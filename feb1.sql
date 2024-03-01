use najimpersonal

CREATE TABLE Mobiles1 (
    mobile_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users2(user_id)
);

INSERT INTO Mobiles1 (mobile_id, brand, model, user_id) VALUES
(101, 'Samsung', 'Galaxy S21', 1),
(102, 'Apple', 'iPhone 12', 2),
(103, 'OnePlus', '9 Pro', 3),
(104, 'Google', 'Pixel 6', 1);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

-- Insert sample data into the Users table
INSERT INTO Users (user_id, username, email) VALUES
(1, 'user1', 'user1@example.com'),
(2, 'user2', 'user2@example.com'),
(3, 'user3', 'user3@example.com');

-- Insert sample data into the Mobiles table


DELIMITER //

CREATE PROCEDURE GetUserMobilePhone(
    IN p_username VARCHAR(50)
)
BEGIN
    DECLARE v_user_id INT;
    
    -- Get the user ID based on the provided username
    SELECT user_id INTO v_user_id
    FROM Users
    WHERE username = p_username;
    
    -- Check if the user exists
    IF v_user_id IS NOT NULL THEN
        -- Retrieve mobile phone information for the user
        SELECT m.brand, m.model
        FROM Mobiles m
        WHERE m.user_id = v_user_id;
    ELSE
        SELECT 'User not found' AS message;
    END IF;
END //

DELIMITER ;
