# Courier Management System
## TASK 1
### Database Design:
```MYSQL
CREATE DATABASE courierdb;
USE courierdb;

-- Creating User table and inserting data
CREATE TABLE User (
    UserID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Email VARCHAR(255) UNIQUE NOT NULL, 
    Password VARCHAR(255) NOT NULL, 
    ContactNumber VARCHAR(20), 
    Address TEXT
);

INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address) 
VALUES 
(1011, 'Rajesh K', 'rajeshk@gmail.com', 'Rajesh@111', '9123456789', 'T Nagar, Chennai, Tamil Nadu'),
(1012, 'Sneha R', 'snehar@gmail.com', 'Sneha@222', '9234567890', 'Peelamedu, Coimbatore, Tamil Nadu'),
(1013, 'Aravind M', 'aravindm@gmail.com', 'Aravind@333', '9345678901', 'Sellur, Madurai, Tamil Nadu'),
(1014, 'Pooja S', 'poojas@gmail.com', 'Pooja@444', '9456789012', 'Perundurai, Erode, Tamil Nadu'),
(1015, 'Harish V', 'harishv@gmail.com', 'Harish@555', '9567890123', 'Woraiyur, Trichy, Tamil Nadu'),
(1016, 'Lakshmi N', 'lakshmin@gmail.com', 'Lakshmi@666', '9678901234', 'RS Puram, Coimbatore, Tamil Nadu'),
(1017, 'Gokul P', 'gokulp@gmail.com', 'Gokul@777', '9789012345', 'Villapuram, Madurai, Tamil Nadu'),
(1018, 'Deepa K', 'deepak@gmail.com', 'Deepa@888', '9890123456', 'Fairlands, Salem, Tamil Nadu'),
(1019, 'Vignesh R', 'vigneshr@gmail.com', 'Vignesh@999', '9901234567', 'Katpadi, Vellore, Tamil Nadu'),
(1020, 'Swetha T', 'swethat@gmail.com', 'Swetha@000', '9812345678', 'Srirangam, Trichy, Tamil Nadu');

SELECT * FROM User;

-- Creating Courier table and inserting data
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,  
    SenderName VARCHAR(255),  
    SenderAddress TEXT,  
    ReceiverName VARCHAR(255),  
    ReceiverAddress TEXT,  
    Weight DECIMAL(5,2),  
    Status VARCHAR(50),  
    TrackingNumber VARCHAR(20) UNIQUE,  
    DeliveryDate DATE
);

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(11, 'Anirudh Sharma', 'HSR Layout, Bangalore, Karnataka', 'Ritika Malhotra', 'Andheri West, Mumbai, Maharashtra', 2.90, 'In Transit', 'BLR223344556', '2025-04-10'),
(12, 'Kabir Mehta', 'Salt Lake, Kolkata, West Bengal', 'Nisha Kapoor', 'Sector 62, Noida, Uttar Pradesh', 1.65, 'Delivered', 'CCU998877665', '2025-01-25'),
(13, 'Rohit Shetty', 'Jubilee Hills, Hyderabad, Telangana', 'Sanya Bhatnagar', 'Colaba, Mumbai, Maharashtra', 3.75, 'Shipped', 'HYD119988776', '2025-02-15'),
(14, 'Vikas Choudhury', 'Viman Nagar, Pune, Maharashtra', 'Tanya Deshmukh', 'Indira Nagar, Lucknow, Uttar Pradesh', 2.10, 'Pending', 'PNQ227766554', '2025-03-22'),
(15, 'Rohan Bhardwaj', 'Connaught Place, Delhi', 'Meenal Saxena', 'Shivaji Nagar, Bhopal, Madhya Pradesh', 4.25, 'Dispatched', 'DEL337788665', '2025-05-08');

SELECT * FROM Courier;

-- Creating Employee table and inserting data
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(255),  
    Email VARCHAR(255) UNIQUE,  
    ContactNumber VARCHAR(20),  
    Role VARCHAR(50),  
    Salary DECIMAL(10,2)
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)  
VALUES  
(126, 'Arjun M', 'arjun.m@email.com', '9876054321', 'HR Manager', 95000.00),
(127, 'Rahul V', 'rahul.v@email.com', '9768451234', 'Operations Head', 72000.00),
(128, 'Divya S', 'divya.s@email.com', '9854123698', 'Logistics Coordinator', 48000.00),
(129, 'Kavitha T', 'kavitha.t@email.com', '9745124789', 'Customer Service Rep', 38000.00),
(130, 'Sandeep K', 'sandeep.k@email.com', '9632547891', 'Inventory Supervisor', 36500.00);

SELECT * FROM Employee;

-- Creating Service table and inserting data
CREATE TABLE Service (
    ServiceID VARCHAR(10) PRIMARY KEY,  
    ServiceName VARCHAR(100),  
    Cost DECIMAL(8,2)
);

INSERT INTO Service (ServiceID, ServiceName, Cost)  
VALUES  
('S16', 'Eco-Friendly Delivery', 180.00),
('S17', 'Same-Day Express', 550.00),
('S18', 'Global Priority Shipping', 3200.00);

SELECT * FROM Service;

-- Creating Location table and inserting data
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,  
    LocationName VARCHAR(100),  
    Address TEXT
);

INSERT INTO Location (LocationID, LocationName, Address)  
VALUES  
(11, 'Chengalpattu Logistics Hub', '12, GST Road, Chengalpattu, Tamil Nadu - 603001'),
(12, 'Thoothukudi Parcel Center', '25, Beach Road, Thoothukudi, Tamil Nadu - 628002'),
(13, 'Tiruvannamalai Distribution Hub', '36, Arunachala Street, Tiruvannamalai, Tamil Nadu - 606603');

SELECT * FROM Location;

-- Creating Payment table and inserting data
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

INSERT INTO Payment (PaymentID, CourierID, LocationID, UserID, ServiceID, Amount, PaymentDate)  
VALUES  
(501, 11, 11, 1011, 'S16', 150.00, '2025-01-12'),  
(502, 12, 12, 1012, 'S17', 250.00, '2025-03-21'),
(503, 13, 13, 1013, 'S18', 500.00, '2025-02-25');

SELECT * FROM Payment;


```
* User Table: 
<img width="473" alt="image" src="https://github.com/user-attachments/assets/8c35e1f3-dea3-4794-a596-b3ce12d68430" />

