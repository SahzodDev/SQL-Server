


-- �lkesi Germany, Mexico, UK olan m��terilerin sipari�leri.

select *
from Orders o
where CustomerID in (select CustomerID from Customers where Country in ('Germany', 'Mexico', 'UK'))

-- Subquerry, hem where, hem from hem de select caluse'lar�nda kullan�labilir.