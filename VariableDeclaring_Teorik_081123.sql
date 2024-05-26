

-- select 4 + 5 Toplam

-- Deðiþken Tanýmlama ve deðiþkene deðer atama
/*
Declare @sonuc as int
set @sonuc = 4 + 5

print @sonuc
*/

use Northwind

go

/*
Declare @Name as varchar(50)
set @Name =  
(
select top 1 FirstName + ' ' + LastName from Employees
where HireDate is not null
order by HireDate asc
)

SELECT @Name EnEskiCalisan
*/

--Declare @Age as int
--set @Age =
--(

--	select top 1 YEAR(GETDATE()) - YEAR(BirthDate) from Employees
--	where BirthDate is not null
--	order by BirthDate asc
	
--)

--if @Age < 70
--begin
--	print 'Yaþ deðeri 70 den küçüktür.'
--end
--else 
--begin
--	print 'Yaþ deðeri 70 e eþit veya büyüktür.'
--end

/*
Declare @Ad varchar(100)
Declare @Soyad varchar(100)
Declare @DogumTarihi DateTime

Select @Ad = FirstName, @Soyad = LastName, @DogumTarihi = BirthDate
From Employees
where EmployeeID = 1

print @Ad
print @Soyad
print @DogumTarihi
*/

/*
select * from Employees
Select  FirstName, LastName, Title, Country,
case Country
when 'USA' then 'Amerika'
when 'UK' then 'Birleþik Krallýk'
else 'Ülke Belirtilmedi'
end CountryDesc

from Employees
*/

--select * from Products

--select ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, 
--case 
--when (UnitsInStock - UnitsOnOrder) > ReorderLevel then 'Stokta mevcut'
--else 'Stokta Yok'
--end StockState
--from Products

--Select ProductID, ProductName, CategoryID,
--case CategoryID
--when 1 then 'Beverages'
--when 2 then 'Condiments'
--when 3 then 'Confections'
--when 4 then 'Dairy Products'
--when 5 then 'Grains/Cereals'
--when 6 then 'Meat/Poultry'
--when 7 then 'Produce'
--when 8 then 'Seafood'
--when 9 then 'Meyveler'
--when 10 then 'Sebzeler'
--end
--from Products

--Declare @sayi1 int = 1
--Declare @sayi2 int = 100
--declare @toplam int = 0
--while(@sayi1 <= @sayi2)
--begin
--	set @toplam = @toplam + @sayi1
--	set @sayi1 = @sayi1 + 1
--end

--print @toplam

--Declare @sayi1 int = 1
--Declare @sayi2 int = 100
--declare @toplam int = 0
--while()
--begin
--	begin
--		if(@sayi1 % 2 = 0)
--	set @toplam = @toplam + @sayi1
--end
--set @sayi1 = @sayi1 + 1

--print @toplam

--select ABS(-5) MutlakDeger

/*
select concat(FirstName, ' ', LastName) EmployeeName,
BirthDate,
Year(BirthDate) BirthYear, Month(BirthDate) BirthMonth, Day(BirthDate) BirthDay
from Employees
*/

/*
select concat(FirstName, ' ', LastName) EmployeeName,
BirthDate,
Datepart(Year, BirthDate) BirthYear, 
DATEPART(month, BirthDate) BirthMonth, 
Datepart(day, BirthDate) BirthDay
from Employees
*/

/*
Select Concat(FirstName, ' ', LastName) EmployeeName,
DATEDIFF(Year, BirthDate, GETDATE()) Age
from Employees
*/

--select Concat(FirstName, ' ', LastName) EmployeeName,
--Datediff(day, HireDate, GetDate()) WorkDays
--from Employees

/*
select Dateadd(day, 2, getdate())
select dateadd(month, 2, getdate())
select dateadd(year, 2, getdate())
select dateadd(hour, 2, getdate())
*/

--select ascii('a') ASCIIKODU
--select ascii('A') ASCIIKODU

/*
select char(65) Karakter
select char(97) Karakter
select char(39) Karakter
*/

--select charindex('h', 'John Doe') [CharIndex]

--select left('John Doe', 4) LeftPart
--select right('John Doe', 3) RightPart

--select len('John Doe') KarakterSayisi

--select ltrim('           John Doe')
--select rtrim('John Doe         ')
--select trim('    John Doe     ')

--select Lower('JOHN DOE')
--select UPPER('john doe')

--select * from Employees

/*
select count(*) ToplamKayit from Employees
select count(Region) ToplamKayit from Employees -- Null'dan farklý deðerlerin sayýsýný getiriyor.

select Count(City) from Employees -- Tekrar eden kayýtlarý da sayýyor.

select count(distinct City) from Employees -- Tekrar etmeyen kayýtlarý sayýyor 'distinct' keyword'ü sayesinde
*/

select SUM(EmployeeID) from Employees

select sum(Datediff(year, BirthDate, GetDate())) Total from Employees

select sum(Datediff(year, BirthDate, GetDate()))/count(*) Ortalama from Employees
where BirthDate is not null

select avg(Datediff(year, BirthDate, GetDate())) Average
from Employees

select MIN(EmployeeID) EnKucukID 
from Employees

select MAX(EmployeeID)
FROM Employees

select * from Products
select MIN(UnitPrice)
from Products
select MAX(UnitPrice)
from Products

DBCC CHECKIDENT('Employees')



insert into Employees(FirstName, LastName)
values('Sample', 'Employee')

select @@IDENTITY
select SCOPE_IDENTITY()
select IDENT_CURRENT('Employees')

insert into Employees(FirstName, LastName)
values('Test', 'Employee')

delete Employees where EmployeeID > 9

insert into Employees(FirstName, LastName)
values('Test2', 'Employee')

select * from Employees 

dbcc checkident('Employees', reseed, 9)