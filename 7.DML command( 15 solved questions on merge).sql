/*Question 1 of 10 — Set up the tables
In SSMS, create these two tables:
- Merge_Employees: EmployeeID (integer primary key), Name (text up to 50 characters), Salary (integer)
- NewSalaries: EmployeeID (integer primary key), Salary (integer)
Then insert these rows:
- Merge_Employees: (1, 'Asha', 30000) and (2, 'Ravi', 35000)
- NewSalaries: (1, 32000) and (2, 35000)*/
CREATE TABLE Merge_Employees
(EmployeeID int primary key, Name VARCHAR(50) , Salary INT )

CREATE TABLE NewSalaries
(EmployeeID int primary key,Salary int);

INSERT INTO Merge_Employees values(1, 'Asha', 30000) ,(2, 'Ravi', 35000);
insert into NewSalaries values (1, 32000),(2, 35000);


/*Question 2 of 10 — Update matching rows
Use MERGE to update Merge_Employees.Salary from NewSalaries.Salary whenever the EmployeeID exists in both tables. Don’t insert or delete any rows.*/

merge Merge_Employees as m
using NewSalaries as n
on

m.EmployeeID=n.EmployeeID
when matched then update
 set m.Salary=n.salary;

/*Question 3 of 10 — Insert a new matching-source row
First, add this row to NewSalaries: EmployeeID = 3, Salary = 40000.

Then use MERGE to insert it into Merge_Employees only when its EmployeeID is not already there. Insert the employee ID and salary; Name can remain NULL. Write the MERGE statement.*/

insert into newsalaries values(3,40000)
merge Merge_Employees 
using newsalaries
on Merge_Employees.EmployeeID=newsalaries.EmployeeID
when not matched by target then

insert (EmployeeID,salary)
values(newsalaries.EmployeeID,newsalaries.salary);

/*Question 4 of 10 — Update only when values differ
Change NewSalaries.Salary for employee 1 to 33000. Then write a MERGE that updates a matching employee’s salary only when the source salary is different from the current salary. Do not insert or delete rows.*/


update  NewSalaries
set salary=33000 where EmployeeID=1;

merge Merge_Employees as t
using newsalaries as s
on t.EmployeeID=s.EmployeeID
when matched  and t.salary<> s.salary then update
set  t.salary=s.salary;


/*Question 5 of 10 — Update or insert
Add (4, 42000) to NewSalaries. Then write one MERGE statement that:
- Updates Merge_Employees.Salary when the EmployeeID already exists and the salary differs.
- Inserts EmployeeID and Salary when the ID does not exist in Merge_Employees.
- Does not delete rows.*/

insert into NewSalaries values(4,42000);

merge Merge_Employees as T
using newsalaries as s
on t.employeeId=s.employeeid
when matched  and t.salary<> s.salary then update
set t.salary=s.salary
when not matched by target then 
insert (employeeid,salary)
values(s.employeeid,s.salary);

/*Question 6 of 10 — Delete rows missing from the source
Suppose employee 2 is removed from NewSalaries, and you want to remove that employee from Merge_Employees too because the employee is no longer in the source list.*/
delete from NewSalaries where employeeid=2;
merge Merge_Employees as T
using newsalaries as s
on t.employeeId=s.employeeid

when not matched by source then 
 delete;

 /*Question 7 of 10 — Synchronize with update and insert
Add (5, 50000) to NewSalaries. Then write one MERGE statement that updates salaries for matching employees and inserts employees whose IDs aren’t yet in Merge_Employees. Don’t delete any rows.*/


insert into NewSalaries values(5,50000);
merge Merge_Employees as T
using newsalaries as s
on t.employeeId=s.employeeid
when matched  and t.salary<> s.salary then update
set t.salary=s.salary
when not matched by target then 
insert (employeeid,salary)
values(s.employeeid,s.salary);


/*Question 8 of 10 — Use all three actions
Make these changes in NewSalaries:
- Change employee 1’s salary to 34000.
- Delete employee 3.
- Add employee 6 with salary 60000.
Then write one MERGE statement that:
- Updates matching employees’ salaries when they differ.
- Inserts source employees missing from Merge_Employees.
- Deletes target employees missing from NewSalaries.
Write the source-table changes first, then the MERGE.*/

