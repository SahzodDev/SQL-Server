

-- UNION i�leminin yap�labilmesi i�in, select clause'lar� alt�ndaki kolon say�s� ve kolon veri tiplerinin ayn� olmas� gerekir.

select c.CategoryID, c.CategoryName
from Products p inner join Categories c on p.CategoryID = c.CategoryID
inner join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierID = 1
union all 
select c.CategoryID, c.CategoryName 
from Products p inner join Categories c on p.CategoryID = c.CategoryID inner join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierID = 2
 union all
 select c.CategoryID, c.CategoryName
 from Products p inner join Categories c on p.CategoryID = c.CategoryID
 inner join Suppliers s on p.SupplierID = s.SupplierID
 where s.SupplierID = 3