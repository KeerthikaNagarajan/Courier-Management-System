CREATE DATABASE courierdb;
USE courierdb;

-- Creating User table and inserting data
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

-- Creating Courier table and inserting data
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

-- Creating Employee table and inserting data
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

-- Creating Service table and inserting data
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

-- Creating Location table and inserting data
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

-- Creating Payment table and inserting data
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

