

Create Database RestoranDB -- Database yaratma

Use RestoranDB
Go

Create Table Musteriler
(
	MusteriID int Primary key identity(1,1),
	MusteriAdi nvarchar(100) NOT NULL,
	MusteriSoyadi nvarchar(100) NOT NULL
)

Create Table MusteriDetay
(
	MusteriID int UNIQUE Foreign key references Musteriler(MusteriID),
	Adres nvarchar(250) NULL,
	TelefonNo nvarchar(20),
	Ulke nvarchar(40) DEFAULT('Turkiye')
)

Create Table Siparisler
(
	SiparisID int primary key identity(1,1),
	MusteriID int Foreign key references Musteriler(MusteriID),
	Urun nvarchar(50),
	Adet int,
	BirimFiyat decimal(18,2),
	ToplamTutar as (BirimFiyat * Adet),
	SiparisTarihi as GetDate()
)

INSERT into Musteriler Values('John', 'Doe'), ('Jane', 'Doe'), ('Tom', 'Doe'), ('Philip', 'Doe')

select * from Musteriler
select * from MusteriDetay

insert into MusteriDetay values(1, 'Kadýköy', '9764325135', 'Türkiye')
insert into MusteriDetay([MusteriID], [Adres], [TelefonNo]) values(2, 'Bakýrköy', '56656564564')

insert into MusteriDetay([MusteriID], [Adres], [TelefonNo]) values(2, 'Bakýrköy', '56656564564') -- MusteriID, unique key olarak tanýmlandýðý için ayný id deðerine sahip 2. bir veri giriþi yapýalmýyor.

insert into Siparisler(MusteriID, Urun, Adet, BirimFiyat)
values(1, 'Sample Text', 2, 15)

select * from Siparisler

Alter table Siparisler
Add SiparisAlan nvarchar(100) NULL

Alter table MusteriDetay
Add Email nvarchar(50)

Alter table MusteriDetay
Drop column Email

Alter table Siparisler
Drop column SiparisAlan

Drop table Siparisler
drop table MusteriDetay

select * from Musteriler

Delete Musteriler -- Kayýtlarý siler

/*
	Transactional: DELETE is a logged operation on a per-row basis. This means each row deletion is recorded in the transaction log, which makes it a slower operation for large numbers of rows but allows it to be rolled back if it's part of a transaction.
Conditional: You can use a WHERE clause to specify which rows to delete. If you omit the WHERE clause, all rows will be removed, similar to TRUNCATE.
Fires Triggers: If there are any delete triggers on the table, DELETE will cause those triggers to fire.
Uses Table Locks: DELETE generally holds row-level locks or page-level locks during the operation.
Retention of Identity Seed: It does not reset the identity of the table. If the table contains an identity column, the identity seed will continue incrementing from the last value.
*/

truncate table Musteriler

/*
	Non-Transactional (with exceptions): TRUNCATE is minimally logged and deallocates whole data pages. The deallocation of data pages means it's much faster for removing all rows from a table. However, TRUNCATE can be part of a transaction and rolled back in that context.
Non-Conditional: You cannot specify a WHERE clause with TRUNCATE. It will remove all rows from the table.
Does Not Fire Triggers: TRUNCATE does not activate triggers, because it does not log row deletions. However, beginning with SQL Server 2016 (13.x), if a table has an AFTER TRIGGER defined, it will fire once for a TRUNCATE operation.
Uses Table Locks: TRUNCATE typically holds a table-level lock during the operation.
Reset of Identity Seed: TRUNCATE resets the identity of the table. If the table has an identity column, the identity seed will be reset to its seed value.
*/

INSERT into Musteriler Values('John', 'Doe'), ('Jane', 'Doe'), ('Tom', 'Doe'), ('Philip', 'Doe')

drop database RestoranDB -- Deletes the entire database.