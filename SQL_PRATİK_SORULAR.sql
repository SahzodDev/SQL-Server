use kutuphane
go


--1.Öðrenci tablosundaki tüm kayýtlarý listeleyin. 

select * from ogrenci

--2.Öðrenci tablosundaki öðrencinin adýný ve soyadýný ve sýnýfýný listeleyin. 

select og.ograd, og.ogrsoyad, og.cinsiyet, og.sinif from ogrenci og

--3. Öðrenci tablosundaki cinsiyeti kýz (K) olan kayýtlarý listeleyiniz. 

select * from ogrenci og where og.cinsiyet = 'K'

--4.Öðrenciler tablosundaki sýnýflarýn adýný her sýnýf bir kez görülecek þekilde listeleyiniz. 

select distinct o.sinif from ogrenci o

--5.Öðrenci tablosundaki cinsiyeti Kýz ve Sýnýfý 10A olan öðrencileri listeleyiniz. 

select o.* from ogrenci o where o.cinsiyet = 'K' and o.sinif = '10A'

--6.Öðrenci tablosundaki 10A veya 10B sýnýfýndaki öðrencilerin adýný, soyadýný ve sýnýfýný listeleyiniz. 

select o.ograd, o.ogrsoyad, o.sinif from ogrenci o where o.sinif = '10A' or o.sinif = '10B'

--7.Öðrenci tablosundaki öðrencinin adýný, soyadýný ve numarasýný okul numarasý olarak listeleyiniz. (as kullaným örneði) 

select o.ograd, o.ogrsoyad, o.ogrno as 'Okul Numarasý' from ogrenci o

--8. Öðrenci tablosundaki öðrencinin adýný ve soyadýný birleþtirip, adsoyad olarak listeleyiniz. (as kullaným örneði) 

select concat(o.ograd, o.ogrsoyad) as adsoyad from ogrenci o

--9. Öðrenci tablosundaki Adý ‘A’ harfi ile baþlayan öðrencileri listeleyiniz.

select o.* from ogrenci o where o.ograd like 'A%'

--10.kitap tablosundaki sayfa sayýsý 50 ile 200 arasýnda olan kitaplarýn adýný ve sayfa sayýsýný listeleyiniz. 

select k.kitapadi, k.sayfasayisi from kitap k where k.sayfasayisi > 50 and k.sayfasayisi < 200

--11. Öðrenci tablosunda adý Fidan, Ýsmail ve Leyla olan öðrencileri listeleyiniz. 

select o.* from ogrenci o where o.ograd = 'Fidan' or o.ograd = 'Ýsmail' or o.ograd = 'Leyla'

--12. Öðrenci tablosundaki öðrencilerden adý A, D ve K ile baþlayan öðrencileri listeleyiniz.

select o.* from ogrenci o where o.ograd like 'A%' or o.ograd like 'D%' or o.ograd like 'K%'

--13. Öðrenci tablosundaki sýnýfý 9A olan Erkekleri veya sýnýfý 9B olan kýzlarýn adýný, soyadýný, sýnýfýný ve cinsiyetini listeleyiniz. 

select o.ograd, o.ogrsoyad, o.sinif, o.cinsiyet from ogrenci o where (o.sinif = '9A' and o.cinsiyet = 'E') or (o.sinif = '9B' and o.cinsiyet = 'K')

--14. Sýnýfý 10A veya 10B olan erkekleri listeleyiniz. 

select o.* from ogrenci o where (o.sinif = '10A' or o.sinif = '10B') and o.cinsiyet = 'E'

--15.Öðrenci tablosunda doðum yýlý 1989 olan öðrencileri listeleyiniz. 

select o.* from ogrenci o where year(o.dtarih) = 1989

--16.Öðrenci numarasý 30 ile 50 arasýnda olan Kýz öðrencileri listeleyiniz. 

select o.* from ogrenci o where o.ogrno > 30 and o.ogrno < 50 and o.cinsiyet = 'K'

--17.Öðrencileri adýna göre sýralayýnýz. 

select o.* from ogrenci o order by o.ograd

--18. Öðrencileri adýna, adý ayný olanlarýda soyadlarýna göre sýralayýnýz. 

select o.* from ogrenci o order by o.ograd, o.ogrsoyad

--19. 10A sýnýfýndaki öðrencileri okul numarasýna göre azalan olarak sýralayýnýz. 

select o.* from ogrenci o order by o.ogrno desc

--20. Öðrenciler tablosundaki ilk 10 kaydý listeleyiniz. 

select top 10 o.* from ogrenci o

