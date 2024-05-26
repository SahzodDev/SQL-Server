


-- Ülkesi Germany, Mexico, UK olan müşterilerin siparişleri.

select *
from Orders o
where CustomerID in (select CustomerID from Customers where Country in ('Germany', 'Mexico', 'UK'))

-- Subquerry, hem where, hem from hem de select caluse'larında kullanılabilir.