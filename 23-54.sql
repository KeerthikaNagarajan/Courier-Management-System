-- 23. Retrieve Payments with Courier Information:
SELECT p.*, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information:
SELECT p.*, l.*
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information:
SELECT p.*, c.*, l.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON p.LocationID = l.LocationID;

-- 26. List all payments with courier details:
SELECT p.*, c.TrackingNumber, c.Status, c.ReceiverName
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 27. Total payments received for each courier:
SELECT 
    c.CourierID, 
    c.TrackingNumber,
    SUM(p.Amount) AS TotalPayments
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.TrackingNumber;

-- 28. List payments made on a specific date (e.g., '2023-06-01'):
SELECT * FROM Payment 
WHERE DATE(PaymentDate) = '2023-06-01';

-- 29. Get Courier Information for Each Payment:
SELECT p.PaymentID, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location:
SELECT p.*, l.LocationName, l.City, l.State
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;

-- 31. Calculating Total Payments for Each Courier:
SELECT 
    c.CourierID,
    c.TrackingNumber,
    SUM(p.Amount) AS TotalPayments
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.TrackingNumber;

-- 32. List Payments Within a Date Range (e.g., June 2023):
SELECT * FROM Payment
WHERE PaymentDate BETWEEN '2023-06-01' AND '2023-06-30';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side:
SELECT u.*, c.*
FROM User u
LEFT JOIN Orders o ON u.UserID = o.UserID
LEFT JOIN Courier c ON o.OrderID = c.OrderID
UNION
SELECT u.*, c.*
FROM User u
RIGHT JOIN Orders o ON u.UserID = o.UserID
RIGHT JOIN Courier c ON o.OrderID = c.OrderID
WHERE u.UserID IS NULL;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side:
SELECT c.*, cs.*
FROM Courier c
LEFT JOIN CourierServiceMapping csm ON c.CourierID = csm.CourierID
LEFT JOIN CourierServices cs ON csm.ServiceID = cs.ServiceID
UNION
SELECT c.*, cs.*
FROM Courier c
RIGHT JOIN CourierServiceMapping csm ON c.CourierID = csm.CourierID
RIGHT JOIN CourierServices cs ON csm.ServiceID = cs.ServiceID
WHERE c.CourierID IS NULL;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side:
SELECT e.*, p.*
FROM Employee e
LEFT JOIN CourierEmployeeAssignment cea ON e.EmployeeID = cea.EmployeeID
LEFT JOIN Courier c ON cea.CourierID = c.CourierID
LEFT JOIN Payment p ON c.CourierID = p.CourierID
UNION
SELECT e.*, p.*
FROM Employee e
RIGHT JOIN CourierEmployeeAssignment cea ON e.EmployeeID = cea.EmployeeID
RIGHT JOIN Courier c ON cea.CourierID = c.CourierID
RIGHT JOIN Payment p ON c.CourierID = p.CourierID
WHERE e.EmployeeID IS NULL;

-- 36. List all users and all courier services, showing all possible combinations:
SELECT u.*, cs.*
FROM User u
CROSS JOIN CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations:
SELECT e.*, l.*
FROM Employee e
CROSS JOIN Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available):
SELECT c.*, u.Name AS SenderUserName, u.Email AS SenderEmail
FROM Courier c
LEFT JOIN Orders o ON c.OrderID = o.OrderID
LEFT JOIN User u ON o.UserID = u.UserID;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):
-- In this schema, receiver info is stored directly in Courier table
SELECT CourierID, ReceiverName, ReceiverAddress, ReceiverContact
FROM Courier;

-- 40. Retrieve a list of couriers along with the courier service details (if available):
SELECT c.*, cs.ServiceName, cs.Description, csm.AppliedCost
FROM Courier c
LEFT JOIN CourierServiceMapping csm ON c.CourierID = csm.CourierID
LEFT JOIN CourierServices cs ON csm.ServiceID = cs.ServiceID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT 
    e.EmployeeID, 
    e.Name,
    COUNT(cea.CourierID) AS CouriersAssigned
FROM Employee e
LEFT JOIN CourierEmployeeAssignment cea ON e.EmployeeID = cea.EmployeeID
GROUP BY e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location:
SELECT 
    l.LocationID,
    l.LocationName,
    COALESCE(SUM(p.Amount), 0) AS TotalPayments
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName):
SELECT SenderName, GROUP_CONCAT(CourierID) AS CourierIDs
FROM Courier
GROUP BY SenderName
HAVING COUNT(*) > 1;

-- 44. List all employees who share the same role:
SELECT Role, GROUP_CONCAT(EmployeeID) AS EmployeeIDs
FROM Employee
GROUP BY Role
HAVING COUNT(*) > 1;

-- 45. Retrieve all payments made for couriers sent from the same location:
SELECT p.LocationID, l.LocationName, GROUP_CONCAT(p.PaymentID) AS PaymentIDs
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
GROUP BY p.LocationID, l.LocationName
HAVING COUNT(*) > 1;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress):
SELECT 
    SUBSTRING_INDEX(SenderAddress, ',', 1) AS SenderLocation,
    GROUP_CONCAT(CourierID) AS CourierIDs
FROM Courier
GROUP BY SenderLocation
HAVING COUNT(*) > 1;

-- 47. List employees and the number of couriers they have delivered:
SELECT 
    e.EmployeeID,
    e.Name,
    COUNT(cea.CourierID) AS CouriersDelivered
FROM Employee e
JOIN CourierEmployeeAssignment cea ON e.EmployeeID = cea.EmployeeID
JOIN Courier c ON cea.CourierID = c.CourierID
WHERE c.Status = 'Delivered'
GROUP BY e.EmployeeID, e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services:
SELECT c.*, p.Amount, csm.AppliedCost
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN CourierServiceMapping csm ON c.CourierID = csm.CourierID
WHERE p.Amount > csm.AppliedCost;

-- 49. Find couriers that have a weight greater than the average weight of all couriers:
SELECT * FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary:
SELECT Name, Salary FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost:
SELECT SUM(CostPerKg) AS TotalCost
FROM CourierServices
WHERE CostPerKg < (SELECT MAX(CostPerKg) FROM CourierServices);

-- 52. Find all couriers that have been paid for:
SELECT DISTINCT c.*
FROM Courier c
WHERE EXISTS (SELECT 1 FROM Payment p WHERE p.CourierID = c.CourierID);

-- 53. Find the locations where the maximum payment amount was made:
SELECT l.LocationID, l.LocationName, p.Amount
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.Amount = (SELECT MAX(Amount) FROM Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'John Smith'):
SELECT *
FROM Courier
WHERE Weight > ALL (
    SELECT Weight 
    FROM Courier 
    WHERE SenderName = 'John Smith'
);