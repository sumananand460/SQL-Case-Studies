-- =========================================================================
-- 🛠️ STEP 1: INITIALIZATION & CLEAN SLATE
-- =========================================================================

-- Wipes out any old versions so you never get accidental duplicate rows when re-running
DROP DATABASE IF EXISTS company_db;

-- Creates the empty database container and switches your active session inside it
CREATE DATABASE company_db;
USE company_db;

-- =========================================================================
-- 🏗️ STEP 2: DATABASE ARCHITECTURE (DDL)
-- =========================================================================

-- Builds the structural table schema with explicit data constraints and an auto-incrementing ID
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    performance_score INT,
    PRIMARY KEY (employee_id)
);

-- =========================================================================
-- 📥 STEP 3: CREATE OPERATIONS (INSERTING DATA)
-- =========================================================================

-- Operation 3A: Bulk Insertion (Loads your first 7 baseline rows into the database)
INSERT INTO employees (first_name, last_name, department, salary, performance_score) VALUES
('Suman', 'Anand', 'Computer Science', 30000.00, 92),
('Arya', 'Sindhusuta', 'English', 32000.00, 80),
('Sai', 'Prakash', 'Mathematics', 20000.00, 72),
('Ram', 'Kumar', 'Mechanical', 26000.00, 50),
('Bruce', 'Wayne', 'Philosophy', 50000.00, 95),
('Amit', 'Kumar', 'Computer Science', 55000.00, 88),
('Neha', 'Singh', 'English', 62000.00, 81);

-- Operation 3B: Dynamic Appending (Adds a single new row at the bottom; auto-assigns ID 8)
INSERT INTO employees (first_name, last_name, department, salary, performance_score) 
VALUES ('Clark', 'Kent', 'Journalism', 40000.00, 90);

-- Operation 3C: Partial Insertion (Skips performance_score; MySQL leaves it as NULL)
INSERT INTO employees (first_name, last_name, department, salary) 
VALUES ('Tony', 'Stark', 'Engineering', 99999.00);

-- =========================================================================
-- 🔍 STEP 4: READ OPERATIONS (SELECTING, FILTERING & SORTING)
-- =========================================================================

-- Operation 4A: Basic Select (Fetches absolutely every row and column currently active)
SELECT * FROM employees;

-- Operation 4B: Column Filtering (Hides IDs and scores; shows names and departments)
SELECT first_name, last_name, department
FROM employees;

-- Operation 4C: Direct Row Filtering (Shows only profiles working in English)
SELECT first_name, last_name, department
FROM employees
WHERE department = 'English';

-- Operation 4D: Data Sorting (Orders rows from highest salary to lowest using ORDER BY DESC)
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC;

-- Operation 4E: Range Filtering (Finds everyone earning between 25,000 and 45,000 using BETWEEN)
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary BETWEEN 25000.00 AND 45000.00;

-- Operation 4F: Pattern Matching (Finds anyone whose last name starts with 'S' using LIKE and '%')
SELECT first_name, last_name 
FROM employees 
WHERE last_name LIKE 'S%';

-- =========================================================================
-- ✏️ STEP 5: UPDATE OPERATIONS (MODIFYING DATA)
-- =========================================================================

-- Operation 5A: Single Row Update (Targets Neha Singh via ID 7 and updates her score to 80)
UPDATE employees
SET performance_score = 80
WHERE employee_id = 7; 

-- Operation 5B: Bulk Column Math Update (Gives a 5,000 raise to everyone in 'Computer Science')
UPDATE employees 
SET salary = salary + 5000.00 
WHERE department = 'Computer Science';

-- Run a quick check to verify updates to Neha and the Computer Science team worked
SELECT * FROM employees;

-- =========================================================================
-- ❌ STEP 6: DELETE OPERATIONS (REMOVING DATA)
-- =========================================================================

-- Operation 6A: Single Row Deletion (Removes Ram Kumar from the database entirely via his unique ID)
DELETE FROM employees 
WHERE employee_id = 4;

-- Final Verification Query: Run this to see the end result of all your changes!
SELECT * FROM employees;

-- Operation 6B: Table Wipe (COMMENTED OUT SO IT DOESN'T RUN AUTOMATICALLY)
-- Uncomment the line below if you want to completely empty the table while keeping its layout structure.
-- TRUNCATE TABLE employees;
