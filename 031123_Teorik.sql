--select p.ProductName, p.UnitsInStock, p.UnitPrice

--from Products p

--where p.UnitPrice > 50 and p.UnitsInStock < 40

--select * from Orders

--select * from Employees

--select * from Shippers

--select OrderID [Sipari�Kodu], EmployeeID [�al��anKodu], ShipVia [Kargo�irketiKodu]

--from Orders 

--where EmployeeID = 3 and ShipVia = 3 and ShipCity = 'London'

--select OrderID [Sipari�Kodu], EmployeeID [�al��anKodu], ShipVia [Kargo�irketiKodu], ShipCountry [G�nderilen�lke]

--from orders

--where EmployeeID = 5 and (ShipCountry = 'Brazil' or ShipCountry = 'Germany')

--select * from Employees

--select FirstName, LastName, City

--from Employees

--where City = 'Seattle' or City = 'London'

--select TitleOfCourtesy, FirstName, LastName

--from Employees

--where TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Miss'

--select TitleOfCourtesy, FirstName, LastName

--from Employees

--where TitleOfCourtesy in ('Ms.', 'Mrs.', 'Miss')

--select TitleOfCourtesy, FirstName, LastName

--from Employees

--where TitleOfCourtesy not in ('Mr.', 'Dr.')

--select top 100 * from Orders

--where ShipVia = 2

--select top 20 percent * from Orders
--where ShipVia = 2

-- Like komutu

--select * from Employees

--select FirstName, LastName, Title
--from Employees
--where FirstName like 'A%' -- �smi 'A' ile ba�layan

--select FirstName, LastName, Title

--from Employees

--where LastName like '%N' -- Soyismi 'N' ile biten

--select FirstName, LastName, Title
--from Employees
--where CONCAT(FirstName, ' ', LastName) like '%A%' -- �sim ve soyisim i�erisinde 'A' i�eren

--select FirstName, LastName, Title

--from Employees

--where FirstName like '[AR]%' -- �smi 'A' veya 'R' ile ba�layan

--select FirstName, LastName, Title

--from Employees

--where CONCAT(FirstName, ' ', LastName) like '%[AH]%' -- The %[AH]% pattern would search for names or surnames that have the exact sequence of characters "[AH]" within them

--select FirstName, LastName, Title

--from Employees

--where FirstName like '[B-S]%' -- �smi, 'B' ve 'S' harfleri dahil o aral�ktaki harflerle ba�layanlar

--select FirstName, LastName, Title

--from Employees

--where FirstName like '[^B-S]%'  -- �smi, 'B' ve 'S' harf aral���nda, o harfler dahil, harflerle ba�lamayan isimler.

--select FirstName, LastName, Title

--from Employees

--where FirstName like '%A__E%' -- �sminde 'A' ve 'E' harfleri i�eren ve o harfler aras�nda 2 karakter i�eren �al��anlar.

--select * from Employees

--where EmployeeID between 2 and 8

--order by FirstName desc

--select FirstName, LastName, BirthDate from Employees
--order by BirthDate

--select FirstName, LastName, BirthDate from Employees
--order by LastName desc

--select FirstName Ad, LastName Soyad  from Employees

---- Order by LastName desc
---- Order by Soyad desc

--order by 2 desc -- 3 versiyonda ayn� i�i yap�yor.

select * from Customers
select CustomerID, CompanyName, Country, City
from Customers
order by Country, City desc -- Country'e g�re artan, city'e g�re azalan.

/*
	Order by, where clause'undan sonra gelir.
*/

