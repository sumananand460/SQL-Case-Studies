-- =========================================================
-- SQL PRACTICE: MODULES 2, 3 & 4
-- Topics Covered:
-- 1. CREATE DATABASE
-- 2. CREATE TABLE
-- 3. INSERT
-- 4. SELECT
-- 5. WHERE
-- 6. Comparison Operators
-- 7. AND, OR, NOT
-- 8. BETWEEN
-- 9. IN
-- 10. LIKE
-- 11. DISTINCT
-- 12. ORDER BY
-- 13. LIMIT
-- 14. Aggregate Functions
--     COUNT(), SUM(), AVG(), MIN(), MAX()
-- =========================================================

DROP DATABASE IF EXISTS employee;
-- Create and use database
CREATE DATABASE employee;
USE employee;

-- Create employees table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (emp_id)
);

-- Insert sample data
INSERT INTO employees (emp_name, department, salary)
VALUES
("Suman Anand", "CSE", 20000),
("Kisan Kumar", "HR", 30000),
("Priya", "Accounts", 15000),
("Rogers", "Finance", 25000),
("Shanti", "CSE", 20000),
("Aman", "HR", 28000),
("Anjali", "Finance", 35000),
("Ritika", "Accounts", 18000);

-- =========================================================
-- BASIC SELECT
-- =========================================================

-- Display all records
SELECT * FROM employees;

-- Display specific columns
SELECT emp_name, salary
FROM employees;

-- =========================================================
-- WHERE CLAUSE
-- =========================================================

-- Employees from CSE department
SELECT *
FROM employees
WHERE department = "CSE";

-- Employees with salary greater than or equal to 20000
SELECT *
FROM employees
WHERE salary >= 20000;

-- Employees with salary less than 25000
SELECT *
FROM employees
WHERE salary < 25000;

-- =========================================================
-- AND OPERATOR
-- =========================================================

SELECT *
FROM employees
WHERE department = "CSE"
AND salary > 10000;

-- =========================================================
-- OR OPERATOR
-- =========================================================

SELECT *
FROM employees
WHERE department = "CSE"
OR department = "Finance";

-- =========================================================
-- NOT OPERATOR
-- =========================================================

SELECT *
FROM employees
WHERE NOT department = "CSE";

-- =========================================================
-- BETWEEN
-- =========================================================

SELECT *
FROM employees
WHERE salary BETWEEN 18000 AND 30000;

-- =========================================================
-- IN
-- =========================================================

SELECT *
FROM employees
WHERE department IN ("HR", "Finance");

-- =========================================================
-- LIKE
-- =========================================================

-- Names starting with 'A'
SELECT *
FROM employees
WHERE emp_name LIKE "A%";

-- Names ending with 'a'
SELECT *
FROM employees
WHERE emp_name LIKE "%a";

-- Names containing 'an'
SELECT *
FROM employees
WHERE emp_name LIKE "%an%";

-- =========================================================
-- DISTINCT
-- =========================================================

SELECT DISTINCT department
FROM employees;

-- =========================================================
-- ORDER BY
-- =========================================================

-- Salary in ascending order
SELECT *
FROM employees
ORDER BY salary ASC;

-- Salary in descending order
SELECT *
FROM employees
ORDER BY salary DESC;

-- Sort by department, then highest salary first
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;

-- =========================================================
-- LIMIT
-- =========================================================

-- Show first 3 employees
SELECT *
FROM employees
LIMIT 3;

-- =========================================================
-- AGGREGATE FUNCTIONS
-- =========================================================

-- Count all employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Count salaries (same here because salary is NOT NULL)
SELECT COUNT(salary) AS salary_count
FROM employees;

-- Total salary expense
SELECT SUM(salary) AS total_salary
FROM employees;

-- Average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- Lowest salary
SELECT MIN(salary) AS minimum_salary
FROM employees;

-- Highest salary
SELECT MAX(salary) AS maximum_salary
FROM employees;

-- =========================================================
-- AGGREGATE FUNCTIONS WITH WHERE
-- =========================================================

-- Number of HR employees
SELECT COUNT(*) AS hr_employee_count
FROM employees
WHERE department = "HR";

-- Total salary paid to CSE department
SELECT SUM(salary) AS cse_total_salary
FROM employees
WHERE department = "CSE";

-- Average salary in Finance department
SELECT AVG(salary) AS finance_average_salary
FROM employees
WHERE department = "Finance";

-- Highest salary in Accounts department
SELECT MAX(salary) AS accounts_highest_salary
FROM employees
WHERE department = "Accounts";

-- =========================================================
-- MULTIPLE AGGREGATE FUNCTIONS IN ONE QUERY
-- =========================================================

SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;