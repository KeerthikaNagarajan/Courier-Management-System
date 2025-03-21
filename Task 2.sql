-- 1. List all customers from the User table.
SELECT * FROM User;

-- 2. List all orders for a specific customer using WHERE.
SELECT c.* 
FROM Courier c
JOIN User u ON c.SenderName = u.Name
WHERE u.UserID = 1011;

-- 3. List all couriers from the Courier table.
SELECT * FROM Courier;

-- 4. List all packages for a specific order.
SELECT * 
FROM Courier 
WHERE CourierID = 11;

-- 5. List all deliveries for a specific courier.
SELECT * 
FROM Courier 
WHERE CourierID = 12 AND Status = 'Delivered';

-- 6. List all undelivered packages (Status != 'Delivered').
SELECT * 
FROM Courier 
WHERE Status != 'Delivered';

-- 7. List all packages scheduled for delivery today (DeliveryDate = CURDATE()).
SELECT * 
FROM Courier 
WHERE DeliveryDate = CURDATE();

-- 8. List all packages with a specific status (WHERE Status = 'In Transit').
SELECT * 
FROM Courier 
WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier using COUNT().
SELECT SenderName, COUNT(*) AS TotalPackages
FROM Courier 
GROUP BY SenderName;

-- 10. Find the average delivery time for each courier using AVG().
SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID;

-- 11. List all packages within a specific weight range (WHERE Weight BETWEEN x AND y).
SELECT * 
FROM Courier 
WHERE Weight BETWEEN 2.00 AND 5.00;

-- 12. Retrieve employees whose names contain 'John' (WHERE Name LIKE '%John%').
SELECT * 
FROM Employee 
WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50.
SELECT c.* 
FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;