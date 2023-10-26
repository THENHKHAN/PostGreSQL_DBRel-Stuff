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

SELECT * FROM company;
INSERT INTO company (id , name , age , address , salary ,join_date )
			VALUES  (6, 'Kim', 22, 'South-Hall', 60000.04,'2004-07-13'),
					(7, 'James', 24, 'California',40000.40, '2008-04-28');
					
SELECT * FROM company WHERE salary>20000 AND salary <85000 ;
-- counting total number of records in company table
SELECT COUNT(*) AS "Total Records" FROM company;
SELECT CURRENT_TIMESTAMP;


-- Fetch the employee who from California 
SELECT *  FROM company WHERE address = 'California';