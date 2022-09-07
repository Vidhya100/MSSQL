/* UC1 */
create database payroll_service;
use payroll_service;

/* UC2 */
create table employee_payroll
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(255) NOT NULL,
salary int NOT NULL,
startDate Date
);

/* UC3 */
Insert into employee_payroll values('vidhya',70000,GETDATE());
Insert into employee_payroll values('Ganesh',80000,GETDATE());
Insert into employee_payroll values('Vishal',60000,GETDATE());
Insert into employee_payroll values('Vaibhav',180000,GETDATE());
Insert into employee_payroll values('Vinayak',100000,'2018-01-01');

/* UC4 */
Select * from employee_payroll;

/* UC5 */
SELECT salary FROM employee_payroll WHERE name = 'Vishal';

SELECT salary FROM employee_payroll WHERE startDate BETWEEN CAST('2018-01-01' AS DATE) AND GETDATE();

/* UC6 */
ALTER table employee_payroll Add  Gender char ;
UPDATE employee_payroll SET Gender = 'F' where name = 'Vidhya';
UPDATE employee_payroll SET Gender = 'M' where name = 'Ganesh';
UPDATE employee_payroll SET Gender = 'M' where name = 'Vishal';
UPDATE employee_payroll SET Gender = 'M' where name = 'Vaibhav';
UPDATE employee_payroll SET Gender = 'M' where name = 'Vinayak';
Select * from employee_payroll;

/* UC7 */
INSERT INTO employee_payroll values (6,'Ankita',60000,GETDATE(),'F');
Select * from employee_payroll;

SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;

SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;

SELECT min(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT max(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT max(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT min(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;

SELECT count(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT count(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;

/* UC 8 */
alter table employee_payroll add PhoneNumber bigint;
alter table employee_payroll add Department varchar(200) NOT NULL default 'IT';
alter table employee_payroll add Address varchar(250);
 
select * from employee_payroll;

/* UC 9 */
alter table employee_payroll add BasicPay float, Deductions float,TaxablePay float, Tax float, net float; 
alter table employee_payroll add city varchar(250), country varchar(250);

alter table employee_payroll DROP column salary;
select * from employee_payroll;


/* UC 10 */
Insert into employee_payroll values (7,'Terissa','2018-01-03','F',98448483992,'US','Sales and Marketing',3000000.00,1000000.00,2000000.00,500000.00,1500000.00,'washington','US');
select * from employee_payroll where Name='Terissa';

/* UC 11 ER_Model */
Create Table Company
(CompanyID int identity(1,1) primary key,
CompanyName varchar(100));
--Insert Values into Company table
Insert into Company values ('TCS'),('OCS'),('TATA');
Select * from Company;

--Creating Employee Table
create table Employee
(EmployeeID int identity(1,1) primary key,
CompanyIdentity int,
EmployeeName varchar(200),
EmployeePhoneNumber bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char(1),
Foreign key (CompanyIdentity) references Company(CompanyID)
);
--Insert Values in Employee Table
insert into Employee values
(1,'sai',999005050,'12, rue des Bouchers,France','2010-01-28','M'),
(2,'vijaya',848488439,'Constitution Ave Fairfield, 94533','2005-04-02','F'),
(3,'kumar',98484848339,'Bernard Shaw,Italy ','2011-08-23','M'),
(2,'Ramya',8894849300,'120 Hanover Sq,London','2002-09-09','F');
Select * from Employee;

--Creating EMPPayroll Table
create table EMPPayroll
(BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
);
--Insert Values in EMPPayroll Table
insert into EMPPayroll(BasicPay,Deductions,IncomeTax,EmployeeIdentity) values 
(9000000,2000000,2000,1),
(503000,90000,4000,2),
(6780000,19000,5000,3),
(9088400,30944,45684,4);
Select * from EMPPayroll;
--Update Derived attribute values 
update EMPPayroll
set TaxablePay=BasicPay-Deductions;

update EMPPayroll
set NetPay=TaxablePay-IncomeTax;

select * from EMPPayroll;

--Creating Department Table
create table Department
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
);
--Insert Values in Department Table
insert into Department values
('HR'),
('Marketing'),
('Sales'),
('IT');

select * from Department

--Creating table EmployeeDepartment
create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (DepartmentIdentity) references Department(DepartmentID),
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
);

--Insert Values in EmployeeDepartment
insert into EmployeeDepartment values
(3,1),
(2,2),
(1,1),
(4,4),
(4,3);

select * from EmployeeDepartment;

/* UC 12*/
/* UC 4 */
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,EmployeeAddress,EmployeePhoneNumber,StartDate,Gender,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay,DepartmentId,DepartName
FROM Company
INNER JOIN Employee on Company.CompanyID = Employee.CompanyIdentity
INNER JOIN EMPPayroll on EMPPayroll.EmployeeIdentity=Employee.EmployeeID
INNER JOIN EmployeeDepartment on Employee.EmployeeID=EmployeeDepartment.EmployeeIdentity
INNER JOIN Department on Department.DepartmentId=EmployeeDepartment.DepartmentIdentity;

/* UC 5*/
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName
FROM Company
INNER JOIN Employee ON Company.CompanyID = Employee.CompanyIdentity where StartDate BETWEEN Cast('2000-11-12' as Date) and cast('2010-02-02' as Date);

/* UC 7 */
select Count(EmployeeID) as "EmployeeCountBasedOnGender",Gender
from Employee
INNER JOIN EMPPayroll on Employee.EmployeeID=EMPPayroll.EmployeeIdentity group by Gender;

select emp.EmployeeID,emp.EmployeeName,BasicPay 
from Employee emp inner join EMPPayroll on Emp.EmployeeID=EMPPayroll.EmployeeIdentity 
where BasicPay=(select min(BasicPay) from EMPPayroll);

select emp.EmployeeID,emp.EmployeeName,BasicPay 
from Employee emp inner join EMPPayroll on Emp.EmployeeID=EMPPayroll.EmployeeIdentity 
where BasicPay=(select max(BasicPay) from EMPPayroll);

select avg(BasicPay) as "AverageSalary",Gender
from Employee
INNER JOIN EMPPayroll on Employee.EmployeeID=EMPPayroll.EmployeeIdentity group by Gender;