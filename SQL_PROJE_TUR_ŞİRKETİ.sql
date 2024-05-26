create database TurSirketiDB

use TurSirketiDB
go


create table Rehberler
(
	RehberID int primary key identity(1,1),
	Ad nvarchar(100),
	Soyad nvarchar(100),
	Cinsiyet nvarchar(20),
	Telefon nvarchar(50),
	Adres nvarchar(200),
	Dil varchar(3) foreign key references Uyruklar(UyrukID),

)

create table Turistler
(
	TuristID int primary key identity(1,1),
	Ad nvarchar(100),
	Soyad nvarchar(100),
	Cinsiyet nvarchar(50),
	DogumTarihi datetime,
	GelisTarihi datetime,
	Rehberi int foreign key references Rehberler(RehberID),
	Ulkesi int foreign key references Ulkeler(UlkeID),
	Uyrugu varchar(3) foreign key references Uyruklar(UyrukID)
)

create table Yerler
(
	YerID int primary key identity(1,1),
	Ad nvarchar(150),
	Ucret money,
	UcretTuru int

)

create table Uyruklar
(
	UyrukID varchar(3) primary key,
	Ad nvarchar(20)
)

create table Indirimler
(
	IndirimID int primary key identity(1,1),
	IndirimCesidi nvarchar(50)
)

create table Ulkeler
(
	UlkeID int primary key identity(1,1),
	Ad nvarchar(50)
)

create table UcretCesitleri
(
	UcretID int primary key identity(1,1),
	Cesit nvarchar(20)
)

create table TuristlerVeYerler
(
	YerID int,
	TuristID int,
	primary key(YerID, TuristID),
	foreign key (YerID) references Yerler(YerID),
	foreign key (TuristID) references Turistler(TuristID)
)

alter table Yerler
add constraint fk_yerler_ucretler
foreign key (UcretTuru) references UcretCesitleri(UcretID) 

create table OdemeTurleri
(
	OdemeTuruID int primary key identity(1,1),
	OdemeTuru nvarchar(50)
)

create table Faturalar
(
	FaturaID int primary key identity(1,1),
	ToplamTutar money,
	OdemeTuru int foreign key references OdemeTurleri(OdemeTuruID)
)

create table FaturalarVeYerler
(
	FaturaID int,
	YerID int,
	primary key (FaturaID, YerID),
	foreign key (FaturaID) references Faturalar( FaturaID)
)



alter table FaturalarVeYerler
add constraint fk_this_yerler
foreign key (YerID) references Yerler(YerID)

alter table Turistler
add FaturaID int unique

alter table Turistler
add constraint fk_turistler_faturalar
foreign key (FaturaID) references Faturalar(FaturaID)

create table RehberlerVeUyruklar
(
	RehberID int,
	UyrukID varchar(3),
	primary key (RehberID, UyrukID),
	foreign key (RehberID) references Rehberler(RehberID),
	foreign key (UyrukID) references Uyruklar(UyrukID)

)


alter table Rehberler
alter column Ad nvarchar(100) not null

alter table Rehberler
alter column Soyad nvarchar(100) not null

alter table Rehberler
alter column Cinsiyet nvarchar(20) not null

alter table Rehberler
alter column Telefon nvarchar(50) not null

alter table Turistler
alter column Ad nvarchar(100) not null

alter table Turistler
alter column Soyad nvarchar(100) not null

alter table Turistler
alter column Cinsiyet nvarchar(50) not null

alter table Turistler
alter column GelisTarihi datetime not null

alter table Turistler
alter  column Ulkesi int not null

alter table Turistler
alter column Uyrugu varchar(3) not null

alter table Faturalar
add Indirim int foreign key references Indirimler(IndirimID)

-- �lke ID data type de�i�ecek.

alter table Rehberler
add constraint df_adres
default 'Bilinmiyor' for Adres

--1-Rehberlerimin bu zamana kadar ilgilendikleri t�m turistleri �lke ve uyruk bilgileri ile getiriniz.

--2-Her bir tur i�in indirimli, tam, yar�m fiyat�n� listeleyen sorguyu yaz�n. Zam veya indirim uygulanm�� turlar�n da ge�mi�e y�nelik t�m fiyat bilgisi gelsin.
--Rapor �u �ekilde olmal�;
--Ayasofya | Tam | 120 | 2015-05-05
--Ayasofya | Yar�m | 60 | 2015-05-05   ....vb

--3-�u zamana kadar yap�lan en pahal� tura hangi turistim dahil olmu�, bu turun �demesini kim yapm�� ve bu turiste hangi tur rehberi atanm��? Ayn� fiyat bilgisine sahip di�er kay�tlar da gelsin.

--4-Almanya uyruklu turistlerimden tam bilet ile tura kat�lan turistlerim nereleri hangi tur rehberi ile ziyaret etmi�.

--5-�ngilizce bildi�i halde �lkesi de uyru�u da �ngiltere olmayan turistlere rehberlik eden tur rehberlerim kimler? �lgilendi�i turist bilgileri ile beraber raporlans�n.

--6-Listemde oldu�u halde rehberlerimin bildi�i diller aras�nda yer almayan diller hangileridir?

--7-�lkesi Japonya olan m��terilerim fatura �demelerini hangi para biriminde yapm��lar. (Turist Ad, Soyad, �lke, FaturaTarihi, �deme�ekli, ParaBirimi)

--8-Nakit �deme yapmamay� tercih eden m��terilerim hangi �lkelerden (Sorguyu di�er �deme �ekil(ler)ini bilmiyormu� gibi yaz�n�z)