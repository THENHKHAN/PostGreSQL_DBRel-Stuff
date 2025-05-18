
ref: https://www.youtube.com/watch?v=AZzTHWF7tEc
PDF - https://drive.google.com/file/d/1-GHBE5iSGXMbGXtQP0Z3bzoKnXEGJUrK/view


CREATE TABLE Products2 (
Order_date date,
Sales int );

INSERT INTO Products2(Order_date,Sales)
VALUES
('2021-01-01',20), ('2021-01-02',32), ('2021-02-08',45), ('2021-02-04',31),
('2021-03-21',33), ('2021-03-06',19), ('2021-04-07',21), ('2021-04-22',10);

select * from Products2;



============ Q1: What is order of execution in sql? ------------------------

FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY > LIMIT

--Example:
SELECT category, AVG(sales) AS avg_sales
FROM SalesData
WHERE year > 2020
GROUP BY category
HAVING COUNT(*) > 10
ORDER BY avg_sales DESC
LIMIT 3


-- Q2: Find monthly sales and sort it by desc order -------------------


-- let's see the data how it will look like after extracting the year and month
select *, extract (year from Order_date) as year, 
--		extract (month from Order_date) as month, 
		to_char (Order_date, 'mon') as month
--		sum(Sales) totalsales
			from Products2  ;
--			group by year, month order by totalsales DESC;
		

-- Actual Query
select  extract (year from Order_date) as year, 
		to_char (Order_date, 'mon') as month,
		sum(Sales) totalsales
			from Products2  
			group by 1,2 order by 3 desc; -- count from 1 - n from left tp right: SC used for columns
			
--			year, month order by totalsales DESC;


------- For Question 3 - -----------

--Q3: Find the candidates best suited for an open Data Science job. Find candidates who are proficient
-- in Python, SQL, and Power BI.
--  Write a query to list the candidates who possess all of the required skills for the job. Sort the output
--  by candidate ID in ascending order.
			
CREATE TABLE Applications (
candidate_id int,
skills varchar);

INSERT INTO Applications(candidate_id,skills)
VALUES
(101, 'Power BI'), (101, 'Python'), (101, 'SQL'), (102, 'Tableau'), (102, 'SQL'),
(108, 'Python'), (108, 'SQL'), (108, 'Power BI'), (104, 'Python'), (104, 'Excel')


select * from Applications;

select candidate_id, skills from Applications where skills in ('SQL', 'Power BI', 'Python'); -- filtered only these colun
--				group by candidate_id ;

select candidate_id , count(*) as skill_count from Applications
					where skills in ('SQL', 'Power BI', 'Python')
						group  by candidate_id order by candidate_id;

-- final 2nd part who possess all the skills

select candidate_id, count(skills) as skill_count from Applications
					where skills in ('SQL', 'Power BI', 'Python') 
					group by candidate_id 
					having count(distinct skills) =3 -- reason why no * only : 
					-- COUNT(DISTINCT skill): This counts the distinct skills for each candidate, ensuring you don't count duplicates (i.e., if a candidate has multiple rows with the same skill, they only count once).
					order by candidate_id ;
					






