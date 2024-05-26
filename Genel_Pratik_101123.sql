
-- Hangi üründen toplam ne kadar hasýlat elde ettim? Ürün ismi ve hasýlatý

select p.ProductName, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) Revenue
from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName

-- Hangi kategorili üründen, hangi müþteriye, toplam ne kadarlýk ürün (fiyat) satýlmýþtýr?

select cat.CategoryName, c.CustomerID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) Revenue
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID join Products p on od.ProductID = p.ProductID join Categories cat on p.CategoryID = cat.CategoryID
group by cat.CategoryName, c.CustomerID

-- Baþ harfi A_K arasýnda ve stok miktarý 5 - 50 arasýnda olan ürün sayýsýný kategori bazýnda listeleyiniz. Ürün sayýsýna göre azalan.
-- Kategori adý, Ürün sayýsý

select cat.CategoryName, count(p.ProductID) 'Ürün Sayýsý'
from Products p join Categories cat on p.CategoryID = cat.CategoryID
where p.ProductName like '[A-K]%' and (p.UnitsInStock between 5 and 50)
group by cat.CategoryName
order by count(p.ProductID) desc

-- Sipariþlerdeki toplam ürün sayýsý 200'den fazla olan ürünleri Ürün Sayýsýna göre artan sýrada listeleyin.
-- OrderID, UrunSayisi

select od.OrderID, sum(od.Quantity)
from [Order Details] od
group by od.OrderID
having sum(od.Quantity) > 200	-- where clause group by'dan önce, having clause group by'dan sonra kullanýlýr.
order by 2

-- 23 ID'li üründen, 20 adetten fazla sipariþ veren müþteri listesi.

select c.CompanyName, sum(od.Quantity) 'Sipariþ Adedi'
from Orders o 
join [Order Details] od on o.OrderID = od.OrderID 
join Customers c on o.CustomerID = c.CustomerID
where od.ProductID = 23
group by c.CompanyName
having sum(od.Quantity) > 20

-- Nancy isimli çalýþanýn aldýðý sipariþleri ve tutarlarý listeleyiniz. Tutara göre pahalýdan ucuza sýralayýnýz.

select o.OrderID, (od.UnitPrice * od.Quantity * (1 - od.Discount)) Tutar
from Orders o 
join Employees e on o.EmployeeID = e.EmployeeID
join [Order Details] od on o.OrderID = od.OrderID
where e.FirstName = 'Nancy'
order by Tutar desc

-- Her müþterinin son sipariþ tarihlerini listeleyiniz.
-- MüþteriID, sipariþ tarihi

select c.CustomerID, (select top 1 o1.OrderDate from Orders o1 where c.CustomerID = o1.CustomerID order by o1.OrderDate desc)
from Customers c join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID

-- Sipariþlerinin toplam cirosu 50000'den yüksek olan firmalarý listeleyiniz.
-- Müþteri Þirket Adý - Toplam Ciro

select c.CompanyName, sum((od.UnitPrice * od.Quantity * (1 - od.Discount))) Ciro
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by c.CompanyName
having sum((od.UnitPrice * od.Quantity * (1 - od.Discount))) > 50000

-- Ürün stokta varsa 'Stokta Var', yoksa 'Stokta Yok' yazsýn.

select p.ProductName, (p.UnitsInStock - p.UnitsOnOrder) as Stockage,
case
	when (p.UnitsInStock - p.UnitsOnOrder) >= 0 then 'In Stock'
	else 'Out of Stock'
	end as StockStatus
from Products p

-- Birim fiyatý ortalamanýn üzerinde olan ürünleri listeleyin.

select p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > (select avg(p1.UnitPrice) from Products p1)

-- Ürünler arasýnda en yüksek fiyatlý ürün hangisi ve fiyhatý?

select p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice = (select max(p1.UnitPrice) from Products p1)

-- Son 10 sipariþte satýlan ürünleri, kategorileri ile birlikte listeleyiniz.

select p.ProductName, cat.CategoryName 
from Products p join Categories cat on p.CategoryID = cat.CategoryID join [Order Details] od1 on p.ProductID = od1.ProductID join Orders o1 on o1.OrderID = od1.OrderID
where o1.OrderDate in (select top 10 o.OrderDate from Orders o join [Order Details] od on o.OrderID = od.OrderID)