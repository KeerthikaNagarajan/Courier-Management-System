-- 23. Retrieve Payments with Courier Information using INNER JOIN.
SELECT p.PaymentID, p.Amount, c.CourierID, c.SenderName, c.ReceiverName
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information using INNER JOIN.
SELECT p.PaymentID, p.Amount, l.LocationID, l.LocationName
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information using INNER JOIN.
SELECT p.PaymentID, p.Amount, c.CourierID, c.SenderName, l.LocationName
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON p.LocationID = l.LocationID;

-- 26. List all payments with courier details.
SELECT p.*, c.SenderName, c.ReceiverName
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 27. Total payments received for each courier using SUM() and GROUP BY.
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

-- 28. List payments made on a specific date using WHERE PaymentDate = 'YYYY-MM-DD'.
SELECT * 
FROM Payment 
WHERE PaymentDate = '2025-01-12';

-- 29. Get Courier Information for Each Payment using JOIN.
SELECT p.PaymentID, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location using JOIN.
SELECT p.*, l.LocationName
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;

-- 31. Calculate Total Payments for Each Courier using SUM() and GROUP BY.
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

-- 32. List Payments Within a Date Range using WHERE PaymentDate BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'.
SELECT * 
FROM Payment 
WHERE PaymentDate BETWEEN '2025-01-01' AND '2025-12-31';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side using FULL OUTER JOIN.
SELECT u.UserID, u.Name, c.CourierID, c.SenderName
FROM User u
LEFT JOIN Courier c ON u.Name = c.SenderName
UNION
SELECT u.UserID, u.Name, c.CourierID, c.SenderName
FROM User u
RIGHT JOIN Courier c ON u.Name = c.SenderName;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side using FULL OUTER JOIN.
SELECT c.CourierID, c.SenderName, s.ServiceID, s.ServiceName
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
LEFT JOIN Service s ON p.ServiceID = s.ServiceID
UNION
SELECT c.CourierID, c.SenderName, s.ServiceID, s.ServiceName
FROM Courier c
RIGHT JOIN Payment p ON c.CourierID = p.CourierID
RIGHT JOIN Service s ON p.ServiceID = s.ServiceID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side using FULL OUTER JOIN.
SELECT e.EmployeeID, e.Name, p.PaymentID, p.Amount
FROM Employee e
LEFT JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
LEFT JOIN Payment p ON ca.CourierID = p.CourierID
UNION
SELECT e.EmployeeID, e.Name, p.PaymentID, p.Amount
FROM Employee e
RIGHT JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
RIGHT JOIN Payment p ON ca.CourierID = p.CourierID;

-- 36. List all users and all courier services, showing all possible combinations using CROSS JOIN.
SELECT u.UserID, u.Name, s.ServiceID, s.ServiceName
FROM User u
CROSS JOIN Service s;

-- 37. List all employees and all locations, showing all possible combinations using CROSS JOIN.
SELECT e.EmployeeID, e.Name, l.LocationID, l.LocationName
FROM Employee e
CROSS JOIN Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available) using LEFT JOIN.
SELECT CourierID, SenderName, SenderAddress
FROM Courier;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available) using LEFT JOIN.
SELECT CourierID, ReceiverName, ReceiverAddress
FROM Courier;

-- 40. Retrieve a list of couriers along with the courier service details (if available) using LEFT JOIN.
SELECT c.CourierID, c.SenderName, s.ServiceID, s.ServiceName
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
LEFT JOIN Service s ON p.ServiceID = s.ServiceID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee using COUNT() and GROUP BY.
SELECT e.EmployeeID, e.Name, COUNT(ca.CourierID) AS NumberOfCouriers
FROM Employee e
LEFT JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
GROUP BY e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location using SUM() and GROUP BY.
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
LEFT JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName) using WHERE.
SELECT c1.CourierID, c1.SenderName, c1.SenderAddress
FROM Courier c1
JOIN Courier c2 ON c1.SenderName = c2.SenderName AND c1.CourierID <> c2.CourierID;

-- 44. List all employees who share the same role using GROUP BY Role and HAVING COUNT(*) > 1.
SELECT e1.EmployeeID, e1.Name, e1.Role
FROM Employee e1
JOIN Employee e2 ON e1.Role = e2.Role AND e1.EmployeeID <> e2.EmployeeID;

-- 45. Retrieve all payments made for couriers sent from the same location using JOIN and WHERE.
SELECT p1.PaymentID, p1.Amount, p1.PaymentDate, l.LocationName
FROM Payment p1
JOIN Payment p2 ON p1.LocationID = p2.LocationID AND p1.PaymentID <> p2.PaymentID
JOIN Location l ON p1.LocationID = l.LocationID;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress) using WHERE.
SELECT c1.CourierID, c1.SenderName, c1.SenderAddress
FROM Courier c1
JOIN Courier c2 ON c1.SenderAddress = c2.SenderAddress AND c1.CourierID <> c2.CourierID;

-- 47. List employees and the number of couriers they have delivered using COUNT() and GROUP BY.
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS NumberOfDeliveries
FROM Employee e
LEFT JOIN CourierAssignment ca ON e.EmployeeID = ca.EmployeeID
LEFT JOIN Courier c ON ca.CourierID = c.CourierID AND c.Status = 'Delivered'
GROUP BY e.EmployeeID, e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services using WHERE.
SELECT c.CourierID, c.SenderName, p.Amount, s.ServiceName, s.Cost
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN Service s ON p.ServiceID = s.ServiceID
WHERE p.Amount > s.Cost;

-- 49. Find couriers that have a weight greater than the average weight of all couriers using a subquery with AVG().
SELECT CourierID, SenderName, Weight
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary using a subquery with AVG().
SELECT EmployeeID, Name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost using SUM() and a subquery with MAX().
SELECT SUM(Cost) AS TotalCost
FROM Service
WHERE Cost < (SELECT MAX(Cost) FROM Service);

-- 52. Find all couriers that have been paid for using EXISTS or JOIN with the Payment table.
SELECT DISTINCT c.CourierID, c.SenderName
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID;

-- 53. Find the locations where the maximum payment amount was made using MAX() and GROUP BY.
SELECT l.LocationID, l.LocationName, p.Amount
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
WHERE p.Amount = (SELECT MAX(Amount) FROM Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName') using ALL operator.
SELECT CourierID, SenderName, Weight
FROM Courier
WHERE Weight > ALL (
    SELECT Weight
    FROM Courier
    WHERE SenderName = 'John Doe'
);
