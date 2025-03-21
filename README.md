# Courier Management System
## Task1: Database Design 
### Creating Database
```mysql
CREATE DATABASE courierdb;
USE courierdb;
```

### Creating User table and inserting data
```mysql
CREATE TABLE User (
    UserID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Email VARCHAR(255) UNIQUE NOT NULL, 
    Password VARCHAR(255) NOT NULL, 
    ContactNumber VARCHAR(20), 
    Address TEXT
);

INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address) 
VALUES 
(1011, 'Rajesh K', 'rajeshk@gmail.com', 'Rajesh@111', '9123456789', 'T Nagar, Chennai, Tamil Nadu'),
(1012, 'Sneha R', 'snehar@gmail.com', 'Sneha@222', '9234567890', 'Peelamedu, Coimbatore, Tamil Nadu'),
(1013, 'Aravind M', 'aravindm@gmail.com', 'Aravind@333', '9345678901', 'Sellur, Madurai, Tamil Nadu'),
(1014, 'Pooja S', 'poojas@gmail.com', 'Pooja@444', '9456789012', 'Perundurai, Erode, Tamil Nadu'),
(1015, 'Harish V', 'harishv@gmail.com', 'Harish@555', '9567890123', 'Woraiyur, Trichy, Tamil Nadu'),
(1016, 'Lakshmi N', 'lakshmin@gmail.com', 'Lakshmi@666', '9678901234', 'RS Puram, Coimbatore, Tamil Nadu'),
(1017, 'Gokul P', 'gokulp@gmail.com', 'Gokul@777', '9789012345', 'Villapuram, Madurai, Tamil Nadu'),
(1018, 'Deepa K', 'deepak@gmail.com', 'Deepa@888', '9890123456', 'Fairlands, Salem, Tamil Nadu'),
(1019, 'Vignesh R', 'vigneshr@gmail.com', 'Vignesh@999', '9901234567', 'Katpadi, Vellore, Tamil Nadu'),
(1020, 'Swetha T', 'swethat@gmail.com', 'Swetha@000', '9812345678', 'Srirangam, Trichy, Tamil Nadu');

SELECT * FROM User;
```
<img width="474" alt="image" src="https://github.com/user-attachments/assets/44cf6822-48bb-4daf-b96a-fc909be5b9f5" />

### Creating Courier table and inserting data
```mysql
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,  
    SenderName VARCHAR(255),  
    SenderAddress TEXT,  
    ReceiverName VARCHAR(255),  
    ReceiverAddress TEXT,  
    Weight DECIMAL(5,2),  
    Status VARCHAR(50),  
    TrackingNumber VARCHAR(20) UNIQUE,  
    DeliveryDate DATE
);

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(11, 'Anirudh Sharma', 'HSR Layout, Bangalore, Karnataka', 'Ritika Malhotra', 'Andheri West, Mumbai, Maharashtra', 2.90, 'In Transit', 'BLR223344556', '2025-04-10'),
(12, 'Kabir Mehta', 'Salt Lake, Kolkata, West Bengal', 'Nisha Kapoor', 'Sector 62, Noida, Uttar Pradesh', 1.65, 'Delivered', 'CCU998877665', '2025-01-25'),
(13, 'Rohit Shetty', 'Jubilee Hills, Hyderabad, Telangana', 'Sanya Bhatnagar', 'Colaba, Mumbai, Maharashtra', 3.75, 'Shipped', 'HYD119988776', '2025-02-15'),
(14, 'Vikas Choudhury', 'Viman Nagar, Pune, Maharashtra', 'Tanya Deshmukh', 'Indira Nagar, Lucknow, Uttar Pradesh', 2.10, 'Pending', 'PNQ227766554', '2025-03-22'),
(15, 'Rohan Bhardwaj', 'Connaught Place, Delhi', 'Meenal Saxena', 'Shivaji Nagar, Bhopal, Madhya Pradesh', 4.25, 'Dispatched', 'DEL337788665', '2025-05-08');

SELECT * FROM Courier;
```
<img width="761" alt="image" src="https://github.com/user-attachments/assets/e94fbde7-3cfe-49fb-8fbf-d3cab7f35270" />

### Creating Employee table and inserting data
```mysql
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(255),  
    Email VARCHAR(255) UNIQUE,  
    ContactNumber VARCHAR(20),  
    Role VARCHAR(50),  
    Salary DECIMAL(10,2)
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)  
VALUES  
(126, 'Arjun M', 'arjun.m@email.com', '9876054321', 'HR Manager', 95000.00),
(127, 'Rahul V', 'rahul.v@email.com', '9768451234', 'Operations Head', 72000.00),
(128, 'Divya S', 'divya.s@email.com', '9854123698', 'Logistics Coordinator', 48000.00),
(129, 'Kavitha T', 'kavitha.t@email.com', '9745124789', 'Customer Service Rep', 38000.00),
(130, 'Sandeep K', 'sandeep.k@email.com', '9632547891', 'Inventory Supervisor', 36500.00);

SELECT * FROM Employee;
```
<img width="431" alt="image" src="https://github.com/user-attachments/assets/800f626b-1956-4d00-bfa6-786aba99953b" />

