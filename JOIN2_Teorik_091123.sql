

select * from Orders where CustomerID = 'VINET'

-- 2 tablo join

select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID

where c.CustomerID = 'VINET'

-- 3 tablo join

select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate, e.EmployeeID, e.FirstName, e.LastName
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID inner join Employees e on o.EmployeeID = e.EmployeeID
where c.CustomerID = 'VINET'

-- 4. tablo
select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate, e.EmployeeID, e.FirstName, e.LastName, od.ProductID, od.Quantity, od.Discount
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID inner join Employees e on o.EmployeeID = e.EmployeeID
inner join [Order Details] od on o.OrderID = od.OrderID
where c.CustomerID = 'VINET'

-- 5. tablo inner join

select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate, e.EmployeeID, e.FirstName, e.LastName, od.ProductID, od.Quantity, od.Discount, p.ProductName, p.CategoryID
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID inner join Employees e on o.EmployeeID = e.EmployeeID
inner join [Order Details] od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
where c.CustomerID = 'VINET'

-- 6. tablo join

select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate, e.EmployeeID, e.FirstName, e.LastName, od.ProductID, od.Quantity, od.Discount, p.ProductName, p.CategoryID, cat.CategoryName
from Customers c inner join Orders o
on c.CustomerID = o.CustomerID inner join Employees e on o.EmployeeID = e.EmployeeID
inner join [Order Details] od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
inner join Categories cat on p.CategoryID = cat.CategoryID
where c.CustomerID = 'VINET'

-- alternatif inner join

select o.*, od.*, c.*
from Orders o, [Order Details] od, Customers c
where o.OrderID = od.OrderID and o.CustomerID = c.CustomerID

select * from Region
select * from Territories


-- Cross join

select r.*, t.*
from Region r cross join Territories t