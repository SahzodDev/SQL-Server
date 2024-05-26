use kutuphane
go


--1.��renci tablosundaki t�m kay�tlar� listeleyin. 

select * from ogrenci

--2.��renci tablosundaki ��rencinin ad�n� ve soyad�n� ve s�n�f�n� listeleyin. 

select og.ograd, og.ogrsoyad, og.cinsiyet, og.sinif from ogrenci og

--3. ��renci tablosundaki cinsiyeti k�z (K) olan kay�tlar� listeleyiniz. 

select * from ogrenci og where og.cinsiyet = 'K'

--4.��renciler tablosundaki s�n�flar�n ad�n� her s�n�f bir kez g�r�lecek �ekilde listeleyiniz. 

select distinct o.sinif from ogrenci o

--5.��renci tablosundaki cinsiyeti K�z ve S�n�f� 10A olan ��rencileri listeleyiniz. 

select o.* from ogrenci o where o.cinsiyet = 'K' and o.sinif = '10A'

--6.��renci tablosundaki 10A veya 10B s�n�f�ndaki ��rencilerin ad�n�, soyad�n� ve s�n�f�n� listeleyiniz. 

select o.ograd, o.ogrsoyad, o.sinif from ogrenci o where o.sinif = '10A' or o.sinif = '10B'

--7.��renci tablosundaki ��rencinin ad�n�, soyad�n� ve numaras�n� okul numaras� olarak listeleyiniz. (as kullan�m �rne�i) 

select o.ograd, o.ogrsoyad, o.ogrno as 'Okul Numaras�' from ogrenci o

--8. ��renci tablosundaki ��rencinin ad�n� ve soyad�n� birle�tirip, adsoyad olarak listeleyiniz. (as kullan�m �rne�i) 

select concat(o.ograd, o.ogrsoyad) as adsoyad from ogrenci o

--9. ��renci tablosundaki Ad� �A� harfi ile ba�layan ��rencileri listeleyiniz.

select o.* from ogrenci o where o.ograd like 'A%'

--10.kitap tablosundaki sayfa say�s� 50 ile 200 aras�nda olan kitaplar�n ad�n� ve sayfa say�s�n� listeleyiniz. 

select k.kitapadi, k.sayfasayisi from kitap k where k.sayfasayisi > 50 and k.sayfasayisi < 200

--11. ��renci tablosunda ad� Fidan, �smail ve Leyla olan ��rencileri listeleyiniz. 

select o.* from ogrenci o where o.ograd = 'Fidan' or o.ograd = '�smail' or o.ograd = 'Leyla'

--12. ��renci tablosundaki ��rencilerden ad� A, D ve K ile ba�layan ��rencileri listeleyiniz.

select o.* from ogrenci o where o.ograd like 'A%' or o.ograd like 'D%' or o.ograd like 'K%'

--13. ��renci tablosundaki s�n�f� 9A olan Erkekleri veya s�n�f� 9B olan k�zlar�n ad�n�, soyad�n�, s�n�f�n� ve cinsiyetini listeleyiniz. 

select o.ograd, o.ogrsoyad, o.sinif, o.cinsiyet from ogrenci o where (o.sinif = '9A' and o.cinsiyet = 'E') or (o.sinif = '9B' and o.cinsiyet = 'K')

--14. S�n�f� 10A veya 10B olan erkekleri listeleyiniz. 

select o.* from ogrenci o where (o.sinif = '10A' or o.sinif = '10B') and o.cinsiyet = 'E'

--15.��renci tablosunda do�um y�l� 1989 olan ��rencileri listeleyiniz. 

select o.* from ogrenci o where year(o.dtarih) = 1989

--16.��renci numaras� 30 ile 50 aras�nda olan K�z ��rencileri listeleyiniz. 

select o.* from ogrenci o where o.ogrno > 30 and o.ogrno < 50 and o.cinsiyet = 'K'

--17.��rencileri ad�na g�re s�ralay�n�z. 

select o.* from ogrenci o order by o.ograd

--18. ��rencileri ad�na, ad� ayn� olanlar�da soyadlar�na g�re s�ralay�n�z. 

