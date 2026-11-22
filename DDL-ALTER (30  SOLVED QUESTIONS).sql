--Category 1 — ADD (Easy)--
--Q1–Q6 · Adding new columns
--Q1. Add a column Age of type INT to Employees.
--sol
ALTER TABLE  Employees
add Age int;

--Q2. Add a column Contact_Number of type VARCHAR(15).
ALTER TABLE Employees
ADD Contact_Number varchar(15);

--Q3. Add a column Gender of type VARCHAR(10).
ALTER TABLE Employees
ADD  Gender VARCHAR(10);

/*Q4. Add two columns in a single statement:
- Country — VARCHAR(30)
- Pincode — VARCHAR(10)*/


ALTER TABLE Employees
ADD Country  VARCHAR(30),
Pincode VARCHAR(10);

--Q5. Add a column Experience of type DECIMAL(4,1).
ALTER TABLE Employees
ADD Experience DECIMAL(4,1);

--Q6. Add a column Is_Active of type BIT with a default value of 1.
ALTER TABLE Employees
 ADD Is_Active BIT DEFAULT 1;
 SELECT * FROM Employees

--Category 2 — ALTER COLUMN (Easy → Medium)--
--Q7–Q12 · Modifying existing columns
--Q7. Change Employee_Name from VARCHAR(30) to VARCHAR(80).
ALTER TABLE Employees
ALTER COLUMN Employee_Name VARCHAR(80);


--Q8. Change Salary from INT to DECIMAL(12,2).
ALTER TABLE Employees
ALTER COLUMN Salary DECIMAL(12,2);

--Q9. Change City to VARCHAR(50)
ALTER TABLE Employees
ALTER COLUMN City VARCHAR(50)

--Q10. Make the Contact_Number column allow NULL values.
ALTER TABLE Employees
ALTER COLUMN Contact_Number VARCHAR(15) NULL;

--Q11. Make the Employee_Name column NOT NULL.
ALTER TABLE Employees
ALTER COLUMN Employee_Name VARCHAR(80) NOT NULL;

--Q12. Change Experience to DECIMAL(5,2) and allow NULL values.
--SOL--
ALTER TABLE Employees
ALTER COLUMN Experience DECIMAL(5,2) ;

--Category 3 — ADD CONSTRAINT (Medium)
--Q13–Q19 · Adding rules/CONSTRAINTS to existing tables
--Q13. Add a CHECK constraint to ensure Age is at least 18. Give it a proper constraint name.
ALTER TABLE Employees
ADD CONSTRAINT CK_Age
check(age>18);


--Q14. Add a CHECK constraint to ensure Salary is greater than 10,000.
ALTER TABLE Employees
ADD CONSTRAINT CK_Salary
Check(Salary >10000);

--Q15. Add a UNIQUE constraint to Contact_Number with a proper constraint name.
ALTER TABLE Employees
ADD  CONSTRAINT UQ_Contact_Number
unique(Contact_Number);

--Q16. Add a DEFAULT constraint to Gender with default value 'Not Specified'. Give it a name.
ALTER TABLE Employees
ADD CONSTRAINT DK_Gender
DEFAULT 'Not Specified' FOR Gender;

--Q17. Add a CHECK constraint to Gender that allows only 'Male', 'Female', or 'Other'.
ALTER TABLE Employees
ADD CONSTRAINT CK_GENDER
Check( gender in ('Male','Female','Other'));

--Q18. Add a CHECK constraint to ensure Experience is not negative.
ALTER TABLE Employees
ADD CONSTRAINT CK_Experience
Check( Experience >0);

--Q19. Add a DEFAULT constraint to Country with the default value 'India', and name the constraint.

ALTER TABLE Employees
ADD CONSTRAINT DK_Country
DEFAULT  'India' FOR  Country

--Category 4 — DROP COLUMN & DROP CONSTRAINT (Medium)
--(REMOVING A COLUMN OR CONSTRAINT FROM EXISTING TABLE)
--Q20. Remove the Pincode column from Employees.
ALTER TABLE Employees
DROP COLUMN Pincode;
SELECT * FROM Employees
--Q21. Drop the UNIQUE constraint that you created on Contact_Number.
ALTER TABLE Employees
DROP CONSTRAINT UQ_Contact_Number;

--Q22. Drop the CHECK constraint you created on Age.
ALTER TABLE Employees
DROP CONSTRAINT CK_Age;

--Q23. Drop the DEFAULT constraint you created on Country.
ALTER TABLE Employees
DROP CONSTRAINT DK_Country;

--Q24. Remove the Gender column from Employees. If constraints are attached to this column, remove those first.
ALTER TABLE Employees
DROP CONSTRAINT DK_GENDER;