--21. Öðrenciler tablosundaki ilk 10 kaydýn ad, soyad ve doðum tarihi bilgilerini listeleyiniz. 

select top 10 o.ograd, o.ogrsoyad, o.dtarih from ogrenci o

--22.Sayfa sayýsý en fazla olan kitabý listeleyiniz. 

select k.* from kitap k where k.sayfasayisi = (select max(k1.sayfasayisi) from kitap k1)

--23. Öðrenciler tablosundaki en genç öðrenciyi listeleyiniz. 

select o.* from ogrenci o where o.dtarih = (select max(o1.dtarih) from ogrenci o1)

--24. 10A sýnýfýndaki en yaþlý öðrenciyi listeyin. 

select o.* from ogrenci o where o.dtarih = (select min(o1.dtarih) from ogrenci o1)

--25. Ýkinci harfi N olan kitaplarý listeleyiniz. 

select k.* from kitap k where k.kitapadi like '_N%'

--26. Öðrencileri sýnýflarýna göre gruplayarak listeleyin.

select o.* from ogrenci o order by o.sinif

--27. Öðrencileri her sorgulamada sýralamasý farklý olacak þekilde rastgele listeleyin. 

select o.* from ogrenci o order by NEWID()

--28. Ogrenci tablosundan Rastgele bir öðrenci seçiniz. 

select top 1 o.* from ogrenci o order by NEWID()

--29. 10A sýnýfýndan rastgele bir öðrencinin adýný, soyadýný, numarasýný ve sýnýfýný getirin.

select top 1 o.ograd, o.ogrsoyad, o.ogrno, o.sinif from ogrenci o where o.sinif = '10A' order by NEWID()

--30. Yazar tablosunu KEMAL UYUMAZ isimli yazarý ekleyin.

insert into yazar (yazarad, yazarsoyad)
values ('Kemal', 'Uyumaz')

--31. Biyografi türünü tür tablosuna ekleyiniz. 

insert into tur (turadi)
values ('Biyografi')

--32. 10A sýnýfý olan ÇAÐLAR ÜZÜMCÜ isimli erkek, sýnýfý 9B olan LEYLA ALAGÖZ isimli kýz ve sýnýfý 11C olan Ayþe Bektaþ isimli kýz öðrencileri tek sorguda ekleyin. 

insert into ogrenci (ograd, ogrsoyad, sinif)
values ('Çaðlar', 'Üzümcü', '10A'), ('Leyla', 'Alagöz', '9B'), ('Ayþe', 'Bektaþ', '11C')

--33. Öðrenci tablosundaki rastgele bir öðrenciyi yazarlar tablosuna yazar olarak ekleyiniz. 

insert into yazar (yazarad, yazarsoyad)
select top 1 o.ograd, o.ogrsoyad from ogrenci o order by NEWID()

--34.Öðrenci numarasý 10 ile 30 arasýndaki öðrencileri yazar olarak ekleyiniz. 

insert into yazar (yazarad, yazarsoyad)
select o.ograd, o.ogrsoyad from ogrenci o where o.ogrno > 10 and o.ogrno < 30

--35. Nurettin Belek isimli yazarý ekleyip yazar numarasýný yazdýrýnýz.(Not: Otomatik arttýrmada son arttýrýlan deðer @@IDENTITY deðiþkeni içinde tutulur.) 

insert into yazar (yazarad, yazarsoyad)
values ('Nurettin', 'Belek')

print(@@Identity)

--36. 10B sýnýfýndaki öðrenci numarasý 3 olan öðrenciyi 10C sýnýfýna geçirin. 

update ogrenci 
set sinif = '10C'
where ogrno = 3

--37. 9A sýnýfýndaki tüm öðrencileri 10A sýnýfýna aktarýn 

update ogrenci
set sinif = '10A'
where sinif = '9A'

--38. Tüm öðrencilerin puanýný 5 puan arttýrýn. 

update ogrenci
set puan += 5
where ogrno < (select max(o.ogrno) from ogrenci o) + 1



--39. 25 numaralý yazarý silin. 

delete 
from yazar
where yazarno = 25

--40. Doðum tarihi null olan öðrencileri listeleyin. (insert sorgusu ile girilen 3 öðrenci listelenecektir) 

select o.* from ogrenci o where o.dtarih is null

--41. Öðrencinin adýný, soyadýný ve kitap aldýðý tarihleri listeleyin. 

select o.ograd, o.ogrsoyad, i.atarih  from ogrenci o join islem i on o.ogrno = i.ogrno

--42. Fýkra ve hikaye türündeki kitaplarýn adýný ve türünü listeleyin. 

