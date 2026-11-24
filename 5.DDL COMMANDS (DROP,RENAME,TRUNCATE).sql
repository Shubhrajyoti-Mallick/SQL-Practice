--1. Write a query to drop the Employees table.
DROP  table Employees;
--2. Write a query to drop the Students table.
DROP TABLE Students;

--3. Write a query to truncate the Employees table.
TRUNCATE TABLE Employees;

--4. Write a query to truncate the Products table.
TRUNCATE TABLE Products;


--5. Write a query to drop a database named CompanyDB.
DROP DATABASE CompanyDB;

--6. Write a query to drop a view named Employee_View.
DROP VIEW Employee_View

--7. Rename the table Employees to Staff.
EXEC SP_RENAME
'Employees',
'STAFF';

8. Rename the table Students to College_Students.
EXEC SP_RENAME
'Students',
'College_Students';



9. Rename the column Employee_Name to Full_Name in the Employees table.
exec sp_rename
'Employees.Employee_Name',
'Full_Name',
'COLUMN';


10. Rename the column Student_Name to Full_Name in the Students table.
exec sp_rename
'student.student_name',
'full_name',
'COLUMN';
--11. Drop the Old_Employees table.
DROP TABLE Old_Employees;

--12. Drop the Customer_Records table.
DROP TABLE Customer_Records;

--13. Truncate the Orders table without deleting its structure.
TRUNCATE TABLE Orders;

--14. Truncate the Library_Books table.
TRUNCATE TABLE Library_Books;

--15. Rename the Products table to Product_Details.
EXEC SP_RENAME
'Products',
'Product_Details';


--16. Rename the Salary column to Monthly_Salary in Employees.
exec sp_rename
'Employees.Salary',
'Monthly_Salary',
'column'


--17. Rename the index IX_Employee_Name to IX_Staff_Name in Employees.
exec sp_rename
'Employees.IX_Employee_Name',
'IX_Staff_Name',
'INDEX'



--18. Drop the index IX_Employee_Name from Employees.
DROP  INDEX IX_Employee_Name ON Employees

--19. Drop the view Customer_View.
DROP VIEW Customer_View;


--20. Drop the database StudentDB.
DROP DATABASE StudentDB;


--21. Your Employees table contains Employee_ID, Employee_Name, Salary, and City. Write a query to remove the entire table.
DROP TABLE Employees

--22. Your Employees table contains 500 records. Remove all records but retain the table structure.
TRUNCATE TABLE Employees

--23. Rename Employee_ID to Staff_ID in the Employees table.
EXEC SP_RENAME
'Employees.Employee_ID',
'Staff_ID',
'COLUMN';


--24. Rename Department to Department_Name in the Employees table.
EXEC SP_RENAME
'Employees.Department',
'Department_Name',
'COLUMN';


--25. Drop the index IX_Product_Name from the Products table.
DROP INDEX IX_Product_Name
ON Products;

--26. A view named High_Salary_Employees exists. Write a query to remove only the view, not the original Employees table.
DROP VIEW High_Salary_Employees;


--27. You want to remove all records from Bank_Accounts, but keep its columns and constraints. Which command will you use?
TRUNCATE TABLE Bank_Accounts

--28. You want to remove the Employees table completely, including its data and structure. Which command will you use?
DROP TABLE Employees

--29. Rename the table Bank_Accounts to Customer_Accounts and its column Account_Number to Account_No.
EXEC SP_RENAME 
'Bank_Accounts',
'Customer_Accounts';

EXEC SP_RENAME
'Bank_Accounts.Account_Number'
'Account_No'
'COLUMN';





/*30. Explain the difference between:
- DROP TABLE Employees
- TRUNCATE TABLE Employees
- DELETE FROM Employees*/
DROP- this is used to remove complete table from data base including its structure and data value
drop table Employees;

TRUNCATE TABLE Employees;
THIS IS USED TO REMOVE ALL ROWS  FROM TABLE KEEPING ITS STRUCTURE 

DELETE FROM Employees
DELETE IS USED TO REMOVE SELECTED ROWS BASED  ON CONDITION USING WHERE OR WE CAN  DELETE ENTIRE ROWS IF WE OMIT WHERE







--31. You have a table named Employee_Backup. Remove all its records but retain the table.

TRUNCATE TABLE Employee_Backup

