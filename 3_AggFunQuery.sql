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