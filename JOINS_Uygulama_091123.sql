

-- Sipariþlerimi oluþturan çalýþanlarý isimleri ve sipariþ id'Leri ile listeleyiniz.

select e.FirstName, o.OrderID 
from Orders o join Employees e on e.EmployeeID = o.EmployeeID

-- Ürünlerin adýný, kategori adýný, birim fiyatýný listeleyiniz..

select p.ProductName, cat.CategoryName, p.UnitPrice
from Products p join Categories cat on p.CategoryID = cat.CategoryID

-- 1998 yýlýnda Almanya'dan sipariþ veren müþterilerin isimlerini ve sipraiþ numaralarýný listeleyin

select c.ContactName, o.OrderID, year(o.OrderDate) 'Sipariþ Tarihi', o.ShipCountry
from Customers c join Orders o on c.CustomerID = o.CustomerID
where o.ShipCountry = 'Germany' and year(o.OrderDate) = 1998

-- ID'si ALFKI olan müþterimin toplam sipariþ tutarýný bulun.

select o.CustomerID, sum((od.UnitPrice * od.Quantity) * (1 - od.Discount)) Total
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
where c.CustomerID = 'ALFKI'
group by o.CustomerID

-- Tüm çalýþanlarýn adýný, soyadýný ve üstlerinin adýný seçin ve üstlerinin adýna göre sýraalyýn.

select e.FirstName, e.LastName, e1.FirstName, e1.Title
from Employees e join Employees e1 on e.ReportsTo = e1.EmployeeID
order by e.ReportsTo asc

-- En çok satýlan 5 ürün hangisidir ve kaç adet satýlmýþtýr?

select top 5 p.ProductName, sum(od.Quantity) Total
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName
order by Total desc

-- Stokta 50'den fazla olan kaç adet ürün var?

select count(p.ProductID)
from Products p
where p.UnitsInStock > 50

-- ID'si 7 olan ürüne ait tüm sipariþlerin toplam miktarýný listeleyin.

select sum(od.Quantity)
from Products p join [Order Details] od on p.ProductID = od.ProductID 
where p.ProductID = 7

-- Hangi sipariþ, hangi çalýþan tarafýndan alýnmýþ, hangi müþteriye gönderilmiþ listeleyiniz.

-- SipariþID, Sipariþ Tarihi, Müþteri Þirket Adý, Müþteri Þirket Yetkilisi, Personel (Unvan, Adý, Soyadý), Personel Görevi

select o.OrderID, o.OrderDate, c.CompanyName, c.ContactName, concat(e.TitleOfCourtesy, ' ', e.FirstName, ' ', e.LastName, ' ', e.Title) 
from Orders o join Employees e on o.EmployeeID = e.EmployeeID join Customers c on o.CustomerID = c.CustomerID

-- Hangi ülkede kaç müþteri var listeleyiniz.

select c.Country, count(c.CustomerID) 'Müþteri Sayýsý'
from Customers c
group by c.Country

-- 1997 yýlýnda satýlan ürünlerin listesini seçin ve satýþ tarihine göre sýralayýn [Ürün Adý ve Sipariþ Tarihi

select distinct p.ProductName, o.OrderDate 
from [Order Details] od join Products p on od.ProductID = p.ProductID join Orders o on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997
order by o.OrderDate desc

-- Hangi ülkede kaç çalýþan vardýr listeleyin. Liste, ülke ve çalýþan sayýsý kolonlarý içersin. Kiþi sayýsýna göre sýralayýn.

select e.Country 'Ülke', count(e.EmployeeID) 'Çalýþan Sayýsý'
from Employees e
group by e.Country

-- Þirket adý 'United Package' olan nakliyecinin, 'Cactus Comidas para llevar' müþterisine ait taþýdýðý sipariþleri listeleyiniz. 
-- Nakliyecinin adý, müþteri adý ve sipariþ tarihi

select s.CompanyName, c.CompanyName, o.OrderDate
from Orders o join Customers c on o.CustomerID = c.CustomerID join Shippers s on o.ShipVia = s.ShipperID
where c.CompanyName = 'Cactus Comidas para llevar' and s.CompanyName = 'United Package'

