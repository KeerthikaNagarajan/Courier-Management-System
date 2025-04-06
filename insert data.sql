INSERT INTO Location (LocationName, Address, City, State, ZipCode, ContactNumber, LocationType, OperatingHours) VALUES
('Main Warehouse', '100 Industrial Park', 'Anytown', 'CA', '90210', '555-0201', 'Warehouse', 'Mon-Fri: 8AM-8PM, Sat: 9AM-5PM'),
('Downtown Hub', '50 Commerce St', 'Somewhere', 'NY', '10001', '555-0202', 'Distribution Center', 'Mon-Sun: 6AM-10PM'),
('Northside Facility', '200 Logistics Ave', 'Nowhere', 'TX', '75001', '555-0203', 'Warehouse', 'Mon-Fri: 7AM-7PM'),
('Eastside Outlet', '300 Shopping Plaza', 'Anywhere', 'FL', '33101', '555-0204', 'Retail Outlet', 'Mon-Sat: 9AM-9PM, Sun: 10AM-6PM'),
('Westside Center', '400 Business Park', 'Everywhere', 'IL', '60007', '555-0205', 'Distribution Center', 'Mon-Fri: 6AM-6PM'),
('Corporate HQ', '500 Executive Blvd', 'Anytown', 'CA', '90211', '555-0206', 'Headquarters', 'Mon-Fri: 8AM-5PM');

INSERT INTO User (Name, Email, Password, ContactNumber, Address, RegistrationDate, LastLogin, AccountStatus) VALUES
('John Smith', 'john.smith@email.com', 'jsmith123', '555-0101', '123 Main St, Anytown, USA', '2023-01-15 09:30:00', '2023-06-01 14:20:00', 'Active'),
('Sarah Johnson', 'sarah.j@email.com', 'sjohnson456', '555-0102', '456 Oak Ave, Somewhere, USA', '2023-01-16 10:15:00', '2023-06-02 10:45:00', 'Active'),
('Michael Brown', 'michael.b@email.com', 'mbrown789', '555-0103', '789 Pine Rd, Nowhere, USA', '2023-01-17 11:45:00', '2023-06-03 09:30:00', 'Active'),
('Emily Davis', 'emily.d@email.com', 'edavis321', '555-0104', '321 Elm St, Anywhere, USA', '2023-01-18 13:20:00', '2023-06-04 16:10:00', 'Active'),
('Robert Wilson', 'robert.w@email.com', 'rwilson654', '555-0105', '654 Maple Dr, Everywhere, USA', '2023-01-19 14:10:00', '2023-06-05 11:25:00', 'Active'),
('Jennifer Lee', 'jennifer.l@email.com', 'jlee987', '555-0106', '987 Cedar Ln, Somewhere, USA', '2023-01-20 15:30:00', '2023-06-06 13:40:00', 'Active');

INSERT INTO Employee (Name, Email, Password, ContactNumber, Role, Salary, HireDate, Status, CurrentLocationID, VehicleInfo) VALUES
('Admin User', 'admin@courier.com', 'admin123', '555-0301', 'Admin', 75000.00, '2020-01-15', 'Active', 6, NULL),
('Warehouse Manager', 'manager@courier.com', 'manager456', '555-0302', 'Manager', 65000.00, '2020-02-20', 'Active', 1, NULL),
('Driver 1', 'driver1@courier.com', 'driver123', '555-0303', 'Driver', 45000.00, '2021-03-10', 'Active', 1, 'Ford Transit #TRN001'),
('Customer Service', 'cs@courier.com', 'cs123', '555-0304', 'Customer Service', 40000.00, '2021-04-15', 'Active', 2, NULL),
('Warehouse Staff', 'warehouse@courier.com', 'wh123', '555-0305', 'Warehouse', 38000.00, '2021-05-20', 'Active', 1, NULL),
('Operations Manager', 'ops@courier.com', 'ops123', '555-0306', 'Manager', 70000.00, '2020-06-25', 'Active', 6, NULL);

