use piramalemployee


--assignment for 29/11


CREATE TABLE CustomerS (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);
insert into CustomerS values(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Bob Johnson', 'bob.johnson@example.com');

	create table OrderS1 (
	order_id int primary key ,
	order_data varchar(50),
	total_amount int ,
	customer_id int foreign key references CustomerS( customer_id )
	)

	insert into OrderS1 values(101, '2023-01-15', 150.50, 1),  -- Order for John Doe
    (102, '2023-02-20', 200.25, 2),  -- Order for Jane Smith
    (103, '2023-03-10', 50.75, 3);  

	select * from CustomerS
	select * from OrderS1

	---- 10 join problems using the given tables

---- 1. Inner join to get customer information with corresponding orders

	select * from CustomerS
	inner join OrderS1 
	on OrderS1.customer_id = CustomerS.customer_id

	---- 2. Left join to get all customers and their orders (if any)
	select * from CustomerS
	left join OrderS1
	on CustomerS.customer_id = OrderS1.customer_id

	---- 3. Right join to get all orders and their corresponding customers (if any)
		select * from CustomerS
		right join OrderS1
		on CustomerS.customer_id =	OrderS1.customer_id
		

		- 4. Full outer join to get all customers and orders, showing null where there is no match
SELECT * FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 5. Self join to find customers with the same email
SELECT * FROM Customers c1
JOIN Customers c2 ON c1.email = c2.email AND c1.customer_id <> c2.customer_id;

-- 6. Cross join to get all possible combinations of customers and orders
SELECT * FROM Customers
CROSS JOIN Orders;

-- 7. Join with a condition to find orders with a total amount greater than 100
SELECT * FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.total_amount > 100;

-- 8. Join using a LIKE condition to find customers with similar names
SELECT * FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Customers.customer_name LIKE 'J%';

-- 9. Multiple joins to get customer information for a specific order
SELECT * FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.order_id = 101;

-- 10. Join with aggregation to get the total amount spent by each customer
SELECT Customers.customer_id, customer_name, SUM(total_amount) AS total_spent
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, customer_name;