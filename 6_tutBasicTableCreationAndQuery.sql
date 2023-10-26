-- Here we'll be learning query from tutorial points website: For practice

CREATE TABLE Company (
	
	id INT UNIQUE NOT NULL,
	name TEXT NOT NULL,
	age INT  NOT NULL ,
	Address VARCHAR(40),
	Salary REAL ,
	PRIMARY KEY (id)
);

-- lets create one more table as department for later exercise

CREATE TABLE Department (

	ID INT PRIMARY KEY NOT NULL,
	Dept 	VARCHAR(50),
	Emp_id	INT NOT NULL
);

-- lets add join_date col in company table

ALTER TABLE company 
ADD COLUMN Join_date DATE;

-- now lets insert data
INSERT INTO company (id , name , age , address , salary ,join_date )
			VALUES  (1, 'Paul', 32, 'California', 20000.00,'2001-07-13'),
					(2, 'Allen', 25, 'Texas',40000.40, '2007-12-13'),
					(3, 'Teddy', 23, 'Norway', 20000.00, DEFAULT),
					(4, 'Mark', 25, 'Rich-Mond ', 65000.00, '2007-12-13'),
					(5, 'David', 27, 'Texas', 85000.00, '2007-12-13');

SELECT * FROM company ORDER BY id;
INSERT INTO company (id , name , age , address , salary ,join_date )
			VALUES  (6, 'Kim', 22, 'South-Hall', 60000.04,'2004-07-13'),
					(7, 'James', 24, 'California',40000.40, '2008-04-28');
					
SELECT * FROM company WHERE salary>20000 AND salary <85000 ;
-- counting total number of records in company table
SELECT COUNT(*) AS "Total Records" FROM company;
SELECT CURRENT_TIMESTAMP;


-- Fetch the employee who from California 
SELECT *  FROM company WHERE address = 'California';

--  Lets do some update Query
UPDATE company 
	SET salary = 45000 WHERE id = 6;
SELECT * FROM company WHERE id = 6
--  let's change the name of Mark to paul 
UPDATE company SET name = 'Paul' WHERE id = 4;

--  LIKE Operator *********************************It used with WHere Clause

--  Ex-1 : Finds salary that start with 200
SELECT * FROM company 
	WHERE salary::TEXT LIKE '200%';

--  Ex-2 : Finds salary that contains 000
SELECT * FROM company 
	WHERE salary::TEXT LIKE '%000%' ORDER BY salary;

--  EX-3 : display all the records from COMPANY table where AGE starts with 2
SELECT * FROM company 
	WHERE age::TEXT LIKE '2%';

-- EX-4 : display all the records from COMPANY table where ADDRESS will have a hyphen (-) inside the text 
SELECT* FROM company 
	WHERE address LIKE '%-%'; -- OUTPUT => South-Hall and Rich-Mond  will comes in address col

-- LIMIT WITH OFFSET operator *******************The OFFSET clause specifies the number of rows to skip before starting to return rows from the query.

-- EX-1 : picks up three records starting from the third position
SELECT * FROM company ORDER BY id 
	LIMIT 3 OFFSET 3 ROW ; -- ROW mentioning is optional
	
-- EX-2 : USING Fetch 
SELECT * FROM company ORDER BY id OFFSET 3 FETCH NEXT 3 ROWS ONLY; -- order by used after the table name 


--EX : sort the result in ascending order by SALARY 
SELECT name , age , salary FROM company 
	ORDER BY age , salary;
	
--  GROUP BY ************************
--  Let us create three more records in COMPANY table using the following INSERT statements:
INSERT INTO COMPANY VALUES (8, 'Paul', 24, 'Houston', 20000.00);
INSERT INTO COMPANY VALUES (9, 'James', 44, 'Norway', 5000.00);
INSERT INTO COMPANY VALUES (10, 'James', 45, 'Texas', 5000.00);
SELECT * FROM COMPANY;

-- EX-1 :  the total amount of salary of each customer, then GROUP BY query would be : it will sum the amount of salary of same name(since we are going group the customer)
SELECT name, SUM(salary) FROM company 
	GROUP BY name ORDER BY name DESC;
	
-- EX-2 :  the total amount of salary of each customer,whose group salary>40000. then GROUP BY  as well as Having will be use for applying condition.
SELECT name , SUM (salary) FROM company
	GROUP BY name HAVING SUM (salary)>40000;
-- 	NOTE: The HAVING clause must follow the GROUP BY clause in a query and must also precede the ORDER BY clause if used. 

-- EX-3 : display record for which the name count is less than 2 : means unique name or single name
SELECT name FROM company GROUP BY name HAVING COUNT(name) <2;

-- EX-4: display record for which the name count is greater than 1: OR Fetch the same name customer
SELECT name FROM company GROUP BY name HAVING COUNT(name)>1; 

SELECT DISTINCT name FROM company order by name;; 