### Creating Service table and inserting data
```mysql
CREATE TABLE Service (
    ServiceID VARCHAR(10) PRIMARY KEY,  
    ServiceName VARCHAR(100),  
    Cost DECIMAL(8,2)
);

INSERT INTO Service (ServiceID, ServiceName, Cost)  
VALUES  
('S16', 'Eco-Friendly Delivery', 180.00),
('S17', 'Same-Day Express', 550.00),
('S18', 'Global Priority Shipping', 3200.00);

SELECT * FROM Service;
```
<img width="211" alt="image" src="https://github.com/user-attachments/assets/002d8040-cedd-44b0-b673-c7fa9ec58b33" />

### Creating Location table and inserting data
```mysql
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,  
    LocationName VARCHAR(100),  
    Address TEXT
);

INSERT INTO Location (LocationID, LocationName, Address)  
VALUES  
(11, 'Chengalpattu Logistics Hub', '12, GST Road, Chengalpattu, Tamil Nadu - 603001'),
(12, 'Thoothukudi Parcel Center', '25, Beach Road, Thoothukudi, Tamil Nadu - 628002'),
(13, 'Tiruvannamalai Distribution Hub', '36, Arunachala Street, Tiruvannamalai, Tamil Nadu - 606603');

SELECT * FROM Location;
```
<img width="287" alt="image" src="https://github.com/user-attachments/assets/2f1bb97d-37df-4f4c-9c8e-96d6eab177ed" />

### Creating Payment table and inserting data
```mysql
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,  
    CourierID INT,  
    LocationID INT,  
    UserID INT,
    ServiceID VARCHAR(10),
    Amount DECIMAL(10, 2),  
    PaymentDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),  
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO Payment (PaymentID, CourierID, LocationID, UserID, ServiceID, Amount, PaymentDate)  
VALUES  
(501, 11, 11, 1011, 'S16', 150.00, '2025-01-12'),  
(502, 12, 12, 1012, 'S17', 250.00, '2025-03-21'),
(503, 13, 13, 1013, 'S18', 500.00, '2025-02-25');

SELECT * FROM Payment;
```
<img width="362" alt="image" src="https://github.com/user-attachments/assets/39c6b652-3c1c-4dc4-b9f0-f32c829f7d55" />

### Creating CourierAssignment table and inserting data
```mysql
CREATE TABLE CourierAssignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    CourierID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID) ON DELETE CASCADE
);

INSERT INTO CourierAssignment (EmployeeID, CourierID) VALUES
(126, 11),
(127, 12),
(128, 13),
(129, 14),
(130, 15);
```
<img width="194" alt="image" src="https://github.com/user-attachments/assets/2946d4d7-c22b-4413-b3e2-cf4cffd148a6" />

### EER: 
<img width="587" alt="EER DIAG" src="https://github.com/user-attachments/assets/c1c4b5de-2291-4ba9-8bbd-323440242e82" />

## Task 2: Select, Where
### 1. List all customers from the User table.
```mysql
SELECT * FROM User;
```
<img width="476" alt="1" src="https://github.com/user-attachments/assets/6fb3f351-3a0f-4cac-98e2-8ffda1736ec0" />

### 2. List all orders for a specific customer using WHERE.
```mysql
SELECT c.* 
FROM Courier c
JOIN User u ON c.SenderName = u.Name
WHERE u.UserID = 1011;
```
<img width="718" alt="2" src="https://github.com/user-attachments/assets/e0dfa872-129b-4823-beb6-5558e001e4f4" />

### 3. List all couriers from the Courier table.
```mysql
SELECT * FROM Courier;
```
<img width="761" alt="3" src="https://github.com/user-attachments/assets/bafa2c94-c4a1-4902-b12d-adec0aed2896" />

### 4. List all packages for a specific order.
```mysql
SELECT * 
FROM Courier 
WHERE CourierID = 11;
```
<img width="719" alt="4" src="https://github.com/user-attachments/assets/d0911bc6-f4ab-46e1-85e5-a5b66bf9e027" />

### 5. List all deliveries for a specific courier.
```mysql
SELECT * 
FROM Courier 
WHERE CourierID = 12 AND Status = 'Delivered';
```
<img width="715" alt="5" src="https://github.com/user-attachments/assets/7a3b081c-1f61-4534-8e46-4caf2e3d6057" />

### 6. List all undelivered packages (Status != 'Delivered').
```mysql
SELECT * 
FROM Courier 
WHERE Status != 'Delivered';
```
<img width="758" alt="6" src="https://github.com/user-attachments/assets/c62cd4b7-518a-4dc9-89d2-d7d4a85d34b8" />

### 7. List all packages scheduled for delivery today (DeliveryDate = CURDATE()).
```mysql
SELECT * 
FROM Courier 
WHERE DeliveryDate = CURDATE();
```
<img width="632" alt="7" src="https://github.com/user-attachments/assets/ec1f5aab-d052-4bfa-b09f-700b34a8fd8a" />

