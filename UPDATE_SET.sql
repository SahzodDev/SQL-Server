/*
	UPDATE <tablo_adi> SET <kolon_adi> = deger1, <kolon2_adi> = deger2, ...

	UPDATE <tablo_adi> SET <kolon_adi> = deger1, <kolon2_adi> = deger2, ...
	where <filter_kolon_adi> = filterdegeri
*/

-- select * into Employees1 from Employees -- Yedeðini alýyoruz



update Employees1
set LastName = 'Kral'
where EmployeeID = 7

update Employees1
set LastName = 'Kral'	-- Eðer update komutu kullanýlýrken, where clause'u yazýlmazsa tüm kayýtlarý update eder.

update Employees1 set TitleOfCourtesy = 'Bay'
where TitleOfCourtesy = 'Mr.'




/*
	DELETE FROM <tablo_adi> -Tablodaki tüm kayýtlarý siler.
	DELETE FROM <tablo_adi> WHERE <kolon_adi> = filtredegeri
*/

delete from Employees1 where EmployeeID = 5

delete from Employees1 where TitleOfCourtesy in ('Ms.', 'Mrs.', 'Miss')

delete from Employees1 -- Tablodaki tüm verileri siler

drop table Employees1 -- Tabloyu siler

--select * from Employees1