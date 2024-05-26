

/*
	INSERT INTO <tablo_adi> VALUES(deger1, deger2, deger3, ...)
	INSERT INTO <tablo_adi> (kolon1, kolon2, kolon3, ...) VALUES (deger1, deger2, deger3, ...)
*/

--INSERT INTO Categories(CategoryName, [Description])
--values('Meyveler', 'Mevsim Meyveleri')

--INSERT INTO Categories(Description, CategoryName)
--values('Mevsim Sebzeleri', 'Sebzeler')

--insert into Categories(Description) Values('Herhangi bir açýklama') -- Error because the new row has an empty category name. The category name column does not allow for null values.

--select * from Categories

insert into Employees(FirstName, LastName, TitleOfCourtesy, Title)
values('John', 'Doe', 'Mr.', 'Owner')

select * from Employees

insert into Employees(FirstName, LastName, TitleOfCourtesy, Title)
values('Sample text for FirstName', 'Doe', 'Mr.', 'Owner') -- Error because the value inserted exceeds the column length.