select k.kitapadi, t.turadi from kitap k join tur t on k.turno = t.turno

--43. 10B veya 10C sýnýfýndaki öðrencilerin numarasýný, adýný, soyadýný ve okuduðu kitaplarý listeleyin. 

select o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi from kitap k join islem i on k.kitapno = i.kitapno join ogrenci o on i.ogrno = o.ogrno where o.sinif = '10B' or o.sinif = '10C' order by o.ogrno asc

--44. Roman türündeki kitaplarý okuyan öðrencilerin numarasýný, adýný, soyadýný ve okuduðu kitabýn adýný listeleyin 

select o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi from kitap k join tur t on k.turno = t.turno join islem i on k.kitapno = i.kitapno join ogrenci o on i.ogrno = o.ogrno where t.turadi = 'Roman'

--48. Kitap alan öðrencinin adý, soyadý, kitap aldýðý tarih listelensin. Kitap almayan öðrencilerinde listede görünsün. 

select o.ograd, o.ogrsoyad, i.atarih
from ogrenci o join islem i on o.ogrno = i.ogrno join kitap k on i.kitapno = k.kitapno

--49. Kitap almayan öðrencileri listeleyin. 

--50. Alýnan kitaplarýn kitap numarasýný, adýný ve kaç defa alýndýðýný kitap numaralarýna göre artan sýrada listeleyiniz. 

--51. Alýnan kitaplarýn kitap numarasýný, adýný kaç defa alýndýðýný (alýnmayan kitaplarýn yanýnda 0 olsun) listeleyin. 

--52. Öðrencilerin adý soyadý ve aldýklarý kitabýn adý listelensin. 

--53.Her öðrencinin adý, soyadý, kitabýn adý, yazarýn adý soyad ve kitabýn türünü ve kitabýn alýndýðý tarihi listeleyiniz. Kitap almayan öðrenciler de listede görünsün. 

--54.Her öðrencinin adý, soyadý, kitabýn adý, yazarýn adý soyad ve kitabýn türünü ve kitabýn alýndýðý tarihi listeleyiniz. Kitap almayan öðrenciler de listede görünsün.( Farklý Çözüm) 

--55. 10A veya 10B sýnýfýndaki öðrencilerin adý soyadý ve okuduðu kitap sayýsýný getirin. 

--56.En fazla sayfa sayýlý kitabýn bilgilerini listeleyiniz. 

--57. Sayfa sayýsý ortalama sayfa sayýsýndan fazla olan kitaplarý listeleyiniz. 

--58.Ýç içe select ile dram türündeki kitaplarý listeleyiniz. 

--59.Adý e harfi ile baþlayan yazarlarýn kitaplarý 

--60.Ýç içe sorgu ile kitap okumayan öðrencileri listeleyiniz. 

--61. Ýç içe select ile okunmayan kitaplarý listeleyiniz. 

--62. Mayýs ayýnda okunmayan kitaplarý listeleyin. 

--63. Tüm kitaplarýn ortalama sayfa sayýsýný bulunuz. 

--64.Sayfa sayýsý ortalama sayfanýn üzerindeki kitaplarý listeleyin. 

--65.Öðrenci tablosundaki öðrenci sayýsýný gösterin 

--66.Öðrenci tablosundaki toplam öðrenci sayýsýný toplam sayý takma(alias kullanýmý) adý ile listeleyin. 

--67.Öðrenci tablosunda kaç farklý isimde öðrenci olduðunu listeleyiniz. 

--68.En fazla sayfa sayýsý olan kitabýn sayfa sayýsýný listeleyiniz. 

--69.En fazla sayfasý olan kitabýn adýný ve sayfa sayýsýný listeleyiniz. 

--70.En az sayfa sayýsý olan kitabýn sayfa sayýsýný listeleyiniz. 

--71.En az sayfasý olan kitabýn adýný ve sayfa sayýsýný listeleyiniz. 

--72.Dram türündeki en fazla sayfasý olan kitabýn sayfa sayýsýný bulunuz. 

--73.numarasý 15 olan öðrencinin okuduðu toplam sayfa sayýsýný bulunuz. 

--74.Öðrencinin adýný, soyadýný ve yaþýný listeleyin. 

--75.Ýsme göre öðrenci sayýlarýnýn adedini bulunuz.(Örn: ali 5 tane, ahmet 8 tane ) 

--76.Her sýnýftaki öðrenci sayýsýný bulunuz. 

--77.Her sýnýftaki erkek ve kýz öðrenci sayýsýný bulunuz. 

--78.Her öðrencinin adýný, soyadýný ve okuduðu toplam sayfa sayýsýný büyükten küçüðe doðru listeleyiniz. 