* Courier:
<img width="719" alt="image" src="https://github.com/user-attachments/assets/4b9eb4ef-4a6f-415f-ba64-70a56683d16f" />

* CourierServices:
<img width="431" alt="image" src="https://github.com/user-attachments/assets/b1ef1711-594a-4c9e-9f44-c363be543ec8" />

* Employee Table: 
<img width="204" alt="image" src="https://github.com/user-attachments/assets/562e5374-7a9d-44f4-bb2e-256c29ae545d" />

* Location Table:
<img width="386" alt="image" src="https://github.com/user-attachments/assets/43e2575c-1e3c-40d0-aa3e-e73be2fa33a5" />

* Payment Table: 
<img width="358" alt="image" src="https://github.com/user-attachments/assets/0ff470a4-5a11-4c2f-bc70-664dec71ba21" />

### EER:
![err](https://github.com/user-attachments/assets/dc92b825-9937-4ca0-9993-072c4afe6a8c)

## TASK 2
### Select,Where:

```MYSQL
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
```

1. List all customers:
<img width="72" alt="image" src="https://github.com/user-attachments/assets/134a15ae-fb30-4f86-adae-bfe02725ca32" />
   
2. List all orders for a specific customer:
<img width="664" alt="image" src="https://github.com/user-attachments/assets/8b66f9b8-2015-4b76-90d5-5673f613b609" />

3. List all couriers:
<img width="719" alt="image" src="https://github.com/user-attachments/assets/05672fe6-50f8-41b1-855a-e7c231797c48" />

4. List all packages for a specific order:
<img width="706" alt="image" src="https://github.com/user-attachments/assets/3e919737-afd7-453f-8478-2d0e448a6ba1" />

5. List all deliveries for a specific courier:
<img width="706" alt="image" src="https://github.com/user-attachments/assets/cecf5304-f9bc-4e10-859d-dbc67fef297e" />

6. List all undelivered packages:
<img width="716" alt="image" src="https://github.com/user-attachments/assets/42f589ec-14e3-42d8-b8be-3942d30be8e4" />

7. List all packages that are scheduled for delivery today:
<img width="357" alt="image" src="https://github.com/user-attachments/assets/8d2cfa1e-fbcc-4a96-976c-a0dadb47692d" />

8. List all packages with a specific status:
<img width="704" alt="image" src="https://github.com/user-attachments/assets/53d22fa5-c89c-4da5-8019-8186b5806e56" />

<img width="675" alt="image" src="https://github.com/user-attachments/assets/5a663361-0a22-418a-b660-612d7bdd63ad" />

9. Calculate the total number of packages for each courier.
<img width="173" alt="image" src="https://github.com/user-attachments/assets/9b46cc6b-8d05-41bf-be49-6b4761a1e917" />

11. Find the average delivery time for each courier
<img width="143" alt="image" src="https://github.com/user-attachments/assets/951d9f6b-9340-4c93-b815-5f77ff00443a" />

12. List all packages with a specific weight range:
<img width="716" alt="image" src="https://github.com/user-attachments/assets/d544c2d9-69ff-4b5a-baaa-b5defb6b2079" />

13. Retrieve employees whose names contain 'John'
<img width="283" alt="image" src="https://github.com/user-attachments/assets/64f49bc2-c397-4974-8bf3-087ca1cdca56" />

14. Retrieve all courier records with payments greater than $50.
<img width="713" alt="image" src="https://github.com/user-attachments/assets/a3560b0a-9831-49da-9f4c-5abd6ff45afc" />

## TASK 3
### GroupBy, Aggregate Functions, Having, Order By, where:
```Mysql
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

```
14. Find the total number of couriers handled by each employee.
<img width="142" alt="image" src="https://github.com/user-attachments/assets/618eb690-1998-4c2b-9a86-61d6217181ad" />


15. Calculate the total revenue generated by each location
<img width="276" alt="image" src="https://github.com/user-attachments/assets/11301697-eb1d-4434-b5ff-70874a5398c8" />


16. Find the total number of couriers delivered to each location.
<img width="255" alt="image" src="https://github.com/user-attachments/assets/24f149a7-5d0e-4897-939d-e2e177e289e3" />


17. Find the courier with the highest average delivery time:
<img width="149" alt="image" src="https://github.com/user-attachments/assets/2338540b-9f10-47b9-a6e5-5ed7339123bc" />


18. Find Locations with Total Payments Less Than a Certain Amount
<img width="278" alt="image" src="https://github.com/user-attachments/assets/446358ec-98fe-4568-9d3d-3b360cbe61a4" />


19. Calculate Total Payments per Location
<img width="287" alt="image" src="https://github.com/user-attachments/assets/7b5a389e-adb2-4942-a227-ca92ade353d8" />


20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):
<img width="144" alt="image" src="https://github.com/user-attachments/assets/1a948cff-cf82-4dc8-9211-2095815b4134" />


