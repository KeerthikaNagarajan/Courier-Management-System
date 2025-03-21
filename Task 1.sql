-- Create the database
CREATE DATABASE CourierDB;
USE CourierDB;

-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Email VARCHAR(255) UNIQUE NOT NULL, 
    Password VARCHAR(255) NOT NULL, 
    ContactNumber VARCHAR(20), 
    Address TEXT
);

-- Location Table (Created Before Courier Table)
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,  
    LocationName VARCHAR(100),  
    Address TEXT
);

-- Courier Table (References Location Table)
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,  
    SenderName VARCHAR(255),  
    SenderAddress TEXT,  
    ReceiverName VARCHAR(255),  
    ReceiverAddress TEXT,  
    Weight DECIMAL(5,2),  
    Status VARCHAR(50),  
    TrackingNumber VARCHAR(20) UNIQUE,  
    DeliveryDate DATE,
    DestinationLocationID INT,
    FOREIGN KEY (DestinationLocationID) REFERENCES Location(LocationID) ON DELETE SET NULL
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(255),  
    Email VARCHAR(255) UNIQUE,  
    ContactNumber VARCHAR(20),  
    Role VARCHAR(50),  
    Salary DECIMAL(10,2)
);

-- Service Table
CREATE TABLE Service (
    ServiceID VARCHAR(10) PRIMARY KEY,  
    ServiceName VARCHAR(100),  
    Cost DECIMAL(8,2)
);

-- Payment Table (References User, Courier, Location, and Service Tables)
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

-- CourierAssignment Table (References Employee and Courier Tables)
CREATE TABLE CourierAssignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    CourierID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID) ON DELETE CASCADE
);

-- Insert into Location Table
INSERT INTO Location (LocationID, LocationName, Address)  
VALUES  
(11, 'Springfield Logistics Hub', '123 Main St, Springfield, IL'),
(12, 'Metropolis Parcel Center', '456 Elm St, Metropolis, NY'),
(13, 'Gotham Distribution Hub', '789 Oak St, Gotham, NJ');

-- Insert into User Table
INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address) 
VALUES 
(1011, 'John Doe', 'johndoe@gmail.com', 'John@123', '9123456789', '123 Main St, Springfield, IL'),
(1012, 'Jane Smith', 'janesmith@gmail.com', 'Jane@456', '9234567890', '456 Elm St, Metropolis, NY'),
(1013, 'Alice Johnson', 'alicej@gmail.com', 'Alice@789', '9345678901', '789 Oak St, Gotham, NJ'),
(1014, 'Bob Brown', 'bobbrown@gmail.com', 'Bob@101', '9456789012', '101 Pine St, Star City, CA'),
(1015, 'Charlie Davis', 'charlied@gmail.com', 'Charlie@202', '9567890123', '202 Maple St, Central City, TX'),
(1016, 'Diana Evans', 'dianae@gmail.com', 'Diana@303', '9678901234', '303 Birch St, Coast City, FL'),
(1017, 'Eve Foster', 'evef@gmail.com', 'Eve@404', '9789012345', '404 Cedar St, National City, WA'),
(1018, 'Frank Green', 'frankg@gmail.com', 'Frank@505', '9890123456', '505 Walnut St, Bludhaven, OR'),
(1019, 'Grace Hall', 'graceh@gmail.com', 'Grace@606', '9901234567', '606 Cherry St, Fawcett City, AZ'),
(1020, 'Henry Irving', 'henryi@gmail.com', 'Henry@707', '9812345678', '707 Spruce St, Ivy Town, CO');

-- Insert into Courier Table
INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, DestinationLocationID) VALUES
(11, 'John Doe', '123 Main St, Springfield, IL', 'Jane Smith', '456 Elm St, Metropolis, NY', 2.90, 'In Transit', 'SPR223344556', '2025-04-10', 11),
(12, 'Alice Johnson', '789 Oak St, Gotham, NJ', 'Bob Brown', '101 Pine St, Star City, CA', 1.65, 'Delivered', 'GTH998877665', '2025-01-25', 12),
(13, 'Charlie Davis', '202 Maple St, Central City, TX', 'Diana Evans', '303 Birch St, Coast City, FL', 3.75, 'Shipped', 'CCT119988776', '2025-02-15', 13),
(14, 'Eve Foster', '404 Cedar St, National City, WA', 'Frank Green', '505 Walnut St, Bludhaven, OR', 2.10, 'Pending', 'NAT227766554', '2025-03-22', 11),
(15, 'Grace Hall', '606 Cherry St, Fawcett City, AZ', 'Henry Irving', '707 Spruce St, Ivy Town, CO', 4.25, 'Dispatched', 'FAW337788665', '2025-05-08', 12);

-- Insert into Employee Table
INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)  
VALUES  
(126, 'Oliver Queen', 'oliverq@email.com', '9876054321', 'HR Manager', 95000.00),
(127, 'Barry Allen', 'barrya@email.com', '9768451234', 'Operations Head', 72000.00),
(128, 'Kara Danvers', 'karad@email.com', '9854123698', 'Logistics Coordinator', 48000.00),
(129, 'Clark Kent', 'clarkk@email.com', '9745124789', 'Customer Service Rep', 38000.00),
(130, 'Bruce Wayne', 'brucew@email.com', '9632547891', 'Inventory Supervisor', 36500.00);

-- Insert into Service Table
INSERT INTO Service (ServiceID, ServiceName, Cost)  
VALUES  
('S16', 'Eco-Friendly Delivery', 180.00),
('S17', 'Same-Day Express', 550.00),
('S18', 'Global Priority Shipping', 3200.00);

-- Insert into Payment Table
INSERT INTO Payment (PaymentID, CourierID, LocationID, UserID, ServiceID, Amount, PaymentDate)  
VALUES  
(501, 11, 11, 1011, 'S16', 150.00, '2025-01-12'),  
(502, 12, 12, 1012, 'S17', 250.00, '2025-03-21'),
(503, 13, 13, 1013, 'S18', 500.00, '2025-02-25'),
(504, 12, 11, 1012, 'S17', 1200.00, '2025-03-25'),  
(505, 13, 11, 1013, 'S18', 1500.00, '2025-03-26'),
(506, 14, 12, 1014, 'S16', 6000.00, '2025-02-15'),
(507, 15, 12, 1015, 'S17', 7000.00, '2025-02-20');

-- Insert into CourierAssignment Table
INSERT INTO CourierAssignment (EmployeeID, CourierID) VALUES
(126, 11),
(127, 12),
(128, 13),
(129, 14),
(130, 15);

