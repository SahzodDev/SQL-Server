

--select ProductName, UnitPrice from Products -- Kolonlar� se�me

--select ProductName [�r�n Ad�], UnitPrice [Fiyat�] from Products -- Kolonlara isim verip se�me

--select ProductName as UrunAdi, UnitPrice as Fiyati from Products -- Kolonlara isim verip se�me alternatif

--select ProductName '�r�n Ad�', UnitPrice 'Fiyat�' from Products

--select ProductName UrunAdi, UnitPrice Fiyati from Products

-- �al��anlar�n ad, soyad, adresleri ve telefon numaralar�n� listeleyiniz.

--select FirstName, LastName, Address, HomePhone from Employees

-- Her bir kategori ad� ve a��klamas�n�n ne oldu�unu listeleyiniz, kolon isimleri verin.

--select c.CategoryName 'Kategori Ad�', c.Description 'A��klama' from Categories c

-- Not : Nereye gidece�i, adres, �ehir ve �lke bilgileriyle 'A��k Adres' kolon ba�l���yla tek sat�rda olacak.



--update Orders

--set AcikAdres = concat(ShipAddress, ', ', ShipCity, ', ', ShipCountry);

--select * from Orders

-- �r�nlerin ad��n, kategori ID'sini, birim fiyat�n� ve stok miktarlar�n� listeleyiniz.

--select p.ProductName, p.CategoryID, p.UnitPrice, p.UnitsInStock from Products p

-- Her bir tedarik�inin �irket ad�n� ve a��k adreslerini listeleyiniz
-- Not : Adres, �ehir, posta kodu bilgileriyle 'A��k Adres' ba�l���yla tek bir sorguda yaz�n�z.

--select s.CompanyName, s.Address + ', ' + s.City + ', ' + s.PostalCode ' A��k Adres' from Suppliers s

-- Her bir m��terinin �irket ad�n� ve adreslerini, aralar�nda '/' i�areti olacak �ekilde, tek bir kolonda, yetkili ki�i ad� ve telefonunu tek bir kolonda olacak �ekilde listeleyiniz.
-- �irket bilgisi kolonu '�irketAd� / Adres'
-- Yetkili bilgisi kolonu 'YetkiliAd� ileti�im / Telefon No'

--select c.CompanyName + '/' + c.Address '�irket Bilgisi', c.ContactName + '/' + c.Phone 'Yetkili Bilgisi' from Customers c

-- �al��anlar tablosundan, unvan� 'Ms.' olan �al��analr�n, Ad�, Soyad� ve Unvan bilgilerini listeleyiniz.

--select e.FirstName, e.LastName, e.Title from Employees e where e.TitleOfCourtesy in ('Ms.')

-- �al��anlar tablosunda ID'si 5'ten b�y�k �al��anlar�n EmployeeID, ad�, soyad� bilgisini listeleyiniz.

--select e.EmployeeID, e.FirstName, e.LastName from Employees e where e.EmployeeID > 5

-- 1960 y�l�nda do�an �al��anlar�n ad�, soyad�, do�um tarihi bilgilerini listeleyiniz.

--select e.FirstName, e.LastName, e.BirthDate from Employees e where year(e.birthdate) = 1960

-- 1950 ile 1961 y�llar� aras�nda do�an �al��anlar�n ad�, soyad� ve do�um tarihi bilgilerini 

--select e.FirstName, e.LastName, e.BirthDate from Employees e where year(e.BirthDate) between 1950 and 1961

-- �ngiltere'de oturan kad�n �al��anlar�n Ad�, Soyad�, Unvan�, G�revi, �lkesi ve Do�um Tarihi bilgilerini listeleyiniz

-- �al��an bilgisi kolonu (Unvan ad soyad), g�revi, �lkesi, do�um tarihi - bunlara kolon isimleri verilecek

select e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName '�al��an Bilgisi', e.Title 'G�revi', e.Country '�lkesi', e.BirthDate 'Do�um Tarihi' from Employees e where (e.TitleOfCourtesy = 'Ms.' or e.TitleOfCourtesy = 'Mrs.') and e.Country = 'UK'



