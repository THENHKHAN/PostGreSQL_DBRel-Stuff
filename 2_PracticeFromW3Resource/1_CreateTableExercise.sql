
/* 1. Write a SQL statement to create a simple table countries including columns country_id,country_name 
and region_id.
*/

CREATE TABLE countries (
		country_id  VARCHAR(3) ,
		country_name VARCHAR(40),
		region_id DECIMAL(10,0) 	
);

SELECT * FROM countries;