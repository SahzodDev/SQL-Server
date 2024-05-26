create database SQL_PROJE_ODEVI_121123_TEST

USE SQL_PROJE_ODEVI_121123_TEST
go

create table Indirimler
(
	IndirimID int primary key identity(1,1),
	Cesit nvarchar(50),
	Oran decimal(3,3)
)

CREATE TABLE Uyruklar
(
	UyrukID varchar(3) primary key,
	Ad nvarchar(50),
)

create table OdemeTurleri
(
	OdemeID int primary key identity(1,1),
	Ad nvarchar(50)
)

create table UcretCesitleri
(
	UcretID int primary key identity(1,1),
	Cesit nvarchar(50)
)

create table Ulkeler
(
	UlkeID varchar(3) primary key,
	Ad nvarchar(50)
)


create table GidilecekYerler
(	
	YerID int primary key identity(1,1),
	Ad nvarchar(100),
	Ucret money,
	UcretCesidi int foreign key references UcretCesitleri(UcretID)
)


create table Rehberler
(
	RehberID int primary key identity(1,1),
	Ad nvarchar(50),
	Soyad nvarchar(50),
	Cinsiyet nvarchar(50),
	Telefon nvarchar(50),
	Adres nvarchar(200) default 'Bilinmiyor'
)

create table RehberlerVeUyruklar
(
	RehberID int,
	UyrukID varchar(3),
	primary key (RehberID, UyrukID),
	foreign key (RehberID) references Rehberler(RehberID),
	foreign key (UyrukID) references Uyruklar(UyrukID)
)

create table Faturalar
(
	FaturaID int primary key identity(1,1),
	ToplamTutar money,
	OdemeTuru int foreign key references OdemeTurleri(OdemeID),
	Indirim int foreign key references Indirimler(IndirimID)
)

create table Turistler
(
	TuristID int primary key identity(1,1),
	Ad nvarchar(50),
	Soyad nvarchar(50),
	Cinsiyet nvarchar(50),
	DogumTarihi date,
	GelisTarihi date,
	Rehberi int foreign key references Rehberler(RehberID),
	Ulkesi varchar(3) foreign key references Ulkeler(UlkeID),
	Uyrugu varchar(3) foreign key references Uyruklar(UyrukID),
	FaturaID int foreign key references Faturalar(FaturaID)
)

create table TuristlerVeYerler
(
	YerID int,
	TuristID int,
	primary key(YerID, TuristID),
	foreign key (YerID) references GidilecekYerler(YerID),
	foreign key (TuristID) references Turistler(TuristID)
)

create table FaturalarVeYerler
(
	FaturaID int,
	YerID int,
	primary key(FaturaID, YerID),
	foreign key (FaturaID) references Faturalar(FaturaID),
	foreign key (YerID) references GidilecekYerler(YerID)
)

-- Ýndirimler
insert into Indirimler (Cesit, Oran)
values ('Tam', 0),
('Yarým', 0.5),
('Ýndirimli', 0.25)


-- Ödeme Türleri

insert into OdemeTurleri (Ad)
values ('Kredi Kartý'),
('Nakit')


-- Ücret Çeþitleri

insert into UcretCesitleri (Cesit)
values ('Euro'),
('Dolar')

-- Gidilecek Yerler

insert into GidilecekYerler (Ad, Ucret, UcretCesidi)
values ('Ayasofya', 25, 2), ('Yerebatan Sarnýcý', 30, 2), ('Pierre Loti', 30, 1), ('Kýz Kulesi', 20, 2), ('Adalar', 20, 1), ('Dolmabahçe Sarayý', 40, 1), ('Miniatürk', 20, 2), ('Rumeli Hisarý', 10, 1), ('Sultan Ahmet Camii', 35, 2), ('Anadolu Hisarý', 15, 2), ('Eyüp Sultan Casmii', 20, 1), ('Kapalý Çarþý', 20, 2), ('Mýsýr Çarþýsý', 20, 2), ('Atatürk Alberatom', 10, 1)

--UYRUKLAR
insert into Uyruklar(UyrukID,Ad)
values ('JP','Japanese')

insert into Uyruklar(UyrukID,Ad)
values ('GR','Greek')

insert into Uyruklar(UyrukID,Ad)
values ('FIN','Finnish')

insert into Uyruklar(UyrukID,Ad)
values ('NL','Dutch')

insert into Uyruklar(UyrukID,Ad)
values ('ENG','English')

insert into Uyruklar(UyrukID,Ad)
values ('UKR','Ukrainian')



--ÜLKELER
insert into Ulkeler(UlkeID,Ad)
values('IT','Italy')
insert into Ulkeler(UlkeID,Ad)
values('GR','Greece')
insert into Ulkeler(UlkeID,Ad)
values('ENG','England')
insert into Ulkeler(UlkeID,Ad)
values('NL','Netherlands')
insert into Ulkeler(UlkeID,Ad)
values('FIN','Finland')
insert into Ulkeler(UlkeID,Ad)
values('JP','Japan')
insert into Ulkeler(UlkeID,Ad)
values('UKR','Ukraine')

--REHBERLER

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Ozan','Temiz','Erkek','5556544343')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Bahar','Sevgin','Kadýn','5556544344')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Ömer','Uçar','Erkek','5556544345')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Linda','Callahan','Kadýn','5556544346')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Sevgi','Çakmak','Kadýn','5556544347')

-- Rehberler ve Uyruklar

insert into RehberlerVeUyruklar (RehberID, UyrukID)
values (1, 'JP'), (2, 'GR'), (3, 'FIN'), (5, 'GR'), (2, 'NL'), (1, 'FIN'), (4, 'JP'), (2, 'ENG'), (1, 'ENG'), (3, 'ENG'), (1, 'GR'), (2, 'JP'), (4, 'UKR'), (5, 'ENG')

--FATURALAR

INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(55,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(50,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(85,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(55,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(10,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(60,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(35,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(150,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(40,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(10,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(50,1,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,2,2)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(40,1,2)

-- FATURALAR VE YERLER

