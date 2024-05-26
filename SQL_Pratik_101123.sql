use Northwind


--1- T�m m��terileri listeleyiniz.

select * from Customers


--2- T�m m��terilerin sadece MusteriAdi ve MusteriUnvanini listeleyiniz.

select ContactName, ContactTitle
from Customers

--3- Birim fiyat� 18 ve �zeri olan �r�nleri listeleyiniz.

select *
from Products
where UnitPrice > 18

--4- Sehir bilgisi �London� olan t�m personelleri listeleyiniz.

select *
from Employees
where City = 'London'

--5- Sehir bilgisi �London� olmayan t�m personellerin ad� ve soyad�n� listeleyiniz.

select *
from Employees
where City != 'London'

--6- KategoriID�si 3 olan ve birim fiyat� 10 dan k���k olan t�m �r�nleri listeleyiniz

select *
from Products p
where p.CategoryID = 3 and p.UnitPrice < 10

--7- Sehir bilgisi �London� veya �Seattle� olan t�m personelleri listeleyiniz.

select *
from Employees e
where e.City = 'London' or e.City = 'Seattle'

--8- 3,5 veya 7 nolu kategorideki t�m �r�nleri listeleyiniz.

select *
from Products p
where p.CategoryID = 3 or p.CategoryID = 5 or p.CategoryID = 7

--9- 6 ve 9 nolu kategorideki �r�nler d���ndaki t�m �r�nleri listeleyiniz.

select *
from Products p
where p.CategoryID != 6 or p.CategoryID != 9

--10- Birim fiyat� 10 ve 20 aras�ndaki t�m �r�nleri listeleyiniz.

select *
from Products p
where p.UnitPrice > 10 and p.UnitPrice < 20

--11- 1996-07-16 ile 1996-07-30 aras�nda sevk edilen sat��lar� listeleyiniz.

select *
from Orders o
where o.ShippedDate > '1996-07-16' and o.ShippedDate < '1996-07-30'

--12- B�lgesi tan�ml� olmayan t�m m��terileri listeleyiniz.

select *
from Customers c
where c.Region is null

--13- Faks numaras� olan t�m m��terileri listeleyiniz.

select *
from Customers c
where c.Fax is not null

--14- Manager �nvan�na sahip t�m m��terileri listeleyiniz.

select *
from Customers
where ContactTitle like '%Manager%'

--15- FR ile ba�layan 5 karekter olan t�m m��terileri listeleyiniz.

select *
from Customers c
where c.CustomerID like 'FR%' AND LEN(c.CustomerID) = 5 

--16- (171) alan kodlu telefon numaras�na sahip m��terileri listeleyiniz.

select *
from Customers c
where c.Phone like '(171)%'

--17- BirimdekiMiktar alan�nda boxes ge�en t�m �r�nleri listeleyiniz.

select *
from Products p
where p.QuantityPerUnit like '%boxes%'

--18- Fransa ve Almanyadaki (France,Germany) M�d�rlerin (Manager) Ad�n� ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)

select c.ContactName, c.Phone
from Customers c
where c.Country = 'France' or c.Country = 'Germany' and c.ContactTitle like '%Manager%'

--19- Birim fiyat� 10 un alt�nda olan �r�nlerin kategoriID lerini tekil bir �ekilde listeleyiniz.

select p.CategoryID
from Products p
where p.UnitPrice < 10

--20- En d���k birim fiyata sahip 5 �r�n� listeleyiniz.

select top 5 *
from Products p
order by p.UnitPrice asc

--21- En y�ksek birim fiyata sahip 10 �r�n� listeleyiniz.

select top 10 *
from Products p
order by p.UnitPrice desc

--22- M��terileri �lke ve �ehir bilgisine g�re s�ralay�p listeleyiniz.

select *
from Customers c
order by c.Country, c.City


--23- Personellerin ad,soyad ve ya� bilgilerini listeleyiniz.(DATEDIFF,GETDATE())

select e.FirstName, e.LastName, datediff(year, e.BirthDate, GETDATE()) Age
from Employees e

--24- 35 g�n i�inde sevk edilmeyen sat��lar� listeleyiniz.

