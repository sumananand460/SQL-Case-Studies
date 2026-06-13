-- Creates the users database container
CREATE DATABASE users_db;
USE users_db;

-- In MySQL, use AUTO_INCREMENT (with an underscore) and VARCHAR instead of TEXT
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT,
    city VARCHAR(100)
);
show databases