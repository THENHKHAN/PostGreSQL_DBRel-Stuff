CREATE TABLE LearningTable(

	  category_id SERIAL NOT NULL PRIMARY KEY,
	  category_name VARCHAR(255),
	  description VARCHAR(255)	
);

SELECT * FROM learningtable;

INSERT INTO learningtable (category_name , description)
		VALUES 
		  ('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
		  ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
		  ('Confections', 'Desserts, candies, and sweet breads'),
		  ('Dairy Products', 'Cheeses'),
		  ('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
		  ('Meat/Poultry', 'Prepared meats'),
		  ('Produce', 'Dried fruit and bean curd'),
		  ('Seafood', 'Seaweed and fish');
-- renamed table name		  
ALTER TABLE learningtable
	RENAME TO categories
	
SELECT * FROM categories;

-- Lets create another table customer

CREATE TABLE customers  (
		customer_id SERIAL NOT NULL PRIMARY KEY,
		customer_name VARCHAR(255),
	    contact_name VARCHAR(255),
	    address VARCHAR(255),
	    city VARCHAR(255),
	    postal_code VARCHAR(255),
	    country VARCHAR(255)
);

SELECT * FROM customers

INSERT INTO customers (customer_name, contact_name, address, city, postal_code, country)
		VALUES 
		  ('Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
		  ('Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
		  ('Antonio Moreno Taquera', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
		  ('Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),		 
		  ('Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez ', 'Jardim das rosas n. 32', 'Lisboa', '1675', 'Portugal'),
		  ('Wolski', 'Zbyszek', 'ul. Filtrowa 68', 'Walla', '01-012', 'Poland');
		  
-- lets create products and order table
CREATE TABLE products (
  product_id SERIAL NOT NULL PRIMARY KEY,
  product_name VARCHAR(255),
  category_id INT,
  unit VARCHAR(255),
  price DECIMAL(10, 2)
);

SELECT * FROM products;

INSERT INTO products (product_id, product_name, category_id, unit, price)
	VALUES
		  (1, 'Chais', 1, '10 boxes x 20 bags', 18),
		  (2, 'Chang', 1, '24 - 12 oz bottles', 19),
		  (3, 'Aniseed Syrup', 2, '12 - 550 ml bottles', 10),
		  (4, 'Chef Antons Cajun Seasoning', 2, '48 - 6 oz jars', 22),
		  (5, 'Chef Antons Gumbo Mix', 2, '36 boxes', 21.35),
		  (6, 'Grandmas Boysenberry Spread', 2, '12 - 8 oz jars', 25),
		  (7, 'Uncle Bobs Organic Dried Pears', 7, '12 - 1 lb pkgs.', 30),
		  (8, 'Northwoods Cranberry Sauce', 2, '12 - 12 oz jars', 40),
		  (9, 'Mishi Kobe Niku', 6, '18 - 500 g pkgs.', 97),
		  (10, 'Ikura', 8, '12 - 200 ml jars', 31);
		  
		  
--order table 

CREATE TABLE orders (
  order_id SERIAL NOT NULL PRIMARY KEY,
  customer_id INT,
  order_date DATE
);
SELECT * FROM orders;
INSERT INTO orders (order_id, customer_id, order_date)
		VALUES
		  (10248, 90, '2021-07-04'),
		  (10249, 81, '2021-07-05'),
		  (10250, 34, '2021-07-08'),
		  (10251, 84, '2021-07-08'),
		  (10252, 76, '2021-07-09'),
		  (10253, 34, '2021-07-10'),
		  (10254, 14, '2021-07-11'),
		  (10255, 68, '2021-07-12'),
		  (10256, 88, '2021-07-15'),
		  (10257, 35, '2021-07-16'),
		  (10258, 20, '2021-07-17');

-- Lets practice query 

SELECT * FROM products 
		WHERE product_name LIKE 'C%'; -- this will fetch whose product_name is starts from C only
		-- difference b/w LIKE and ILIKE : case-sensivity 1st is case senesetive and 2nd not
		
SELECT customer_name , country FROM Customers; -- will fetch only customer_name and country columns all record.

SELECT DISTINCT country FROM Customers; -- it will fetch only unique record of column country.

/*
We can also use the DISTINCT keyword in combination with the COUNT statement, which in the 
example below will return the number of different countries there are in the customers table.
*/
SELECT COUNT (DISTINCT country) FROM customers;


-- Sort Data : using ORDER BY 
/*
The ORDER BY keyword is used to sort the result in ascending or descending order.

The ORDER BY keyword sorts the records in ascending order by default(incr order). 
To sort the records in descending order, use the DESC keyword.
*/

SELECT * FROM products
		ORDER BY price; -- default ASC order
SELECT * FROM products  ORDER BY product_id DESC;
-- For string values the ORDER BY keyword will order alphabetically:
SELECT * FROM products ORDER BY product_name;

--  LIMIT Clause : It us used to limit the fetch record of column
SELECT * FROM customers LIMIT 3; -- only fetch 3 record of all the column of table customers.

-- OFFSET Clause : The OFFSET clause is used to specify where to start selecting the records to return.
-- If you want to return 20 records, but start at number 40, you can use both LIMIT and OFFSET.
-- Note: The first record is number 0, so when you specify OFFSET 40 it means starting at record number 41.
SELECT * FROM customers LIMIT 4 OFFSET 2 ; -- so it will start from 3rd customer and go 3,4,5,6 means limit 4.