--32. Rename the Orders table to Customer_Orders, then rename Order_Amount to Total_Amount.
EXEC SP_RENAME
'Orders',
'Customer_Orders';
EXEC SP_RENAME
'Order_Amount',
'Total_Amount',
'COLUMN';

--33. A table named Old_Products is no longer needed. Remove it permanently.
drop table Old_Products;

--34. You have an index named IX_Student_Name on the Students table. Rename it to IX_Full_Name.
exec sp_rename
'IX_Student_Name',
'IX_Full_Name',
'INDEX';


--35. You have a database named Old_CompanyDB. Write a query to remove it.
drop database Old_CompanyDB;

--36. You have a view named Active_Customers. Rename it to Current_Customers.
exec sp_rename
'Active_Customers',
'Current_Customers';

--37. You have two tables: Employees and Departments. You want to remove only Departments. What should you check before dropping it?
before dropping we should check wheather one table is depoendent on another table through foreign key 
or to check whether another table is refenced through foreign key

--38. An Orders table contains an IDENTITY column. What happens to its identity counter after TRUNCATE? Explain.
/*( IDENTITY COLUMN IS A COLUMN WHOSE VALUES DATABASE GENERATES AUTOMATICALLY AS AN UNIQUE NUMBER FOR EACH NEW ROW)
CREATE TABLE Employees (
    EmployeeID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100)
);
HERE IDENTITY (1,1) MEANS VALUES START AT 1  AND INCRESES BY ONE FOR EACH ROW AND  WE GENERALLY LEAVE THAT COLUMN OUT OF INSERT STATEMENT  SQL SERVER AUTOMATICALLY TAKES VALUES WE DONT HAVE TO INSERT THAT COLUM*/



IN QUESTION 38  IF  A TABLE CONTAIN  IDENTITY COLUMN AND WE  TRUNCATE  THE TABLE THE  TABLE DELETES  ALL ROWS  OR DATAVALUES KEEPING ITS STRUCTURE AND RESENTS THE IDENTITY COUNTER. THE VALUES AGIN START FROM ONE AND KEEPS UPDAING 



--39. Your Employees table is referenced by another table through a FOREIGN KEY. Can you directly truncate Employees? ExplaiN

NO, WE CANNOT TRUNCATE A TABLE  REFERENECED BY ANOTHER TABLE  THROUGH FOREIGN KEY FIRST WE HAVE REMOVE THE FOREIGN KEY THEN TRUNCATE  IF WE NEED TO TRUNCATE 

--40. Can you use a WHERE condition with TRUNCATE TABLE to remove only employees whose salary is below ₹20,000? Explain and write the appropriate alternative query.

NO WE CANNOT USE WHERE CONDITION IN TRUNCATE QUERY. WE CANNOT REMOVE SELECTED ROWS USEING TRUNCATE COMMAND  THIS COMMAND REMOVES ALL ROW FROM TABLE.
TO REMOVE SELECTED ROWS SUCH AS EMPLOYESS WHOSE SALARY IS BELOW  20,000 WE HAVE  USE DELETE COMMAND
DELETE FROM Employees
WHERE Salary < 20000;


--41.You have a table named Employees. Rename it to Staff, then rename Employee_Name to Staff_Name.
EXEC SP_RENAME 
'Employees',
'Staff';

EXEC SP_RENAME
'STAFF.Employee_Name',
'Staff_Name'

--42You have a table named Products with an index named IX_Product_Price. Drop that index and then rename the table to Product_Details.
DROP INDEX IX_Product_Price
ON Products;

EXEC SP_RENAME 
'Products',
'Product_Details'

--43.A database named CompanyDB contains multiple tables and views. Write the command to remove the entire database.
DROP DATABASE CompanyDB;

--44.You have a view named Employee_Salary_View based on the Employees table. Drop only the view. Will the original table and its records be deleted?
DROP  VIEW Employee_Salary_View;

NO , THE ORIGINAL TABLE  AND IT RECORD WILL REMAIN UNCHANGED ONLY THE SPECIFIED VIEW WILL BE DELETED

--45.You have a table named Customers with a UNIQUE constraint on Email. Can you truncate this table? Explain.
 YES THE CONSTRAIN ON  COLUMN DOES NOT PREVENT THE TRUNCATING TABLE 

--46.You have a table named Orders referenced by another table using a FOREIGN KEY. Write the steps you would consider before truncating Orders.
  
  BEFORE TRUNCATING ORDER WE FIRST MUST REMOVE FOREIGN KEY 
  THEN TRUNCATE THE TABLE 

  --46.You accidentally truncated a table containing important records. Is recovery possible in SQL Server? Explain the conditions under which recovery might be possible.
