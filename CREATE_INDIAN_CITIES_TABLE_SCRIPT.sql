--------------------------------------------------------
--  File created - Wednesday-February-28-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table INDIAN_CITIES
--------------------------------------------------------

  CREATE TABLE "DEMO"."INDIAN_CITIES" 
   (	"ORIGIN" VARCHAR2(26), 
	"DESTINATION" VARCHAR2(26), 
	"DISTANCE" NUMBER(10,0)
   ) ;
REM INSERTING into DEMO.INDIAN_CITIES
SET DEFINE OFF;
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Agra','Delhi',240);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Agra','Lucknow',334);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Agra','Kanpur',277);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Ahmedabad','Mumbai',526);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Ahmedabad','Pune',663);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Ahmedabad','Jaipur',660);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Ahmedabad','Udaipur',258);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bengaluru','Pune',839);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bengaluru','Hyderabad',576);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bengaluru','Chennai',346);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bengaluru','Goa',562);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bhubaneswar','Kolkata',442);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bhubaneswar','Vishakhapatnam',444);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Bhubaneswar','Patna',831);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Chennai','Hyderabad',626);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Chennai','Bengaluru',345);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Chennai','Kochi',690);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Chennai','Mumbai',1335);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Chennai','Kolkata',1666);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Jaipur',307);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Agra',243);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Lucknow',548);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Chennai',2208);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Bengaluru',2174);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Mumbai',1452);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Delhi','Hyderabad',1582);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Goa','Hyderabad',674);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Goa','Kochi',755);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Goa','Mumbai',585);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Goa','Pune',442);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Goa','Thiruvananthapuram',1305);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Pune',562);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Bengaluru',576);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Chennai',627);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Goa',674);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Mumbai',708);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Delhi',1583);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Hyderabad','Kolkata',1489);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Jaipur','Ahmedabad',659);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Jaipur','Udaipur',397);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Jaipur','Delhi',308);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Jaipur','Mumbai',1170);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Jaipur','Pune',1191);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kanpur','Agra',301);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kanpur','Lucknow',115);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kanpur','Varanasi',328);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kochi','Chennai',690);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kochi','Bengaluru',547);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kochi','Goa',754);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kochi','Thiruvananthapuram',206);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kochi','Bengaluru',547);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kolkata','Varanasi',680);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kolkata','Patna',554);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kolkata','Bhubaneswar',442);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kolkata','Chennai',1668);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Kolkata','Delhi',1563);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Lucknow','Delhi',553);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Lucknow','Agra',333);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Lucknow','Kanpur',89);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Pune',148);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Ahmedabad',526);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Delhi',1453);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Hyderabad',713);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Bengaluru',984);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Kolkata',1886);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Mumbai','Chennai',1338);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Patna','Varanasi',256);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Patna','Kolkata',578);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Pune','Mumbai',150);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Pune','Ahmedabad',660);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Pune','Hyderabad',560);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Pune','Bengaluru',842);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Udaipur','Ahmedabad',257);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Udaipur','Jaipur',397);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Udaipur','Mumbai',767);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Udaipur','Delhi',688);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Varanasi','Kanpur',328);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Varanasi','Patna',259);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Varanasi','Kolkata',683);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Varanasi','Lucknow',312);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Vishakhapatnam','Bhubaneswar',441);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Vishakhapatnam','Hyderabad',618);
Insert into DEMO.INDIAN_CITIES (ORIGIN,DESTINATION,DISTANCE) values ('Vishakhapatnam','Kolkata',882);
