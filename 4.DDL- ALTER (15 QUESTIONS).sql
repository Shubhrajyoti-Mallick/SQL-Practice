--Category 1 — Mixed Column Operations
/*Q1–Q6 · Difficult

Q1. Employee modification

Your existing Employees table has Employee_ID, Employee_Name and Salary.
1. Add Email VARCHAR(100) and apply a named UNIQUE constraint in the same statement.
2.  apply a named CHECK constraint ensuring Age is between 18 and 60.
3. Add a named DEFAULT constraint of 'Bhubaneswar'.*/

--SOL--
--1
ALTER TABLE Employees
ADD Email VARCHAR(100),
CONSTRAINT UQ_Email
UNIQUE(Email);
SELECT * FROM Employees

--2
ALTER TABLE Employees
ADD CONSTRAINT CK_AGE
CHECK(AGE BETWEEN 18 AND 60)

--3
ALTER TABLE Employees
ADD CONSTRAINT DK_CITY
DEFAULT 'Bhubaneswar' FOR CITY 

/*Q2. Multiple column modifications

In Employees:
1. Change Employee_Name to VARCHAR(100).
2. Change Salary to DECIMAL(12,2).
3. Change Contact_Number to VARCHAR(15) and allow NULL.
4. Make Email NOT NULL.*/
--SOL--
1.
ALTER TABLE Employees
ALTER COLUMN Employee_Name VARCHAR(100);

ALTER TABLE Employees
ALTER COLUMN salary DECIMAL(12,2);

ALTER TABLE Employees
ALTER COLUMN Contact_Number VARCHAR(15) NULL;

ALTER TABLE Employees
drop uq_email;

ALTER TABLE Employees
ALTER  COLUMN EMAIL VARCHAR(100) NOT NULL;


ALTER  TABLE Employees
ADD CONSTRAINT UQ_EMAIL
UNIQUE(EMAIL);


/*Q3. Add and remove columns
1. Add Temporary_Address VARCHAR(100).
2. Add Permanent_Address VARCHAR(100).
3. Remove Temporary_Address.
4. Change Permanent_Address to VARCHAR(150).*/


ALTER TABLE Employees
ADD Temporary_Address VARCHAR(100),


ALTER TABLE Employees
ADD Permanent_Address VARCHAR(100);

ALTER TABLE Employees
DROP COLUMN Temporary_Address;


ALTER TABLE Employees
ALTER COLUMN  Permanent_Address VARCHAR(150);



/*Q4. Multiple constraints

Add a column Experience2DECIMAL(5,2) and apply a named CHECK constraint ensuring experience is between 0 and 40.

Then add a named DEFAULT constraint with value 0 to the same column.*/


--SOL--
ALTER TABLE Employees
ADD Experienc2 DECIMAL(5,2),
CONSTRAINT CK_XPERIENCE
CHECK(EXPERIENCE BETWEEN 0 AND 40),
CONSTRAINT DK_EXPERIENCE
DEFAULT 0 FOR Experience;


--Q5. Constraint modification

/*ur Employees table has a CHECK constraint on Salary requiring Salary to be greater than 10,000.
1. Remove the existing CHECK constraint.
2. Add a new named CHECK constraint requiring Salary to be at least 25,000.*/

SOL--

ALTER TABLE Employees
DROP CK_SALARY;

ALTER TABLE Employees
ADD CONSTRAINT CK_SALARY
CHECK(SALARY>=25000);


--Q6. NULL and NOT NULL challenge
/*
1. Change Age to NOT NULL.
2. Change City to allow NULL.
3. Change Salary to DECIMAL(10,2) and make it NOT NULL.*/

ALTER TABLE Employees
ALTER COLUMN AGE INT   NOT NULL;


ALTER TABLE Employees
ALTER COLUMN Salary DECIMAL(10,2) NOT NULL;