### 8. List all packages with a specific status (WHERE Status = 'In Transit').
```mysql
SELECT * 
FROM Courier 
WHERE Status = 'In Transit';
```
<img width="718" alt="8" src="https://github.com/user-attachments/assets/e7488286-65a8-49ef-87e6-e0d7ceba5f85" />

### 9. Calculate the total number of packages for each courier using COUNT().
```mysql
SELECT SenderName, COUNT(*) AS TotalPackages
FROM Courier 
GROUP BY SenderName;
```
<img width="153" alt="9" src="https://github.com/user-attachments/assets/fa9e54cf-78a9-4bb4-89eb-e2e2525b14d1" />

### 10. Find the average delivery time for each courier using AVG().
```mysql
SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID;
```
<img width="145" alt="10" src="https://github.com/user-attachments/assets/3e338f84-e23f-4335-8a0a-e97648f11f9d" />

### 11. List all packages within a specific weight range (WHERE Weight BETWEEN x AND y).
```mysql
SELECT * 
FROM Courier 
WHERE Weight BETWEEN 2.00 AND 5.00;
```
<img width="760" alt="11" src="https://github.com/user-attachments/assets/cf5fbea6-afcd-4e5e-b4b4-ebfb3520578e" />

### 12. Retrieve employees whose names contain 'John' (WHERE Name LIKE '%John%').
```mysql
SELECT * 
FROM Employee 
WHERE Name LIKE '%John%';
```
<img width="280" alt="12" src="https://github.com/user-attachments/assets/917fb8ab-f541-4f19-bd62-f69c3058d206" />

### 13. Retrieve all courier records with payments greater than $50.
```mysql
SELECT c.* 
FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;
```
<img width="759" alt="13" src="https://github.com/user-attachments/assets/044ccf60-446b-41cf-898a-abf16a38d752" />

## Task 3: GroupBy, Aggregate Functions, Having, Order By, where 
### 14. Find the total number of couriers handled by each employee using COUNT() and GROUP BY.
```mysql
SELECT e.EmployeeID, e.Name, COUNT(ca.CourierID) AS TotalCouriers
FROM Employee e
JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
GROUP BY e.EmployeeID, e.Name;
```
<img width="203" alt="14" src="https://github.com/user-attachments/assets/7d3854fb-11bf-4aff-bff2-887185085fd8" />

### 15. Calculate the total revenue generated by each location using SUM() and GROUP BY.
```mysql
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName;
```
<img width="241" alt="15" src="https://github.com/user-attachments/assets/1fa9a510-b88a-4684-afd5-6bf77ec3c3d8" />

### 16. Find the total number of couriers delivered to each location.
```mysql
SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalDelivered
FROM Location l
JOIN Courier c ON l.LocationID = c.DestinationLocationID
WHERE c.Status = 'Delivered'
GROUP BY l.LocationID, l.LocationName;
```
<img width="242" alt="16" src="https://github.com/user-attachments/assets/f7063dcf-d0d2-45a2-aa7f-4d7dad5c8f2f" />

### 17. Find the courier with the highest average delivery time using AVG() and ORDER BY.
```mysql
SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;
```
<img width="143" alt="17" src="https://github.com/user-attachments/assets/f65656e1-ad31-457f-ad1b-c200e07c6cad" />

### 18. Find locations with total payments less than a certain amount using HAVING.
```mysql
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING TotalPayments < 3000;
```
<img width="241" alt="18" src="https://github.com/user-attachments/assets/58235479-b156-4d6b-9214-7b4226923631" />

### 19. Calculate total payments per location using SUM() and GROUP BY.
```mysql
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName;
```
<img width="244" alt="19" src="https://github.com/user-attachments/assets/f24425cb-7d2d-43dd-ad59-733277ad7676" />

### 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (WHERE LocationID = X).
```mysql
SELECT p.CourierID, SUM(p.Amount) AS TotalPayment
FROM Payment p
WHERE p.LocationID = 11
GROUP BY p.CourierID
HAVING TotalPayment > 1000;
```
<img width="136" alt="20" src="https://github.com/user-attachments/assets/1eebe4cd-b057-49d0-8d10-c885e3a0bbb2" />

### 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (WHERE PaymentDate > 'YYYY-MM-DD').
```mysql
SELECT p.CourierID, SUM(p.Amount) AS TotalPayment
FROM Payment p
WHERE p.PaymentDate > '2025-03-01'
GROUP BY p.CourierID
HAVING TotalPayment > 1000;
```
<img width="136" alt="21" src="https://github.com/user-attachments/assets/efec406f-8834-4813-bc89-67092466b393" />

### 22. Retrieve locations where the total amount received is more than $5000 before a certain date (HAVING SUM(Amount) > 5000 AND PaymentDate < 'YYYY-MM-DD').
```mysql
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
WHERE p.PaymentDate < '2025-03-01'
GROUP BY l.LocationID, l.LocationName
HAVING TotalPayment > 5000;
```
<img width="239" alt="22" src="https://github.com/user-attachments/assets/5f8bcb32-b260-477f-848d-e985a160aedc" />

## Task 4: Inner Join, Full Outer Join, Cross Join, Left Outer Join, Right Outer Join 


## Scope: Inner Queries, Non-Equi Joins, Equi joins, Exist, Any, All 
