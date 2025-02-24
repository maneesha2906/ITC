#################################################################
/* corollary: Move data from one database to another
use Infotech;
rename table infotech.employees to infotech.employees_moto;
*/
#################################################################

/* EMPLOYEES TABLE CREATION*/
use Infotech;
# drop table Employees;

create table Employees(
Emp_ID int auto_increment primary key,
First_Name varchar (50) ,
Last_Name varchar (50),
Department varchar (250),
Designation varchar (200),
Position varchar (100),
Work_Service_Age int,
Work_Status varchar (100)
);

/* DATA INSERT INTO EMPLOYEES TABLE*/
insert into Employees
(First_Name, Last_Name, Department, Designation, Position, Work_Service_Age, Work_Status)
values
('John', 'Mark', 'ICT', 'Trainer', 'Senior', 10, 'Active'),
('Evelyn', 'Carter', 'Security', 'Lead Security', 'Management', 8, 'Active'),
('David', 'Elam', 'Management', 'Deputy Mgr','Management', 12, 'Active'),
('Cross', 'Duke', 'HR', 'HR Officer', 'Junior', 5,'Active'),
('Lam', 'Lyodd', 'ICT', 'Admin', 'Senior', 20, 'Inactive'),
('Lisa', 'Adam', 'HR', 'Front Desk', 'Junior', 7, 'Inactive'),
('Fred', 'Peter', 'Finance', 'Accountant', 'Senior', 10, 'Active'),
('Kelvin', 'James', 'HSE', 'HSE Officer', 'Junior', 2, 'Inactive'),
('Frank', 'Miller', 'Engineering', 'Mechanical Engr', 'Senior', 8, 'Inactive'),
('Elijah', 'Uzam', 'Quality', 'Quality Engr.', 'Senior', 15, 'Active');

truncate table employees;
use infotech;
/*DDL*/
# CC TRAD
# use infotech;
# truncate table Employees;

#ALTER OPS INVOLVING TABLES
# rename table Employees to Employees2; 
# rename table Employees2 to Employees;

alter table employees 
add column pension_amount int after Work_Status;

alter table employees
add middlename varchar(100) after first_name;
insert into employees
(middlename)
values
('Alex'); 

alter table employees
drop column middlename;
use infotech;
alter table employees
modify column Department varchar(20);

use infotech;
#describe employees; #table employees;
alter table employees
change column Dept Department varchar (100);



use infotech;
alter table employees 
rename column Last_Name to JustRenamed;

select * from employees
/*DML*/


/*DQL*/
select * from Employees;
select First_Name, LName from Employees
where Emp_ID between 3 and 7;

select count(*) from employees; # Counts all items including null values
select count(work_status) from employees; # Counts all items excluding null values
select count(distinct work_status) from employees; # Counts & returns distint values only.alter

select position, sum(work_service_age) from employees
group by position;



/*DCL*/


/*TCL*/



#################################################################################

/*PERFORMANCE EVALUATION TABLE CREATION*/
use Infotech;
# drop table Performance_Evaluation;

create table Performance_Evaluation
(
Emp_ID int, 
First_Name varchar (50), 
Last_Name varchar(50),
Job_Description varchar (250),
Designation varchar(200),
Position varchar(100),
Cadre varchar (50),
Last_Promotion_Date date,
Work_Service_Age int,
Evaluation_Score int
);

/*INSERT INTO PERFORMANCE EVALUATION TABLE*/
insert into Performance_Evaluation
(
Emp_ID, First_Name, Last_Name, Job_Description, Designation, Position, Cadre,
Last_Promotion_Date, Work_Service_Age, Evaluation_Score
)
values
(1, 'John', 'Mark', 'ICT', 'Identify skill set gaps and conduct Training as required for Employees', 'Trainer', 'Senior', '2000-03-20', 15, 30),
(2, 'Evelyn', 'Carter', 'Security', 'Ensure personnel, properties and the Work premise is secured', 'Lead Security', 'Management', '2005-10-02', 9, 20),
(3, 'David', 'Elam', 'Management', 'Coordinate the department', 'Deputy Mgr','Management', '2005-06-30', 20, 60),
(4, 'Cross', 'Duke', 'HR', 'Manage personnel, Conduct recruitment and carry out Human Resource activities', 'HR Officer', 'Junior', '2003-02-23', 10, 80),
(5, 'Lam', 'Lyodd', 'ICT', 'Manage Info-Tech activities for the organization', 'Admin', 'Senior', '1995-01-29', 7, 95),
(6, 'Lisa', 'Adam', 'HR', 'Administrate frontdesk activities, attend to visitors/guests',  'Front Desk', 'Junior', '1998-08-18', 18, 55),
(7, 'Fred', 'Peter', 'Finance', 'Coordinate the finances of the Organization and payment of salaries ', 'Accountant', 'Senior', '2001-11-05', 20, 40),
(8, 'Kelvin', 'James', 'HSE', 'Coordinate HSE activities for the Organization', 'HSE Officer', 'Junior', '2000-11-09', 14, 69),
(9, 'Frank', 'Miller', 'Engineering', 'Carry out Engineering activities', 'Mechanical Engr', 'Senior', '2022-03-25', 10, 80),
(10, 'Elijah', 'Uzam', 'Quality', 'Carry out Quality Assurance Works for the Organization', 'Quality Engr.', 'Senior', '2019-09-10', 11, 75);

/*DCL*/
select * from performance_evaluation;

select First_Name, Last_Name, position,evaluation_score  from Performance_Evaluation
where evaluation_score between 45 and 90 order by evaluation_score desc;

/*TCL*/


################################################################################

/*PROMOTION TABLE CREATION*/ 
use Infotech;
# drop table Promotion

create table Promotion
(
Emp_ID int,
First_Name varchar(50),
Last_Name varchar(50),
Due_Promo varchar(10),
Last_Promo_Date date,
Evaluation_Grade varchar(25),
Approval varchar(15),
Recommendation varchar(50)
);

/*INSERT INTO PROMOTION TABLE*/
insert into Promotion
(Emp_ID, First_Name, Last_Name, Due_Promo, Last_Promo_Date, Evaluation_Grade, Approval, Recommendation)
values
(1, 'John', 'Mark', 'Yes', '2000-03-20', 'Poor', 'Not Approved', 'Require Training'),
(2, 'Evelyn', 'Carter', 'No','2005-10-02', 'Poor', 'Not Approved', 'Require Training'),
(3, 'David', 'Elam', 'Yes', '2005-06-30', 'Poor', 'Not Approved', 'Require Training'),
(4, 'Cross', 'Duke', 'Yes', '2003-02-23', 'Fair', 'Not Approved', 'Require Training'),
(5, 'Lam', 'Lyodd', 'Yes', '1995-01-29', 'Good', 'Not Approved', 'Under study'),
(6, 'Lisa', 'Adam', 'Yes', '1998-08-18', 'Very Good', 'Approved', ''),
(7, 'Fred', 'Peter', 'No', '2001-11-05', 'Fair', 'Not Approved', 'Require Training'),
(8, 'Kelvin', 'James', 'Yes', '2000-11-09', 'Average', 'Not Approved', ''),
(9, 'Frank', 'Miller', 'No', '2022-03-25', 'Good', 'Not Approved', 'Under Study'),
(10, 'Elijah', 'Uzam', 'Yes', '2019-09-10', 'Average', 'Not Approved', 'Under Study');

select * from promotion;

/*DML*/
update promotion set due_promo = 'Hold' where Emp_id = 2;

