CREATE DATABASE CourierManagementSystem;
USE CourierManagementSystem;

CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Country VARCHAR(50) DEFAULT 'USA',
    ContactNumber VARCHAR(20) NOT NULL,
    LocationType ENUM('Warehouse', 'Distribution Center', 'Retail Outlet', 'Headquarters'),
    OperatingHours TEXT
);

CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Address TEXT NOT NULL,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastLogin DATETIME,
    AccountStatus ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

CREATE TABLE UserPaymentMethods (
    PaymentMethodID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    CardNumber VARCHAR(20),
    CardType ENUM('Visa', 'MasterCard', 'Amex', 'Discover'),
    ExpiryDate DATE,
    BillingAddress TEXT,
    IsDefault BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Role ENUM('Admin', 'Manager', 'Driver', 'Warehouse', 'Customer Service') NOT NULL,
    Salary DECIMAL(10, 2),
    HireDate DATE NOT NULL,
    TerminationDate DATE,
    Status ENUM('Active', 'On Leave', 'Terminated') DEFAULT 'Active',
    CurrentLocationID INT,
    VehicleInfo VARCHAR(100),
    FOREIGN KEY (CurrentLocationID) REFERENCES Location(LocationID)
);

ALTER TABLE Location
ADD COLUMN ManagerID INT,
ADD FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Returned') DEFAULT 'Pending',
    PaymentMethodID INT,
    ShippingMethod VARCHAR(50),
    EstimatedDelivery DATE,
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (PaymentMethodID) REFERENCES UserPaymentMethods(PaymentMethodID)
);

CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT,
    BaseCost DECIMAL(8, 2) NOT NULL,
    CostPerKg DECIMAL(8, 2),
    MaxWeight DECIMAL(8, 2),
    EstimatedDeliveryDays INT,
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Courier (
    CourierID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    SenderContact VARCHAR(20) NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    ReceiverContact VARCHAR(20) NOT NULL,
    Weight DECIMAL(8, 2) NOT NULL,
    Dimensions VARCHAR(50),
    Status ENUM('Processing', 'In Transit', 'Out for Delivery', 'Delivered', 'Failed', 'Returned') DEFAULT 'Processing',
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    PickupDate DATETIME,
    DeliveryDate DATETIME,
    DeliveryProof TEXT,
    InsuranceAmount DECIMAL(10, 2) DEFAULT 0.00,
    SpecialInstructions TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE CourierServiceMapping (
    MappingID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT NOT NULL,
    ServiceID INT NOT NULL,
    AppliedCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT NOT NULL,
    LocationID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer', 'Digital Wallet'),
    PaymentStatus ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    TransactionID VARCHAR(100),
    Notes TEXT,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Parcel (
    ParcelID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT NOT NULL,
    Description TEXT NOT NULL,
    Weight DECIMAL(8, 2) NOT NULL,
    Length DECIMAL(8, 2),
    Width DECIMAL(8, 2),
    Height DECIMAL(8, 2),
    Value DECIMAL(10, 2),
    Category ENUM('Document', 'Electronics', 'Clothing', 'Food', 'Fragile', 'Other'),
    Barcode VARCHAR(50),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

CREATE TABLE TrackingHistory (
    TrackingID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT NOT NULL,
    LocationID INT,
    Status VARCHAR(100) NOT NULL,
    UpdateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    EmployeeID INT,
    Notes TEXT,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE EmployeeLocationAssignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    LocationID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    IsPrimary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE CourierEmployeeAssignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT NOT NULL,
    EmployeeID INT NOT NULL,
    AssignmentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Assigned', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Assigned',
    CompletionDate DATETIME,
    Notes TEXT,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    CourierID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FeedbackDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Response TEXT,
    ResponseDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    LocationID INT NOT NULL,
    ItemName VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    LastRestocked DATE,
    MinimumThreshold INT,
    Status ENUM('In Stock', 'Low Stock', 'Out of Stock') DEFAULT 'In Stock',
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE DeliveryRoute (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    RouteName VARCHAR(100) NOT NULL,
    StartLocationID INT NOT NULL,
    EndLocationID INT NOT NULL,
    Distance DECIMAL(8, 2),
    EstimatedTime DECIMAL(8, 2),
    Status ENUM('Active', 'Inactive', 'Under Maintenance'),
    FOREIGN KEY (StartLocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (EndLocationID) REFERENCES Location(LocationID)
);

CREATE TABLE RouteSchedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    RouteID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ScheduleDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME,
    Status ENUM('Scheduled', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    VehicleID VARCHAR(50),
    FOREIGN KEY (RouteID) REFERENCES DeliveryRoute(RouteID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


