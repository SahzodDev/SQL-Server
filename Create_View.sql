--create view dbo.View_CustomerTotal
--as
--select c.CompanyName, c.CustomerID, sum((od.Quantity * od.UnitPrice) * (1 - od.Discount)) [CustomerTotal]
--from Customers c inner join Orders o on c.CustomerID = o.CustomerID inner join [Order Details] od on o.OrderID = od.OrderID 
--group by c.CustomerID, c.CompanyName

select * from dbo.View_CustomerTotal

--create view dbo.View_EmployeeManager

--as

--select concat(e.FirstName, ' ', e.LastName) [Manager], concat(e1.FirstName, ' ', e1.LastName) [EmployeeFullName]
--from Employees e inner join Employees e1 on e.EmployeeID = e1.ReportsTo

select * from dbo.View_EmployeeManager

alter view dbo.View_EmployeeManager

as

select e.EmployeeID [ManagerID], concat(e.FirstName, ' ', e.LastName) [Manager], e1.EmployeeID [EmployeeID], concat(e1.FirstName, ' ', e1.LastName) [EmployeeFullName]
from Employees e inner join Employees e1 on e.EmployeeID = e1.ReportsTo

select * from INFORMATION_SCHEMA.VIEWS

create view dbo.View_EmployeeManager
with encryption -- Oluþturulan view'un kodunu gizlemeye yarar. Encryption'ý kaldýrmak için alter table diyip with encryption ifadesi olmadan yazýlmasý gerekir.
as

select e.EmployeeID [ManagerID], concat(e.FirstName, ' ', e.LastName) [Manager], e1.EmployeeID [EmployeeID], concat(e1.FirstName, ' ', e1.LastName) [EmployeeFullName]
from Employees e inner join Employees e1 on e.EmployeeID = e1.ReportsTo

select * from dbo.View_CustomerTotal
where CustomerTotal > 20000