select o.* from ogrenci o order by o.ograd, o.ogrsoyad

--19. 10A s�n�f�ndaki ��rencileri okul numaras�na g�re azalan olarak s�ralay�n�z. 

select o.* from ogrenci o order by o.ogrno desc

--20. ��renciler tablosundaki ilk 10 kayd� listeleyiniz. 

select top 10 o.* from ogrenci o

--21. ��renciler tablosundaki ilk 10 kayd�n ad, soyad ve do�um tarihi bilgilerini listeleyiniz. 

select top 10 o.ograd, o.ogrsoyad, o.dtarih from ogrenci o

--22.Sayfa say�s� en fazla olan kitab� listeleyiniz. 

select k.* from kitap k where k.sayfasayisi = (select max(k1.sayfasayisi) from kitap k1)

--23. ��renciler tablosundaki en gen� ��renciyi listeleyiniz. 

select o.* from ogrenci o where o.dtarih = (select max(o1.dtarih) from ogrenci o1)

--24. 10A s�n�f�ndaki en ya�l� ��renciyi listeyin. 

select o.* from ogrenci o where o.dtarih = (select min(o1.dtarih) from ogrenci o1)

--25. �kinci harfi N olan kitaplar� listeleyiniz. 

select k.* from kitap k where k.kitapadi like '_N%'

--26. ��rencileri s�n�flar�na g�re gruplayarak listeleyin.

select o.* from ogrenci o order by o.sinif

--27. ��rencileri her sorgulamada s�ralamas� farkl� olacak �ekilde rastgele listeleyin. 

select o.* from ogrenci o order by NEWID()

--28. Ogrenci tablosundan Rastgele bir ��renci se�iniz. 

select top 1 o.* from ogrenci o order by NEWID()

--29. 10A s�n�f�ndan rastgele bir ��rencinin ad�n�, soyad�n�, numaras�n� ve s�n�f�n� getirin.

select top 1 o.ograd, o.ogrsoyad, o.ogrno, o.sinif from ogrenci o where o.sinif = '10A' order by NEWID()

--30. Yazar tablosunu KEMAL UYUMAZ isimli yazar� ekleyin.

insert into yazar (yazarad, yazarsoyad)
values ('Kemal', 'Uyumaz')

--31. Biyografi t�r�n� t�r tablosuna ekleyiniz. 

insert into tur (turadi)
values ('Biyografi')

--32. 10A s�n�f� olan �A�LAR �Z�MC� isimli erkek, s�n�f� 9B olan LEYLA ALAG�Z isimli k�z ve s�n�f� 11C olan Ay�e Bekta� isimli k�z ��rencileri tek sorguda ekleyin. 

insert into ogrenci (ograd, ogrsoyad, sinif)
values ('�a�lar', '�z�mc�', '10A'), ('Leyla', 'Alag�z', '9B'), ('Ay�e', 'Bekta�', '11C')

--33. ��renci tablosundaki rastgele bir ��renciyi yazarlar tablosuna yazar olarak ekleyiniz. 

insert into yazar (yazarad, yazarsoyad)
select top 1 o.ograd, o.ogrsoyad from ogrenci o order by NEWID()

--34.��renci numaras� 10 ile 30 aras�ndaki ��rencileri yazar olarak ekleyiniz. 

insert into yazar (yazarad, yazarsoyad)
select o.ograd, o.ogrsoyad from ogrenci o where o.ogrno > 10 and o.ogrno < 30

--35. Nurettin Belek isimli yazar� ekleyip yazar numaras�n� yazd�r�n�z.(Not: Otomatik artt�rmada son artt�r�lan de�er @@IDENTITY de�i�keni i�inde tutulur.) 

insert into yazar (yazarad, yazarsoyad)
values ('Nurettin', 'Belek')

print(@@Identity)

--36. 10B s�n�f�ndaki ��renci numaras� 3 olan ��renciyi 10C s�n�f�na ge�irin. 

update ogrenci 
set sinif = '10C'
where ogrno = 3

--37. 9A s�n�f�ndaki t�m ��rencileri 10A s�n�f�na aktar�n 

update ogrenci
set sinif = '10A'
where sinif = '9A'

