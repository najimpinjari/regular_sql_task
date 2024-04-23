use najimpersonal

-- Create the database
CREATE DATABASE LibraryManagementSystem;

-- Use the database
USE LibraryManagementSystem;

-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    status VARCHAR(20)
);

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255)
);

-- Create the Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255),
    email VARCHAR(255)
);

-- Create the Borrowing_History table
CREATE TABLE Borrowing_History (
    borrowing_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_id, author_name) VALUES
(1, 'Stephen King'),
(2, 'J.K. Rowling'),
(3, 'George Orwell');

-- Insert sample data into Books table
INSERT INTO Books (book_id, title, author_id, status) VALUES
(101, 'IT', 1, 'available'),
(102, 'Harry Potter and the Philosopher''s Stone', 2, 'available'),
(103, '1984', 3, 'borrowed');

-- Insert sample data into Members table
INSERT INTO Members (member_id, member_name, email) VALUES
(201, 'John Doe', 'john@example.com'),
(202, 'Jane Smith', 'jane@example.com');

-- Insert sample data into Borrowing_History table
INSERT INTO Borrowing_History (borrowing_id, book_id, member_id, borrow_date, return_date) VALUES
(301, 101, 201, '2024-04-20', NULL),
(302, 103, 202, '2024-04-18', '2024-04-25');

-- Retrieve the list
