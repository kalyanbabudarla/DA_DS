-- SQL Mini Project – Online Food Delivery Management System
-- Based on your uploaded PDF: Online Food Delivery Management System
-- This project includes:
-- Database creation
-- Table creation
-- Insert records
-- SQL queries
-- Joins
-- Views
-- Window functions
-- Outputs
-- Step-by-step explanation

#Step 1: Create Database
CREATE DATABASE FoodDeliverySystem;
#Select Database
USE FoodDeliverySystem;
-- Explanation
-- CREATE DATABASE creates a new database.
-- USE selects the database for working.

-- Step 2: Create Tables
-- 1. Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Mobile_Number VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50)
);
-- Explanation
-- This table stores customer details.

-- 2. Restaurants Table
CREATE TABLE Restaurants (
    Restaurant_ID INT PRIMARY KEY,
    Restaurant_Name VARCHAR(100),
    Location VARCHAR(100),
    Rating DECIMAL(2,1),
    Contact_Number VARCHAR(15)
);
-- Explanation
-- Stores restaurant information.

-- 3. Food_Items Table
CREATE TABLE Food_Items (
    Food_ID INT PRIMARY KEY,
    Food_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Restaurant_ID INT,
    FOREIGN KEY (Restaurant_ID)
    REFERENCES Restaurants(Restaurant_ID)
);
-- Explanation
-- Stores food item details.
-- FOREIGN KEY connects with Restaurants table.

-- 4. Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Food_ID INT,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    Order_Date DATE,
    Order_Status VARCHAR(50),

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Food_ID)
    REFERENCES Food_Items(Food_ID)
);
-- Explanation
-- Stores order details.

-- 5. Delivery_Partners Table
CREATE TABLE Delivery_Partners (
    Partner_ID INT PRIMARY KEY,
    Partner_Name VARCHAR(100),
    Phone_Number VARCHAR(15),
    Assigned_Order INT,

    FOREIGN KEY (Assigned_Order)
    REFERENCES Orders(Order_ID)
);

-- 6. Payments Table
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(50),

    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID)
);

-- Step 3: Insert Records
-- Insert Customers
INSERT INTO Customers VALUES
(1,'Arun','9876543210','Anna Nagar','Chennai'),
(2,'Priya','9876543211','T Nagar','Chennai'),
(3,'Kumar','9876543212','Velachery','Chennai'),
(4,'Sneha','9876543213','Tambaram','Chennai');

-- Insert Restaurants
INSERT INTO Restaurants VALUES
(101,'Pizza Hub','Chennai',4.5,'9000011111'),
(102,'Burger Point','Chennai',4.2,'9000022222'),
(103,'Spicy Kitchen','Chennai',4.7,'9000033333');

-- Insert Food Items
INSERT INTO Food_Items VALUES
(201,'Veg Pizza','Italian',250,101),
(202,'Chicken Burger','Fast Food',180,102),
(203,'Fried Rice','Chinese',220,103),
(204,'Pasta','Italian',300,101);

-- Insert Orders
INSERT INTO Orders VALUES
(301,1,201,2,500,'2026-05-20','Delivered'),
(302,2,202,1,180,'2026-05-21','Pending'),
(303,3,203,3,660,'2026-05-21','Delivered'),
(304,1,204,1,300,'2026-05-22','Cancelled');

-- Insert Delivery Partners
INSERT INTO Delivery_Partners VALUES
(401,'Ravi','9000044444',301),
(402,'Suresh','9000055555',302),
(403,'Manoj','9000066666',303);

-- Insert Payments
INSERT INTO Payments VALUES
(501,301,'UPI','Paid'),
(502,302,'Cash','Pending'),
(503,303,'Card','Paid'),
(504,304,'UPI','Refunded');

-- Step 4: Display Tables
-- View Customers 
SELECT * FROM Customers;

-- Step 5: INNER JOIN
-- Customer Name with Ordered Food Item
SELECT 
    Customers.Customer_Name,
    Food_Items.Food_Name,
    Orders.Quantity,
    Orders.Total_Amount