--38. T�m ��rencilerin puan�n� 5 puan artt�r�n. 

update ogrenci
set puan += 5
where ogrno < (select max(o.ogrno) from ogrenci o) + 1



--39. 25 numaral� yazar� silin. 

delete 
from yazar
where yazarno = 25

--40. Do�um tarihi null olan ��rencileri listeleyin. (insert sorgusu ile girilen 3 ��renci listelenecektir) 

select o.* from ogrenci o where o.dtarih is null

--41. ��rencinin ad�n�, soyad�n� ve kitap ald��� tarihleri listeleyin. 

select o.ograd, o.ogrsoyad, i.atarih  from ogrenci o join islem i on o.ogrno = i.ogrno

--42. F�kra ve hikaye t�r�ndeki kitaplar�n ad�n� ve t�r�n� listeleyin. 

select k.kitapadi, t.turadi from kitap k join tur t on k.turno = t.turno

--43. 10B veya 10C s�n�f�ndaki ��rencilerin numaras�n�, ad�n�, soyad�n� ve okudu�u kitaplar� listeleyin. 

select o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi from kitap k join islem i on k.kitapno = i.kitapno join ogrenci o on i.ogrno = o.ogrno where o.sinif = '10B' or o.sinif = '10C' order by o.ogrno asc

--44. Roman t�r�ndeki kitaplar� okuyan ��rencilerin numaras�n�, ad�n�, soyad�n� ve okudu�u kitab�n ad�n� listeleyin 

select o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi from kitap k join tur t on k.turno = t.turno join islem i on k.kitapno = i.kitapno join ogrenci o on i.ogrno = o.ogrno where t.turadi = 'Roman'

--48. Kitap alan ��rencinin ad�, soyad�, kitap ald��� tarih listelensin. Kitap almayan ��rencilerinde listede g�r�ns�n. 

select o.ograd, o.ogrsoyad, i.atarih
from ogrenci o join islem i on o.ogrno = i.ogrno join kitap k on i.kitapno = k.kitapno

--49. Kitap almayan ��rencileri listeleyin. 

--50. Al�nan kitaplar�n kitap numaras�n�, ad�n� ve ka� defa al�nd���n� kitap numaralar�na g�re artan s�rada listeleyiniz. 

--51. Al�nan kitaplar�n kitap numaras�n�, ad�n� ka� defa al�nd���n� (al�nmayan kitaplar�n yan�nda 0 olsun) listeleyin. 

--52. ��rencilerin ad� soyad� ve ald�klar� kitab�n ad� listelensin. 

--53.Her ��rencinin ad�, soyad�, kitab�n ad�, yazar�n ad� soyad ve kitab�n t�r�n� ve kitab�n al�nd��� tarihi listeleyiniz. Kitap almayan ��renciler de listede g�r�ns�n. 

--54.Her ��rencinin ad�, soyad�, kitab�n ad�, yazar�n ad� soyad ve kitab�n t�r�n� ve kitab�n al�nd��� tarihi listeleyiniz. Kitap almayan ��renciler de listede g�r�ns�n.( Farkl� ��z�m) 

--55. 10A veya 10B s�n�f�ndaki ��rencilerin ad� soyad� ve okudu�u kitap say�s�n� getirin. 

--56.En fazla sayfa say�l� kitab�n bilgilerini listeleyiniz. 

--57. Sayfa say�s� ortalama sayfa say�s�ndan fazla olan kitaplar� listeleyiniz. 

--58.�� i�e select ile dram t�r�ndeki kitaplar� listeleyiniz. 

--59.Ad� e harfi ile ba�layan yazarlar�n kitaplar� 

--60.�� i�e sorgu ile kitap okumayan ��rencileri listeleyiniz. 

--61. �� i�e select ile okunmayan kitaplar� listeleyiniz. 

--62. May�s ay�nda okunmayan kitaplar� listeleyin. 

--63. T�m kitaplar�n ortalama sayfa say�s�n� bulunuz. 

--64.Sayfa say�s� ortalama sayfan�n �zerindeki kitaplar� listeleyin. 

--65.��renci tablosundaki ��renci say�s�n� g�sterin 

