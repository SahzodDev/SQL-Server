
-- INNER JOIN Her iki tablodaki eþleþen kayýtlarý döner

select o.OrderID, o.OrderDate, od.ProductID, od.Quantity, od.UnitPrice, od.Discount
from Orders o inner join [Order Details] od
on o.OrderID = od.OrderID
where o.OrderID = 10273

select * into #tmpOrders from Orders
select * into #tmpOrderDetails from [Order Details]

select * from #tmpOrders
select * from #tmpOrderDetails

select count(OrderID) from #tmpOrders
select count(distinct OrderID) from #tmpOrderDetails

Delete #tmpOrders where OrderID in(10273, 10248, 10249, 10250)

Delete #tmpOrderDetails where OrderID in (10251, 10252, 10253, 10254)

select o.*, od.*
from #tmpOrders o inner join #tmpOrderDetails od
on o.OrderID = od.OrderID
where o.OrderID in (10273, 10248, 10249, 10250, 10251, 10252, 10253, 10254)

-- LEFT OUTER JOIN 

select o.OrderID, o.OrderDate, od.*
from #tmpOrders o left outer join #tmpOrderDetails od
on o.OrderID = od.OrderID
-- where od.OrderID in (10273, 10248, 10249, 10250)
where o.OrderID in (10251, 10252, 10253, 10254)


-- RIGHT OUTER JOIN

select o.OrderID, o.OrderDate, od.*
from #tmpOrders o right outer join #tmpOrderDetails od
on o.OrderID = od.OrderID
where od.OrderID in (10273, 10248, 10249, 10250)
-- where o.OrderID in (10251, 10252, 10253, 10254)

-- FULL OUTER JOIN

select o.OrderID, o.OrderDate, od.*
from #tmpOrders o full outer join #tmpOrderDetails od
on o.OrderID = od.OrderID

drop table #tmpOrders
drop table #tmpOrderDetails



