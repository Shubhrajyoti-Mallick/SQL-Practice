--SQL BASICS (CREATE TABLE,insert value)
Question 1 of 10
/*1.Create a table named Students with these columns:
- Student_ID
- Student_Name
- Age
- City*/
	--------SOLUTION
CREATE table Students (Student_ID int,Student_Name varchar(20),Age tinyint,City varchar(10));
select* from students;


/*Question 2 of 10
Create a table named Employees with these columns:
- Employee_ID
- Employee_Name
- Salary
- Department
Choose your own data types and constraints. Send me your query!*/

--sol--
create  TABLE Employees (Employee_ID smallint primary key ,Employee_Name varchar(30) not null,Salary decimal(10,2) check(salary>0),Department varchar(10));
select* from Employees

/*Question 3 of 10
Create a table named Products with these columns:
- Product_ID
- Product_Name
- Price
- Quantity
- Category
Choose your own data types and constraints.*/


--sol--
create TABLE Products (Product_ID TINYINT PRIMARY KEY,Product_Name VARCHAR(30) UNIQUE,Price DECIMAL(7,2) CHECK(Price>0),Quantity NUMERIC(4),Category VARCHAR (10) NOT NULL);
SELECT * FROM  Products

/*Question 4 of 10 – Customers
Create a table named Customers with these columns:
- Customer_ID
- Customer_Name
- Email
- Phone_Number
- Age
- City*/

--sol--
create TABLE Customers
(Customer_ID tinyint primary key,Customer_Name varchar (10),Email varchar(30) unique,Phone_Numbers varchar(12) unique,Age tinyint check(age>0 and age<100),City varchar(10));

/*Question 5 of 10
Create a table named Orders with these columns:
- Order_ID
- Customer_ID
- Order_Date
- Order_Amount
- Order_Status*/

--sol
create TABLE Orders
(Order_ID VARCHAR(10) primary key,Customer_ID smallint unique,Order_Date date not null,Order_Amount decimal(10,2),Order_Status varchar(30) not null);
select* from Orders

/* Question 7 of 10
Create a table named Bank_Accounts with these columns:
- Account_ID
- Account_Holder_Name
- Account_Number
- Balance
- Account_Type
- Opening_Date*/

--sol--
create TABLE Bank_Accounts(Account_ID VARCHAR(10) PRIMARY KEY,Account_Holder_Name VARCHAR(10),Account_Number CHAR (12) UNIQUE,Balance DECIMAL(10,2),Account_Type VARCHAR(10),Opening_Date DATE NOT NULL);
SELECT* from Bank_Accounts

/*Question 8 of 10 – INSERT
Suppose you have already created the Bank_Accounts table.

Insert this one record:
Account_ID	Account_Holder_Name	Account_Number	Balance	Account_Type	Opening_Date
A101	Priya	123456789012	25000.50	Savings	2026-11-18*/


 --sol--
 insert into Bank_Accounts values('A101','Priya','123456789012',25000.50,'Savings','2026-11-18')
 select* from Bank_Accounts


 /*Question 9 – Try again
Insert these three new records in one INSERT statement:
Account_ID	Name	Account_Number	Balance	Type	Opening_Date
A102	Rahul	234567890123	35000.00	Current	2026-10-10
A103	Sneha	345678901234	42000.50	Savings	2026-09-15
A104	Amit	456789012345	18000.00	Savings	2026-08-20*/

insert into Bank_Accounts values('A102','Rahul','234567890123',	35000.00,'Current','2026-10-10'),
('A103','Sneha','345678901234',42000.50,'Savings','2026-09-15'),
('A104','Amit','456789012345',18000.00,'Savings','2026-08-20');

/*Question 10 of 10 – Final challenge
Create a table named Library_Books with these columns:
- Book_ID
- Book_Name
- Author_Name
- ISBN
- Price
- Published_Date
- Available_Copies*/

--solution--
create TABLE Library_Bookss
(Book_ID varchar(10) primary key,Book_Name varchar(10),Author_Name varchar(10),Price decimal(10,2) check(price>0),
Published_Date date,Available_Copies int check (Available_Copies>=0));
select* from Library_Bookss