## TASK 4 
```mysql
-- 23. Retrieve Payments with Courier Information  

select c.CourierID,c.SenderName,c.ReceiverName,c.DeliveryDate,p.paymentID,p.amount
from courier c join payment p
on c.CourierID=p.CourierID
order by c.CourierID desc;

-- 24. Retrieve Payments with Location Information  

select l.locationID,p.paymentID,l.locationName,p.amount,p.paymentDate
from location l join payment p
on l.LocationID=p.LocationID;

-- 25. Retrieve Payments with Courier and Location Information 
 
select p.paymentID,c.courierID,l.locationID,c.senderName,l.locationName,p.paymentDate
from payment p join courier c on c.CourierID=p.CourierID
join location l on l.LocationID=p.LocationID
order by c.CourierID;

-- 26. List all payments with courier details
  
select p.*,c.courierID,c.senderName
from payment p join courier c
on c.CourierID=p.CourierID
order by c.SenderName;

-- 27. Total payments received for each courier
select courierID,sum(amount) as Total_Payments
from payment
group by CourierID;

-- 28. List payments made on a specific date 

select p.PaymentID, p.CourierID, c.senderName, p.Amount, p.PaymentDate
from Payment p
inner join Courier c on p.CourierID = c.CourierID
where p.PaymentDate = '2025-01-12';

-- 29. Get Courier Information for Each Payment 
 
select p.paymentID,p.paymentDate,c.*
from payment p join courier c 
on c.CourierID=p.CourierID
group by p.PaymentID order by p.PaymentID desc;

-- 30. Get Payment Details with Location 
 
select p.*,l.*
from payment p inner join location l
on p.LocationID=l.LocationID;

-- 31. Calculating Total Payments for Each Courier
 
select courierID,sum(amount) as Total_Payments
from payment
group by CourierID; 

-- 32. List Payments Within a Date Range  

select * from payment 
where paymentDate between '2025-02-20' and  '2025-03-06';

-- 33. Retrieve a list of all users and their corresponding services, including cases where there are no matches on either side  

select u.UserID, u.Name, s.ServiceID, s.ServiceName from User u
left join Payment p on u.UserID = p.UserID
left join Service s on p.ServiceID = s.ServiceID union
select  u.UserID,u.Name, s.ServiceID, s.ServiceName from User u
right join Payment p on u.UserID = p.UserID
right join Service s on p.ServiceID = s.ServiceID;

-- 34. Retrieve a list of all couriers and their corresponding courier records, including cases where there are no matches on either side 
 
select c.CourierID, c.senderName, s.ServiceID, s.ServiceName from Courier c
left join Payment p on c.CourierID = p.CourierID 
left join Service s on p.ServiceID = s.ServiceID union
select c.CourierID, c.senderName, s.ServiceID, s.ServiceName from Courier c
right join Payment p on c.CourierID = p.CourierID
right join Service s on p.ServiceID = s.ServiceID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
  
select e.employeeID,e.Name,e.role,c.courierID,p.paymentID,p.amount from courier c
left join employee e on c.CourierID=e.CourierID
left join payment p on c.courierID=p.courierID union
select e.employeeID,e.Name,e.role,c.courierID,p.paymentID,p.amount from courier c
right join employee e on c.CourierID=e.CourierID
right join payment p on c.courierID=p.courierID ;

-- 36. List all users and all courier services, showing all possible combinations.  

select u.userID,u.Name,s.serviceID,s.serviceName 
from user u 
cross join service s;

-- 37. List all employees and all locations, showing all possible combinations:
 
select e.employeeID,e.Name,l.LocationID,l.LocationName,l.Address
from employee e
cross join location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)  

select courierID,senderName,senderAddress 
from courier;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):
  
select courierID,receiverName,receiverAddress
from courier;

-- 40. Retrieve a list of couriers along with the courier service details (if available): 
 
select c.courierID,c.senderName,s.serviceID,s.serviceName
from payment p join courier c 
on c.CourierID=p.CourierID
join service s on s.ServiceID=p.ServiceID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee: 

select e.employeeID,e.Name,count(c.courierID) as NO_of_couriers
from  courier c join employee e
on c.CourierID=e.CourierID
group by e.EmployeeID;

-- 42. Retrieve a list of locations and the total payment amount received at each location:

select l.locationID,l.locationName,sum(p.amount) as Total_payment
from location l left join payment p
on l.LocationID=p.locationID
group by l.LocationID;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName).  

select * from Courier c1
join Courier c2 on c1.SenderName = c2.SenderName 
and c1.CourierID <> c2.CourierID
order by c1.SenderName, c1.CourierID;

-- 44. List all employees who share the same role.  

select e1.employeeID,e1.Name,e1.role 
from employee e1 join employee e2
on e1.role=e2.role and e1.employeeID <> e2.employeeID;

-- 45. Retrieve all payments made for couriers sent from the same location.  

select p.paymentID,p.amount,p.paymentDate,l.locationName from payment p 
join location l on p.locationID=l.locationID
join courier c on c.CourierID=p.courierID
join payment p1 on p1.PaymentID<>p.PaymentID --  comparing different payments
join courier c1 on c1.CourierID=p.CourierID
join location l1 on l1.LocationID=p.locationID
order by l.LocationName; -- Ensures payments are from the same location

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress). 

select c.CourierID,c.senderName,c.SenderAddress from courier c 
join courier c1 on c.SenderAddress=c1.SenderAddress
and c.CourierID <> c1.CourierID;

-- 47. List employees and the number of couriers they have delivered:  

select e.employeeID,e.name,count(c.courierID)  as NOofCouriers 
from employee e join courier c on c.CourierID=e.CourierID
where status='Delivered'
group by e.EmployeeID,e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services 

select c.courierID,p.amount,s.serviceName,s.serviceID from payment p 
join courier c on c.CourierID=p.CourierID
join service s on p.ServiceID=s.ServiceID
where amount>s.cost;

-- 49. Find couriers that have a weight greater than the average weight of all couriers  

select courierID,senderName,weight
from courier 
where weight>(select avg(weight) from courier);

-- 50. Find the names of all employees who have a salary greater than the average salary:  

select employeeID,Name,salary 
from employee 
where salary>(select avg(salary) from employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost  

select sum(Cost) as Tota_cost 
from service where cost<(select max(cost) from service);

-- 52. Find all couriers that have been paid for 

select courierID from payment 
where exists (select 1 from payment where amount is not null); 

-- 53. Find the locations where the maximum payment amount was made
  
select locationID,amount from payment 
where amount=(select max(amount) from payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 
 
select courierID,senderName,weight from courier 
where weight>all
(select weight from courier where senderName='Divya Shree');
```
