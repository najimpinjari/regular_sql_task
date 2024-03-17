use ADODOTNET

-- Create the mobiles table
CREATE TABLE mobiles (
    mobile_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    price DECIMAL(10, 2),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert sample data into the mobiles table
INSERT INTO mobiles (mobile_id, brand, model, price, user_id) VALUES
(1, 'Apple', 'iPhone 12', 999.99, 1),
(2, 'Samsung', 'Galaxy S20', 899.99, 2),
(3, 'Google', 'Pixel 5', 699.99, 3),
(4, 'OnePlus', 'OnePlus 9 Pro', 1099.99, 1),
(5, 'Xiaomi', 'Mi 11', 799.99, 2);

-- Create the users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Insert sample data into the users table
INSERT INTO users (user_id, username, email, phone_number) VALUES
(1, 'john_doe', 'john@example.com', '123-456-7890'),
(2, 'jane_smith', 'jane@example.com', '987-654-3210'),
(3, 'mike_williams', 'mike@example.com', '555-555-5555');



import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('mobiles_and_users.db')
cursor = conn.cursor()

# Function to display all mobiles
def display_mobiles():
    cursor.execute("SELECT * FROM mobiles")
    mobiles = cursor.fetchall()
    print("Mobiles:")
    for mobile in mobiles:
        print(mobile)

# Function to display all users
def display_users():
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    print("Users:")
    for user in users:
        print(user)

# Function to add a new mobile
def add_mobile(brand, model, price, user_id):
    cursor.execute("INSERT INTO mobiles (brand, model, price, user_id) VALUES (?, ?, ?, ?)",
                   (brand, model, price, user_id))
    conn.commit()
    print("New mobile added successfully.")

# Function to add a new user
def add_user(username, email, phone_number):
    cursor.execute("INSERT INTO users (username, email, phone_number) VALUES (?, ?, ?)",
                   (username, email, phone_number))
    conn.commit()
    print("New user added successfully.")

# Display all mobiles and users before any changes
print("Before any changes:")
display_mobiles()
display_users()

# Add a new user
add_user("test_user", "test@example.com", "999-999-9999")

# Add a new mobile for the newly added user
add_mobile("TestBrand", "TestModel", 799.99, 4)

# Display all mobiles and users after changes
print("\nAfter changes:")
display_mobiles()
display_users()

# Close the connection
conn.close()
