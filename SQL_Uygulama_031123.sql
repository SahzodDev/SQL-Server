

-- �al��anlar� isimleri A'dan Z'ye olacak �ekilde s�ralay�n�z.

--select FirstName, LastName, TitleOfCourtesy
--from Employees

--order by FirstName asc

-- �al��anlar tablosundan ID'si 2 ile 7 aras�nda olan �al��anlar�n bilgilerini, FirstName kolonuna g�re ARTAN s�rada s�ralay�n�z. (A'dan Z'ye)

--select FirstName from Employees

--where EmployeeID between 2 and 7

--order by FirstName asc

-- M��teriID'si ALFKI olan m��terimin t�m sipari�lerini listeleyin.

--select * from Orders

--where CustomerID like '%ALFKI%'

-- �al��anlar tablosundaki �al��anlar�n Ad, Soyad, Do�um Tarihi bilgilerini, Do�um Tarihi kolonuna g�re artan �ekilde s�ralay�n�z. (Do�um Tarihi kolonu bo� olmayanlar�)

--select e.FirstName, e.LastName, e.BirthDate
--from Employees e
--where e.BirthDate is not null
--order by BirthDate asc

-- �al��anlar tablosundaki �al��anlar�n Ad, Soyad, Do�um Tarihi bilgilerini LastName kolonuna g�re AZALAN s�rada listeleyiniz.

--select FirstName, LastName, BirthDate
--from Employees

--order by LastName desc

-- �al��anlar tablosundaki �al��anlar� Ad, Soyad, Do�um Tarihi, ��e Al�m Tarihi, G�rev, Unvan kolonlar�yla, Unvan kolonuna g�re ARTAN, i�e al�m tarihi kolonuna g�re azalan olarak listelyiniz. (kolonlar isimlendirilecek.)

--select FirstName '�sim', LastName 'Soyisim', BirthDate 'Do�um Tarihi', HireDate '��e Al�m Tarihi', Title 'G�rev', TitleOfCourtesy 'Unvan'
--from Employees
--where HireDate is not null
--order by TitleOfCourtesy asc, HireDate desc -- �lk hangi case'i verirsem ona �ncelik veriyor.

-- 04.07.1996 - 10.07.1996 tarih aral���ndaki sipari�leri yazd�r�n

--select	*
--from Orders

--where OrderDate between '1996-07-04' and '1996-07-10'

-- �al��anlar�, unvanlar�na g�re ve unvanlar� ayn�ysa y�l baz�nda ya�lar�na g�re b�y�kten k����e s�ralay�n�z.
-- (Unvan, Ad, Soyad, Ya� kolon adlar�yla birlikte)

--select TitleOfCourtesy 'Unvan', FirstName '�sim', LastName 'Soyisim', DATEDIFF(year, BirthDate, GetDate()) as Age
--from Employees
--order by TitleOfCourtesy desc, Age desc

-- �r�nlerin �r�n ad�, birim fiyat�, stok miktarlar�n� 50 ile 100 aras�nda olanlar� filtreleyerek, stok miktarlar�na g�re artan s�rada s�ralay�n�z.

--select ProductName, UnitPrice, UnitsInStock
--from Products

--where UnitsInStock between 50 and 100
--order by UnitsInStock asc

-- Her bir saipari� detay�n�n toplam fiyat�n� id'si ile birlikte en y�ksek fiyattan d����e g�re s�ralay�n�z.

--select OrderID, Quantity * UnitPrice * (1 - Discount) as TotalSales
--from [Order Details]

--order by TotalSales desc

-- FirstName'e g�re ilk 3 �al��an� listeleyin.

--select top 3 *
--from Employees

--order by FirstName 

-- Kategoriler ve Kargo Firmalar� tablolar�ndan t�m kolonlar� tek bir sorguda listeleyiniz.

--select * from Categories, Shippers, Products
