
          -- VÝEW ÖRNEKLER --
-- Hangi müþterim benden ne kadarlýk alýþveriþ yapmýþ? View ile gösteriniz.

create view dbo.View_CustomerPurchase
as
select c.CompanyName 'Müþteri Þirketi', sum(od.Quantity * od.UnitPrice * (1 - od.Discount)) 'Alýþveriþ Tutarý'
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by c.CompanyName

select * from dbo.View_CustomerPurchase

-- Her bir sipariþteki toplam ürün sayýsýný getiren View oluþturunuz.

create view VW_QuantityPerOrders
as
select o.OrderID, sum(od.Quantity) TotalProductQuantity
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by o.OrderID

select * from VW_QuantityPerOrders 

-- Az önceki View'ý yanlýþ oluþturmuþum, toplam ürün sayýsý 100'den fazla oalcak þekilde güncelelyiniz.

alter view VW_QuantityPerOrders
as
select o.OrderID, sum(od.Quantity) TotalProductQuantity
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on o.CustomerID = c.CustomerID
group by o.OrderID
having sum(od.Quantity) > 100

select * from VW_QuantityPerOrders 

-- Çalýþanlarýmý ilgilendikleri sipariþler ile birlikte geiren view'ý yazýnýz.
-- Kolonlar : Çalýþan ad + soyad, Sipariþ No, Sipariþ Tarihi

create view VW_EmployeeOrders
as
select e.FirstName + ' ' + e.LastName 'Çalýþan Ad Soyad', o.OrderID, o.OrderDate
from Orders o join Employees e on o.EmployeeID = e.EmployeeID

select * from VW_EmployeeOrders

-- En çok satýlan 10 ürünü listeleyin View'i yazýnýz.

create view VW_BestSellerProducts
as
select top 10 p.ProductName, sum(od.Quantity) 'Satýþ Adedi'
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
group by p.ProductName
order by sum(od.Quantity) desc

select * from VW_BestSellerProducts

           -- FUNCTION ÖRNEKLER --

-- Girilen deðere göre, stokta daha az olan ürünleri dönen fonksiyonu yazýnýz.

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

-- Verilen OrderID'den elde edilen toplam fiyatý (table) dönen Function()

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

-- Verilen OrderID'den elde edilen toplam fiyatý (money) dönen Function()

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



                  -- PROCEDURE ÖRNEKLER --

-- Employees tablosunda, yaþadýðý region'lar NULL olmayan çalýþanlarýn Ad, Soyad ve Görev'lerini listeleyen bir SP yazýnýz.

create procedure SP_NonNull_Employees
as
select e.FirstName, e.LastName, e.Title
from Employees e
where e.Region is not null

execute SP_NonNull_Employees

-- KategoriID'si alan ve bu ID'ye ilgili kategoriye ait ürünleri listeleyen SP yazýnýz...

create procedure SP_ProductPerCategory
@CategoryID int
as
select p.ProductID, p.ProductName, cat.CategoryName
from Categories cat join Products p on cat.CategoryID = p.CategoryID
where p.CategoryID = @CategoryID

execute SP_ProductPerCategory
@CategoryID = 6

-- Verilen OrderID'ye göre eðer toplam tutar 1000'den fazla ise "1000'den fazla", deðilse "1000'den az" diye ekrana yazan procedure yazýnýz.

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


