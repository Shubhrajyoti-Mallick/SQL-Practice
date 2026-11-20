--Question 1 of 20 – Beginner--
--You have an existing table named Students:--
/*1.Student_ID	Student_Name	Age	City
			

Insert this one record:
- Student_ID: 101
- Student_Name: Rahul
- Age: 22
- City: Hyderabad*/
--sol--
insert into  students values (101,'Rahul',22,'Hyderabad')
select* from students


/*For Question 2, the required values are:
- Student_ID: 102
- Student_Name: 'Priya'
- Age: 23
- City: 'Bangalore'*/

--sol
insert into  students values (102,'Priya',23,'Bangalore')
select* from students

/*Question 3 of 20
Insert this record into Students:
Column	Value
Student_ID	103
Student_Name	Sneha
Age	21
City	Mumbai*/

--sol--
insert into Students values(103,'Sneha',21,'Mumbai')

/*Question 4 of 20 – Medium
You have an existing table named Employees:
Employee_ID	Employee_Name	Salary	Department	
101	Rahul	35000	IT	
102	Priya	42000	HR	

Task: Insert two new employees in a single INSERT statement.
Employee_ID	Employee_Name	Salary	Department	
103	Sneha	50000	IT	
104	Amit	38000	Finance	*/


--sol--
insert into Employees (Employee_ID, Employee_Name, Salary, Department) values(101,'Rahul',35000,'IT'),(102,'Priya',42000,'HR'),
(103,'Sneha',50000,'IT'),(104,'Amit',38000,'Finance')
select* from Employees
 

/*Q5 — Student Records

Create a table named Student_Records with the following columns:
- Student_ID
- Student_Name
- Age
- City
Insert 3 records in a single INSERT statement.

Requirements:
- Student_ID must uniquely identify each student.
- Student_Name cannot be empty (NULL).
- Age must be greater than 0.*/




--sol--
CREATE table Student_Records (Student_ID int primary key,
Student_Name varchar(20) not null,Age tinyint check(age>0),City varchar(20) not null);
insert into  Student_Records values(105,'shubha',84,'bbsr'),(102,'shubhashree',30,'bhadrak'),(103,'suna',39,'baloshore')
select* from Student_Records



/*Now Q6 – Product Inventory
Let's move to the next question. Don't redo Student_Records.

Create a table named Productt_Inventory with:
Column name	Your choice
Product_ID	Choose data type + constraint
Product_Name	Choose data type + constraint
Price	Choose data type + constraint
Stock	Choose data type + constraint
Category	Choose data type + constraint

Insert these 5 records:
Product_ID	Product_Name	Price	Stock	Category
201	Keyboard	850.00	25	Electronics
202	Mouse	450.00	40	Electronics
203	Monitor	12500.00	10	Electronics
204	Notebook	120.00	100	Stationery
205	Pen	20.00	200	Stationery

Constraints to apply:
- Product_ID → Primary Key
- Product_Name → Unique
- Price → Greater than 0
- Stock → Cannot be negative
- Category → Cannot be NULL*/


--sol--
create TABLE Productt_Inventory (Product_ID INT PRIMARY KEY,Product_Name  VARCHAR(10) UNIQUE,Price DECIMAL(10,2) CHECK (PRICE>0),Stock INT check (Stock>=0),Category VARCHAR (20)NOT NULL);
INSERT INTO Productt_Inventory VALUES(201,'Keyboard',850.00,25,'Electronics'),(202,'Mouse',450.00,25,'Electronics'),(203,'Monitor',12500.00,10,'Electronics'),
(204,'Notebook',120.00,100,'Electronics'),(205,'Pen',20.00,200,'Electronics')
select* from Productt_Inventory




