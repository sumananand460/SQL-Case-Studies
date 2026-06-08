CREATE DATABASE store_db;
USE store_db;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT,          -- Automatically increments (1, 2, 3...) for new items
    name VARCHAR(100) NOT NULL,             -- Text up to 100 characters; cannot be left blank
    category VARCHAR(50) NOT NULL,          -- Text up to 50 characters
    price DECIMAL(10, 2) NOT NULL,          -- Up to 10 digits total, exactly 2 after the decimal point
    stock_quantity INT DEFAULT 0,           -- Whole number; defaults to 0 if not specified
    PRIMARY KEY (product_id)                -- Sets product_id as our absolute unique identifier
);
INSERT INTO products (name, category, price, stock_quantity) VALUES 
('M3 MacBook Pro', 'Electronics', 1999.99, 15),
('Python Crash Course', 'Books', 29.99, 140),
('Wireless Mouse', 'Electronics', 49.99, 0),
('Ergonomic Desk Chair', 'Furniture', 249.99, 8),
('Django for Beginners', 'Books', 34.99, 55);

SELECT * FROM products;
SELECT name, price
FROM products
WHERE category = 'Electronics';

SELECT name, price
FROM products
WHERE stock_quantity > 0 AND price < 100.00;

SELECT name, price
FROM products
WHERE price BETWEEN 20.00 AND 50.00;