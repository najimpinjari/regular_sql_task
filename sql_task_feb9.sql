use practiceQuestions

-- Create Mobiles table
CREATE TABLE Mobiles (
    mobile_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Populate Mobiles table with sample data
INSERT INTO Mobiles (mobile_id, brand, model, price)
VALUES 
    (1, 'Apple', 'iPhone 13', 999.99),
    (2, 'Samsung', 'Galaxy S21', 799.99),
    (3, 'Google', 'Pixel 6', 699.99);

-- Create Owners table
CREATE TABLE Owners (
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(50),
    mobile_id INT,
    FOREIGN KEY (mobile_id) REFERENCES Mobiles(mobile_id)
);

-- Populate Owners table with sample data
INSERT INTO Owners (owner_id, owner_name, mobile_id)
VALUES 
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Alice Johnson', 3);

	--Retrieve the details of all mobile phones owned by a specific owner (by name).

SELECT m.brand, m.model, m.price
FROM Mobiles m
INNER JOIN Owners o ON m.mobile_id = o.mobile_id
WHERE o.owner_name = 'Jane Smith';


--Calculate the total value of mobile phones owned by each owner.

SELECT o.owner_name, SUM(m.price) AS total_value
FROM Mobiles m
INNER JOIN Owners o ON m.mobile_id = o.mobile_id
GROUP BY o.owner_name;


--Find the owner(s) of the most expensive mobile phone(s).

SELECT o.owner_name
FROM Mobiles m
INNER JOIN Owners o ON m.mobile_id = o.mobile_id
WHERE m.price = (SELECT MAX(price) FROM Mobiles);


--List the brand and model of mobile phones that have not been assigned to any owner.

SELECT m.brand, m.model
FROM Mobiles m
LEFT JOIN Owners o ON m.mobile_id = o.mobile_id
WHERE o.mobile_id IS NULL;


