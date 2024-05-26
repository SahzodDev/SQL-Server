
-- Kategori tablosuna 'Sebzeler' kategorisini, 'Mevsim sebzeleri taze tüketilirse faydalý olur.' açýklamasýyla birlikte ekleyiniz.

--insert into Categories(CategoryName, Description)

--values('Sebzeler', 'Mevsim sebzeleri taze tüketilirse faydalý olur')

--select * from Categories

-- Employees tablosuna kendi bilgilerinizi ekleyiniz.

--insert into Employees (FirstName, LastName, BirthDate, TitleOfCourtesy)
--values('Shohzod', 'Ýrgaþ', '1999-08-24', 'Mr.')

--select * from Employees

-- Çalýþanlar tablosundan ID'si 10 olan çalýþanýn soyadýný güncelleyiniz..

--select * into Employees1 from Employees

--update Employees1
--set LastName = 'Test'
--where EmployeeID = 10

--select * from Employees1

--delete from Employees1 where LastName = 'Ýrgaþ'

--select * from Employees1

-- Fransaya gönderilecek olan sipariþlerin, Sipariþ Kodu, Müþteri Kodu, Adres, Þehir ve Ülke bilgilerini listeleyiniz.

select OrderID, CustomerID, ShipAddress, ShipCity, ShipCountry

from Orders

where ShipCountry = 'France'