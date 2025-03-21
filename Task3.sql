USE courierdb;
SELECT e.Name, COUNT(ca.CourierID) AS Total_Couriers 
FROM Employee e 
JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
JOIN Courier c ON ca.CourierID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS Total_Revenue
FROM Payment p 
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName;

ALTER TABLE Courier ADD COLUMN DestinationLocationID INT;
ALTER TABLE Courier ADD FOREIGN KEY (DestinationLocationID) REFERENCES Location(LocationID) ON DELETE SET NULL;

UPDATE Courier SET DestinationLocationID = 11 WHERE CourierID = 11;
UPDATE Courier SET DestinationLocationID = 12 WHERE CourierID = 12;
UPDATE Courier SET DestinationLocationID = 13 WHERE CourierID = 13;
UPDATE Courier SET DestinationLocationID = 11 WHERE CourierID = 14;
UPDATE Courier SET DestinationLocationID = 12 WHERE CourierID = 15;

SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS Total_Delivered
FROM Location l 
JOIN Courier c ON l.LocationID = c.DestinationLocationID
WHERE c.Status = 'Delivered'
GROUP BY l.LocationID, l.LocationName;

SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID
ORDER BY AvgDeliveryTime DESC 
LIMIT 1;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS Total_Revenue
FROM Payment p 
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName 
HAVING Total_Revenue < 3000;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS Total_Payments
FROM Payment p 
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName;

SELECT p.CourierID, SUM(p.Amount) AS Total_Payment
FROM Payment p 
WHERE p.LocationID = 11
GROUP BY p.CourierID 
HAVING Total_Payment > 1000;

SELECT CourierID, SUM(Amount) AS Total_Payment
FROM Payment 
WHERE PaymentDate > '2025-03-21'
GROUP BY CourierID 
HAVING Total_Payment > 1000;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS Total_Payment
FROM Payment p 
JOIN Location l ON p.LocationID = l.LocationID
WHERE p.PaymentDate < '2025-02-20'
GROUP BY l.LocationID, l.LocationName 
HAVING Total_Payment > 5000;