IF THE TRANSACTION IS NOT COMMITED WE CAN UNDO IT BACKUSING ROLLBACK TRANSACTION BUT IF TRANSACTION IS COMMITED WE CANNOT UNDO IT BACK HOW EVER IF CAN  RECOVER IT USING DATA BASE BACK BY ADMINSTRATOR
DEPENDING ON DATABASE MODEL AND AVAILABLE BACKUP


   BEGIN TRANSACTION
   TRNCATE TABLE  TABLE_NAME
   ROLLBACK TRANSACTION

 --47You have a table named Employees with a PRIMARY KEY and FOREIGN KEY constraints. Can you drop the table directly? Explain what dependencies you should check.

   NO WE CANNOT DROP THAT TABLE AS  ONE TABLE HERE IS DEPENDENT ON ANOTHER ANOTHER TABLE THROUGH FOREIGN KEY
    WE HAVE TO CHECK  IF ONE TABLE IS DEPEND ON ANOTHER TABLE THROUGH FOREIGN KEY
     AFTER DROPING FOREIGN KEY WE CAN DROP  THE TABLE

--48. Consider these three commands:
/*-DROP TABLE Employees;

TRUNCATE TABLE Employees;

DELETE FROM Employees;
Explain the differences in:
- Table structure
- Records
- Identity counter
- WHERE condition
- Triggers
- Foreign-key restrictions*/
 IN DROP COMMAND  ENTIRE TABLE IS DELETED INCLUDING ITS DATA VALUE AND STRUCTURE 
 IN TRUNCATE COMMAND  ENTIRE ROWS  IS DELETED KEEPING IS STRUCTURE UNCHANGED 
 IN  DELETE COMMAND THE SELECTED ROWS IS DELETD  KEEPING ITS STRUCTURE SAME


 IN DROP COMMAND RECORD IS DELETD
 TRUNCATE  ENTIRE RECORD IS DELED
 IN DELETE SELECTED RECORD IS DELETED


 IN DROP COMMAND AS ENTIRE STRUCTURE IS DELETED THE IDENTITY COUNTER OES NOT WORK
 IN TRUNCATE AS ENTIRE ROW IS DELETED THE VALUES CREATED IN IDENTIY COUNTER  IS RESETED AND AGAIN IT STARTS FROM FIRST
 IN DELETE COMMAND IDENTITY COUNTER HAS NO EFFECT AS ONLY SLECTED ROWS ARE DELETED



 IN DROP COMMAND WHERE COOMMAND DOES NOT WORK OR IS INVALID AS ENTIRE STRUCTURE AND DATA VALUES RE DELETED
 IN TRUNCATE COMMAND WHERE  COMMAND DOES NOT WORK AS IT CANNOT REMOVE SELECTED ROWS  IT REMOVE ENTIRE ROWS
 IN DELETE COMMAND THE SELECTED ROWS ARE DELETD BASED ON THE CONDITION PUT BY WHERE COMMAND




 IN DROP COMMAND WE CANNOT  REMOVE ATABLE IF IT IS REFEREND BY ANOTHER TABLE BY FOREIGN KEY
  SIMLILARY WE CANNOT TRUNCATE OR REMOVE THE ROWS IF THE TABLE IS DEPENDED ON ANOTHER TABLE OR IS REFERENED BY ANOTHER TABLE THROUGH FOREIGN KEY
 SIMILARY  AME CASE FOR DELETE






















/*50. Final real-world challenge

You have the following objects:
- Table: Employees
- Table: Departments
- View: Employee_View
- Index: IX_Employee_Name on Employees
- Database: CompanyDB
Perform these tasks in the correct order:
1. Drop the view Employee_View.
2. Drop the index IX_Employee_Name.
3. Rename Employees to Staff.
4. Rename Employee_Name to Full_Name.
5. Remove all records from Departments while retaining its structure.
6. Finally, write the command to drop CompanyDB (do not execute it until you're sure you no longer need anything inside).*/

--SOL--
DROP VIEW Employee_View;
DROP INDEX IX_Employee_Name;
EXEC SP_RENAME
'Employees',
'Staff';
EXEC SP_RENAME
'Employees.Employee_Name',
'Full_Name',
'COLUMN';

TRUNCATE  TABLE Departments
DROP  DATABASE CompanyDB
















