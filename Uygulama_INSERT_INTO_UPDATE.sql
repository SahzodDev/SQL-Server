
-- Kategori tablosuna 'Sebzeler' kategorisini, 'Mevsim sebzeleri taze t�ketilirse faydal� olur.' a��klamas�yla birlikte ekleyiniz.

--insert into Categories(CategoryName, Description)

--values('Sebzeler', 'Mevsim sebzeleri taze t�ketilirse faydal� olur')

--select * from Categories

-- Employees tablosuna kendi bilgilerinizi ekleyiniz.

--insert into Employees (FirstName, LastName, BirthDate, TitleOfCourtesy)
--values('Shohzod', '�rga�', '1999-08-24', 'Mr.')

--select * from Employees

-- �al��anlar tablosundan ID'si 10 olan �al��an�n soyad�n� g�ncelleyiniz..

--select * into Employees1 from Employees

--update Employees1
--set LastName = 'Test'
--where EmployeeID = 10

--select * from Employees1

--delete from Employees1 where LastName = '�rga�'

--select * from Employees1

-- Fransaya g�nderilecek olan sipari�lerin, Sipari� Kodu, M��teri Kodu, Adres, �ehir ve �lke bilgilerini listeleyiniz.

select OrderID, CustomerID, ShipAddress, ShipCity, ShipCountry

from Orders

where ShipCountry = 'France'