UPDATE Location SET ManagerID = 2 WHERE LocationID = 1;
UPDATE Location SET ManagerID = 4 WHERE LocationID = 2;
UPDATE Location SET ManagerID = 6 WHERE LocationID = 6;

INSERT INTO UserPaymentMethods (UserID, CardNumber, CardType, ExpiryDate, BillingAddress, IsDefault) VALUES
(1, '4111111111111111', 'Visa', '2025-12-31', '123 Main St, Anytown, USA', TRUE),
(2, '5555555555554444', 'MasterCard', '2024-10-31', '456 Oak Ave, Somewhere, USA', TRUE),
(3, '378282246310005', 'Amex', '2026-06-30', '789 Pine Rd, Nowhere, USA', TRUE),
(4, '6011111111111117', 'Discover', '2025-08-31', '321 Elm St, Anywhere, USA', TRUE),
(5, '3530111333300000', 'Amex', '2024-09-30', '654 Maple Dr, Everywhere, USA', FALSE),
(6, '5105105105105100', 'MasterCard', '2026-03-31', '987 Cedar Ln, Somewhere, USA', TRUE);

INSERT INTO CourierServices (ServiceName, Description, BaseCost, CostPerKg, MaxWeight, EstimatedDeliveryDays, IsActive) VALUES
('Standard Ground', 'Regular ground shipping', 8.99, 1.50, 50.00, 3, TRUE),
('Express 2-Day', 'Guaranteed 2-day delivery', 15.99, 2.50, 50.00, 2, TRUE),
('Overnight', 'Next business day delivery', 25.99, 4.00, 50.00, 1, TRUE),
('International Standard', 'International ground shipping', 29.99, 5.00, 50.00, 7, TRUE),
('International Express', 'Fast international shipping', 49.99, 8.00, 50.00, 3, TRUE),
('Same Day Delivery', 'Delivery within same day', 59.99, 10.00, 20.00, 0, TRUE);

INSERT INTO Orders (UserID, OrderDate, TotalAmount, Status, PaymentMethodID, ShippingMethod, EstimatedDelivery) VALUES
(1, '2023-06-01 10:15:00', 25.99, 'Delivered', 1, 'Express 2-Day', '2023-06-03'),
(2, '2023-06-02 11:30:00', 45.50, 'Processing', 2, 'Overnight', '2023-06-03'),
(3, '2023-06-03 09:45:00', 15.99, 'Shipped', 3, 'Standard Ground', '2023-06-06'),
(4, '2023-06-04 14:20:00', 89.99, 'Processing', 4, 'International Express', '2023-06-07'),
(5, '2023-06-05 16:10:00', 120.00, 'Cancelled', 5, 'Same Day Delivery', '2023-06-05'),
(6, '2023-06-06 13:40:00', 59.99, 'Delivered', 6, 'Overnight', '2023-06-07');

ALTER TABLE Courier 
MODIFY COLUMN Status ENUM('Processing', 'In Transit', 'Out for Delivery', 'Delivered', 'Failed', 'Returned', 'Cancelled') DEFAULT 'Processing';

INSERT INTO Courier (OrderID, SenderName, SenderAddress, SenderContact, ReceiverName, ReceiverAddress, ReceiverContact, Weight, Dimensions, Status, TrackingNumber, PickupDate, DeliveryDate) VALUES
(1, 'John Smith', '123 Main St, Anytown, USA', '555-0101', 'Alice Brown', '789 Pine Rd, Nowhere, USA', '555-0201', 2.5, '12x8x4', 'Delivered', 'TRK123456', '2023-06-01 14:00:00', '2023-06-03 10:30:00'),
(2, 'Sarah Johnson', '456 Oak Ave, Somewhere, USA', '555-0102', 'Bob Green', '321 Elm St, Anywhere, USA', '555-0202', 5.0, '18x12x6', 'In Transit', 'TRK789012', '2023-06-02 12:30:00', NULL),
(3, 'Michael Brown', '789 Pine Rd, Nowhere, USA', '555-0103', 'Carol White', '654 Maple Dr, Everywhere, USA', '555-0203', 1.2, '10x6x3', 'Out for Delivery', 'TRK345678', '2023-06-03 10:45:00', NULL),
(4, 'Emily Davis', '321 Elm St, Anywhere, USA', '555-0104', 'Dave Black', '987 Cedar Ln, Somewhere, USA', '555-0204', 15.0, '24x18x12', 'Processing', 'TRK901234', NULL, NULL),
(5, 'Robert Wilson', '654 Maple Dr, Everywhere, USA', '555-0105', 'Eve Gray', '123 Main St, Anytown, USA', '555-0205', 25.0, '36x24x18', 'Cancelled', 'TRK567890', NULL, NULL),
(6, 'Jennifer Lee', '987 Cedar Ln, Somewhere, USA', '555-0106', 'Frank Blue', '456 Oak Ave, Somewhere, USA', '555-0206', 3.5, '14x10x8', 'Delivered', 'TRK123789', '2023-06-06 15:00:00', '2023-06-07 11:15:00');

INSERT INTO CourierServiceMapping (CourierID, ServiceID, AppliedCost) 
VALUES 
(1, 2, 25.99), 
(2, 3, 45.50), 
(3, 1, 15.99), 
(4, 5, 89.99), 
(5, 6, 120.00), 
(6, 3, 59.99);

INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate, PaymentMethod, PaymentStatus, TransactionID) VALUES
(1, 1, 25.99, '2023-06-01 10:20:00', 'Credit Card', 'Completed', 'TXN123456'),
(2, 2, 45.50, '2023-06-02 11:35:00', 'Credit Card', 'Completed', 'TXN789012'),
(3, 3, 15.99, '2023-06-03 09:50:00', 'Debit Card', 'Completed', 'TXN345678'),
(4, 4, 89.99, '2023-06-04 14:25:00', 'Credit Card', 'Pending', 'TXN901234'),
(5, 5, 120.00, '2023-06-05 16:15:00', 'Bank Transfer', 'Refunded', 'TXN567890'),
(6, 6, 59.99, '2023-06-06 13:45:00', 'Digital Wallet', 'Completed', 'TXN123789');

INSERT INTO Parcel (CourierID, Description, Weight, Length, Width, Height, Value, Category, Barcode) VALUES
(1, 'Important documents', 0.5, 12, 8, 4, 50.00, 'Document', 'DOC123456'),
(1, 'Books', 2.0, 12, 8, 4, 100.00, 'Other', 'BK789012'),
(2, 'Laptop', 3.0, 18, 12, 6, 1200.00, 'Electronics', 'ELEC345678'),
(2, 'Monitor', 2.0, 18, 12, 6, 300.00, 'Electronics', 'ELEC901234'),
(3, 'Clothing', 1.2, 10, 6, 3, 75.00, 'Clothing', 'CLOTH567890'),
(6, 'Gift items', 3.5, 14, 10, 8, 200.00, 'Other', 'GIFT123789');

INSERT INTO TrackingHistory (CourierID, LocationID, Status, UpdateTime, EmployeeID, Notes) VALUES
(1, 1, 'Processing', '2023-06-01 14:00:00', 3, 'Package received at warehouse'),
(1, NULL, 'In Transit', '2023-06-02 08:30:00', 3, 'Package left distribution center'),
(1, NULL, 'Delivered', '2023-06-03 10:30:00', 3, 'Package delivered to recipient'),
(2, 2, 'Processing', '2023-06-02 12:30:00', 3, 'Package received at downtown hub'),
(2, NULL, 'In Transit', '2023-06-03 09:15:00', 3, 'Package in route to destination'),
(6, 6, 'Delivered', '2023-06-07 11:15:00', 3, 'Package delivered successfully');

INSERT INTO EmployeeLocationAssignment (EmployeeID, LocationID, StartDate, IsPrimary) VALUES
(1, 6, '2020-01-15', TRUE),
(2, 1, '2020-02-20', TRUE),
(3, 1, '2021-03-10', FALSE),
(4, 2, '2021-04-15', TRUE),
(5, 1, '2021-05-20', FALSE),
(6, 6, '2020-06-25', TRUE);

INSERT INTO CourierEmployeeAssignment (CourierID, EmployeeID, AssignmentDate, Status) 
VALUES 
(1, 3, '2023-06-01 14:05:00', 'Completed'), 
(2, 3, '2023-06-02 12:35:00', 'In Progress'), 
(3, 3, '2023-06-03 10:50:00', 'In Progress'), 
(4, 5, '2023-06-04 14:30:00', 'Assigned'), 
(6, 3, '2023-06-06 15:05:00', 'Completed');

INSERT INTO Feedback (UserID, CourierID, Rating, Comments, FeedbackDate) VALUES
(1, 1, 5, 'Excellent service, delivered on time!', '2023-06-03 11:00:00'),
(2, 2, 4, 'Good service, but slightly delayed', '2023-06-04 09:30:00'),
(3, 3, 3, 'Average experience', '2023-06-05 14:15:00'),
(4, 4, NULL, 'Still waiting for delivery', '2023-06-06 10:45:00'),
(5, 5, 1, 'Order was cancelled without notice', '2023-06-07 08:20:00'),
(6, 6, 5, 'Perfect service, will use again!', '2023-06-07 12:30:00');

INSERT INTO Inventory (LocationID, ItemName, Quantity, LastRestocked, MinimumThreshold, Status) VALUES
(1, 'Shipping Boxes (Small)', 500, '2023-05-20', 100, 'In Stock'),
(1, 'Shipping Boxes (Large)', 300, '2023-05-25', 50, 'In Stock'),
(2, 'Bubble Wrap', 200, '2023-06-01', 30, 'In Stock'),
(3, 'Packing Tape', 150, '2023-05-28', 20, 'In Stock'),
(4, 'Thermal Labels', 1000, '2023-06-05', 200, 'In Stock'),
(5, 'Packing Peanuts', 400, '2023-05-30', 100, 'In Stock');

INSERT INTO DeliveryRoute (RouteName, StartLocationID, EndLocationID, Distance, EstimatedTime, Status) VALUES
('Anytown Downtown', 1, 2, 15.5, 1.5, 'Active'),
('Cross-State Express', 2, 3, 250.0, 4.0, 'Active'),
('Metro Loop', 3, 4, 120.0, 2.5, 'Active'),
('Regional Circuit', 4, 5, 180.0, 3.0, 'Active'),
('Coastal Run', 5, 6, 300.0, 5.0, 'Active'),
('Corporate Shuttle', 6, 1, 10.0, 0.5, 'Active');

INSERT INTO RouteSchedule (RouteID, EmployeeID, ScheduleDate, StartTime, EndTime, Status, VehicleID) VALUES
(1, 3, '2023-06-07', '08:00:00', '10:00:00', 'Scheduled', 'TRN001'),
(2, 3, '2023-06-08', '07:00:00', '12:00:00', 'Scheduled', 'TRN001'),
(3, 3, '2023-06-09', '09:00:00', '12:30:00', 'Scheduled', 'TRN001'),
(4, 3, '2023-06-10', '08:30:00', '12:30:00', 'Scheduled', 'TRN001'),
(5, 3, '2023-06-11', '07:30:00', '13:30:00', 'Scheduled', 'TRN001'),
(6, 3, '2023-06-12', '09:30:00', '11:00:00', 'Scheduled', 'TRN001');

