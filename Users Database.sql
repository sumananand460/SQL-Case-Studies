-- Filtering and Sorting Data
-- Lets create a new database named employeee
create database employee;
use employee;

create table employees (
	emp_id int auto_increment,
    emp_name varchar(50) not null,
    department varchar(50) not null,
    salary decimal (10,2) not null,
    primary key (emp_id)
);

insert into employees (emp_name, department, salary) values
("Suman Annd", "CSE", 20000),
("Kisan Kumar", "HR", 30000),
("Priya", "Accounts", 15000),
("Rogers", "Finance", 25000),
("Shanti", "CSE", 20000);

select *
from employees;

select *
from employees
where department = "CSE";

select *
from employees
where salary >= 20000;

select *
from employees
where department = "CSE"
and salary > 10000;

SELECT *
FROM employees
WHERE department = 'CSE'
OR department = 'Finance';

SELECT *
FROM employees
WHERE NOT department = 'CSE';


