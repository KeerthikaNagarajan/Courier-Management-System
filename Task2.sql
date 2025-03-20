-- 1. List all customers
SELECT Name FROM User;

-- 2. List all orders for a specific customer
SELECT * FROM Courier WHERE SenderName = 'Kabir Mehta';

-- 3. List all couriers
SELECT * FROM Courier;

-- 4. List all packages for a specific order
SELECT * FROM Courier WHERE CourierID = 8;

-- 5. List all deliveries for specific couriers (5 and 6) that have been delivered
SELECT * FROM Courier 
WHERE CourierID IN (5, 6) AND DeliveryDate IS NOT NULL;

-- 6. List all undelivered packages
SELECT * FROM Courier WHERE Status != 'Delivered';

-- 7. List all packages scheduled for delivery today
SELECT * FROM Courier WHERE DeliveryDate = CURDATE();

-- 8. List all packages with a specific status
SELECT * FROM Courier WHERE Status = 'In Transit';
SELECT * FROM Courier WHERE Status = 'Shipped';

-- 9. Calculate the total number of packages for each sender
SELECT SenderName, COUNT(*) AS TotalPackages
FROM Courier 
GROUP BY SenderName;

-- 10. Find the average delivery time for each courier
SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID;

-- 11. List all packages within a specific weight range
SELECT * FROM Courier WHERE Weight BETWEEN 2.00 AND 5.00;

-- 12. Retrieve employees whose names contain 'John'
SELECT * FROM Employee WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50
SELECT c.* 
FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;
