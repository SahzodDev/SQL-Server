
-- Hangi �r�nden toplam ne kadar has�lat elde ettim? �r�n ismi ve has�lat�

select p.ProductName, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) Revenue
from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName

-- Hangi kategorili �r�nden, hangi m��teriye, toplam ne kadarl�k �r�n (fiyat) sat�lm��t�r?

select cat.CategoryName, c.CustomerID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) Revenue
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID join Products p on od.ProductID = p.ProductID join Categories cat on p.CategoryID = cat.CategoryID
group by cat.CategoryName, c.CustomerID

-- Ba� harfi A_K aras�nda ve stok miktar� 5 - 50 aras�nda olan �r�n say�s�n� kategori baz�nda listeleyiniz. �r�n say�s�na g�re azalan.
-- Kategori ad�, �r�n say�s�

select cat.CategoryName, count(p.ProductID) '�r�n Say�s�'
from Products p join Categories cat on p.CategoryID = cat.CategoryID
where p.ProductName like '[A-K]%' and (p.UnitsInStock between 5 and 50)
group by cat.CategoryName
order by count(p.ProductID) desc

-- Sipari�lerdeki toplam �r�n say�s� 200'den fazla olan �r�nleri �r�n Say�s�na g�re artan s�rada listeleyin.
-- OrderID, UrunSayisi

select od.OrderID, sum(od.Quantity)
from [Order Details] od
group by od.OrderID
having sum(od.Quantity) > 200	-- where clause group by'dan �nce, having clause group by'dan sonra kullan�l�r.
order by 2

-- 23 ID'li �r�nden, 20 adetten fazla sipari� veren m��teri listesi.

select c.CompanyName, sum(od.Quantity) 'Sipari� Adedi'
from Orders o 
join [Order Details] od on o.OrderID = od.OrderID 
join Customers c on o.CustomerID = c.CustomerID
where od.ProductID = 23
group by c.CompanyName
having sum(od.Quantity) > 20

-- Nancy isimli �al��an�n ald��� sipari�leri ve tutarlar� listeleyiniz. Tutara g�re pahal�dan ucuza s�ralay�n�z.

select o.OrderID, (od.UnitPrice * od.Quantity * (1 - od.Discount)) Tutar
from Orders o 
join Employees e on o.EmployeeID = e.EmployeeID
join [Order Details] od on o.OrderID = od.OrderID
where e.FirstName = 'Nancy'
order by Tutar desc

-- Her m��terinin son sipari� tarihlerini listeleyiniz.
-- M��teriID, sipari� tarihi

select c.CustomerID, (select top 1 o1.OrderDate from Orders o1 where c.CustomerID = o1.CustomerID order by o1.OrderDate desc)
from Customers c join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID

-- Sipari�lerinin toplam cirosu 50000'den y�ksek olan firmalar� listeleyiniz.
-- M��teri �irket Ad� - Toplam Ciro

select c.CompanyName, sum((od.UnitPrice * od.Quantity * (1 - od.Discount))) Ciro
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by c.CompanyName
having sum((od.UnitPrice * od.Quantity * (1 - od.Discount))) > 50000

-- �r�n stokta varsa 'Stokta Var', yoksa 'Stokta Yok' yazs�n.

select p.ProductName, (p.UnitsInStock - p.UnitsOnOrder) as Stockage,
case
	when (p.UnitsInStock - p.UnitsOnOrder) >= 0 then 'In Stock'
	else 'Out of Stock'
	end as StockStatus
from Products p

-- Birim fiyat� ortalaman�n �zerinde olan �r�nleri listeleyin.

select p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > (select avg(p1.UnitPrice) from Products p1)

-- �r�nler aras�nda en y�ksek fiyatl� �r�n hangisi ve fiyhat�?

select p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice = (select max(p1.UnitPrice) from Products p1)

-- Son 10 sipari�te sat�lan �r�nleri, kategorileri ile birlikte listeleyiniz.

select p.ProductName, cat.CategoryName 
from Products p join Categories cat on p.CategoryID = cat.CategoryID join [Order Details] od1 on p.ProductID = od1.ProductID join Orders o1 on o1.OrderID = od1.OrderID
where o1.OrderDate in (select top 10 o.OrderDate from Orders o join [Order Details] od on o.OrderID = od.OrderID)