--66.��renci tablosundaki toplam ��renci say�s�n� toplam say� takma(alias kullan�m�) ad� ile listeleyin. 

--67.��renci tablosunda ka� farkl� isimde ��renci oldu�unu listeleyiniz. 

--68.En fazla sayfa say�s� olan kitab�n sayfa say�s�n� listeleyiniz. 

--69.En fazla sayfas� olan kitab�n ad�n� ve sayfa say�s�n� listeleyiniz. 

--70.En az sayfa say�s� olan kitab�n sayfa say�s�n� listeleyiniz. 

--71.En az sayfas� olan kitab�n ad�n� ve sayfa say�s�n� listeleyiniz. 

--72.Dram t�r�ndeki en fazla sayfas� olan kitab�n sayfa say�s�n� bulunuz. 

--73.numaras� 15 olan ��rencinin okudu�u toplam sayfa say�s�n� bulunuz. 

--74.��rencinin ad�n�, soyad�n� ve ya��n� listeleyin. 

--75.�sme g�re ��renci say�lar�n�n adedini bulunuz.(�rn: ali 5 tane, ahmet 8 tane ) 

--76.Her s�n�ftaki ��renci say�s�n� bulunuz. 

--77.Her s�n�ftaki erkek ve k�z ��renci say�s�n� bulunuz. 

--78.Her ��rencinin ad�n�, soyad�n� ve okudu�u toplam sayfa say�s�n� b�y�kten k����e do�ru listeleyiniz. 

--79.Her ��rencinin okudu�u kitap say�s�n� getiriniz. 

 
-- Complex JOIN with Aggregation:
--Write a SQL query to list the products that have been sold the most in terms of quantity, including the product name, the total quantity sold, and the total sales amount. Order the results by the total quantity sold in descending order.

--Advanced Subqueries and Aggregation:
--Write a SQL query to find customers who have not placed any orders in the last year. Include the customer's company name and the date of their last order.

--Recursive CTEs:
--If the Northwind database had a self-referencing table (e.g., Employees with a manager who is also an employee), write a SQL query to create an organizational chart that shows each employee, their manager, and the level of depth in the organizational hierarchy.

--Partitioning with Window Functions:
--Write a SQL query that lists each customer's total orders quantity and total order amount alongside their highest single order quantity and the date on which they placed that order. Use window functions to calculate the totals.

--Complex DATE Operations:
--Write a SQL query to determine how many orders were placed on the last day of each month in the year 1996. Include the date and the number of orders placed.

--PIVOT Query:
--Write a SQL query that shows a pivot table of how many products each employee has sold, with employees as rows and months of the year as columns.

--Dynamic SQL for Reporting:
--Write a SQL statement that generates a dynamic SQL query to select the top 3 most profitable categories for each month in the year 1997, where the profitability is defined by the total sales minus discounts given.

--Correlated Subquery and EXISTS:
--Write a SQL query to list all the products that have never been sold in any order. Use a correlated subquery with the EXISTS operator.

--Analytical Functions for Running Totals:
--Write a SQL query to list each product and the running total of its sales quantity over time. Order the list by product name and the date of the sale.

--Complex Data Manipulation with Transactions:
--Write a SQL transaction that moves a discontinued product's remaining stock to a 'Clearance' category, updates the unit price to reflect a 50% discount, and logs this action in an audit table.


use Northwind

-- 1 - Hangi �r�n, hangi tedarik�i taraf�ndan �retiliyor ve hangi kategoriye ait, listeleyin.
-- CompanyName'e g�re s�ralay�n.
-- CompanyName, ProductName, UnitPrice, CategoryName

select s.CompanyName, p.ProductName, p.UnitPrice, c.CategoryName
from Products p join Suppliers s on p.SupplierID = s.SupplierID join Categories c on p.CategoryID = c.CategoryID

-- 2 - 'Eastern Connection' gemisi ile ta��nan �r�nlerin isimlerini, sipari� tarihi ile birlikte s�ralay�n�z. En son tarih ki sipari�ten ba�layarak s�ralay�n�z.

select p.ProductName, o.OrderDate
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
where o.ShipName = 'Eastern Connection'
order by o.OrderDate desc

