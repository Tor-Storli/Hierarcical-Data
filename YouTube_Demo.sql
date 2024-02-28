/**********************************************************************
 NOTE:  (The following CTE query):
 The search depth first by last_name set order1 clause 
 specifies the order in which the recursive rows are processed. 
 It ensures that the traversal follows a depth-first approach, 
 ordered by the last_name column. 
 The order1 identifier is used to define this order.
 Note that the order1 identifier is used internally for ordering 
 during the recursive traversal and is not directly accessible 
 in the final result set.
 *********************************************************************/
with emp as (
	select /*+ inline gather_plan_statistics */ 
		e.last_name, e.employee_id, e.manager_id
	from employees e
), 
emp_hierarchy (last_name,employee_id,manager_id,lvl) as (
	select e.last_name,  e.employee_id, e.manager_id, 1 as lvl 
	from emp e where e.manager_id is null
    
	union all
	
    select emp.last_name,  emp.employee_id, emp.manager_id, emph.lvl + 1 as lvl
	from emp
	join emp_hierarchy emph on emph.employee_id = emp.manager_id 
)
search depth first by last_name set order1
select  eh.employee_id, eh.manager_id,lvl , lpad(' ', lvl*4-1,' ') || eh.last_name last_name
from emp_hierarchy eh;


--------------------------------------------------------------------------------------------------
-- The query above can be written in a more elegant way using this syntax:
--------------------------------------------------------------------------------------------------
SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE"
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;










SELECT ORIGIN , DESTINATION , Distance, LEVEL, LPAD(' ',4*(LEVEL - 1)) || ORIGIN  "CITIES"
FROM INDIAN_CITIES
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY PRIOR ORIGIN = Destination;

--Add NOCYCLE
SELECT ORIGIN , DESTINATION , Distance, LEVEL, LPAD(' ',4*(LEVEL - 1)) || ORIGIN  "CITIES"
FROM INDIAN_CITIES
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY NOCYCLE PRIOR ORIGIN = Destination;

-- Add CONNECT_BY_ISCYCLE
SELECT ORIGIN , DESTINATION , Distance, LEVEL, LPAD(' ',4*(LEVEL - 1)) || ORIGIN  "CITIES",
CONNECT_BY_ISCYCLE
FROM INDIAN_CITIES
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY NOCYCLE PRIOR ORIGIN = Destination;


--Filter out all Cyclical records, Notice Dups
SELECT ORIGIN , DESTINATION , Distance, LEVEL, LPAD(' ',4*(LEVEL - 1)) || ORIGIN  "CITIES",
CONNECT_BY_ISCYCLE
FROM INDIAN_CITIES
WHERE CONNECT_BY_ISCYCLE =0
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY NOCYCLE PRIOR ORIGIN = Destination;



--Try to removing Duplicates - Still problems. i.e.
/*
Vishakhapatnam	Hyderabad	618	16	                                                            Vishakhapatnam	0
Vishakhapatnam	Hyderabad	618	17	                                                                Vishakhapatnam	0
*/
SELECT DISTINCT ORIGIN , DESTINATION , Distance, LEVEL, LPAD(' ',4*(LEVEL - 1)) || ORIGIN  "CITIES",
CONNECT_BY_ISCYCLE
FROM INDIAN_CITIES
WHERE CONNECT_BY_ISCYCLE =0
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY NOCYCLE PRIOR ORIGIN = Destination;





--Removing LEVEL - Still Garbage
SELECT DISTINCT ORIGIN , DESTINATION , Distance,
CONNECT_BY_ISCYCLE
FROM  INDIAN_CITIES
WHERE CONNECT_BY_ISCYCLE = 0
START WITH ORIGIN = 'Agra' AND Destination = 'Delhi'
CONNECT BY NOCYCLE PRIOR ORIGIN = Destination;





/***************************************************
CREATE FUNCTION CALC_DISTANCE(VALUE_IN as varchar2)
RETURN NUMBER
IS
    OutValue NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT ' || VALUE_IN || ' FROM DUAL' INTO OutValue;
    RETURN OutValue;
EXCEPTION
WHEN OTHERS THEN
    RETURN NULL;

END;

DROP FUNCTION CALC_DISTANCE;

 ****************************************************/ 
