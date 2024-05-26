


-- Ülkesi Germany, Mexico, UK olan müþterilerin sipariþleri.

select *
from Orders o
where CustomerID in (select CustomerID from Customers where Country in ('Germany', 'Mexico', 'UK'))

-- Subquerry, hem where, hem from hem de select caluse'larýnda kullanýlabilir.