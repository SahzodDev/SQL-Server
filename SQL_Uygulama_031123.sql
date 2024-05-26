

-- Çalýþanlarý isimleri A'dan Z'ye olacak þekilde sýralayýnýz.

--select FirstName, LastName, TitleOfCourtesy
--from Employees

--order by FirstName asc

-- Çalýþanlar tablosundan ID'si 2 ile 7 arasýnda olan çalýþanlarýn bilgilerini, FirstName kolonuna göre ARTAN sýrada sýralayýnýz. (A'dan Z'ye)

--select FirstName from Employees

--where EmployeeID between 2 and 7

--order by FirstName asc

-- MüþteriID'si ALFKI olan müþterimin tüm sipariþlerini listeleyin.

--select * from Orders

--where CustomerID like '%ALFKI%'

-- Çalýþanlar tablosundaki çalýþanlarýn Ad, Soyad, Doðum Tarihi bilgilerini, Doðum Tarihi kolonuna göre artan þekilde sýralayýnýz. (Doðum Tarihi kolonu boþ olmayanlarý)

--select e.FirstName, e.LastName, e.BirthDate
--from Employees e
--where e.BirthDate is not null
--order by BirthDate asc

-- Çalýþanlar tablosundaki çalýþanlarýn Ad, Soyad, Doðum Tarihi bilgilerini LastName kolonuna göre AZALAN sýrada listeleyiniz.

--select FirstName, LastName, BirthDate
--from Employees

--order by LastName desc

-- Çalýþanlar tablosundaki çalýþanlarý Ad, Soyad, Doðum Tarihi, Ýþe Alým Tarihi, Görev, Unvan kolonlarýyla, Unvan kolonuna göre ARTAN, iþe alým tarihi kolonuna göre azalan olarak listelyiniz. (kolonlar isimlendirilecek.)

--select FirstName 'Ýsim', LastName 'Soyisim', BirthDate 'Doðum Tarihi', HireDate 'Ýþe Alým Tarihi', Title 'Görev', TitleOfCourtesy 'Unvan'
--from Employees
--where HireDate is not null
--order by TitleOfCourtesy asc, HireDate desc -- Ýlk hangi case'i verirsem ona öncelik veriyor.

-- 04.07.1996 - 10.07.1996 tarih aralýðýndaki sipariþleri yazdýrýn

--select	*
--from Orders

--where OrderDate between '1996-07-04' and '1996-07-10'

-- Çalýþanlarý, unvanlarýna göre ve unvanlarý aynýysa yýl bazýnda yaþlarýna göre büyükten küçüðe sýralayýnýz.
-- (Unvan, Ad, Soyad, Yaþ kolon adlarýyla birlikte)

--select TitleOfCourtesy 'Unvan', FirstName 'Ýsim', LastName 'Soyisim', DATEDIFF(year, BirthDate, GetDate()) as Age
--from Employees
--order by TitleOfCourtesy desc, Age desc

-- Ürünlerin ürün adý, birim fiyatý, stok miktarlarýný 50 ile 100 arasýnda olanlarý filtreleyerek, stok miktarlarýna göre artan sýrada sýralayýnýz.

--select ProductName, UnitPrice, UnitsInStock
--from Products

--where UnitsInStock between 50 and 100
--order by UnitsInStock asc

-- Her bir saipariþ detayýnýn toplam fiyatýný id'si ile birlikte en yüksek fiyattan düþüðe göre sýralayýnýz.

--select OrderID, Quantity * UnitPrice * (1 - Discount) as TotalSales
--from [Order Details]

--order by TotalSales desc

-- FirstName'e göre ilk 3 çalýþaný listeleyin.

--select top 3 *
--from Employees

--order by FirstName 

-- Kategoriler ve Kargo Firmalarý tablolarýndan tüm kolonlarý tek bir sorguda listeleyiniz.

--select * from Categories, Shippers, Products
