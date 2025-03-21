SELECT Name FROM User;

SELECT * FROM Courier WHERE SenderName = 'Kabir Mehta';

SELECT * FROM Courier;

SELECT * FROM Courier WHERE CourierID = 11;

SELECT * FROM Courier 
WHERE CourierID IN (11, 12) AND DeliveryDate IS NOT NULL;

SELECT * FROM Courier WHERE Status != 'Delivered';

SELECT * FROM Courier WHERE DeliveryDate = CURDATE();

SELECT * FROM Courier WHERE Status = 'In Transit';
SELECT * FROM Courier WHERE Status = 'Shipped';

SELECT SenderName, COUNT(*) AS TotalPackages
FROM Courier 
GROUP BY SenderName;

SELECT c.CourierID, 
       AVG(DATEDIFF(c.DeliveryDate, p.PaymentDate)) AS AvgDeliveryTime
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID;

SELECT * FROM Courier WHERE Weight BETWEEN 2.00 AND 5.00;

SELECT * FROM Employee WHERE Name LIKE '%John%';

SELECT c.* 
FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;
