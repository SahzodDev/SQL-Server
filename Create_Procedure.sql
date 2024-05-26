create procedure dbo.SP_Category_ProductCount
-- Parametre listesi
as
select c.CategoryName, sum(od.Quantity) [TotalProduct]
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
group by CategoryName

execute dbo.SP_Category_ProductCount -- Procedure, arka planda bir execution planý oluþturduðu için %70'e varan verimlilik saðlar.

alter procedure dbo.SP_Category_ProductCount
-- Parametre listesi
as
select c.CategoryName, sum(od.Quantity) [TotalProduct]
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
group by CategoryName
order by TotalProduct desc

create procedure dbo.SP_ProductCountWithParameter
@Count int
as 
select c.CategoryName, sum(od.Quantity) [TotalProduct]
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
group by CategoryName
having sum(od.Quantity) > @Count

execute dbo.SP_ProductCountWithParameter 
@Count = 7000


create procedure dbo.SP_Category_ProductCount_2
@Count int,
@CategoryName varchar(100)
as
select c.CategoryName, sum(od.Quantity) [TotalProduct]
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
where c.CategoryName = @CategoryName
group by CategoryName
having sum(od.Quantity) > @Count

execute dbo.SP_Category_ProductCount_2 7000, 'Confections'

create procedure dbo.SP_Category_ProductCount_3
@Count int = 5000, -- default parametre deðeri
@CategoryName varchar(100)
as
select c.CategoryName, sum(od.Quantity) [TotalProduct]
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
where c.CategoryName = @CategoryName
group by CategoryName
having sum(od.Quantity) > @Count

execute dbo.SP_Category_ProductCount_3 -- Parametre göndermediðim için default parametre deðeri çalýþýyor.
@CategoryName = 'Confections'

execute dbo.SP_Category_ProductCount_3 -- Parametre gönderdiðimde default deðeri yerine verdiðim parametre deðerini alýyor.
8000,
'Confections'

create Procedure dbo.SP_EmployeeInfo
@EmployeeID int,
@EmployeeName varchar(100) output
as
declare @FirstName varchar(50)
declare @LastName varchar(50)
select @FirstName = e.FirstName, @LastName = e.LastName
from Employees e
where e.EmployeeID = @EmployeeID
set @EmployeeName = @FirstName + ' ' + @LastName

declare @FullName varchar(100)
execute dbo.SP_EmployeeInfo 7, @FullName output
print @FullName

create procedure dbo.SP_ProductInfo
@ProductID int = 0
as
if @ProductID <> 0
begin
	select * from Products where ProductID = @ProductID
end
else
begin
	select * from Products
end

execute dbo.SP_ProductInfo 7

create procedure dbo.SP_ProductInfo2
@ProductID int = 0 -- Parametre vermezsem parametre 0 oluyor ve case when yapýsý sayesidne tüm kayýtlar geliyor. Eðer parametre verirsem verdiðim parametre deðerine sahip ProductID'nin bilgileri geliyor.
as
select * from Products
where case when @ProductID = 0 then @ProductID else ProductID end
=@ProductID

execute dbo.SP_ProductInfo2 6


