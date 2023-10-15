CREATE TABLE Student (
	R_No INT ,
	Name varchar(30),
	Address varchar(40)
)

SELECT * FROM Course
SELECT R_No from Student

CREATE TABLE Course(
 	C_id INT PRIMARY KEY ,
	C_name varchar(20)	
)
-- Adding primary key in an existing table
ALTER TABLE Student 
	ADD PRIMARY KEY (R_No);
	
-- adding new col in course so we can further make relation with student through fk
ALTER TABLE Course
	ADD COLUMN R_No_FK INT
	
-- Adding data in Student and Course table (one by specify the column name and other not)

INSERT INTO Student (R_No , Name , Address) 
			VALUES	(1 , 'Noor' , 'Delhi' ),
				 	(2 , 'Noor1' , 'Mumbai'),
					(3 , 'Noor2'  , 'BLG');

INSERT INTO Course 
			VALUES  (11 , 'DBMS' , 3), -- you can't leave 3rd column's value blank if using only VALUES keyword
					(22 , 'ML'   , NULL),
					(33 , 'WEB Dev' , NULL);

-- Now lets make the relation b/w Student and Course (One to One OR 1-1) 
/*
Syntax : 
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (id);
ustomer_id : it is Going to act as FK for customer table id col.
customer is parent table and orders is the table which want FK as customer_id.
IMP: ADD Constraint fk_course_stutent . It will be seen in the UI when you check
here fk_course_stutent is just name of constraint name. it should be unique but it user choice to name But 
it is better to give fk_jismeFKhaiUskaName_JiskoRefKarRhaHai
*/
ALTER TABLE Course 
	ADD Constraint fk_course_student
	FOREIGN KEY (R_No_FK) REFERENCES Student (R_No);

ALTER TABLE Course
ALTER COLUMN C_id SET DATA TYPE int,
ALTER COLUMN C_id SET NOT NULL;
--      ****** ABout table and Simple DB query *************************
SELECT current_database();
SELECT * FROM information_schema.tables WHERE table_schema = 'public'; -- will show all table and some other thing.
SELECT table_name -- resultant column which will be containing all tables. This will show table who are in public  schema
FROM information_schema."tables"
WHERE table_schema = 'public';

SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'Course';

SELECT Name , R_No FROM student;

ALTER TABLE student 
	ADD Column Age INT;
-- Update query
UPDATE student
	SET age = 60 where R_No = 3 ;

SELECT R_No, Name, Age FROM student;

-- Adding time STAP :

ALTER TABLE student 
ADD COLUMN created_at timestamp DEFAULT current_timestamp;
SELECT * FROM student;
-- ******************************************************

-- ******  INNER JOIN Query ALSO called JOIN*********
SELECT * FROM student AS S INNER JOIN course AS C ON
C.r_no_fk = S.r_no -- it will fetch all Feild(since * used) and ONLY those rows(tuple)whose data is matching with FK , PK Condition.

-- it will join only Student name and course name whose pk fk matches.
SELECT Student.name,Course.c_name FROM Student 
		INNER JOIN Course ON Course.r_no_fk = Student.r_no

-- it will join only Student join Student roll no, name and course c_id, name whose pk fk matches.
SELECT Stud.r_no, Stud.name, C.c_id ,C.c_name FROM Student AS Stud 
		INNER JOIN Course AS C ON C.r_no_fk = Stud.r_no ORDER BY Stud.r_no


-- ******  LEFT JOIN Query *********
-- This will return all the RECORDS of Left table (Student) and from Course only whose match found
SELECT *  FROM Student as Stud 
LEFT JOIN Course AS C ON  C.r_no_fk = Stud.r_no

-- This will return all the RECORDS of Left table (Course) and from Student only whose match found(roll 1,3)
SELECT * FROM Course  as C 
LEFT JOIN Student AS Stud ON  C.r_no_fk = Stud.r_no ORDER BY Stud.r_no


-- Lets add new column M_No to see whether timeStamp is adding or not 
SELECT *  FROM Student
ALTER TABLE student
ADD COLUMN M_No BIGINT;

UPDATE student SET M_No = 1234567890 where R_NO = 1;

INSERT INTO student (r_no , name ,address, age, m_no)
	VALUES(10 , 'Hamdan' , 'ALG' , 22 , 445566 );  -- working timeStamp

INSERT INTO course (c_id , r_no_fk)
	VALUES(44 , 10);  
SELECT *  FROM course

-- How to create new table from an existing table 
CREATE TABLE newCourse AS
SELECT C_name FROM Course
WHERE C_id<50;
-- DROP TABLE newCourse
SELECT *  FROM newCourse