--CATAGORY  CONSTRAINT COMBINATION--
/*
Q7–Q12 · Difficult

Q7. Product table

Create a table Products containing:
- Product_ID INT PRIMARY KEY
- Product_Name VARCHAR(50) NOT NULL
- Price DECIMAL(10,2)*/

CREATE TABLE Products
( Product_ID INT PRIMARY KEY,
Product_Name VARCHAR(50) NOT NULL,
Price DECIMAL(10,2));


/*Now use ALTER TABLE to:
1. Add Stock INT.
2. Add a named CHECK constraint ensuring Stock is not negative.
3. Add a named DEFAULT constraint of 0 to Stock.
4. Add Category VARCHAR(30) with a named DEFAULT constraint of 'General'.*/

ALTER TABLE Products
ADD Stock INT,
CONSTRAINT ck_STOCK
CHECK (STOCK>=0),
Category VARCHAR(30),
constraint dk_stock
default 'general' for stock;


/*Q8. Remove multiple constraints

Your Products table contains:
- A CHECK constraint on Price.
- A DEFAULT constraint on Stock.
- A UNIQUE constraint on Product_Name.*/

alter table Products
drop constraint dk_stock,
constraint ck_price,
constraint uk_productname;

/*Q9. Add multiple columns with constraints

Add the following columns to Employees:
- Bonus DECIMAL(10,2) with DEFAULT 0.
- Account_Status VARCHAR(15) with DEFAULT 'Active' and CHECK allowing only Active or Inactive.
Use proper constraint names.*/



alter table  Employees
add bonus decimal(10,2) ,
constraint dk_bonus
default 0 for bonus,
Account_Status VARCHAR(15),
constraint dk_Account_Status
default 'Active' for Account_Status,
constraint ck_Account_Status
check (Account_Status in ('Active','Inactive'));


/*Q10. Replace a constraint

Your Employees table has a CHECK constraint allowing Age between 18 and 65.

Change the rule so that Age must be between 21 and 60.

Do not delete the Age column.*/

alter table employees
drop ck_age ;

alter table employees
add  constraint CK_AGE
check(age between 21 and 60);

/*Q11. UNIQUE constraint challenge

Your Employees table has an Email column.
1. Add a named UNIQUE constraint to Email.
2. Remove that UNIQUE constraint.
3. Add a new UNIQUE constraint with a different name.*/

alter  table Employees
add constraint uq_email
unique(email);

alter table Employees
drop constraint uq_email;

alter table Employees
add constraint uk_email
unique(email);


/*Q12. Multiple column and constraint operations

In one ALTER TABLE statement, add:
- Rating INT with a named CHECK constraint between 1 and 5.
- Status VARCHAR(20) with a named DEFAULT constraint of 'Pending'.*/

--sol--

alter table employees
add rating int,
constraint ck_rating
check(rating  between 1 and 5),
Status VARCHAR(20),
constraint dk_status
default 'Pending' for Status ;


/*Category 3 — Relationships and Keys
Q13–Q18 · Advanced

Q13. Department relationship

Create Departments with:
- Department_ID INT PRIMARY KEY
- Department_Name VARCHAR(40) NOT NULL*/

create table Departments
( Department_ID INT PRIMARY KEY,
 Department_Name VARCHAR(40) NOT NULL);

 /*Then:
1. Add Department_ID to Employees.
2. Add a named FOREIGN KEY referencing Departments.
3. Make sure both Department_ID columns have matching data types.*/


alter table Employees
add Department_ID int 
constraint fk_Department_ID
foreign key(Department_ID) references Departments(Department_ID);


/*Q14. Self-referencing relationship

In Employees:
1. Add Manager_ID INT.
2. Make Employee_ID a PRIMARY KEY if it doesn't already have one.
3. Add a named self-referencing FOREIGN KEY using Manager_ID and Employee_ID.*/

alter table Employees
add Manager_ID int,
constraint pk_Employee_ID
primary key(Employee_ID),
constraint fk_Manager_ID
foreign key(Employee_ID) references Employees(Employee_ID);

