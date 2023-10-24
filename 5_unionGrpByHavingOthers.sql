
SELECT * FROM customers ORDER By customer_id;
SELECT * FROM orders;
SELECT * FROM products;


-- GROUP BY :
/*
The GROUP BY clause groups rows that have the same values into summary rows, like "find the number of customers in each country".

The GROUP BY clause is often used with aggregate functions like COUNT(), MAX(), MIN(), SUM(),
AVG() to group the result-set by one or more columns.
*/


-- EX-1: Find the number of customers in each country: 
SELECT city, COUNT(customer_id) AS TotalCustomerInSameCity  FROM customers
	GROUP BY city;


-- GROUP BY With JOIN :
-- EX-2: lists the number of orders made by each customer: 

SELECT customers.contact_name, COUNT(orders.order_id) AS numOfOrderPerCust FROM orders LEFT JOIN
		customers ON orders.customer_id = customers.customer_id 
		GROUP By customers.contact_name ;

-- HAVING : ************ The HAVING clause was added to SQL because the WHERE clause cannot be used with aggregate functions.
-- Aggregate functions are often used with GROUP BY clauses, and by adding HAVING we can write condition like we do with WHERE clauses.
-- IMP: HAVING can only used with GROUP BY clause.

-- EX-1 : List the number of customer who have made order.

SELECT customer_id, COUNT(*) FROM orders 
	GROUP BY customer_id; -- it will display customer_id because by this we can identify customer for each order

-- EX-2 : List only countries that are represented less than 5 times:

SELECT country , COUNT(*) FROM customers GROUP BY country
	HAVING COUNT(*) < 5 ;
	
-- EX-3 : lists the products who are having more than one category.

SELECT products.category_id, COUNT (product_id) AS ProdOfSameCateg FROM products  GROUP BY products.category_id
HAVING COUNT(product_id)>1 ;

SELECT * FROM products























-- UNION : 
/*
The UNION operator is used to combine the result-set of two or more queries.

The queries in the union must follow these rules:

-> They must have the same number of columns
-> The columns must have the same data types
-> The columns must be in the same order
*/
SELECT customers.customer_id FROM customers 
		UNION 
SELECT orders.order_id FROM orders; 