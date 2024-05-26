use Northwind


--1- Tüm müþterileri listeleyiniz.

select * from Customers


--2- Tüm müþterilerin sadece MusteriAdi ve MusteriUnvanini listeleyiniz.

select ContactName, ContactTitle
from Customers

--3- Birim fiyatý 18 ve üzeri olan ürünleri listeleyiniz.

select *
from Products
where UnitPrice > 18

--4- Sehir bilgisi ‘London’ olan tüm personelleri listeleyiniz.

select *
from Employees
where City = 'London'

--5- Sehir bilgisi ‘London’ olmayan tüm personellerin adý ve soyadýný listeleyiniz.

select *
from Employees
where City != 'London'

--6- KategoriID’si 3 olan ve birim fiyatý 10 dan küçük olan tüm ürünleri listeleyiniz

select *
from Products p
where p.CategoryID = 3 and p.UnitPrice < 10

--7- Sehir bilgisi ‘London’ veya ‘Seattle’ olan tüm personelleri listeleyiniz.

select *
from Employees e
where e.City = 'London' or e.City = 'Seattle'

--8- 3,5 veya 7 nolu kategorideki tüm ürünleri listeleyiniz.

select *
from Products p
where p.CategoryID = 3 or p.CategoryID = 5 or p.CategoryID = 7

--9- 6 ve 9 nolu kategorideki ürünler dýþýndaki tüm ürünleri listeleyiniz.

select *
from Products p
where p.CategoryID != 6 or p.CategoryID != 9

--10- Birim fiyatý 10 ve 20 arasýndaki tüm ürünleri listeleyiniz.

select *
from Products p
where p.UnitPrice > 10 and p.UnitPrice < 20

--11- 1996-07-16 ile 1996-07-30 arasýnda sevk edilen satýþlarý listeleyiniz.

select *
from Orders o
where o.ShippedDate > '1996-07-16' and o.ShippedDate < '1996-07-30'

--12- Bölgesi tanýmlý olmayan tüm müþterileri listeleyiniz.

select *
from Customers c
where c.Region is null

--13- Faks numarasý olan tüm müþterileri listeleyiniz.

select *
from Customers c
where c.Fax is not null

--14- Manager ünvanýna sahip tüm müþterileri listeleyiniz.

select *
from Customers
where ContactTitle like '%Manager%'

--15- FR ile baþlayan 5 karekter olan tüm müþterileri listeleyiniz.

select *
from Customers c
where c.CustomerID like 'FR%' AND LEN(c.CustomerID) = 5 

--16- (171) alan kodlu telefon numarasýna sahip müþterileri listeleyiniz.

select *
from Customers c
where c.Phone like '(171)%'

--17- BirimdekiMiktar alanýnda boxes geçen tüm ürünleri listeleyiniz.

select *
from Products p
where p.QuantityPerUnit like '%boxes%'

--18- Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adýný ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)

select c.ContactName, c.Phone
from Customers c
where c.Country = 'France' or c.Country = 'Germany' and c.ContactTitle like '%Manager%'

--19- Birim fiyatý 10 un altýnda olan ürünlerin kategoriID lerini tekil bir þekilde listeleyiniz.

select p.CategoryID
from Products p
where p.UnitPrice < 10

--20- En düþük birim fiyata sahip 5 ürünü listeleyiniz.

select top 5 *
from Products p
order by p.UnitPrice asc

--21- En yüksek birim fiyata sahip 10 ürünü listeleyiniz.

select top 10 *
from Products p
order by p.UnitPrice desc

--22- Müþterileri ülke ve þehir bilgisine göre sýralayýp listeleyiniz.

select *
from Customers c
order by c.Country, c.City


--23- Personellerin ad,soyad ve yaþ bilgilerini listeleyiniz.(DATEDIFF,GETDATE())

select e.FirstName, e.LastName, datediff(year, e.BirthDate, GETDATE()) Age
from Employees e

--24- 35 gün içinde sevk edilmeyen satýþlarý listeleyiniz.

