-- =========================================================================
-- 1. DATABASE & TABLE SETUP
-- =========================================================================

-- Creates a brand new database named 'store_db' to hold our store's information.
CREATE DATABASE store_db;

-- Tells MySQL to select and use 'store_db' for all subsequent actions in this script.
USE store_db;

-- Creates our core 'products' structural data table with specific data type rules.
CREATE TABLE products (
    product_id INT AUTO_INCREMENT,          -- Automatically increments (1, 2, 3...) for new items
    name VARCHAR(100) NOT NULL,             -- Text up to 100 characters; cannot be left blank
    category VARCHAR(50) NOT NULL,          -- Text up to 50 characters
    price DECIMAL(10, 2) NOT NULL,          -- Up to 10 digits total, exactly 2 after the decimal point
    stock_quantity INT DEFAULT 0,           -- Whole number; defaults to 0 if not specified
    PRIMARY KEY (product_id)                -- Sets product_id as our absolute unique identifier
);

-- Inserts 5 starting records into our fresh table to give us data to test against.
INSERT INTO products (name, category, price, stock_quantity) VALUES 
('M3 MacBook Pro', 'Electronics', 1999.99, 15),
('Python Crash Course', 'Books', 29.99, 140),
('Wireless Mouse', 'Electronics', 49.99, 0),
('Ergonomic Desk Chair', 'Furniture', 249.99, 8),
('Django for Beginners', 'Books', 34.99, 55);


-- =========================================================================
-- 2. DATA RETRIEVAL & FILTERING QUERIES
-- =========================================================================

-- Usage: Broad inspection tool. 
-- The asterisk (*) acts as a wildcard to fetch every single row and column in the table.
SELECT * FROM products;

-- Usage: Targeted column selection and text matching.
-- Uses a basic WHERE clause to isolate rows matching the exact string 'Electronics'.
SELECT name, price
FROM products
WHERE category = 'Electronics';

-- Usage: Multi-condition evaluation.
-- Uses the 'AND' operator to ensure a row is only returned if it passes BOTH logic checks:
-- it must be currently in stock AND cost less than $100.00.
SELECT name, price
FROM products
WHERE stock_quantity > 0 AND price < 100.00;

-- Usage: Range filtering.
-- The 'BETWEEN' shorthand filters a clean, inclusive numeric spectrum ($20.00 up to $50.00) 
-- instead of writing out 'price >= 20.00 AND price <= 50.00'.
SELECT name, price
FROM products
WHERE price BETWEEN 20.00 AND 50.00;

-- Usage: Multi-value matching.
-- The 'IN' operator acts like a compact checklist. It grabs rows where the category matches 
-- any item inside the parentheses, replacing multiple messy 'OR' conditions.
SELECT name, price
FROM products
WHERE category IN ('Books', 'Furniture');

-- Usage: Partial text/string searching.
-- The 'LIKE' operator combined with percentage wildcards (%) performs a flexible search. 
-- '%MacBooK%' tells MySQL to locate the word "MacBook" anywhere inside the product name string.
SELECT name, price
FROM products
WHERE name LIKE '%MacBooK%';


-- =========================================================================
-- 3. SORTING & LIMITING RESULTS
-- =========================================================================

-- Usage: Sorting data rows.
-- 'ORDER BY' organizes records based on a specified column. The 'DESC' keyword sorts them
-- in descending order (highest price to lowest price). Use 'ASC' for lowest to highest.
SELECT name, price
FROM products
ORDER BY price DESC; 

-- Usage: Capping result sets.
-- The 'LIMIT' clause restricts the output to a specified maximum number of rows.
-- This is perfect for fetching "Top 2" elements or handling small data previews.
SELECT name, price
FROM products
LIMIT 2;

-- Usage: Data pagination (splitting results into pages).
-- 'LIMIT 2' specifies the page size (show 2 rows), while 'OFFSET 2' tells MySQL to skip
-- the first 2 rows of the result set before it starts returning data. 
-- Useful for displaying "Page 2" of a product listing.
SELECT name, price
FROM products
LIMIT 2 OFFSET 2;

-- Task 1: Make a list of product that are out of stock
SELECT name, stock_quantity
FROM Products
WHERE stock_quantity = 0;

-- Task 2: 
SELECT name, category, price
FROM products
WHERE category = 'Books' AND price > 30.00;

-- Task 3:
SELECT name 
FROM products
ORDER BY name ASC;

-- Task 4:
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 5;
