-- From Here we'll start join concept
SELECT * FROM company ;
SELECT * FROM department;
-- right now there is no data inserted in department table so lets insert some data

INSERT INTO department  (id,dept,emp_id)
				VALUES  (1, 'IT Billing', 1 ),
						(2, 'Engineering', 2),
						(3, 'Finance', 7 );
	
--  The CROSS JOIN
/*
A CROSS JOIN matches every row of the first table with every row of the second table. If the 
input tables have x and y columns, respectively, the resulting table will have x+y columns. 
Because CROSS JOINs have the potential to generate extremely large tables, care must be taken to use them only when appropriate.

*/
--EX: cross join two table company and department.
SELECT company."name" , company.id , department.dept, department.emp_id , department.id 
	FROM company CROSS JOIN department ;

-- INNER JOIN or JOIN : for def see the lect4
SELECT c.name , c.id , c.address , d.dept, d.emp_id ,d.id 
    FROM company AS c INNER JOIN
	department AS d  ON c.id = d.emp_id;

-- LEFT JOIN 
SELECT c.id , c.name , d.id , d.emp_id,d.dept
	FROM company AS c LEFT JOIN department AS d
	ON c.id = d.emp_id ORDER BY c.id;
	
-- RIGHT JOIN
SELECT c.id , c.name , d.id , d.emp_id,d.dept
	FROM company AS c RIGHT JOIN department AS d
	ON c.id = d.emp_id ORDER BY c.id;

-- FULL JOIN
SELECT c.id , c.name, d.emp_id,d.dept
	FROM company AS c FULL JOIN department AS d
	ON c.id = d.emp_id ORDER BY c.id;

-- UNION ********************
-- The PostgreSQL UNION clause/operator is used to combine the results of two or more SELECT statements without returning any duplicate rows.

INSERT INTO department  (id,dept,emp_id)
				VALUES  (4, 'Engineering', 3),
						(5, 'Finance', 4),
						(6, 'Engineering', 5 ),
						(7, 'Finance', 6);

SELECT * FROM company ;
SELECT * FROM department;













