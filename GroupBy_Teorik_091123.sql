


select * from Customers
select distinct ContactTitle from Customers

select  ContactTitle, ContactName, count(CustomerID) [Count]
from Customers
group by ContactTitle, ContactName -- group by kullanýlýrken sleect içerisinde belirtilen kolonlar ya bir aggregate function içerisinde kullanýlmalý ya da group by clause içerisidne belirtilmeli yoksa querry hata verir.
order by ContactTitle

select * from Products
select c.CategoryName, count(p.ProductID) [ProductCount] 
from Products p inner join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName

select o.CustomerID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) [Total]
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
group by o.CustomerID
order by o.CustomerID

select * from [Order Details] where ProductID = 11
order by Quantity desc

select max(Quantity) [MaxQuantity], ProductID
from [Order Details]
group by ProductID
order by ProductID

select min(Quantity) [MaxQuantity], ProductID
from [Order Details]
group by ProductID
order by ProductID

select top 1 o.CustomerID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) [Total]
from Orders o inner join [Order Details] od on o.OrderID = od.OrderID
group by o.CustomerID
order by Total desc

select od.ProductID, sum(Quantity)[TotalQuantity]
from [Order Details] od
group by od.ProductID
order by TotalQuantity

select o.CustomerID, max(o.OrderDate) [LastOrderDate]
from Orders o
group by o.CustomerID

select avg(p.UnitPrice) 'Average Prices', cat.CategoryID
from Products p inner join Categories cat on p.CategoryID = cat.CategoryID
group by cat.CategoryID
having avg(UnitPrice) >= 30

select o.EmployeeID, count(OrderID)[EmployeeOrderCount]
from Orders o
group by o.EmployeeID
having count(OrderID) > 50
order by EmployeeOrderCount desc

select o.EmployeeID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) [Revenue] 
from Employees e inner join Orders o on e.EmployeeID = o.EmployeeID inner join [Order Details] od on o.OrderID = od.OrderID
group by o.EmployeeID

select p.CategoryID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) [Total]
from Orders o inner join [Order Details] od inner join Products p on od.ProductID = p.ProductID on o.OrderID = od.OrderID
group by p.CategoryID
order by Total desc
