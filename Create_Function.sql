-- User defined functions -- Function ve procedure farký : Function mutlaka bir deðer dönerken, procedure bi rdeðer dönmek zorunda deðildir.

-- Scaler, table valued

-- 1 - Scaler Functions

create function dbo.fn_Toplam(@Sayi1 int, @Sayi2 int)
returns int
as 
begin
	Declare @Toplam int
	set @Toplam = @Sayi1 + @Sayi2
	return @Toplam
end

select dbo.fn_Toplam(4,7)

create function dbo.fn_Faktoriyel(@Sayi1 int)
returns int
as
begin
	Declare @i int = 1
	while @Sayi1 > 1
	begin
		set @i = @Sayi1 * @i
		set @Sayi1 = @Sayi1 - 1
	end
	return @i
end

select [dbo].[fn_Faktoriyel](5)


create function dbo.fn_RecursiveFaktoriyel(@Sayi int)
returns int
as
begin
	declare @sonuc int
	if @Sayi <= 1
		set @sonuc = 1
	else
		set @sonuc = @sayi * dbo.fn_RecursiveFaktoriyel(@sayi - 1)
	return @sonuc
end

select [dbo].[fn_RecursiveFaktoriyel](5)


-- Table Valued Function
-- Inline

create function dbo.fn_GetOrderByCustomerID
(
	@CustomerId varchar(5)
)

returns Table
as
return select * from Orders
where case when @CustomerId = '0' then @CustomerID else CustomerID end 
= @CustomerId

SELECT * FROM dbo.fn_GetOrderByCustomerID ('ALFKI')
SELECT * FROM dbo.fn_GetOrderByCustomerID ('0')
order by CustomerID

create function dbo.EmployeeTotal(@EmployeeID int)
returns Table
as
return
Select e.FirstName + ' ' + e.LastName EmployeeName, sum(od.Quantity * od.UnitPrice * (1 - od.Discount)) Total
from Orders o inner join [Order Details] od on o.OrderID = od.OrderID
inner join Employees e on o.EmployeeID = e.EmployeeID
where e.EmployeeID = @EmployeeID
group by o.EmployeeID, e.FirstName, e.LastName

select * from dbo.EmployeeTotal(5)

-- Multi Statement

create function dbo.fn_GetCustomerOrders
(
	@CustomerID varchar(5)
)
returns @CustomerOrders Table
(
	OrderID int,
	OrderDate datetime,
	EmployeeName varchar(100)
)
Begin
	Insert into @CustomerOrders
	select o.OrderID, o.OrderDate, e.FirstName + ' ' + e.LastName
	from Orders o inner join Employees e on o.EmployeeID = e.EmployeeID
	where o.CustomerID = @CustomerID

	if @@ROWCOUNT = 0
	begin
		insert into @CustomerOrders values (0,null,'N/A')
	end
	return
end

select * from fn_GetCustomerOrders('ALFKI')
select * from fn_GetCustomerOrders('HHHH')
