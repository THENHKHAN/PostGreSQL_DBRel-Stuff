
/* 1. Write a SQL statement to create a simple table countries including columns country_id,country_name 
and region_id.
*/

CREATE TABLE countries (
		country_id  VARCHAR(3) ,
		country_name VARCHAR(40),
		region_id DECIMAL(10,0) 	
);

SELECT * FROM countries;

/* 2. Write a SQL statement to create a simple table countries including columns country_id,country_name 
and region_id which already exist.

*/
CREATE TABLE IF NOT EXISTS countries (

		country_id  VARCHAR(3) ,
		country_name VARCHAR(40),
		region_id DECIMAL(10,0) 	
)
-- INFO : Try to Create the Table Again. If we attempt to create that table again:
--We don’t get an error, we get a notice:NOTICE:  relation "t1" already exists, skipping. Wihout using IF NOT EXISTS it will throw ERROR

/* 3. Write a SQL statement to create the structure of a table dup_countries similar to countries.
*/
CREATE TABLE dup_countries (
		country_id  VARCHAR(3) ,
		country_name VARCHAR(40),
		region_id DECIMAL(10,0) 
)
SELECT * FROM dup_countries
DROP TABLE dup_countries; -- since it does not ask for exact same but similar structure that's only structure it need. there is one method to do it.

CREATE TABLE dup_countries AS 
	(SELECT * FROM countries) 
	WITH NO DATA; -- so it will create only structure and not along with the data Unlike above method
/* Explains:
This SQL statement creates a new table named dup_countries that is a copy of the existing countries table without any data. The WITH NO DATA clause is used to create an empty table with the same structure as the source table (countries).
*/

/* 4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
*/
CREATE TABLE dup_countries 
		AS
	SELECT * FROM countries; -- so it will creat as countries table structure as well as all the data.
	
/* 5. Write a SQL statement to create a table countries set a constraint NULL.
*/
DROP TABLE countries; -- so that i can create below without updating schema.
CREATE TABLE IF NOT EXISTS countries (

		country_id  VARCHAR(3) NOT NULL,
		country_name VARCHAR(40) NOT NULL,
		region_id DECIMAL(10,0) NOT NULL
);

/* 6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and 
check whether the max_salary amount exceeding the upper limit 25000.
*/

CREATE TABLE IF NOT EXISTS jobs (
		job_id varchar(10) NOT NULL ,
		job_title varchar(35) NOT NULL,
		min_salary DECIMAL(6,0) ,
		max_salary Decimal(6,0)
	-- this is how to use CHECK constraint 
	CHECK (max_salary <= 25000) -- CHECK allows you to specify a condition or expression that the data in a particular column or combination of columns must adhere to.
);
-- If a row is inserted or updated in the jobs table, and the condition (max_salary <= 25000) is not met (i.e., if the max_salary exceeds 25,000), 
-- it will result in a constraint violation, and the operation will be rejected.
-- In this case, the CHECK constraint is used to enforce a business rule that limits the max_salary values to a specific maximum amount (25,000). 
-- It helps ensure data integrity by preventing invalid data from being inserted into the table.
SELECT * FROM jobs;	

/* 7. Write a SQL statement to create a table named countries, including country_id, country_name and region_id and make sure that no countries except Italy, 
		India and China will be entered in the table.
*/
drop TABLE countries;
-- so in this also we have make a check but will multiple option so need to use IN operator
CREATE TABLE IF NOT EXISTS countries (
		
		country_id  VARCHAR(3) NOT NULL,
		country_name VARCHAR(40) NOT NULL,
		region_id DECIMAL(10,0) NOT NULL
		CHECK (country_name IN ('Italy' , 'India' , 'China')) --OR more readable
-- 		CONSTRAINT valid_countries CHECK (country_name IN ('Italy' , 'India' , 'China')) -- valid_countries - this will be the constraint name
)
SELECT * FROM countries;