ALTER TABLE Employees
DROP CONSTRAINT CK_GENDER;
 
ALTER TABLE Employees
DROP COLUMN GENDER;

--Category 5 — ALTER TABLE with multiple operations (Hard)
--Q25. Add a column Bonus of type DECIMAL(10,2) and, in the same statement, assign a named DEFAULT constraint of 0.
ALTER TABLE Employees
ADD Bonus DECIMAL(10,2) DEFAULT 0;

--Q26. Add a column Rating of type INT with a named CHECK constraint that allows values only between 1 and 5.
ALTER TABLE Employees
ADD Rating INT 
CONSTRAINT CK_Rating
CHECK (rating BETWEEN 1 AND 5);

--Q27. Modify Salary to DECIMAL(12,2), then add a named CHECK constraint ensuring salary is at least 20,000.
alter table Employees
alter column Salary DECIMAL(12,2);
alter table Employees
add constraint ck_Salary
check(salary>=20000);


--Category 6 — Advanced Challenges (Hard).Q28–Q30 · Real-world table modifications
/*Q28. — Department relationship

Create a new table Departments containing:
- Department_ID — INT, PRIMARY KEY
- Department_Name — VARCHAR(40), NOT NULL and UNIQUE
Then use ALTER TABLE Employees to:
1. Add a Department_ID column.
2. Add a named FOREIGN KEY constraint referencing Departments(Department_ID).*/



CREATE TABLE Departments
(Department_ID INT PRIMARY KEY,
Department_Name VARCHAR(40) NOT NULL UNIQUE);
ALTER TABLE Employees
ADD Department_ID INT,
CONSTRAINT FK_Department_ID
FOREIGN KEY(Department_ID) REFERENCES Departments(Department_ID);


/*Q29. — Multiple constraints

Add a column Account_Status of type VARCHAR(15) to Employees, and in the same statement:
- Give it a DEFAULT value of 'Active'.
- Add a named CHECK constraint that permits only 'Active' or 'Inactive'.*/
 ALTER  TABLE Employees
 ADD Account_Status VARCHAR(15),
 CONSTRAINT DK_Account_Status
 DEFAULT 'Active' FOR Account_Status,
 CONSTRAINT CK_Account_Status
 CHECK(Account_Status IN ('Active','Inactive'));

 --Q30. — Final challenge

/*Modify the Employees table as follows:
1. Add Last_Name of type VARCHAR(30).
2. Change Employee_Name to VARCHAR(100).
3. Change Salary to DECIMAL(12,2).
4. Add a named CHECK constraint ensuring Salary is greater than 25,000.
5. Add Work_Mode of type VARCHAR(15) with a DEFAULT value 'Office'.
6. Add a named CHECK constraint allowing only 'Office', 'Remote', or 'Hybrid' for Work_Mode.
7. Add a Manager_ID column of type INT.
8. Add a named self-referencing FOREIGN KEY where Manager_ID references Employee_ID in the same table.*/

--1. Add Last_Name of type VARCHAR(30).
ALTER TABLE Employees
ADD Last_Name  VARCHAR(30);
--2.Change Employee_Name to VARCHAR(100).ALTER TABLE Employees
ALTER COLUMN Employee_Name VARCHAR(100);
--3. Change Salary to DECIMAL(12,2).
ALTER TABLE  Employees
ALTER COLUMN Salary DECIMAL(12,2);
--4.Add a named CHECK constraint ensuring Salary is greater than 25,000.
ALTER TABLE Employees
ADD CONSTRAINT CK_SALARY
CHECK (SALARY>2500)
--5. Add Work_Mode of type VARCHAR(15) with a DEFAULT value 'Office'.
ALTER TABLE Employees
ADD Work_Mode VARCHAR(15) ,
CONSTRAINT DK_Work_Mode
DEFAULT 'Office' FOR Work_Mode;
--6.Add a named CHECK constraint allowing only 'Office', 'Remote', or 'Hybrid' for Work_Mode.
ALTER TABLE Employees
ADD CONSTRAINT CK_Work_Mode
CHECK(Work_Mode IN ('Office','Remote','Hybrid'));
--7. Add a Manager_ID column of type INT.
ALTER TABLE Employees
ADD Manager_ID INT;
--8. Add a named self-referencing FOREIGN KEY where Manager_ID references Employee_ID in the same table.*/
ALTER TABLE Employees
ADD CONSTRAINT FK_Manager_ID
FOREIGN KEY (Manager_ID) REFERENCES Employees (Employee_ID);
SELECT * FROM Employees








 

