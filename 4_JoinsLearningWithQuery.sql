-- JOIN : A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
SELECT * FROM products ;
SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM orders;
-- Lets join products and categories table
-- EX: it will fetch records which would find match from both products & categories table based on category_id column 
SELECT products.product_id , products.product_name , categories.category_id , categories.category_name 
			FROM products INNER JOIN categories 
			ON products.product_id = categories.category_id ;

-- Different Types of Joins
-- Here are the different types of the Joins in PostgreSQL:
/*
INNER JOIN:    Returns records that have matching values in both tables
LEFT JOIN:    Returns all records from the left table, and the matched records from the right table
RIGHT JOIN:    Returns all records from the right table, and the matched records from the left table
FULL JOIN:    Returns all records when there is a match in either left or right table
*/

-- 1)  INNER JOIN Or JOIN:       The INNER JOIN keyword selects records that have matching values in both tables on only.

-- By using INNER JOIN we will not get the records where there is not a match, we will only get the records that matches both tables:

-- EX-1-: lets join products table and categories based on the column category_id. And return product id , category name and its description

SELECT products.product_id , categories.category_name , categories.description
		FROM products INNER JOIN categories 
		ON products.product_id = categories.category_id ;

-- 2)  LEFT JOIN  also called LEFT OUTER JOIN :  The LEFT JOIN keyword selects ALL records from the "left" table, and the matching records from the "right" table. The result is 0 records from the right side if there is no match..
--     LEFT table is which we write before LEFT JOIN or after FROM 

-- EX-2-: lets join products table and categories based on the column category_id. And return product id , category category_id , name and its description
 -- it will fetch all the record of products table and categories table only those who gets match
 
SELECT products.product_id , categories.category_id, categories.category_name , categories.description
		FROM products INNER JOIN categories
		ON products.category_id = categories.category_id;

-- 3) RIGHT JOIN also called RIGHT OUTER JOIN : The RIGHT JOIN keyword selects ALL records from the "right" table, and the matching records from the "left" table. The result is 0 records from the left side if there is no match.

-- EX-3 : Lets find all the customer who have ordered some product.Based on customer_id.

SELECT customers.customer_id,customers.customer_name , orders.order_id,orders.order_date 
		FROM customers RIGHT JOIN orders
		ON orders.customer_id = customers.customer_id ; -- if nothing match orders table id with the cutomer then will return as null in their records.
	
-- 4) FULL JOIN also called RIGHT OUTER JOIN: The FULL JOIN keyword selects ALL records from both tables, even if there is not a match. For rows with a match the values from both tables are available, if there is not a match the empty fields will get the value NULL.
-- Ex-4 : full join customers and orders based on customer_id column
		-- All records from both tables are returned.

SELECT customers.customer_id,customers.customer_name , orders.order_id,order_date
		FROM customers FULL JOIN orders
		ON customers.customer_id = orders.customer_id;
		-- Rows with no match will get a NULL value in fields from the opposite table: