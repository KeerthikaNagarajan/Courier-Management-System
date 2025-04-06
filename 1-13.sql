-- 1. List all customers:
SELECT * FROM User;

-- 2. List all orders for a specific customer (e.g., UserID = 1):
SELECT * FROM Orders WHERE UserID = 1;

-- 3. List all couriers:
SELECT * FROM Courier;

-- 4. List all packages for a specific order (e.g., OrderID = 1):
SELECT * FROM Parcel WHERE CourierID IN (SELECT CourierID FROM Courier WHERE OrderID = 1);

-- 5. List all deliveries for a specific courier (e.g., EmployeeID = 3):
SELECT c.* FROM Courier c
JOIN CourierEmployeeAssignment cea ON c.CourierID = cea.CourierID
WHERE cea.EmployeeID = 3;

-- 6. List all undelivered packages:
SELECT * FROM Courier WHERE Status NOT IN ('Delivered', 'Cancelled');

-- 7. List all packages that are scheduled for delivery today:
SELECT * FROM Courier 
WHERE DATE(DeliveryDate) = CURDATE() 
AND Status NOT IN ('Delivered', 'Cancelled');

-- 8. List all packages with a specific status (e.g., 'In Transit'):
SELECT * FROM Courier WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier:
SELECT c.CourierID, COUNT(p.ParcelID) AS PackageCount
FROM Courier c
LEFT JOIN Parcel p ON c.CourierID = p.CourierID
GROUP BY c.CourierID;

-- 10. Find the average delivery time for each courier (for delivered packages):
SELECT 
    c.CourierID,
    AVG(TIMESTAMPDIFF(HOUR, c.PickupDate, c.DeliveryDate)) AS AvgDeliveryHours
FROM Courier c
WHERE c.Status = 'Delivered' AND c.PickupDate IS NOT NULL AND c.DeliveryDate IS NOT NULL
GROUP BY c.CourierID;

-- 11. List all packages with a specific weight range (e.g., between 1 and 5 kg):
SELECT * FROM Parcel WHERE Weight BETWEEN 1 AND 5;

-- 12. Retrieve employees whose names contain 'John':
SELECT * FROM Employee WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50:
SELECT c.* FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;