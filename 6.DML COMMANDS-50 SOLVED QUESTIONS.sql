/*Create a table named Students with these columns:
- StudentID — integer, primary key
- Name — text up to 50 characters
- Age — integer
Then insert one student: ID 101, name Ravi, age 20.*/
--SOL-
CREATE TABLE Students
(STUDENT_ID INT PRIMARY KEY,NAME VARCHAR(50),AGE INT);
INSERT INTO Students VALUES  (101,'RAVI',20);

/*Question 2 of 50 — Easy
Add a second student to Students:
- ID: 102
- Name: Meena
- Age: 21
Write the INSERT statement.*/


INSERT INTO students values(102,'meena',21);

--Question 3 of 50 — Easy
--Change Meena’s age to 22. Write an UPDATE statement that updates only the student whose ID is 102.
UPDATE Students
set age=22 where STUDENT_ID=102;

/*Question 4 of 50 — Easy
Display all rows and columns from Students. Write the SQL query.*/

select * from students

/*Question 5 of 50 — Easy
Delete only Ravi’s row from Students. Write a= DELETE statement using his ID (101).*/
 
 delete from students where STUDENT_ID=101;

--Insert a student with ID 103, name Arun, and age 19. This time, specify the column names in your INSERT statement.
insert into students (STUDENT_ID,name,age) values ( 103,'arun',19);

--Question 7 of 50 — Easy
--Show only the Name and Age of all students. Write the SELECT statement.

select name,age from students;

--Question 8 of 50 — Easy
--Show the students whose age is 20 or older. Write a SELECT statement that returns all their columns.

select * from students where age>=20;

--Question 9 of 50 — Easy
--Show the students whose names are exactly 'Meena'. Return all columns.
select * from students where name= 'meena';

--Question 10 of 50 — Easy
--Increase every student’s age by 1 year. Write an UPDATE statement. This should affect all rows in Students.
update students
set age=age+1;

--Question 11 of 50 — Easy
--Add a new column named City to Students, using a text type that can hold up to 40 characters. Write the SQL command.
alter table students 
add city varchar (40);

--12.Set Ravi’s city to 'Delhi'. Write an UPDATE statement using Ravi’s ID (101).
update students 
set city='delhi' where student_id=101;
--Question 13 of 50 — Easy
--Set Meena’s City to NULL. Write an UPDATE statement using her ID (102).

update students
set city=null where student_id=102;

--Question 14 of 50 — Easy
--Find all students whose City has no value (NULL). Write a SELECT statement that returns all their columns.
select * from students where city is null;

--Question 15 of 50 — Easy
--Find students whose City has a value. Return all columns. Write the query. Use IS NOT NULL.
select * from students  where city is not null;

--For Question 16, write a query that returns all students with an age from 19 through 22, inclusive. You can use BETWEEN.

select * from students where age between 19 and 22;

--Question 17 of 50 — Easy
--Find students whose age is not between 19 and 22. Return all columns. Write the query.
select * from students where age not between 19 and 22;

--Question 18 of 50 — Easy
--List all students from youngest to oldest. Return all columns. Write the query using ORDER BY.

select * from students ORDER BY age asc;

--Question 19 of 50 — Easy
--Show the three oldest students. Return all columns, ordered from oldest to youngest. Write the query.
select  top (3) * from students order by age desc;

--Question 20 of 50 — Easy
--Show students whose names start with the letter M. Return all columns. Write the query using LIKE.
select * from students where name like 'M%';

--Question 21 of 50 — Easy
--Find students whose names end with a. Return all columns. Write a query using LIKE
select * from students where name like '%a';

--Question 22 of 50 — Easy
--Find students whose names contain the letter e anywhere. Return all columns. Write a query using LIKE.
select * from students where name like '%e%';

--Question 23 of 50 — Easy
--Show each different city in Students only once. Write a query that returns the City column without duplicates.
select distinct city   from students;

--Question 24 of 50 — Easy
--Count how many student rows are in the table. Write a query using COUNT. Include a column alias named TotalStudents.
select count(*) as TotalStudents from students ;


/*Question 25 of 50 — Easy
A student’s name was entered incorrectly. Change the name of the student with STUDENT_ID = 103 to 'Arun Kumar'. Write the UPDATE statement.*/
update students
set name='Arun Kumar' where student_id =103;

/*Question 26 of 50 — Easy
Add a new student: ID 104, name Sara, age 20, city Mumbai. Write an INSERT statement that lists the column names.*/

insert into students(student_id,name,age,city)values(104,'sara',20,'mumbai');

/*Question 27 of 50 — Easy
Sara moved to Pune. Update only her City using her ID (104). Write the UPDATE statement.*/
update students
set city= 'pune' where student_id=104;

/*Question 28 of 50 — Easy
Delete only Sara’s row from Students, using her ID (104). Write the DELETE statement.*/

delete from students where  student_id=104;

/*Question 29 of 50 — Easy
Insert two students in one statement:
- ID 105, name Kiran, age 23, city Chennai
- ID 106, name Nila, age 18, city Jaipur
Write one INSERT statement with both rows.*/

insert into students values(105,'kiran',23,'chennai'),(106,'nila',18,'jaipur');


