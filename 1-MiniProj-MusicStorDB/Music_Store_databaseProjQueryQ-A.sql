-- there are total 11 tables 
SELECT * FROM album;

			-- 			Question set-1 Easy *****************************


-- Question-1 : WHo is the senior most employee based on job title?

-- Step -1: lets see what type of data employee table contains

SELECT * FROM employee; -- there is a column level. Based on this seniority will be decide. l1 to l7 -> junior to senior.
-- STEP-2 : We can sort it using ORDER BY clause in DESC order.
SELECT * FROM employee 
		ORDER BY levels DESC ;
-- STEP-3 : Now we can use limit to get the 1st row or most senior employee
SELECT * FROM employee 
		ORDER BY levels DESC LIMIT 1 ; -- OUTPUT- empId-9 and name Madan and Levels-L7

-- Question-2 : Which countries have the most invoices?

--STEP-1 : lets see the invoice table 1st bcz there is no country table.
SELECT * FROM invoice; 
-- STEP -2 : There is a billing_country column which we need. Since need to count country hence we'll use GROUP BY clause
SELECT COUNT (*) AS c_count ,  billing_country
	FROM invoice GROUP BY billing_country ;
-- STEP-3 : we can calculate how many times each country appeared in row. Now we can sort in Desc order and get the 1st row
SELECT COUNT(*) AS "each country count" , billing_country
	FROM invoice GROUP BY billing_country 	
	ORDER BY COUNT(*) DESC ;

-- STEP-4: we can get the 1st record for most invoices
SELECT COUNT(*) AS "Max-Invoice" , billing_country
	FROM invoice GROUP BY billing_country 
	ORDER BY COUNT(*) DESC LIMIT 1;
	

-- Question-3 : What are the Top 3 values of total invoices?

-- STEP-1 : We need to see the invoice table. Yes, there is column total.So its asking top 3 values.
-- So lets sort it in DESC order and use limit
SELECT invoice_id , customer_id , total 
	FROM invoice ORDER BY total DESC;

SELECT invoice_id , customer_id , total 
	FROM invoice ORDER BY total DESC LIMIT 3;


-- Question-4 : 
/* Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals */

--STEP-1 : talking about invoice table again.We have to focus on city name and sum of all invoice totals column.
-- best customer means the city which would have most of the total.
SELECT * FROM invoice;
-- STEP-2 : need to get city and  total column
SELECT billing_city , total 
	FROM invoice;
	
-- STEP-3 : We need to group city name because there may be in the same city have different total
-- and calculate same city total

SELECT billing_city , SUM (total) AS total_invoice  
	FROM invoice 
	GROUP BY billing_city 
	ORDER BY total_invoice DESC	;

-- Question-5 : 

/*  Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money */

-- STEP-1: Talking about customer and person means customer table
SELECT * FROM customer;
-- STEP-2 : In customer , there is nothing related to money spend so we have to look into other table like invoice. So we have use JOIN so that we can get the combine result
SELECT * FROM invoice order By total DESC;
-- STEP-3 : Lets join
SELECT c.customer_id , c.first_name, c.last_name , i.billing_country , i.total
	FROM customer AS c 
	INNER JOIN invoice AS i
	ON c.customer_id = i.customer_id  ;
-- STEP-4 : Now we need to group the customer bcz there is possibility that one customer can ordered many item

SELECT c.customer_id , c.first_name , c.last_name , SUM(i.total) AS "total Spend Money"
	FROM customer AS c 
	INNER JOIN invoice AS i
	ON c.customer_id = i.customer_id GROUP BY c.customer_id ;

-- STEP-5 : Now to need to sort the result set in DESC order so that we can get the most spent money
SELECT c.customer_id , c.first_name , c.last_name , SUM(i.total) AS total_Spend_Money
	FROM customer AS c 
	INNER JOIN invoice AS i
	ON c.customer_id = i.customer_id GROUP BY c.customer_id ORDER BY total_Spend_Money DESC LIMIT 1;
-- Imp : for getting 2nd most spend - LIMIT 1 OFFSET 1; OFFSET 1 clause skips the first result, giving you the second highest spender.


			-- 			Question set-1 Moderate LEVEL *****************************


-- Question-1 : 

/*  Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with  */

SELECT * FROM genre where name='Rock'




