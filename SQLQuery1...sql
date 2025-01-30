Create database hR_data_analysis

Use hR_data_analysis


Create table Department(
DepId int Primary Key,
DepName varchar(100) Not Null default 'Depatment');

Create table Employee (
EmpId int Primary Key,
EmpName varchar(100),
StartYear int,
EndYear int,
StartSalary Float,
CurrentSalary Float,
EndSalary Float,
DepId int Not Null FOREIGN KEY  REFERENCES Department(DepID ))

Insert into Department
(DepId, DepName)
values 
(1,'HR' ), (2 ,'IT' ), (3 ,'Sales' )



select* from Department

INSERT INTO Employee (EmpId, DepId, EmpName, StartYear, EndYear, StartSalary,
CurrentSalary, EndSalary )
VALUES
(1,1,'Bill Gates', 2000,NULL, 310000.00, 310000.00,NULL),
(2,1,'John Lenon', 2000,NULL, 110000.00,110000.00,NULL),
(3,2,'Haily Anderson', 2010,NULL, 90000.00, 90000.00,NULL),
(4,2,'Nicolaus Michelson', 2009,NULL, 95000.00, 95000.00,NULL),
(5,2,'Rebecca Michelson', 2010,NULL, 85000.00, 85000.00,NULL),
(6,3,'Elena Gilbert', 2010,NULL, 55000.00, 55000.00,NULL),
(7,3,'John Smith', 2010,NULL, 65000.00, 65000.00,NULL),
(8,3,'Alex Red', 20013,NULL, 68000.00, 68000.00,NULL),
(9,3,'Richard Blue', 2013,NULL, 1198000.00, 1198000.00,NULL),
(10,3,'Edward Cullen', 2013,NULL, 1298000.00, 1298000.00,NULL);

Select * from Employee
--Task 1
--1.emoloyees whose name starts with B
Select EmpName
from Employee
where EmpName like 'B%'

--2.employees belonging to the department having department id 2
Select EmpName
from Employee
where DepId = 2

--3.number of records in the employee table
select count(*)
from Employee

--4.maximum startsalary for year 2010
select max(StartSalary)
from Employee
where StartYear = 2010

--5.EmpName and their startsalary who joined 2010 onwards
select EmpName, StartSalary
from Employee
where StartYear >= 2010
order by StartSalary desc

--6.Summarized start salary for each department
Select DepId, Sum(startsalary)
from Employee 
group by DepId

--7.To show department names and employees names belonging in each department
Select DepName, EmpName
from Employee e inner join department d on e.DepId = d.DepId

--Task 2
--1.inserting a new department accounting
insert into Department
(DepId,DepName)
values(4,'Accounting')

--2.insert new record in the employee table
insert into employee
(EmpId, DepId, EmpName, StartYear, StartSalary )
values (11,3,'Brian Latona',2014,120000)

--3. insert new records in the employee table
insert into employee
(EmpId, DepId, EmpName, StartYear, StartSalary )
values (12,4,'Meredith Withney',2011,350000),
       (13,4,'Mario Gabelli',2011,420000)

--4.writing an update query
Update employee
Set EndYear = 2013,
    EndSalary = StartSalary + 3000
where EmpName = 'Haily Anderson'

--5.Finding total current salary of existing employees for HR department
Select Sum(CurrentSalary)
from Employee e inner join Department d on e.DepId = d.DepId
where DepName = 'HR' and EndYear is Null

--6.making 6% increment in the salary of existing employees for depid =2
Update Employee
Set CurrentSalary =1.06 *CurrentSalary
where DepId = 2 and EndYear is Null

--7.Creating  view
create view Week3_DepartmentEmployee_vi as
(select d.Depid,DepName,EmpId,EmpName,StartSalary,CurrentSalary,
CurrentSalary-StartSalary as promoted,EndSalary
from  Employee e inner join Department d on e.DepId = d.DepId)

