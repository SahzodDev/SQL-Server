
-- Bir ArabaDB database'i olu�turun

-- Arabalar Tablosu :
	-- ArabaID (Identity)
	-- Marka
	-- Model
	-- UretimYili
	-- UlkeID

-- Araba Detaylar� Tablosu :
	-- ArabaDetaylariID (Identity)
	-- SasiNo
	-- Renk
	-- Paket
	-- ArabaID

-- Ulkeler Tablosu :
	-- UlkeID
	-- UlkeAdi
	-- Kita

Create database ArabaDB

use ArabaDB
go

create table Arabalar
(
	ArabaID int primary key identity(1,1),
	Marka nvarchar(50) NOT NULL,
	Model nvarchar(50) NOT NULL,
	UretimYili datetime,
	UlkeID int 
)

create table ArabaDetaylari
(
	ArabaDetaylariID int primary key identity(1,1),
	SasiNo nvarchar(50),
	Renk nvarchar(15),
	Paket nvarchar(10),
	ArabaID int foreign key references Arabalar(ArabaID)
)

create table Ulkeler
(
	UlkeID int primary key identity(1,1),
	UlkeAdi nvarchar(20),
	Kita nvarchar(10)
)

alter table Arabalar

add constraint FK_Arabalar_Ulkeler

Foreign key (UlkeID) references Ulkeler(UlkeID)

alter table ArabaDetaylari

add constraint UC_ArabaDetaylari unique (SasiNo)

alter table Arabalar
drop constraint FK_Arabalar_Ulkeler

alter table Ulkeler
drop constraint PK__Ulkeler__DDFD2C825D5A7EE9

alter table Ulkeler
drop column UlkeID

alter table Ulkeler
add UlkeID nvarchar(10)

alter table Ulkeler
alter column UlkeID nvarchar(10) NOT NULL

alter table Ulkeler
add constraint PK_UlkeID primary key (UlkeID)

alter table Arabalar
alter column UlkeID nvarchar(10)

alter table Arabalar
add constraint FK_UlkeID_Ulkeler 
foreign key (UlkeID) references Ulkeler(UlkeID)

alter table Ulkeler
alter column UlkeAdi nvarchar(80)

alter table Ulkeler
alter column Kita nvarchar(80)

-- �lkeler tablosuna 3 �lke ekleyiniz.
-- ID TR - Turkey - Asia

insert into Ulkeler ([UlkeID], [UlkeAdi], [Kita])
values('TR', 'Turkey', 'Asia'), ('RU', 'Russian Federation', 'Europe'), ('US', 'United States of America', 'North America')

insert into Arabalar ([Marka], [Model], [UretimYili], [UlkeID]) values ('BMW', '3', '5.01.2002', 'TR'), ('Mercedes', 'AMG', '12.08.2020', 'TR'), ('Toyota', 'Avensis', '03.01.2002', 'TR'), ('Porsche', 'Cayman', '04.01.2002', 'TR'), ('Maserati', 'GT', '05.01.2002', 'TR')

select * from Arabalar

select * from Ulkeler

-- ID'si 5 olan araban�n modelini 'Yeni' olarak de�i�tiriniz.

update Arabalar
set Model = 'Yeni'
where ArabaID = 5

-- Arabalar Tablosuna 'Araba�retildiMi' kolonu ekleyiniz.

alter table Arabalar
add ArabaUretildiMi bit

-- Bu kolonu siliniz

alter table Arabalar
drop column ArabaUretildiMi

-- ArabaDetaylari tablosundaki ArabaID kolonunu siliniz.

alter table ArabaDetaylari
drop constraint FK__ArabaDeta__Araba__398D8EEE

alter table ArabaDetaylari
drop column ArabaID

select * from ArabaDetaylari


create database UrunDB
go
use UrunDB
go

create table Urunler
(
	UrunID int primary key identity(1,1),
	Marka nvarchar(10),
	UrunAd nvarchar(15),
	SirketID int foreign key references Sirketler(SirketID)
)

create table Sirketler
(
	SirketID int primary key identity(1,1),
	SirketAd nvarchar(15),
	SirkeyAdres nvarchar(50)
)

create table SirketDetaylar
(
	SirketID int foreign key references Sirketler(SirketID),
	VergiDairesi nvarchar(25) default 'Kad�k�y',
	VergiNo bigint,
	MersisNo bigint
)

-- Vergi No Unique yapal�m.

alter table SirketDetaylar
add constraint UC_VergiNo unique (VergiNo)

-- Yeni bir tablo olu�turunuz. ID ve Aciklama kolonlar� olsun.

create table YeniTablo
(
	YeniTabloID int primary key identity(1,1),
	Aciklama nvarchar(100)
)

-- Yeni tabloya UrunID foreign key'i eklensin.

alter table YeniTablo
add UrunID int

alter table YeniTablo
add constraint FK_UrunID_Urunler 
foreign key (UrunID) references Urunler(UrunID)

select * from YeniTablo

-- YeniTablo i�erisindeki t�m datalar� siliniz

delete YeniTablo

-- YeniTablo'yu siliniz.

drop table YeniTablo

-- Database'i siliniz.

drop database UrunDB

-- delete ile fark�, delete datalar� sildikten sonra arka plandaki identity yap�s�n�n devaml�l���n� sa�l�yor. Yani delete ile silinen tabloya yeni veriler eklendi�inde, identity say�lar� en son silinen sat�rdan itibaren numaraland�r�l�yor. Ancak truncate kullan�ld���nda ise, arka plandaki identity say�lar� s�f�rlan�yor. Yani trucnate edilen bir tabloya eklenen yeni veriler en ba�tan numaraland�r�l�yor.

truncate table YeniTablo