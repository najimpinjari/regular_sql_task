	use ADODOTNET

	-- Creating Authors table
	CREATE TABLE Authors (
		author_id INT PRIMARY KEY,
		author_name VARCHAR(100),
		author_birthdate DATE
	);

	-- Inserting sample data into Authors table
	INSERT INTO Authors (author_id, author_name, author_birthdate) VALUES
	(1, 'J.K. Rowling', '1965-07-31'),
	(2, 'George Orwell', '1903-06-25'),
	(3, 'Harper Lee', '1926-04-28');

	-- Creating Books table
	CREATE TABLE Books (
		book_id INT PRIMARY KEY,
		book_title VARCHAR(255),
		author_id INT,
		publication_year INT,
		FOREIGN KEY (author_id) REFERENCES Authors(author_id)
	);

	-- Inserting sample data into Books table
	INSERT INTO Books (book_id, book_title, author_id, publication_year) VALUES
	(1, 'Harry Potter and the Philosopher''s Stone', 1, 1997),
	(2, '1984', 2, 1949),
	(3, 'To Kill a Mockingbird', 3, 1960);



	--Add a new author and their book:


	-- Assuming you have a method to retrieve the latest author_id from the Authors table
DECLARE @latestAuthorId INT;
SET @latestAuthorId = (SELECT MAX(author_id) FROM Authors);

-- Inserting a new author
INSERT INTO Authors (author_id, author_name, author_birthdate)
VALUES (@latestAuthorId + 1, 'New Author', GETDATE());

-- Inserting a book for the new author
INSERT INTO Books (book_id, book_title, author_id, publication_year)
VALUES ((SELECT MAX(book_id) FROM Books) + 1, 'New Book', @latestAuthorId + 1, 2024);


--Update an author's details:

DECLARE @authorIdToUpdate INT;
SET @authorIdToUpdate = 1; -- For example, updating the author with ID 1

UPDATE Authors
SET author_name = 'Updated Author Name'
WHERE author_id = @authorIdToUpdate;


--Get the total number of books published in a specific year:


DECLARE @yearToCount INT;
SET @yearToCount = 1997; -- For example, counting books published in 1997

SELECT COUNT(*)
FROM Books
WHERE publication_year = @yearToCount;