-- 3 - �r�n kategorilerine g�re ortalama �r�n fiyatlar�n� listleyiniz

select cat.CategoryName, avg(p.UnitPrice) 'Ortalama Fiyat'
from Products p join Categories cat on p.CategoryID = cat.CategoryID
group by cat.CategoryName


-- 4 - Londra da ya�ayan �al��anlar�m 1995 - 1997 y�llar� aras�nda g�nderdikleri sipari�lerin nakliyesini yapan firmalar� listeleyiniz.
-- �al��an Ad� ve Soyad�, Ya�ad��� �ehir, Sipari� ID'ler ve tarihleri, Nakliye firma ad�

select concat(e.FirstName, ' ', e.LastName) '�al��an', e.City, o.OrderID,  o.OrderDate, s.CompanyName
from Employees e join Orders o on e.EmployeeID = o.EmployeeID join Shippers s on o.ShipVia = s.ShipperID
where e.City = 'London' and year(o.OrderDate) between 1995 and 1997 

-- 5 - Toplam tutar� 2500 ile 3500 aras�nda olan sipari�leri listeleyelim.

select od.OrderID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount))
from [Order Details] od 
group by od.OrderID
having sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) between 2500 and 3500

-- 6 - Yukar�daki sorguya filtre �art� olarak sipari� kodu 10500 ile 11000 aras�nda olma ko�ulunu yazal�m.

select od.OrderID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount))
from [Order Details] od 
where od.OrderID between 10500 and 11000
group by od.OrderID
having sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) between 2500 and 3500

-- 7 - Tedarik�ilere g�re toplam stok miktar� 100'den fazla olanlar� listeleyiniz

select s.CompanyName, sum(p.UnitsInStock)
from Products p join Suppliers s on p.SupplierID = s.SupplierID
group by s.CompanyName
having sum(p.UnitsInStock) > 100

-- 8 - �r�nlere g�re sipari�ler de ortalama fiyat� 10 ile 30 aras�nda olanlar� listeleyiniz. Ortalama Fiyata g�re artan �ekilde s�ralay�n�z

select p.ProductName, avg(od.UnitPrice)
from [Order Details] od join Products p on od.ProductID = p.ProductID
group by p.ProductName
having avg(od.UnitPrice) between 10 and 30

-- �r�nlere bir ka� �r�n ekleyelim

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Ice Tea', 4, 6, '10 boxes', 10, 45, 0, 25, 0)

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Chips', 2, 8, '10 bags', 5, 78, 0, 40, 0)

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Wagyu A5', 1, 7, '1 kg pkgs', 200, 12, 0, 5, 0)

-- �r�nler tablosundaki �r�nlerden SATILAN �r�nleri listeleyiniz...

select distinct p.ProductName
from Products p join [Order Details] od on p.ProductID = od.ProductID 

-- With subquery

select p.ProductName 
from Products p
where p.ProductID in (select od.ProductID from [Order Details] od)

-- Sat�lmayan �r�nleri listeleyiniz

select p.ProductName
from Products p
where p.ProductID not in (select od.ProductID from [Order Details] od)

-- subquery olmadan

select p.ProductName
from Products p left join [Order Details] od on p.ProductID = od.ProductID
where od.ProductID is null

-- Ald��� firstName'e g�re �al��an�n ald��� sipari�leri getiren Stored Procedure // Function
go
create procedure dbo.SP_FirstNameOrder
@Firstname varchar(60)
as
select e.FirstName, count(o.OrderID)
from Employees e join Orders o  on e.EmployeeID = o.EmployeeID
where e.FirstName = @Firstname
group by e.FirstName

execute dbo.SP_FirstNameOrder 'Andrew'

go
create function FN_ReturnOrdersBasedOnEmployee (@FirstName nvarchar(30))
returns table
as
return select e.FirstName, count(o.OrderID) 'Sipari� Say�s�'
from Employees e join Orders o  on e.EmployeeID = o.EmployeeID
where e.FirstName = @Firstname
group by e.FirstName

select * from dbo.FN_ReturnOrdersBasedOnEmployee('Andrew')