/*Employee Details
Create a table named Employee_Details with the following columns:
Column name
Employee_ID
Employee_Name
Salary
Department
Hire_Date

Insert the following 5 records
Employee_ID	Employee_Name	Salary	Department	Hire_Date
301	Neha	45000	HR	2024-01-15
302	Raj	65000	IT	2023-06-10
303	Aman	55000	Finance	2024-03-20
304	Pooja	72000	IT	2022-11-05
305	Karan	40000	Sales	2025-02-01*/

--sol--
create TABLE Employee_Details(Employee_ID INT PRIMARY KEY,Employee_Name VARCHAR(20) NOT NULL,Salary DECIMAL(10,2) CHECK(SALARY>0),Department VARCHAR(20),Hire_Date DATE);
INSERT INTO Employee_Details VALUES(301,'Neha',45000,'HR','2024-01-15'),(302,'Raj',65000,'IT','2023-06-10'),
(303,'Aman',55000,'Finance','2024-03-20'),(304,'Pooja',72000,'IT','2022-11-05'),(305,'Karan',40000,'Sales','2025-02-01')
select* from Employee_Details


/*Question 8 of 20 — Customer Information
Difficulty: Medium

Create a table named Customer_Info.
Columns
- Customer_ID
- Customer_Name
- Email
- Phone_Number
- Age
- City
Insert these 5 records
Customer_ID	Customer_Name	Email	Phone_Number	Age	City
401	Ananya	ananya@gmail.com	9876543210	25	Kolkata
402	Rohan	rohan@gmail.com	8765432109	32	Delhi
403	Sneha	sneha@gmail.com	7654321098	19	Pune
404	Arjun	arjun@gmail.com	6543210987	45	Hyderabad
405	Priya	priya@gmail.com	5432109876	28	Mumbai

Constraints
- Customer_ID → Primary Key
- Customer_Name → NOT NULL
- Email → UNIQUE
- Phone_Number → UNIQUE and NOT NULL
- Age → Must be at least 18
- City → NOT NULL
You choose your own data types and constraints.*/


