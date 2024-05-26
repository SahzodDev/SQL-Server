/*
	UPDATE <tablo_adi> SET <kolon_adi> = deger1, <kolon2_adi> = deger2, ...

	UPDATE <tablo_adi> SET <kolon_adi> = deger1, <kolon2_adi> = deger2, ...
	where <filter_kolon_adi> = filterdegeri
*/

-- select * into Employees1 from Employees -- Yede�ini al�yoruz



update Employees1
set LastName = 'Kral'
where EmployeeID = 7

update Employees1
set LastName = 'Kral'	-- E�er update komutu kullan�l�rken, where clause'u yaz�lmazsa t�m kay�tlar� update eder.

update Employees1 set TitleOfCourtesy = 'Bay'
where TitleOfCourtesy = 'Mr.'




/*
	DELETE FROM <tablo_adi> -Tablodaki t�m kay�tlar� siler.
	DELETE FROM <tablo_adi> WHERE <kolon_adi> = filtredegeri
*/

delete from Employees1 where EmployeeID = 5

delete from Employees1 where TitleOfCourtesy in ('Ms.', 'Mrs.', 'Miss')

delete from Employees1 -- Tablodaki t�m verileri siler

drop table Employees1 -- Tabloyu siler

--select * from Employees1