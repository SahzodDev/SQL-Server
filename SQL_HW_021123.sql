
--1-) Stok miktar� 10 dan az kalan �r�nlerin, �r�n Ad�, Fiyat�, Stok Miktar� kolonlar�n� listeleyiniz

select p.ProductName, p.UnitPrice, p.UnitsInStock from Products p


--2-) Fransaya'ya g�nderilecek olan sipari�lerin, Sipari� Kodu, M��teri Kodu, Adres, �ehir ve �lke bilgilerini listeleyiniz

select o.OrderID, o.CustomerID, o.ShipAddress, o.ShipCountry from Orders o where o.ShipCountry = 'France'

--3-) Region(B�lge) bilgisi BEL�RT�LMEM�� olan �al��anlar�n Unvan, Ad, Soyad, B�lge bilgilerini listeleyiniz

select e.TitleOfCourtesy, e.FirstName, e.LastName, e.Region from Employees e where e.Region is null

--4-) Region(B�lge) bilgisi belirtilmi� olan �al��anlar�n Unvan, Ad, Soyad, B�lge bilgilerini listeleyiniz

select e.TitleOfCourtesy, e.FirstName, e.LastName, e.Region from Employees e where e.Region is not null