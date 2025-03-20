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