select DATEDIFF(day, o.OrderDate, o.ShippedDate) as DaysTook, *
from Orders o
where  DATEDIFF(day, o.OrderDate, o.ShippedDate) > 35 -- Can't refer to an alias under the select clause.


--25- Birim fiyatý en yüksek olan ürünün kategori adýný listeleyiniz. (Alt Sorgu)

select top 1 (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) 'Category Name'
from Products p
order by p.UnitPrice desc

--26- Kategori adýnda 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)

select *, (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) CategoryName
from Products p
where (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) like '%on%'


--27- Nancy adlý personelin Brezilyaya sevk ettiði satýþlarý listeleyiniz (Alt Sorgu)

select *, (select e.FirstName from Employees e where e.EmployeeID = o.EmployeeID) EmployeeName
from Orders o
where (select e.FirstName from Employees e where e.EmployeeID = o.EmployeeID) = 'Nancy' and o.ShipCountry = 'Brazil'

--28- 1996 yýlýnda yapýlan sipariþlerin listesi

select *
from Orders o
where year(o.OrderDate) = 1996

--29- Japonyadan kaç farklý ürün tedarik edilmektedir.

select count(p.ProductID) 'Japonyadan Tedarik Edilen Ürün Çeþidi Sayýsý'
from Products p inner join Suppliers s on p.SupplierID = s.SupplierID
where s.Country = 'Japan'

--30- Konbu adlý üründen kaç adet satýlmýþtýr.

select count(od.ProductID) 'Tedarik Edilen Ürün Sayýsý'
from Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on p.ProductID = od.ProductID
where p.ProductName = 'Konbu'

--31- 1997 yýlýnda yapýlmýþ satýþlarýn en yüksek, en düþük ve ortalama nakliye ücretlisi ne kadardýr?

select max(o.Freight) 'Maksimum Nakliye Ücreti', min(o.Freight) 'Minimum Nakliye Ücreti', avg(o.Freight) 'Ortalama Nakliye Ücreti'
from Orders o

--32- Tüm ürünleri listeleyiniz. Tablolarý basit birleþtirme baðlayýnýz. (urunAdi,kategoriAdi)

select p.ProductName, c.CategoryName
from Products p inner join Categories c on p.CategoryID = c.CategoryID

--33- Tüm ürünleri listeleyiniz. Tablolarý join metodu baðlayýnýz. (urunAdi,kategoriAdi,Tedarikçi þirket adý)

select p.ProductName, c.CategoryName, s.CompanyName
from Products p inner join Categories c on p.CategoryID = c.CategoryID inner join Suppliers s on p.SupplierID = s.SupplierID


--34- 10248 ID li satýþýn ürünlerini listeleyiniz. (UrunAdi,Toplam fiyatý)

select p.ProductName, od.UnitPrice * od.Quantity * (1 - od.Discount) TotalPrice
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
where od.OrderID = 10248

--35- En pahalý ve En ucuz ürünü listeleyiniz.

select max(p.UnitPrice) MostExpensive, min(p.UnitPrice) LeastExpensive
from Products p

--36- Personelleri ve baðlý çalýþtýðý kiþileri listeleyiniz. (Ad,Tur(Patron,Personel,Müþteri))

select concat(e.FirstName, ' ', e.LastName, ' ', e.Title) Personel, concat(e1.FirstName, ' ', e1.LastName, ' ', e1.Title) BagliOlduguKisi
from Employees e join Employees e1 on e.ReportsTo = e1.EmployeeID

--37- Her bir kategoride kaç adet ürün var listeleyiniz.

select c.CategoryName, count(p.ProductID) UrunAdedi
from Products p join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName

--38- Nancy adlý personelin ülkelere göre kaç adet satýþ sevk ettiðini listeleyiniz. (Sevk Ülkesi,Adet)

select o.ShipCountry, count(o.OrderID) 'Satýþlar'
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where e.FirstName = 'Nancy'
group by o.ShipCountry

--39- Tüm ürünlerin kaç adet satýldýðýný listeleyiniz. (Ürün adý, Adet)

select p.ProductName, count(od.ProductID) SoldAmount
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
group by p.ProductName