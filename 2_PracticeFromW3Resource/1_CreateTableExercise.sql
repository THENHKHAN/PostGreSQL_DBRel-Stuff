
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
DROP TABLE countries;
CREATE TABLE IF NOT EXISTS countries (

		country_id  VARCHAR(3) NOT NULL,
		country_name VARCHAR(40) NOT NULL,
		region_id DECIMAL(10,0) NOT NULL
);
		