select DATEDIFF(day, o.OrderDate, o.ShippedDate) as DaysTook, *
from Orders o
where  DATEDIFF(day, o.OrderDate, o.ShippedDate) > 35 -- Can't refer to an alias under the select clause.


--25- Birim fiyat� en y�ksek olan �r�n�n kategori ad�n� listeleyiniz. (Alt Sorgu)

select top 1 (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) 'Category Name'
from Products p
order by p.UnitPrice desc

--26- Kategori ad�nda 'on' ge�en kategorilerin �r�nlerini listeleyiniz. (Alt Sorgu)

select *, (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) CategoryName
from Products p
where (select c.CategoryName from Categories c where c.CategoryID = p.CategoryID) like '%on%'


--27- Nancy adl� personelin Brezilyaya sevk etti�i sat��lar� listeleyiniz (Alt Sorgu)

select *, (select e.FirstName from Employees e where e.EmployeeID = o.EmployeeID) EmployeeName
from Orders o
where (select e.FirstName from Employees e where e.EmployeeID = o.EmployeeID) = 'Nancy' and o.ShipCountry = 'Brazil'

--28- 1996 y�l�nda yap�lan sipari�lerin listesi

select *
from Orders o
where year(o.OrderDate) = 1996

--29- Japonyadan ka� farkl� �r�n tedarik edilmektedir.

select count(p.ProductID) 'Japonyadan Tedarik Edilen �r�n �e�idi Say�s�'
from Products p inner join Suppliers s on p.SupplierID = s.SupplierID
where s.Country = 'Japan'

--30- Konbu adl� �r�nden ka� adet sat�lm��t�r.

select count(od.ProductID) 'Tedarik Edilen �r�n Say�s�'
from Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on p.ProductID = od.ProductID
where p.ProductName = 'Konbu'

--31- 1997 y�l�nda yap�lm�� sat��lar�n en y�ksek, en d���k ve ortalama nakliye �cretlisi ne kadard�r?

select max(o.Freight) 'Maksimum Nakliye �creti', min(o.Freight) 'Minimum Nakliye �creti', avg(o.Freight) 'Ortalama Nakliye �creti'
from Orders o

--32- T�m �r�nleri listeleyiniz. Tablolar� basit birle�tirme ba�lay�n�z. (urunAdi,kategoriAdi)

select p.ProductName, c.CategoryName
from Products p inner join Categories c on p.CategoryID = c.CategoryID

--33- T�m �r�nleri listeleyiniz. Tablolar� join metodu ba�lay�n�z. (urunAdi,kategoriAdi,Tedarik�i �irket ad�)

select p.ProductName, c.CategoryName, s.CompanyName
from Products p inner join Categories c on p.CategoryID = c.CategoryID inner join Suppliers s on p.SupplierID = s.SupplierID


--34- 10248 ID li sat���n �r�nlerini listeleyiniz. (UrunAdi,Toplam fiyat�)

select p.ProductName, od.UnitPrice * od.Quantity * (1 - od.Discount) TotalPrice
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
where od.OrderID = 10248

--35- En pahal� ve En ucuz �r�n� listeleyiniz.

select max(p.UnitPrice) MostExpensive, min(p.UnitPrice) LeastExpensive
from Products p

--36- Personelleri ve ba�l� �al��t��� ki�ileri listeleyiniz. (Ad,Tur(Patron,Personel,M��teri))

select concat(e.FirstName, ' ', e.LastName, ' ', e.Title) Personel, concat(e1.FirstName, ' ', e1.LastName, ' ', e1.Title) BagliOlduguKisi
from Employees e join Employees e1 on e.ReportsTo = e1.EmployeeID

--37- Her bir kategoride ka� adet �r�n var listeleyiniz.

select c.CategoryName, count(p.ProductID) UrunAdedi
from Products p join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName

--38- Nancy adl� personelin �lkelere g�re ka� adet sat�� sevk etti�ini listeleyiniz. (Sevk �lkesi,Adet)

select o.ShipCountry, count(o.OrderID) 'Sat��lar'
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where e.FirstName = 'Nancy'
group by o.ShipCountry

--39- T�m �r�nlerin ka� adet sat�ld���n� listeleyiniz. (�r�n ad�, Adet)

select p.ProductName, count(od.ProductID) SoldAmount
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
group by p.ProductName