-- Here I'll be learning Basic function 

SELECT * FROM customers;
SELECT * FROM products ORDER BY price;

				-- MAX and MIN function : 
								--return max or min value of requred col with col name max or min respectively by default. But we can set our choice col name.

-- 1) The MIN() function returns the smallest value of the selected column.

SELECT MIN(price) FROM products;  -- Return the lowest price in the products table:

-- 2) The MAX() function returns the largest value of the selected column.

SELECT MAX (price) FROM products; -- Return the highest price in the products table:
 
 -- alias of min max col default col user choice 
 -- Set Column Name
/* When you use MIN() or MAX(), the returned column will be named min or max by default. 
		To give the column a new name, use the AS keyword.*/
SELECT MAX (price) AS maxPriceOfProd FROM products; -- maxPriceOfProd will be fetch col name

-- COUNT() Function : The COUNT() function returns the **number of rows** that matches a specified criterion.

SELECT COUNT (customer_id) FROM customers; -- If the specified criterion is a column name, the COUNT() function returns the total number of rows that match the specified criterion."
-- now lets look where exactly it can be used 

SELECT COUNT (country) FROM customers WHERE country = 'Mexico'; -- it will return no. of customer who are from Mexico.
SELECT COUNT(order_date) FROM orders WHERE order_date = '2021-07-08'; -- count total no. of order done on this date.ALso we can omit col name in count function instead we can use * since count function coount rows not col.

--SUM() function : The SUM() function returns the total sum of a numeric column
SELECT SUM(price) FROM Products; -- Return the total amount of products price :

-- AVG() function : The AVG() function returns the average value of a numeric column.
SELECT AVG(price) FROM Products; -- it will return avg of price column. By default its decimal point is around 10  but we can customize its decimal point.
-- We can use the ::NUMERIC operator to round the average price to a number with 2 decimals
SELECT AVG (price)::NUMERIC(10,2) FROM products; -- it will round off till two decimal point

-- *IMP::::
-- LIKE and ILIKE Operator  
	
	-- 	: The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
							/* There are two wildcards often used in conjunction with the LIKE operator:

							 % =>The percent sign represents zero, one, or multiple characters.
							 _ => The underscore sign represents one, single character.
							*/
			-- PERCETAGE (%) Wildcard**************************
			
-- 1) Starts with : To return records that starts with a specific letter or phrase, add the % at the end of the letter or phrase.
					--: i) Return all customers with a name that starts with the letter 'A':

SELECT * FROM customers WHERE customer_name LIKE 'A%';
					--	ii) Return all customers with a name that starts with the letter 'A' and end with 'e':						
SELECT * FROM customers WHERE customer_name LIKE 'A%e';

-- 2) Contains   : To return records that contains a specific letter or phrase, add the % both before and after the letter or phrase.
					--: i) Return all customers with a name that contains the letter 'A':
SELECT * FROM customers WHERE customer_name LIKE '%A%';

-- 3) Ends with : To return records that ends with a specific letter or phrase, add the % before the letter or phrase.

				-- i) Return all products with a name that ends with the phrase 'en':
SELECT * FROM products WHERE product_name LIKE '%en';

				--  Undescore (_) Wildcard**************************
				
-- Def: The _ wildcard represents a single character.
-- 					It can be any character or number, but each _ represents one, and only one, character.

-- EX -1 : Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters:

SELECT * FROM customers WHERE city LIKE 'L_nd__';
-- EX -2 : Return all products name which 2nd character is 'h' and end with 'en'
SELECT * FROM products WHERE product_name LIKE '_h%en';

--            PostgreSQL IN Operator *****************************opposite of it is NOT IN operator.

-- Def : The IN operator allows you to specify a list of possible values in the WHERE clause.
	-- IMP : The IN operator is a shorthand for multiple OR conditions.

-- EX: 1 -> return all the customers who are from the city London or Mexico D.F.
SELECT * FROM customers WHERE city IN ('London' , 'Mexico D.F.');
-- EX: 2 -> return all the product name whose price is either 18.00 or 22.00 or 25.00
SELECT * FROM products WHERE price IN (18.00 , 25.00 , 22.00 );
-- EX: 3 -> IN with SELECT inside a parenthesis.
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM products);        
SELECT * FROM products

--				PostgreSQL BETWEEN Operator  *****************************

-- Def : The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- 		The BETWEEN operator is inclusive: begin and end values are included.

--B/w Numerics - EX -> Select all products with a price between 10 and 30:
SELECT * FROM products WHERE price BETWEEN 10 AND 30 ;

--B/w TEXT -> Def :The result returns all records that are alphabetically between the specified values (on the basis of 1st letter).
-- Explain Detail :  if you have a list of names and you use the BETWEEN operator to filter names alphabetically, it will consider the entire name, not just the first letter. The BETWEEN operator evaluates the entire text values and includes all records that fall within the specified range according to the full text content.

SELECT * FROM Products
WHERE product_name BETWEEN 'Chais' AND 'Men' ORDER By product_name;

--B/w DATE Values -> Def : The BETWEEN operator can also be used on date values..
-- Ex : Select all orders between 12. of April 2021 and 12. of Oct 20203:
SELECT * FROM orders 
WHERE order_date BETWEEN '2021-04-12' AND '2023-10-12'

SELECT product_name AS "PI PN" FROM Products