--Find all orders made by customers from Germany, and display the OrderID, CustomerID, and OrderDate. Sort the results by OrderDate in descending order.

--select	o.OrderID, o.CustomerID, o.OrderDate
--from Orders o

--order by o.OrderDate desc

--Retrieve the details of products that are priced more than the average product price. Show the ProductName and UnitPrice. Order the results by UnitPrice in ascending order.

--select p.UnitPrice

--from Products p

--where p.UnitPrice > (select AVG(UnitPrice) from Products)

--order by p.UnitPrice asc

--List all the employees who have made more than 25 orders. Include the EmployeeID, LastName, and the total number of orders they have made. Sort by the total number of orders in descending order.

--select e.EmployeeID, e.LastName, (select count(OrderID) from Orders where EmployeeID = e.EmployeeID) as EmplopyeeOrders
--from Employees e
--where (select count(OrderID) from Orders where EmployeeID = e.EmployeeID) > 25 -- Can't use the alias for the subquerry in the where clause because where keyword is processed before the select clause.
--order by (select count(OrderID) from Orders where EmployeeID = e.EmployeeID) desc -- same for here. gotta use the subquerry itself.



--Display the CustomerID and the total number of orders made by each customer. Only include customers who have made more than 15 orders, and sort the result by the total number of orders in descending order.

--select c.CustomerID, (select count(OrderID) from Orders where CustomerID = c.CustomerID) as CustomerOrderCount
--from Customers c

--where (select count(OrderID) from Orders where CustomerID = c.CustomerID) > 15
--order by (select count(OrderID) from Orders where CustomerID = c.CustomerID) desc

--For each category, show the CategoryName and the average price of the products in that category. Only include categories with an average product price greater than $20.

--select c.CategoryName, (select avg(UnitPrice) from Products p where p.CategoryID = c.CategoryID) as AveragePrice
--from Categories c
--where (select avg(UnitPrice) from Products p where p.CategoryID = c.CategoryID) > 20

--Find the ProductName and QuantityPerUnit for all products that have been discontinued (Discontinued = 1) and have a stock level (UnitsInStock) below 10. Order the results by ProductName.

--select p.ProductName, p.QuantityPerUnit
--from Products p

--where Discontinued = 1 and UnitsInStock < 10
--order by p.ProductName

--Update the UnitPrice of all 'Beverage' category products by increasing their price by 10%. Do not execute the query, just write it.

--select * into Products1 from Products

--update Products1

----set UnitPrice = UnitPrice * (1 + 0.1)
--where CategoryID = (select c.CategoryID from Categories c where c.CategoryName = 'Beverages')

--select p.UnitPrice, p1.UnitPrice from Products1 p1, Products p

--where p.CategoryID = (select c.CategoryID from Categories c where c.CategoryName = 'Beverages') and p1.CategoryID = (select c.CategoryID from Categories c where c.CategoryName = 'Beverages')

--order by p.UnitPrice desc, p1.UnitPrice desc

--Insert a new order record for the customer with CustomerID 'VINET'. Assume necessary details for columns like Freight, ShipName, etc., are provided. Create the SQL statement for the insert.

--insert into Orders(CustomerID, Freight, ShipName, ShipCity)
--values('VINET', 31, 'TEST', 'TEST')

--select * from Orders
--where CustomerID = 'VINET'

--Select all products that have been ordered in the same order as any 'Confections' products. Display unique ProductName and OrderID. Hint: You'll need to use a subquery.

--select od.OrderID, (select p.ProductName from Products p where p.ProductID = od.ProductID) as ProductName
--from [Order Details] od
--where od.OrderID in (select od2.OrderID from [Order Details] od2 where od2.ProductID in (select p2.ProductID from Products p2 where p2.CategoryID = (select c.CategoryID from Categories c where c.CategoryName = 'Confections')))

--List the top 3 employees based on the number of orders they have processed, but restrict the results to employees who are from the Sales department (EmployeeID 1, 4, or 7). Display the EmployeeID, LastName, and the total number of orders.

select top 3 e.EmployeeID, e.LastName, (select count(o.OrderID) from Orders o where o.EmployeeID = e.EmployeeID) as TotalNumberOfOrders, E.Title
from Employees e
where e.Title like '%SALES%'
order by TotalNumberOfOrders desc


