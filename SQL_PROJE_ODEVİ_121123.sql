

create database SQL_PROJE_ODEVI_121123

USE SQL_PROJE_ODEVI_121123
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
	Ad nvarchar(100) NOT NULL,
	Ucret money NOT NULL,
	UcretCesidi int foreign key references UcretCesitleri(UcretID) NOT NULL
)


create table Rehberler
(
	RehberID int primary key identity(1,1),
	Ad nvarchar(50) NOT NULL,
	Soyad nvarchar(50) NOT NULL,
	Cinsiyet nvarchar(50) NOT NULL,
	Telefon nvarchar(50) NOT NULL,
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
	ToplamTutar money NOT NULL,
	OdemeTuru int foreign key references OdemeTurleri(OdemeID) NOT NULL,
	Indirim int foreign key references Indirimler(IndirimID) NOT NULL
)

create table Turistler
(
	TuristID int primary key identity(1,1),
	Ad nvarchar(50) NOT NULL,
	Soyad nvarchar(50) NOT NULL,
	Cinsiyet nvarchar(50) NOT NULL,
	DogumTarihi date NOT NULL,
	GelisTarihi date NOT NULL,
	Rehberi int foreign key references Rehberler(RehberID) NOT NULL,
	Ulkesi varchar(3) foreign key references Ulkeler(UlkeID) NOT NULL,
	Uyrugu varchar(3) foreign key references Uyruklar(UyrukID) NOT NULL,
	FaturaID int foreign key references Faturalar(FaturaID) NOT NULL
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