FROM Orders
INNER JOIN Customers
ON Orders.Customer_ID = Customers.Customer_ID
INNER JOIN Food_Items
ON Orders.Food_ID = Food_Items.Food_ID;
-- Explanation
-- INNER JOIN combines matching records from tables.

-- Step 6: LEFT JOIN
-- Customers Without Orders
SELECT 
    Customers.Customer_Name,
    Orders.Order_ID
FROM Customers
LEFT JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;
-- Explanation
-- Shows all customers even if they did not place orders.

-- Step 7: RIGHT JOIN
-- Restaurants With Orders
SELECT 
    Restaurants.Restaurant_Name,
    Orders.Order_ID
FROM Orders
RIGHT JOIN Food_Items
ON Orders.Food_ID = Food_Items.Food_ID
RIGHT JOIN Restaurants
ON Food_Items.Restaurant_ID = Restaurants.Restaurant_ID;

-- Step 8: SELF JOIN
-- Restaurants in Same Location
SELECT 
    A.Restaurant_Name,
    B.Restaurant_Name,
    A.Location
FROM Restaurants A
JOIN Restaurants B
ON A.Location = B.Location
AND A.Restaurant_ID <> B.Restaurant_ID;

-- Step 9: Create Views
-- Customer Order View
CREATE VIEW Customer_Order_View AS
SELECT
    Customers.Customer_Name,
    Restaurants.Restaurant_Name,
    Food_Items.Food_Name,
    Orders.Order_Status
FROM Orders
JOIN Customers
ON Orders.Customer_ID = Customers.Customer_ID
JOIN Food_Items
ON Orders.Food_ID = Food_Items.Food_ID
JOIN Restaurants
ON Food_Items.Restaurant_ID = Restaurants.Restaurant_ID;

-- View Data
SELECT * FROM Customer_Order_View;

-- Step 10: Restaurant Sales View
CREATE VIEW Restaurant_Sales_View AS
SELECT
    Restaurants.Restaurant_Name,
    SUM(Orders.Total_Amount) AS Total_Sales
FROM Orders
JOIN Food_Items
ON Orders.Food_ID = Food_Items.Food_ID
JOIN Restaurants
ON Food_Items.Restaurant_ID = Restaurants.Restaurant_ID
GROUP BY Restaurants.Restaurant_Name;

-- Step 11: Window Functions
-- ROW_NUMBER()
SELECT
    Order_ID,
    Customer_ID,
    Total_Amount,
    ROW_NUMBER() OVER(ORDER BY Total_Amount DESC) AS Row_Num
FROM Orders;

-- RANK()
SELECT
    Restaurant_Name,
    SUM(Orders.Total_Amount) AS Sales,
    RANK() OVER(ORDER BY SUM(Orders.Total_Amount) DESC) AS Ranking
FROM Orders
JOIN Food_Items
ON Orders.Food_ID = Food_Items.Food_ID
JOIN Restaurants
ON Food_Items.Restaurant_ID = Restaurants.Restaurant_ID
GROUP BY Restaurant_Name;

-- Step 12: TCL Commands
-- COMMIT
START TRANSACTION;

UPDATE Orders
SET Order_Status='Delivered'
WHERE Order_ID=302;

COMMIT;
-- Explanation
-- Saves changes permanently.

-- ROLLBACK
START TRANSACTION;

DELETE FROM Orders
WHERE Order_ID=304;

ROLLBACK;
-- Explanation
-- Cancels changes.

-- Step 13: DCL Commands (Data Control Language)
-- GRANT Permission
GRANT SELECT ON Orders TO employee1;
-- REVOKE Permission
REVOKE UPDATE ON Orders FROM employee1;

-- Final Output Reports
-- Total Sales
SELECT SUM(Total_Amount) AS Total_Sales FROM Orders;
-- Output
-- Total_Sales
-- 1640


