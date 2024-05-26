
          -- V�EW �RNEKLER --
-- Hangi m��terim benden ne kadarl�k al��veri� yapm��? View ile g�steriniz.

create view dbo.View_CustomerPurchase
as
select c.CompanyName 'M��teri �irketi', sum(od.Quantity * od.UnitPrice * (1 - od.Discount)) 'Al��veri� Tutar�'
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by c.CompanyName

select * from dbo.View_CustomerPurchase

-- Her bir sipari�teki toplam �r�n say�s�n� getiren View olu�turunuz.

create view VW_QuantityPerOrders
as
select o.OrderID, sum(od.Quantity) TotalProductQuantity
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by o.OrderID

select * from VW_QuantityPerOrders 

-- Az �nceki View'� yanl�� olu�turmu�um, toplam �r�n say�s� 100'den fazla oalcak �ekilde g�ncelelyiniz.

alter view VW_QuantityPerOrders
as
select o.OrderID, sum(od.Quantity) TotalProductQuantity
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by o.OrderID
having sum(od.Quantity) > 100

select * from VW_QuantityPerOrders 

-- �al��anlar�m� ilgilendikleri sipari�ler ile birlikte geiren view'� yaz�n�z.
-- Kolonlar : �al��an ad + soyad, Sipari� No, Sipari� Tarihi

create view VW_EmployeeOrders
as
select e.FirstName + ' ' + e.LastName '�al��an Ad Soyad', o.OrderID, o.OrderDate
from Orders o join Employees e on o.EmployeeID = e.EmployeeID

select * from VW_EmployeeOrders

-- En �ok sat�lan 10 �r�n� listeleyin View'i yaz�n�z.

create view VW_BestSellerProducts
as
select top 10 p.ProductName, sum(od.Quantity) 'Sat�� Adedi'
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
group by p.ProductName
order by sum(od.Quantity) desc

select * from VW_BestSellerProducts

           -- FUNCTION �RNEKLER --

-- Girilen de�ere g�re, stokta daha az olan �r�nleri d�nen fonksiyonu yaz�n�z.

create function fn_StokDurum
(
	@Deger int = 0
)
returns table
as
return select p.*
from Products p
where p.UnitsInStock < @Deger

select * from fn_StokDurum (50)

-- Verilen OrderID'den elde edilen toplam fiyat� (table) d�nen Function()

create function fn_ToplamFiyatDon
(
	@OrderID int
)
returns table
as
return select od.OrderID, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) 'Fiyat'
from [Order Details] od
group by od.OrderID
having od.OrderID = @OrderID

select * from fn_ToplamFiyatDon (10248)

-- Verilen OrderID'den elde edilen toplam fiyat� (money) d�nen Function()

create function fn_ToplamFiyatDonMoney
(
	@OrderID int
)
returns money
as
begin
	declare @sonuc money
	select @sonuc = sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) from [Order Details] od where od.OrderID = @OrderID
	return @sonuc
end

select dbo.fn_ToplamFiyatDonMoney(10248)



                  -- PROCEDURE �RNEKLER --

-- Employees tablosunda, ya�ad��� region'lar NULL olmayan �al��anlar�n Ad, Soyad ve G�rev'lerini listeleyen bir SP yaz�n�z.

create procedure SP_NonNull_Employees
as
select e.FirstName, e.LastName, e.Title
from Employees e
where e.Region is not null

execute SP_NonNull_Employees

-- KategoriID'si alan ve bu ID'ye ilgili kategoriye ait �r�nleri listeleyen SP yaz�n�z...

create procedure SP_ProductPerCategory
@CategoryID int
as
select p.ProductID, p.ProductName, cat.CategoryName
from Categories cat join Products p on cat.CategoryID = p.CategoryID
where p.CategoryID = @CategoryID

execute SP_ProductPerCategory
@CategoryID = 6

-- Verilen OrderID'ye g�re e�er toplam tutar 1000'den fazla ise "1000'den fazla", de�ilse "1000'den az" diye ekrana yazan procedure yaz�n�z.

create procedure SP_ReturnPriceBasedOn1000
@OrderID int
as
declare @TotalFiyat decimal(8,2)
select @TotalFiyat = sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) from [Order Details] od where od.OrderID = @OrderID
if @TotalFiyat < 1000
begin
	--print(@TotalFiyat)
	print('1000 den az')
end
else
begin
	--print(@TotalFiyat)
	print('1000 den fazla')
end

execute SP_ReturnPriceBasedOn1000 
@OrderID = 10248



execute SP_ReturnPriceBasedOn1000 
@OrderID = 10546


