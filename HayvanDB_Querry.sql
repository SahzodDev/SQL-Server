
create database HayvanBakimDB

use HayvanBakimDB
go

create table Bakicilar
(
	BakiciID int primary key identity(1,1),
	Ad nvarchar(50)
)

create table Sahipler
(
	SahipID int primary key identity(1,1),
	Ad nvarchar(50)
)

create table Yiyecekler
(
	YiyecekID int primary key identity(1,1),
	Ad nvarchar(50),
	Icerik nvarchar(90),
	Kalori int
)

create table Hayvanlar
(
	HayvanID int primary key identity(1,1),
	Ad nvarchar(50),
	FavoriYiyecek int foreign key references Yiyecekler(YiyecekID),
	Cinsiyet nvarchar(10),
	SahibiVarMi bit,
	DogumTarihi datetime,
	Agirlik decimal,
	Tur nvarchar(40),
	Cins nvarchar(40),
	BakiciID int foreign key references Bakicilar(BakiciID),
	SahipID int foreign key references Sahipler(SahipID)
)

create table HayvanlarVeYiyecekler
(
	HayvanID int,
	YiyecekID int,
	primary key (HayvanID, YiyecekID),
	foreign key (HayvanID) references Hayvanlar(HayvanID),
	foreign key (YiyecekID) references Yiyecekler(YiyecekID)
)