update NewSalaries
set salary=34000 where employeeid=1;

delete from NewSalaries where employeeid=3

insert into NewSalaries values(6,60000);

merge Merge_Employees as T
using newsalaries as s
on t.employeeId=s.employeeid
when matched  and t.salary<> s.salary then update
set t.salary=s.salary
when not matched by target then 
insert (employeeid,salary)
values(s.employeeid,s.salary)
when not matched by source then 
delete;


/*Question 9 of 10 — Conditional insert
Add these rows to NewSalaries:
- Employee 7, salary 52000
- Employee 8, salary 45000
Write a MERGE that inserts a source employee into Merge_Employees only when their ID is missing and their salary is at least 50000. Don’t update or delete any rows.*/

insert into newsalaries values(7,52000),(8,45000)
merge Merge_Employees as shi
using newsalaries as hii
on shi.employeeid=hii.employeeid
when not matched by target  and  hii.salary>=50000 then 
insert (employeeid,salary)
values(hii.employeeid,hii.salary);

/*Question 10 of 10 — Final MERGE practice
In NewSalaries, change employee 1’s salary to 36000 and add employee 9 with salary 55000.

Then write a MERGE that:
- Updates the salary when an employee ID exists in both tables and the salaries differ.
- Inserts employees missing from Merge_Employees.
- Does not delete any rows.
Write the source-table changes first, then the MERGE statement.*/



update NewSalaries
set salary=36000 where employeeid=1;

insert into NewSalaries values(9,55000)

merge merge_employees as T
using newsalaries as s
on t.employeeid=s.employeeid

when matched and t.salary <> s.salary then
update set t.salary = s.salary

when not matched by target then 
insert(employeeid,salary)
values(s.employeeid,s.salary);


/*Extra Question 1 of 5 — Update matching rows
Change employee 1’s salary in NewSalaries to 37000. Then write a MERGE that updates Merge_Employees for matching employee IDs when the salaries differ. Don’t insert or delete rows.*/


update newsalaries
set salary=37000 where employeeid=1
merge merge_employees as t
using newsalaries as s
on t.employeeid=s.employeeid
when matched and t.salary <> s.salary then
update set t.salary=s.salary;


/*Extra Question 2 of 5 — Insert a missing row
Add employee 10 with salary 61000 to NewSalaries. Then write a MERGE that inserts a row into Merge_Employees only when the source EmployeeID doesn’t already exist there. Don’t update or delete rows.*/


insert into NewSalaries values(10,61000)
merge merge_employees as munu
using newsalaries as biki
on munu.employeeid=biki.employeeid

when not  matched by target then 
insert (employeeid,salary)
values(biki.employeeid,biki.salary);

/*
Extra Question 3 of 5 — Delete a target row missing from source
Employee 2 is no longer in NewSalaries. Write a MERGE that deletes employee 2 from Merge_Employees if that ID is missing from the source. Don’t update or insert rows. Use a condition so this MERGE only deletes target employee 2.;
*/


merge merge_employees as munu
using newsalaries as biki
on munu.employeeid=biki.employeeid
when not matched by source and munu.employeeid=2 then 
delete ;

/*Extra Question 4 of 5 — Choose the right clause
You want to add a source employee to the target when their ID is missing from Merge_Employees. Which clause identifies that case: WHEN NOT MATCHED BY TARGET or WHEN NOT MATCHED BY SOURCE? Explain what “not matched” is being compared to.*/

 in case  when not matched by target   means when the employeeid exist in  source but not in target then   we  need to insert the  row exist in source into  target table.


 /*Extra Question 5 of 5 — Final practice
Add employee 12 with salary 72000 to NewSalaries. Then write one MERGE statement that:
- Updates a matching employee’s salary only when the salaries differ.
- Inserts a source employee when their ID is missing from Merge_Employees.
- Does not delete any rows.
Write the source INSERT first, then the MERGE.*/


insert into NewSalaries values(12,72000);


merge merge_employees as t
using newsalaries as s

on t.employeeid=s.employeeid

when matched and t.salary <> s.salary  then
update set t.salary =s.salary

when not matched by target then
insert (employeeid,salary)
values(s.employeeid,s.salary);



























