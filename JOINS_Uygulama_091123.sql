

-- Sipari�lerimi olu�turan �al��anlar� isimleri ve sipari� id'Leri ile listeleyiniz.

select e.FirstName, o.OrderID 
from Orders o join Employees e on e.EmployeeID = o.EmployeeID

-- �r�nlerin ad�n�, kategori ad�n�, birim fiyat�n� listeleyiniz..

select p.ProductName, cat.CategoryName, p.UnitPrice
from Products p join Categories cat on p.CategoryID = cat.CategoryID

-- 1998 y�l�nda Almanya'dan sipari� veren m��terilerin isimlerini ve siprai� numaralar�n� listeleyin

select c.ContactName, o.OrderID, year(o.OrderDate) 'Sipari� Tarihi', o.ShipCountry
from Customers c join Orders o on c.CustomerID = o.CustomerID
where o.ShipCountry = 'Germany' and year(o.OrderDate) = 1998

-- ID'si ALFKI olan m��terimin toplam sipari� tutar�n� bulun.

select o.CustomerID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) Total
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
where c.CustomerID = 'ALFKI'
group by o.CustomerID

-- T�m �al��anlar�n ad�n�, soyad�n� ve �stlerinin ad�n� se�in ve �stlerinin ad�na g�re s�raaly�n.

select e.FirstName, e.LastName, e1.FirstName, e1.Title
from Employees e join Employees e1 on e.ReportsTo = e1.EmployeeID
order by e.ReportsTo asc

-- En �ok sat�lan 5 �r�n hangisidir ve ka� adet sat�lm��t�r?

select top 5 p.ProductName, sum(od.Quantity) Total
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName
order by Total desc

-- Stokta 50'den fazla olan ka� adet �r�n var?

select count(p.ProductID)
from Products p
where p.UnitsInStock > 50

-- ID'si 7 olan �r�ne ait t�m sipari�lerin toplam miktar�n� listeleyin.

select sum(od.Quantity)
from Products p join [Order Details] od on p.ProductID = od.ProductID 
where p.ProductID = 7

-- Hangi sipari�, hangi �al��an taraf�ndan al�nm��, hangi m��teriye g�nderilmi� listeleyiniz.

-- Sipari�ID, Sipari� Tarihi, M��teri �irket Ad�, M��teri �irket Yetkilisi, Personel (Unvan, Ad�, Soyad�), Personel G�revi

select o.OrderID, o.OrderDate, c.CompanyName, c.ContactName, concat(e.TitleOfCourtesy, ' ', e.FirstName, ' ', e.LastName, ' ', e.Title) 
from Orders o join Employees e on o.EmployeeID = e.EmployeeID join Customers c on o.CustomerID = c.CustomerID

-- Hangi �lkede ka� m��teri var listeleyiniz.

select c.Country, count(c.CustomerID) 'M��teri Say�s�'
from Customers c
group by c.Country

-- 1997 y�l�nda sat�lan �r�nlerin listesini se�in ve sat�� tarihine g�re s�ralay�n [�r�n Ad� ve Sipari� Tarihi

select distinct p.ProductName, o.OrderDate 
from [Order Details] od join Products p on od.ProductID = p.ProductID join Orders o on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997
order by o.OrderDate desc

-- Hangi �lkede ka� �al��an vard�r listeleyin. Liste, �lke ve �al��an say�s� kolonlar� i�ersin. Ki�i say�s�na g�re s�ralay�n.

select e.Country '�lke', count(e.EmployeeID) '�al��an Say�s�'
from Employees e
group by e.Country

-- �irket ad� 'United Package' olan nakliyecinin, 'Cactus Comidas para llevar' m��terisine ait ta��d��� sipari�leri listeleyiniz. 
-- Nakliyecinin ad�, m��teri ad� ve sipari� tarihi

select s.CompanyName, c.CompanyName, o.OrderDate
from Orders o join Customers c on o.CustomerID = c.CustomerID join Shippers s on o.ShipVia = s.ShipperID
where c.CompanyName = 'Cactus Comidas para llevar' and s.CompanyName = 'United Package'