--79.Her öðrencinin okuduðu kitap sayýsýný getiriniz. 

 
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

-- 1 - Hangi ürün, hangi tedarikçi tarafýndan üretiliyor ve hangi kategoriye ait, listeleyin.
-- CompanyName'e göre sýralayýn.
-- CompanyName, ProductName, UnitPrice, CategoryName

select s.CompanyName, p.ProductName, p.UnitPrice, c.CategoryName
from Products p join Suppliers s on p.SupplierID = s.SupplierID join Categories c on p.CategoryID = c.CategoryID

-- 2 - 'Eastern Connection' gemisi ile taþýnan ürünlerin isimlerini, sipariþ tarihi ile birlikte sýralayýnýz. En son tarih ki sipariþten baþlayarak sýralayýnýz.

select p.ProductName, o.OrderDate
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
where o.ShipName = 'Eastern Connection'
order by o.OrderDate desc

-- 3 - Ürün kategorilerine göre ortalama ürün fiyatlarýný listleyiniz

select cat.CategoryName, avg(p.UnitPrice) 'Ortalama Fiyat'
from Products p join Categories cat on p.CategoryID = cat.CategoryID
group by cat.CategoryName


-- 4 - Londra da yaþayan çalýþanlarým 1995 - 1997 yýllarý arasýnda gönderdikleri sipariþlerin nakliyesini yapan firmalarý listeleyiniz.
-- Çalýþan Adý ve Soyadý, Yaþadýðý þehir, Sipariþ ID'ler ve tarihleri, Nakliye firma adý

select concat(e.FirstName, ' ', e.LastName) 'Çalýþan', e.City, o.OrderID,  o.OrderDate, s.CompanyName
from Employees e join Orders o on e.EmployeeID = o.EmployeeID join Shippers s on o.ShipVia = s.ShipperID
where e.City = 'London' and year(o.OrderDate) between 1995 and 1997 

-- 5 - Toplam tutarý 2500 ile 3500 arasýnda olan sipariþleri listeleyelim.

select od.OrderID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount))
from [Order Details] od 
group by od.OrderID
having sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) between 2500 and 3500

-- 6 - Yukarýdaki sorguya filtre þartý olarak sipariþ kodu 10500 ile 11000 arasýnda olma koþulunu yazalým.

select od.OrderID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount))
from [Order Details] od 
where od.OrderID between 10500 and 11000
group by od.OrderID
having sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) between 2500 and 3500

-- 7 - Tedarikçilere göre toplam stok miktarý 100'den fazla olanlarý listeleyiniz

select s.CompanyName, sum(p.UnitsInStock)
from Products p join Suppliers s on p.SupplierID = s.SupplierID
group by s.CompanyName
having sum(p.UnitsInStock) > 100

-- 8 - Ürünlere göre sipariþler de ortalama fiyatý 10 ile 30 arasýnda olanlarý listeleyiniz. Ortalama Fiyata göre artan þekilde sýralayýnýz

select p.ProductName, avg(od.UnitPrice)
from [Order Details] od join Products p on od.ProductID = p.ProductID
group by p.ProductName
having avg(od.UnitPrice) between 10 and 30

-- Ürünlere bir kaç ürün ekleyelim

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Ice Tea', 4, 6, '10 boxes', 10, 45, 0, 25, 0)

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Chips', 2, 8, '10 bags', 5, 78, 0, 40, 0)

insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values ('Wagyu A5', 1, 7, '1 kg pkgs', 200, 12, 0, 5, 0)

-- Ürünler tablosundaki ürünlerden SATILAN ürünleri listeleyiniz...

select distinct p.ProductName
from Products p join [Order Details] od on p.ProductID = od.ProductID 

-- With subquery

select p.ProductName 
from Products p
where p.ProductID in (select od.ProductID from [Order Details] od)

-- Satýlmayan ürünleri listeleyiniz

select p.ProductName
from Products p
where p.ProductID not in (select od.ProductID from [Order Details] od)

-- subquery olmadan

select p.ProductName
from Products p left join [Order Details] od on p.ProductID = od.ProductID
where od.ProductID is null

-- Aldýðý firstName'e göre çalýþanýn aldýðý sipariþleri getiren Stored Procedure // Function
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
return select e.FirstName, count(o.OrderID) 'Sipariþ Sayýsý'
from Employees e join Orders o  on e.EmployeeID = o.EmployeeID
where e.FirstName = @Firstname
group by e.FirstName

select * from dbo.FN_ReturnOrdersBasedOnEmployee('Andrew')






