
--1-) Stok miktarý 10 dan az kalan ürünlerin, Ürün Adý, Fiyatý, Stok Miktarý kolonlarýný listeleyiniz

select p.ProductName, p.UnitPrice, p.UnitsInStock from Products p


--2-) Fransaya'ya gönderilecek olan sipariþlerin, Sipariþ Kodu, Müþteri Kodu, Adres, Þehir ve Ülke bilgilerini listeleyiniz

select o.OrderID, o.CustomerID, o.ShipAddress, o.ShipCountry from Orders o where o.ShipCountry = 'France'

--3-) Region(Bölge) bilgisi BELÝRTÝLMEMÝÞ olan çalýþanlarýn Unvan, Ad, Soyad, Bölge bilgilerini listeleyiniz

select e.TitleOfCourtesy, e.FirstName, e.LastName, e.Region from Employees e where e.Region is null

--4-) Region(Bölge) bilgisi belirtilmiþ olan çalýþanlarýn Unvan, Ad, Soyad, Bölge bilgilerini listeleyiniz

select e.TitleOfCourtesy, e.FirstName, e.LastName, e.Region from Employees e where e.Region is not null