--sol--
create table customer_info
(Customer_ID int primary key,Customer_Name varchar(20) NOT NULL,
Email varchar (25) UNIQUE,Phone_Number char(12) unique not null,age tinyint check(age>18),city varchar(20) not null);
insert into customer_info values(401,'ananya','ananya@gmail.com','
9876543210',25,'Kolkata'),(402,'Rohan','rohan@gmail.com','8765432109',32,'Delhi'),
(403,'Sneha','sneha@gmail.com','7654321098',19,'Pune'),
(404,'Arjun','arjun@gmail.com','6543210987',45,'Hyderabad'),
(405,'Priya','priya@gmail.com','5432109876',28,'Mumbai')
select* from customer_info

/*9 out of 20
Create a table named Bank_Accounts_2.
Columns
- Account_ID
- Account_Holder
- Account_Number
- Balance
- Account_Type
- Opening_Date*/


CREATE  TABLE  Bank_Accounts2
(Account_ID int PRIMARY KEY,
Account_Number CHAR(12) UNIQUE NOT NULL,
Balance DECIMAL(10,2) CHECK(Balance>=0),Account_Type varchar(10)CHECK (Account_Type IN ('Savings', 'Current')),opening_date date not null);
select * from Bank_Accounts2


/*Question 10 out of 20— Product Inventory (Medium–Hard)
Create a table named Product_Inventory2 and insert 5 records.
Column	Requirement
Product_ID	Unique identifier
Product_Name	Cannot be NULL
Price	Must be greater than 0
Stock_Quantity	Cannot be negative
Category	Only Electronics, Clothing, or Grocery allowed
Expiry_Date	Can be NULL

Your tasks:
1. Create the table using appropriate data types and constraints.
2. Insert 5 records of your own choice.
3. Make sure all constraints are properly applied.
Don't copy my data types or constraint syntax — decide them yourself.*/

--sol--
CREATE TABLE Product_Inventory2
(Product_ID INT PRIMARY KEY,Product_Name VARCHAR(20) NOT NULL,
Price DECIMAL(10,2) CHECK(PRICE>0),
Stock_Quantity INT CHECK(Stock_Quantity>=0),
Category VARCHAR(20) CHECK(Category IN ('Electronics','Clothing','Grocery')),
Expiry_Date DATE);
 INSERT INTO Product_Inventory2 VALUES
 (101,'FAN',2500.00,3,'ELECTRONICS',NULL),
 (102,'TOP',250.00,3,'CLOTHING',NULL),
 (103,'HALDIPOWDER',200.00,10,'GROCERY',NULL),
 (104,'JACKET',1600.00,12,'CLOTHING',NULL),
 (105,'WIRE',250.00,0,'ELECTRONICS','2028-7-10');
 SELECT* FROM  Product_Inventory2


 /*Question 11 — Employee Payroll (Medium–Hard)
Create a table named Employee_Payroll and insert 5 records.
Column	Requirement
Employee_ID	Primary Key
Employee_Name	Not Null
Salary	Between 15,000 and 1,00,000
Department	Only IT, HR, Finance, Sales
Email	Unique
Bonus	Default 0, cannot be negative

Your task: Write the CREATE TABLE query first. Choose your own data types and constraints.*/
 
--SOL--
CREATE TABLE Employee_Payroll
(Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(20) NOT NULL,
Salary DECIMAL(10,2) CHECK( SALARY BETWEEN 15000 AND 100000),
Department VARCHAR(10) check(Department in ('IT','HR','Finance','Sales')),
Email varchar(30) UNIQUE,
Bonus  int default 0 check(bonus>=0));
insert into Employee_Payroll values
(1,'shubhra',19000.00,'IT','shubhra@gmail.com',5000),
(2,'shreebhasa',19000.00,'HR','shibhra@gmail.com',600),
(3,'shubhashree',16000.00,'Finance','shubh@gmail.com',80),
(4,'snigdha',16000.00,'sales','shura@gmail.com',81000),
(5,'sanghamitra',32000.00,'HR','shra@gmail.com',80);
select * from Employee_Payroll


/*Question 13 — Student Examination (Hard)
Create a table named Student_Results and insert 5 records.
Column	Requirement
Result_ID	Primary Key
Student_Name	NOT NULL
Marks	Between 0 and 100
Grade	Only A, B, C, D, F
Exam_Fee	DEFAULT 500; cannot be negative
Result_Date	NOT NULL
Email	UNIQUE

Tasks:
1. Create the table using suitable data types and constraints.
2. Insert 5 records.
3. Leave Exam_Fee out for at least 2 records to test DEFAULT.*/




--sol--
CREATE TABLE Student_Examination
(Result_ID INT PRIMARY KEY,
Student_Name VARCHAR(20) NOT NULL,
Marks TINYINT CHECK( marks BETWEEN 0 AND 100),
Grade CHAR(1) CHECK (Grade IN ('A','B','C','D','F')),
Exam_Fee DECIMAL(10,2)DEFAULT 500 CHECK(Exam_fee>=0),
Result_Date DATE NOT NULL,
email VARCHAR(20) UNIQUE);
insert into Student_Examination values
(1,'himanshu',10,'A',default,'2027-7-7','biki2001@gmail.com'),
(2,'munu',80,'A',default,'2027-6-7','munu2001@gmail.com'),
(4,'shrubhrshree',80,'B',890.00,'2027-6-7','dibu2001@gmail.com'),
(5,'kabita',80,'D',3400.00,'2027-6-7','kabita@gmail.com'),
(6,'radharani',80,'F',default,'2027-6-7','shree@gmail.com');
SELECT * FROM Student_Examination


/*Question 12 — Foreign Key Practice (Revised)
Table 1: Parent — Suppliers
Column	Requirement
Supplier_ID	PRIMARY KEY
Supplier_Name	NOT NULL
Email	UNIQUE
City	DEFAULT 'Bhubaneswar'

Insert 3 suppliers. Omit City for at least one record to test DEFAULT.
Table 2: Child — Supplier_Orders
Column	Requirement
Order_ID	PRIMARY KEY
Supplier_ID	FOREIGN KEY references Suppliers
Order_Amount	CHECK greater than 0
Order_Status	DEFAULT 'Pending'
Order_Date	NOT NULL

Insert 5 orders. Omit Order_Status for at least 2 records.*/



--SOL--
CREATE  TABLE parent_Suppliers
(Supplier_ID INT PRIMARY KEY,Supplier_Name VARCHAR(30) NOT NULL,Email VARCHAR(30) UNIQUE,City VARCHAR(20) DEFAULT 'Bhubaneswar');
INSERT INTO parent_Suppliers VALUES
(76,'zahra','dibya567@gmail.com',default),
(87,'liara','Rahul98@gmail.com','bhadrak'),
(9,'advani','radha@gmail.com','jajpur');
SELECT * from parent_Suppliers

CREATE  TABLE Supplier_Orders
(Order_ID INT PRIMARY KEY,Supplier_ID INT FOREIGN KEY  references parent_Suppliers
,Order_Amount VARCHAR(30) check(Order_Amount>0),
Order_Status VARCHAR(20) DEFAULT 'pending',
Order_Date date not null);
INSERT INTO Supplier_Orders VALUES
(12,'76','90',default,'2027-09-9'),
(13,'87','9','onway','2018-8-9'),
(14,'9','89','default','2025-9-9');
SELECT * from parent_Suppliers


/* question 14
Insert 5 records into Supplier_Orders with these rules:
- Order_ID → unique integer
- Supplier_ID → must exist in parent_Suppliers
- Order_Amount → greater than 0
- Order_Status → at least 2 orders must use DEFAULT
- Order_Date → valid date*/

--sol--
insert into Supplier_Orders values
(45,76,8,default,'2023-7-9'),
(44,76,9,default,'2023-6-9'),
(49,76,9,'active','2023-4-9'),
(42,76,9,'shipped','2023-6-10'),
(41,76,9,default,'2023-6-6');
select* from Supplier_Orders


/*question 15
: Departments & Employees
Part 1 — Create Parent table Departments
Column	Requirement
Dept_ID	INT, Primary Key
Dept_Name	VARCHAR(20), NOT NULL, UNIQUE

Insert 5 departments.

Part 2 — Create Child table Staff
Column	Requirement
Staff_ID	INT, Primary Key
Staff_Name	VARCHAR(30), NOT NULL
Dept_ID	INT, Foreign Key referencing Departments(Dept_ID)
Salary	INT, CHECK salary greater than 0

Insert 3 staff records using existing department IDs.

Part 3: Display both tables using SELECT.*/



--sol--
CREATE TABLE Departments
(Dept_ID INT Primary Key,
Dept_Name VARCHAR(50) NOT NULL UNIQUE);
insert into Departments values
(101,'accounts'),
(102,'reception'),
(103,'teaching'),
(104,'adminstration'),
(105,'game');
select * from Departments
CREATE TABLE staff
(Staff_ID INT Primary Key,
Staff_Name VARCHAR(30) NOT NULL,
Dept_ID	INT Foreign Key references Departments(Dept_ID),
Salary	INT CHECK  (Salary>0));
select * from  
INSERT INTO staff VALUES
(1,'SHINA',101,2300),
(2,'SHIRA',102,230),
(8,'CHINAM',101,2600);
SELECT * FROM staff



/*Create two tables: Categories (Parent) and Items (Child).

16. Parent table: Categories
Column	Requirement
Category_ID	INT, Primary Key
Category_Name	VARCHAR(30), NOT NULL, UNIQUE

Insert 3 categories.

2. Child table: Items
Column	Requirement
Item_ID	INT, Primary Key
Item_Name	VARCHAR(30), NOT NULL
Category_ID	INT, Foreign Key referencing Categories
Price	DECIMAL(8,2), CHECK greater than 0

Insert 3 items using valid Category IDs.*/


--SOL--
CREATE TABLE Catagories
(Catagory_ID INT Primary Key ,
Category_Name VARCHAR(30) NOT NULL UNIQUE);
INSERT INTO Catagories values
(1,'hello'),
(2,'cello'),
(3,'mello');
select* from Catagories
CREATE TABLE ITEMS
(Item_ID INT Primary Key,
Item_Name VARCHAR(30) NOT NULL,
Category_ID	INT Foreign Key referencES Catagories(Category_ID),
Price DECIMAL(8,2) CHECK(PRICE>0));
insert into ITEMS values
(101,'charger',1,102.78),
(106,'pen',2,100.78),
(104,'bulb',1,160.78);
SELECT * FROM ITEMS
SELECT* FROM Catagories



/* QUESTION 17
Challenge: Clinic Appointment System
Create 2 related tables.
1. Doctors (Parent table)
Column	Requirement
Doctor_ID	INT, Primary Key
Doctor_Name	VARCHAR(30), NOT NULL
Specialization	VARCHAR(20), UNIQUE
Consultation_Fee	DECIMAL(8,2), CHECK greater than 500

Insert 3 doctors.
2. Appointments (Child table)
Column	Requirement
Appointment_ID	INT, Primary Key
Patient_Name	VARCHAR(30), NOT NULL
Doctor_ID	INT, Foreign Key referencing Doctors
Appointment_Fee	DECIMAL(8,2), CHECK greater than 0
Status	VARCHAR(15), DEFAULT 'Scheduled', CHECK must be Scheduled, Completed, or Cancelled
Appointment_Date	DATE, NOT NULL

Rules for your insert
- Insert 4 appointments.
- At least 2 must use DEFAULT for Status.
- Use only existing Doctor_IDs.
- Use different appointment statuses.
- Don't forget your commas, datatype lengths, and constraints.*/
--SOL--
CREATE TABLE Doctors
(Doctor_ID INT Primary Key,
Doctor_Name	VARCHAR(30) NOT NULL,
Specialization VARCHAR(20) UNIQUE,
Consultation_Fee DECIMAL(8,2) CHECK (Consultation_Fee>500));
INSERT INTO Doctors VALUES
(121,'BIBHUTI NAYAK','ORTHOLOGIST',5670.00),
(122,'MONALISA NAYAK','GYNOCOLOGIST',1000.00),
(123,'AMITA NAYAK','CARDIOLOGIST',700.00);
SELECT * FROM Doctors

CREATE TABLE Appointments 
(Appointment_ID	INT Primary Key,
Patient_Name VARCHAR(30)  NOT NULL,
Doctor_ID INT  Foreign Key references Doctors(Doctor_ID),
Appointment_Fee	DECIMAL(8,2) CHECK (Appointment_Fee>0),
Status	VARCHAR(15) DEFAULT 'Scheduled' CHECK (Status IN ('Scheduled', 'Completed','Cancelled')),
Appointment_Date DATE NOT NULL);
INSERT INTO Appointments VALUES
(111,'SHUBHRA',121,234.00,DEFAULT,'2027-8-9'),
(112,'SHUBHRA',122,234.00,'Cancelled','2027-8-10'),
(113,'SHUBHRA',123,234.00,'Completed','2027-8-13'),
(114,'SHUBHRA',121,234.00,DEFAULT,'2027-8-14');
SELECT * FROM Appointments


/*SQL Challenge 
QUESTION 18
You need to create 2 related tables and perform operations on them.
1. Parent table: Bank_Customers
Column	Requirement
Customer_ID	INT, Primary Key
Customer_Name	VARCHAR(40), NOT NULL
Email	VARCHAR(50), UNIQUE
Age	INT, CHECK Age >= 18
City	VARCHAR(20), DEFAULT 'Bhubaneswar'

Insert 3 customers. At least one customer must use the default city.
2. Child table: Bank_Transactions
Column	Requirement
Transaction_ID	INT, Primary Key
Customer_ID	INT, Foreign Key referencing Bank_Customers
Amount	DECIMAL(10,2), CHECK Amount > 0
Transaction_Type	VARCHAR(10), only 'Deposit' or 'Withdraw'
Transaction_Date	DATE, NOT NULL

Insert 4 transactions. Use only valid Customer IDs.*/


--SOL--
CREATE TABLE Bank_Customers
(Customer_ID	INT Primary Key,
Customer_Name	VARCHAR(40) NOT NULL,
Email VARCHAR(50) UNIQUE,
Age	INT CHECK (Age >= 18),
City	VARCHAR(20) DEFAULT 'Bhubaneswar');
INSERT INTO Bank_Customers values
(101,'radha','radha@gmail.com',34,'bhadrak'),
(102,'rani','rani@gmail.com',30,default),
(104,'raita','raita@gmail.com',30,default),
(105,'rita','rita@gmail.com',37,'balasore');

CREATE TABLE Bank_Transactions
(Transaction_ID	INT Primary Key,
Customer_ID	INT Foreign Key referenCES Bank_Customers(Customer_ID),
Amount DECIMAL(10,2) CHECK (Amount > 0),
Transaction_Type VARCHAR(10) CHECK ( Transaction_Type IN ('Deposit' ,'Withdraw')),
Transaction_Date DATE NOT NULL);

INSERT INTO Bank_Transactions values
(1,101,734.00,'deposit','2026-8-9'),
(2,102,284.00,'Withdraw','2026-8-1'),
(3,101,236.00,'deposit','2026-8-5'),
(4,102,534.00,'deposit','2026-8-8');

select * from Bank_Transactions


/*SQL Question 19 — Advanced Constraints & INSERT Challenge 🔥
Task: Create Employee_Records
Column	Requirement
Employee_ID	INT — Primary Key
Employee_Name	VARCHAR(40) — NOT NULL
Email	VARCHAR(50) — UNIQUE, NOT NULL
Age	INT — must be between 21 and 60
Salary	DECIMAL(10,2) — must be greater than 15,000
Department	Only 'IT', 'HR', 'Finance', 'Sales'
Joining_Date	DATE — NOT NULL
City	VARCHAR(20) — DEFAULT 'Bhubaneswar'
Bonus	DECIMAL(8,2) — DEFAULT 0, cannot be negative
Manager_ID	INT — Foreign Key referencing Employee_ID in the same table, can be NULL

Your challenge
1. Create the table with all constraints.
2. Insert 5 employees.
3. At least one employee must use DEFAULT values.
4. At least one employee must have NULL for Manager_ID (the top-level manager).
5. At least one employee must have a manager whose Employee_ID already exists in the table.
6. Use valid values for every constraint.*/

--SOL--
CREATE TABLE Employee_Records
(Employee_ID INT  Primary Key,
Employee_Name VARCHAR(40) NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
Age	INT CHECK(Age between 21 and 60),
Salary	DECIMAL(10,2) check(Salary > 15000),
Department varchar(20) check(Department IN ('IT','HR','Finance','Sales')),
Joining_Date DATE  NOT NULL,
City VARCHAR(20) DEFAULT 'Bhubaneswar',
Bonus	DECIMAL(8,2) DEFAULT 0 check(Bonus>=0),
Manager_ID	INT  Foreign Key references Employee_Records(Employee_ID));


INSERT INTO Employee_Records VALUES
(1,'Alvina','alvina@email.com',23,23000.00,'IT','2027-7-9',default,default,1),
(2,'Shubhra','shubhra@email.com',25,30000.00,'HR','2027-7-10',default,default,1) ,
(3,'jiban','jiban@email.com',50,40000.00,'Finance','2027-7-1','bhadrak',2300.00,2),
(4,'ghanashyam','ghanashyam@email.com',40,24000.00,'HR','2027-9-8','balosore',2400,3),
(5,'prem','prem@email.com',30,20000.00,'HR','2027-3-9',default,default,5);
SELECT * FROM  Employee_Records


/*SQL Practice QUESTION 20
— Difficult Interview Question 🔥
Topic: CREATE TABLE + Constraints + INSERT only
Scenario: Online Shopping Orders
Create 2 tables: Customers and Orders.
1. Customers table
Column	Requirement
Customer_ID	INT, Primary Key
Customer_Name	VARCHAR(40), NOT NULL
Email	VARCHAR(60), UNIQUE, NOT NULL
Age	CHECK: 18 to 65
City	DEFAULT 'Bhubaneswar'
Account_Status	DEFAULT 'Active', only Active or Inactive allowed

2. Orders table
Column	Requirement
Order_ID	INT, Primary Key
Customer_ID	Foreign Key referencing Customers
Product_Name	VARCHAR(40), NOT NULL
Quantity	CHECK: between 1 and 10
Price	DECIMAL(10,2), CHECK: greater than 0
Discount	DEFAULT 0, CHECK: between 0 and 30
Order_Status	DEFAULT 'Pending', only Pending, Shipped, Delivered, Cancelled
Order_Date	DATE, NOT NULL

3. Insert requirements
- Insert 5 customers.
- Insert 7 orders.
- Use DEFAULT for at least 2 values.
- Include different cities and account statuses.
- Include at least one customer with no orders.
- Include multiple orders for the same customer.
- Make sure every constraint is satisfied.*/


--SOL--
CREATE TABLE Customers_table
(Customer_ID INT Primary Key,
Customer_Name VARCHAR(40) NOT NULL,
Email VARCHAR(60) UNIQUE NOT NULL,
Age	 int CHECK(age between 18 and 65),
City varchar (20) DEFAULT 'Bhubaneswar',
Account_Status varchar(20)  DEFAULT 'Active', check(Account_Status IN ( 'Active','Inactive')));
INSERT INTO Customers_table VALUES
(100,'SAINA','saina@gmail.com',30,default,default),
(101,'RAINA','raina@gmail.com',30,'bhadrak',default),
(102,'MAINA','maina@gmail.com',30,'anugul',default),
(103,'LAINA','laina@gmail.com',30,'cuttack','active'),
(104,'EAINA','eaina@gmail.com',30,'berhumpur',default);
select * from Customers_table



CREATE TABLE  Orders_table
(Order_ID INT Primary Key,
Customer_ID	 int Foreign Key references Customers_table (Customer_ID),
Product_Name VARCHAR(40) NOT NULL,
Quantity int CHECK(Quantity between 1 and 10),
Price DECIMAL(10,2) CHECK( Price>0),
Discount  int DEFAULT 0 CHECK( Discount between 0 and 30),
Order_Status  varchar (30) DEFAULT 'Pending' check( Order_Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
Order_Date DATE NOT NULL);

INSERT INTO  Orders_table VALUES
(1,101,'CLOTH',4,345.00,DEFAULT,'Pending','2026-9-9'),
(2,102,'PEN',8,500.00,DEFAULT,'Shipped','2026-9-9'),
(3,103,'LIGHT',4,900.00,DEFAULT,'Cancelled','2026-9-9'),
(4,101,'GROCERY',5,345.00,DEFAULT,'Pending','2026-9-9'),
(5,104,'KITCHEN ITEMS',4,345.00,DEFAULT,'Pending','2026-9-9'),
(6,102,'POWDER',4,345.00,DEFAULT,DEFAULT,'2026-9-9'),
(7,104,'GUM',4,345.00,DEFAULT,'Shipped','2026-9-9');

SELECT * FROM Orders_table 

















 