WITH CTE_CITIES AS (
    SELECT 'Agra' AS Origin, 'Delhi' AS Destination, 240 AS Distance FROM DUAL UNION ALL 
    SELECT 'Ahmedabad' AS Origin, 'Udaipur' AS Destination, 258 AS Distance FROM DUAL UNION ALL 
    SELECT 'Bengaluru' AS Origin, 'Pune' AS Destination, 839 AS Distance FROM DUAL UNION ALL 
    SELECT 'Delhi' AS Origin, 'Jaipur' AS Destination, 307 AS Distance FROM DUAL UNION ALL 
    SELECT 'Goa' AS Origin, 'Kochi' AS Destination, 755 AS Distance FROM DUAL UNION ALL 
    SELECT 'Hyderabad' AS Origin, 'Goa' AS Destination, 674 AS Distance FROM DUAL UNION ALL 
    SELECT 'Jaipur' AS Origin, 'Mumbai' AS Destination, 1170 AS Distance FROM DUAL UNION ALL 
    SELECT 'Kochi' AS Origin, 'Bengaluru' AS Destination, 547 AS Distance FROM DUAL UNION ALL 
    SELECT 'Mumbai' AS Origin, 'Hyderabad' AS Destination, 713 AS Distance FROM DUAL UNION ALL 
    SELECT 'Pune' AS Origin, 'Ahmedabad' AS Destination, 660 AS Distance FROM DUAL
)
--SELECT * FROM CTE_CITIES;

SELECT LEVEL, ORIGIN, DESTINATION, Distance,
SUM(Distance) OVER (PARTITION BY ORIGIN ORDER BY LEVEL
                                      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RUNNING_SUM_DISTANCE,
CALC_DISTANCE(SUBSTR(SYS_CONNECT_BY_PATH(Distance, '+'),2)) As Total_Distance,
SYS_CONNECT_BY_PATH(Distance, '+')  as Total_Distance_Path ,
SYS_CONNECT_BY_PATH(DESTINATION, '::') as PATH,
LPAD(' ',2*(LEVEL - 1)) || ORIGIN "CITY"
FROM CTE_CITIES
--WHERE CONNECT_BY_ISCYCLE = 0
START WITH ORIGIN = 'Agra' 
CONNECT BY PRIOR DESTINATION = ORIGIN 
ORDER BY LEVEL; 
--CONNECT BY NOCYCLE PRIOR DESTINATION = ORIGIN; 


--------------------------------------------------------------------------------------
-- FIND TOP FEW NODES IN A HIERARCHIES
-- You can use the CONNECT_BY_ISLEAF Pseudo-Column
--------------------------------------------------------------------------------------
SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE", 
CONNECT_BY_ISLEAF
FROM EMPLOYEES
WHERE LEVEL <= 2
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

--------------------------------------------------------------------------------------
-- AGGREGATE  SUB-TREE HIERARCY SALARIES
-- You can use an in-line View
--------------------------------------------------------------------------------------

SELECT h2.EMPLOYEE_ID, h2.MANAGER_ID, h2.LAST_NAME,  
h2.SALARY, 
(SELECT SUM(h1.SALARY) FROM EMPLOYEES h1
START WITH h1.EMPLOYEE_ID = h2.EMPLOYEE_ID
CONNECT BY  h1.MANAGER_ID = PRIOR h1.EMPLOYEE_ID) AS Sum_of_Salary
FROM EMPLOYEES h2;


--------------------------------------------------------------------------------------
-- FIND ALL CHILREN NODES IN A HIERARCHIES
-- You can use the CONNECT_BY_ISLEAF Pseudo-Column
--------------------------------------------------------------------------------------
SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE", 
CONNECT_BY_ISLEAF
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE", 
CONNECT_BY_ISLEAF
FROM EMPLOYEES
WHERE CONNECT_BY_ISLEAF = 1
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
ORDER SIBLINGS BY LAST_NAME;

--------------------------------------------------------------------------------------
-- ORDER HIERARCHIES
-- You can use the SIBLINGS Keyword in the ORDER BY Clause
--------------------------------------------------------------------------------------

SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE"
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;


SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE"
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
ORDER BY LAST_NAME;

------------------------------------
-- USE SIBLINGS Keyword
------------------------------------
SELECT EMPLOYEE_ID,
MANAGER_ID, LEVEL, LPAD(' ',4*(LEVEL - 1)) || LAST_NAME "EMPLOYEE"
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID
ORDER SIBLINGS BY LAST_NAME;











