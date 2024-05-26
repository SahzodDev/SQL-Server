

--select ProductName, UnitPrice from Products -- Kolonlarý seçme

--select ProductName [Ürün Adý], UnitPrice [Fiyatý] from Products -- Kolonlara isim verip seçme

--select ProductName as UrunAdi, UnitPrice as Fiyati from Products -- Kolonlara isim verip seçme alternatif

--select ProductName 'Ürün Adý', UnitPrice 'Fiyatý' from Products

--select ProductName UrunAdi, UnitPrice Fiyati from Products

-- Çalýþanlarýn ad, soyad, adresleri ve telefon numaralarýný listeleyiniz.

--select FirstName, LastName, Address, HomePhone from Employees

-- Her bir kategori adý ve açýklamasýnýn ne olduðunu listeleyiniz, kolon isimleri verin.

--select c.CategoryName 'Kategori Adý', c.Description 'Açýklama' from Categories c

-- Not : Nereye gideceði, adres, þehir ve ülke bilgileriyle 'Açýk Adres' kolon baþlýðýyla tek satýrda olacak.



--update Orders

--set AcikAdres = concat(ShipAddress, ', ', ShipCity, ', ', ShipCountry);

--select * from Orders

-- Ürünlerin adýýn, kategori ID'sini, birim fiyatýný ve stok miktarlarýný listeleyiniz.

--select p.ProductName, p.CategoryID, p.UnitPrice, p.UnitsInStock from Products p

-- Her bir tedarikçinin þirket adýný ve açýk adreslerini listeleyiniz
-- Not : Adres, þehir, posta kodu bilgileriyle 'Açýk Adres' baþlýðýyla tek bir sorguda yazýnýz.

--select s.CompanyName, s.Address + ', ' + s.City + ', ' + s.PostalCode ' Açýk Adres' from Suppliers s

-- Her bir müþterinin þirket adýný ve adreslerini, aralarýnda '/' iþareti olacak þekilde, tek bir kolonda, yetkili kiþi adý ve telefonunu tek bir kolonda olacak þekilde listeleyiniz.
-- Þirket bilgisi kolonu 'ÞirketAdý / Adres'
-- Yetkili bilgisi kolonu 'YetkiliAdý iletiþim / Telefon No'

--select c.CompanyName + '/' + c.Address 'Þirket Bilgisi', c.ContactName + '/' + c.Phone 'Yetkili Bilgisi' from Customers c

-- Çalýþanlar tablosundan, unvaný 'Ms.' olan çalýþanalrýn, Adý, Soyadý ve Unvan bilgilerini listeleyiniz.

--select e.FirstName, e.LastName, e.Title from Employees e where e.TitleOfCourtesy in ('Ms.')

-- Çalýþanlar tablosunda ID'si 5'ten büyük çalýþanlarýn EmployeeID, adý, soyadý bilgisini listeleyiniz.

--select e.EmployeeID, e.FirstName, e.LastName from Employees e where e.EmployeeID > 5

-- 1960 yýlýnda doðan çalýþanlarýn adý, soyadý, doðum tarihi bilgilerini listeleyiniz.

--select e.FirstName, e.LastName, e.BirthDate from Employees e where year(e.birthdate) = 1960

-- 1950 ile 1961 yýllarý arasýnda doðan çalýþanlarýn adý, soyadý ve doðum tarihi bilgilerini 

--select e.FirstName, e.LastName, e.BirthDate from Employees e where year(e.BirthDate) between 1950 and 1961

-- Ýngiltere'de oturan kadýn çalýþanlarýn Adý, Soyadý, Unvaný, Görevi, Ülkesi ve Doðum Tarihi bilgilerini listeleyiniz

-- Çalýþan bilgisi kolonu (Unvan ad soyad), görevi, ülkesi, doðum tarihi - bunlara kolon isimleri verilecek

select e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName 'Çalýþan Bilgisi', e.Title 'Görevi', e.Country 'Ülkesi', e.BirthDate 'Doðum Tarihi' from Employees e where (e.TitleOfCourtesy = 'Ms.' or e.TitleOfCourtesy = 'Mrs.') and e.Country = 'UK'



