

create database BurgerDB



create table Menuler

(
	MenuID int primary key identity(1,1),
	MenuAdi nvarchar(50),
	Fiyat money
)

create table Boylar
(
	BoyID int primary key identity(1,1),
	BoyAdi nvarchar(50),
	FiyatFarki smallmoney
)

create table Siparisler
(
	SiparisID int primary key identity(1,1),
	MenuID int foreign key references Menuler(MenuID),
	MenuAdedi int,
	BoyID int foreign key references Boylar(BoyID),
	ToplamFiyat money
)

create table EkstraMalzemeler
(
	EkstraMalzemeID int primary key identity(1,1),
	EkstraMalzemeAdi nvarchar(50),
	Fiyat money
)

create table SiparislerVeEkstraMalzemeler
(
	EkstraMalzemeID int,
	SiparisID int,
	primary key (EkstraMalzemeID, SiparisID),
	foreign key (EkstraMalzemeID) references EkstraMalzemeler(EkstraMalzemeID),
	foreign key (SiparisID) references Siparisler(SiparisID)
)