/*Question 30 of 50 — Easy
A data entry mistake set the age of student 105 to 230. Correct it to 23. Write an UPDATE statement that affects only that student.*/

update  students
set age=23 where student_id=105;

/*Question 31 of 50 — Easy
Delete all students whose age is under 18. Write the DELETE statement. Be sure to include a WHERE condition.*/

delete from students where age<18;

/*Question 32 of 50 — Easy
A city name was entered with extra spaces for student 106. Set that student’s City to 'Jaipur'. Write the UPDATE statement using the student ID.*/

update students 
set city = 'jaipur' where student_id=106; 

/*Question 33 of 50 — Easy
Increase the age of every student in Chennai by 1 year. Write an UPDATE statement with a WHERE condition so students in other cities aren’t changed.*/

update students
set age=age+1 where city ='chennai';

/*Question 34 of 50 — Medium
Insert a student with ID 107, name Dev, and age 20. You don’t know Dev’s city yet, so leave City as NULL. List the column names in your INSERT statement.*/


insert into students (student_id,name,age,city) values(107,'dev',20,null);

/*Question 35 of 50 — Medium
A student with ID 106 has moved to Ahmedabad and is now 19. Update both the City and Age for that student in a single UPDATE statement.*/


update students
set city ='Ahmedabad',
age = 19
where student_id=106;

/*Question 36 of 50 — Medium
The name for student 105 was entered incorrectly as Kiran. Change it to Kiran Patel, but only if the current name is still Kiran. Write an UPDATE statement with both conditions.*/

update students
set name= 'Kiran Patel'
where student_id=105 and name ='kiran';

/*Question 37 of 50 — Medium
A duplicate student record was added with ID 107. Delete only that record, and only if its name is 'Dev'. Write a DELETE statement with both conditions.*/

delete from students where student_id=107 and name='dev';


/*Question 38 of 50 — Medium
A student withdrew from the course. Delete all students whose City is 'Jaipur' and whose age is under 20. Write a DELETE statement with both conditions.*/



delete from students where city='jaipur' and age<20;

/*Question 39 of 50 — Medium
Add a student with ID 108, name Maya, age 21, and city Delhi. Write an INSERT statement with the column names.*/


insert into students (student_id,name,age,city)values(108,'maya',21,'delhi');

/*Question 40 of 50 — Medium
A student’s city was recorded as 'Delih' by mistake. Correct it to 'Delhi' for student ID 108. Write the UPDATE statement.*/

update students
set city='Delhi'
where student_id=108;

/*Question 41 of 50 — Medium
Delete all students whose City is NULL. Write a DELETE statement. Use the correct SQL check for NULL.*/

delete from students where city is null;

/*Question 42 of 50 — Medium
Increase the age by 1 for students whose age is less than 20 and whose city is not NULL. Write an UPDATE statement with both conditions.*/


update students
set age=age+1 where age<20 and city is not null;


/*Question 43 of 50 — Medium
A student’s ID was entered incorrectly as 109, but the correct ID is 110. Change the ID from 109 to 110. Write an UPDATE statement. Assume ID 110 is not already in use.*/

update  students 
set student_id =110 where student_id=109;

/*Question 44 of 50 — Medium
Delete students whose city is either 'Delhi' or 'Mumbai'. Write a DELETE statement using OR.*/

delete from students where city  = 'delhi'or  city= 'mumbai';

/*Question 45 of 50 — Medium
Give every student in 'Delhi' a 10% age increase, rounding down to a whole number. Use FLOOR and update only Delhi students. Write the UPDATE statement.*/


update students
set age =floor(age+(age*0.1)) where city='delhi';


/*Question 46 of 50 — Medium
Reduce the age by 1 for students in 'Mumbai', but only if their age is greater than 18. Write the UPDATE statement.*/


update students
set age= age-1 where city='Mumbai' and age >18;

/*Question 47 of 50 — Medium
A cleanup request says to delete students whose city is 'Jaipur' or whose age is under 18. Write a DELETE statement using OR. Ensure each condition is complete.*/


delete from students where city ='jaipur' or age <18;

/*Question 48 of 50 — Medium
A student with ID 108 has moved from Delhi to Mumbai. Update the city only if the student’s current city is still 'Delhi'. Write an UPDATE statement with both conditions.*/


update students
set  city='mumbai' where student_id=108 and city='delhi';


/*Question 49 of 50 — Difficult
Before deleting students under age 18, first preview which rows would be deleted. Write the SELECT query you would run to check them. After that, write the DELETE statement using the same condition.*/

select * from students  where age <18;
delete from students where age<18;


/*Question 50 of 50 — Difficult
A company has two tables:
- Employees(EmployeeID, Name, DepartmentID, Salary)
- NewSalaries(EmployeeID, Salary)
Write a SQL Server MERGE statement that updates an employee’s salary from NewSalaries when the EmployeeID already exists in both tables. Don’t insert or delete rows.*/

merge Employees  as T
USING  NewSalaries AS S
ON T.EmployeeID=S.EmployeeID
WHEN MATCHED THEN 
UPDATE SET T.SALARY=S.SALARY ;









