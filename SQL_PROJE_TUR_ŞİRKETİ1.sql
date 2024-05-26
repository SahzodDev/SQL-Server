

create database TurSirketiDB

use TurSirketiDB
go

--create table UcretCesitleri -- Check
--(
--	UcretID int primary key identity(1,1) not null,
--	Cesit nvarchar(20) not null
--)

--create table Ulkeler -- Check
--(
--	UlkeID varchar(3) primary key not null,
--	Ad nvarchar(50) not null
--)

--create table Uyruklar
--(
--	UyrukID varchar(3)not null primary key,
--	Ad nvarchar(20) not null
--)

--create table Indirimler
--(
--	IndirimID int not null primary key identity(1,1),
--	IndirimCesidi nvarchar(50) not null,
--	IndirimOrani decimal(3,3)
--)

--create table Yerler
--(
--	YerID int not null primary key identity(1,1),
--	Ad nvarchar(150) not null,
--	Ucret MONEY not null,
--	UcretTuru int foreign key references UcretCesitleri(UcretID) not null

--)
--create table Rehberler
--(
--	RehberID int primary key identity(1,1),
--	Ad nvarchar(100)  not null,
--	Soyad nvarchar(100) not null,
--	Cinsiyet nvarchar(20) not null,
--	Telefon nvarchar(50) not null,
--	Adres nvarchar(200) default 'Bilinmiyor',
--	Dil varchar(3) not null foreign key references Uyruklar(UyrukID),
--)

--create table Turistler
--(
--	TuristID int primary key identity(1,1) not null,
--	Ad nvarchar(100) not null,
--	Soyad nvarchar(100) not null,
--	Cinsiyet nvarchar(50) not null,
--	DogumTarihi datetime not null,
--	GelisTarihi datetime not null,
--	Rehberi int not null foreign key references Rehberler(RehberID),
--	Ulkesi varchar(3) not null foreign key references Ulkeler(UlkeID),
--	Uyrugu varchar(3) not null foreign key references Uyruklar(UyrukID)
--)



--create table OdemeTurleri
--(
--	OdemeTuruID int primary key identity(1,1),
--	OdemeTuru nvarchar(50)
--)

--create table Faturalar
--(
--	FaturaID int primary key identity(1,1),
--	ToplamTutar money,
--	OdemeTuru int foreign key references OdemeTurleri(OdemeTuruID),
--	Indirim int foreign key references Indirimler(IndirimID),
--	TuristID int foreign key references Turistler(TuristID) unique
--)

alter table Turistler
add FaturaID int foreign key references Faturalar(FaturaID)

alter table Turistler
Add constraint UQ_FaturaID
unique(FaturaID)

--create table TuristlerVeYerler
--(
--	YerID int not null,
--	TuristID int not null,
--	primary key(YerID, TuristID),
--	foreign key (YerID) references Yerler(YerID),
--	foreign key (TuristID) references Turistler(TuristID)
--)

--create table FaturalarveYerler
--(
--FaturaID int not null,
--YerID int not null,
--primary key (FaturaID,YerID),
--foreign key (FaturaID) references Faturalar(FaturaID),
--foreign key (YerID) references Yerler(YerID)

--)

--create table FaturalarveTuristler
--(
--FaturaID int not null,
--TuristID int not null,
--primary key (FaturaID,TuristID)
--)



--create table RehberlerVeUyruklar
--(
--	RehberID int,
--	UyrukID varchar(3),
--	primary key (RehberID, UyrukID),
--	foreign key (RehberID) references Rehberler(RehberID),
--	foreign key (UyrukID) references Uyruklar(UyrukID)

--)



--alter table Yerler
--add constraint fk_yerler_ucretler
--foreign key (UcretTuru) references UcretCesitleri(UcretID)

--UPDATE Rehberler
--SET Adres = 'Bilinmiyor'
--WHERE Adres IS NULL OR Adres = '';

--REHBERLER
--INSERT INTO Rehberler (Ad, Soyad, Cinsiyet, Dil, Telefon, Adres)
--VALUES ('Ozan', 'Temiz', 'Erkek', 'Türkçe', '5556544343',)

--INSERT INTO Rehberler (Ad, Soyad, Cinsiyet, Dil, Telefon, Adres)
--VALUES ('Bahar', 'Sevgin', 'Kadýn', 'Türkçe', '5556544344', )

--INSERT INTO Rehberler (Ad, Soyad, Cinsiyet, Dil, Telefon, Adres)
--VALUES ('Ömer', 'Uçar', 'Erkek', 'Türkçe', '5556544345', 'Ýstanbul',)

--INSERT INTO Rehberler (Ad, Soyad, Cinsiyet, Dil, Telefon, Adres)
--VALUES ('Sevgi', 'Çakmak', 'Kadýn', 'Türkçe', '5556544346', 'Ýstanbul',)

--INSERT INTO Rehberler (Ad, Soyad, Cinsiyet, Dil, Telefon, Adres)
--VALUES ('Linda', 'Callahan', 'Kadýn', 'Ýngilizce', '5556544347', 'SORR',)

----TURÝSTLER

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--VALUES ('Levi', 'Acevedo', 'Kadýn', '06.11.2001', '11.01.2022', 1, 1, 'Japanese',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--VALUES ('Basil', 'Aguilar', 'Erkek', '04.22.2005', '08.11.2022', 1, 1, 'Greek',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--VALUES ('Zenaida', 'Holder', 'Erkek', '01.09.1990', '02.04.2022', 1, 1, 'Finnish',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--VALUES ('Illana',' Browning', 'Kadýn', '01.28.2001', '01.05.2023', 1, 1, 'Greek',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Raja',' Duke','Erkek','07.27.1993','08.09.2021',1,1,'Duch',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Isaiah',' Valdez','Erkek','01.06.2012','08.09.2022',1,1,'Finnish',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Gray',' Marshall','Kadýn','11.21.1990','07.08.2022',1,1,'Japanese',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Ora',' Fletcher','Kadýn','01.19.2008','03.04.2023',1,1,'English',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Lavinia',' Lloyd','Kadýn','10.26.1996','06.03.2021',1,1,'English',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Jenna',' Williams','Kadýn','01.05.1992','06.11..2022',1,1,'Greek',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Christian',' Nash','Erkek','09.08.1990','05.02.2022',1,1,'English',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Basil',' Aguilar','Erkek','04.22.2009','09.09.2021',1,1,'Greek',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Christian',' Nash','Erkek','09.08.1990','05.02.2022',1,1,'English',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Brianna',' Everett', 'Erkek','03.09.1988','09.04.2022',1,1,'Japanese',)

--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Geoffrey' ,'Knowles', 'Erkek','02.17.1995','06.01.2022',1,1,'Ukrainian',)


--INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
--values ('Quinn',' Hamilton', 'Erkek','10.07.2022','04.12.2021',1,1,'English',)

--insert into Indirimler (IndirimCesidi, IndirimOrani)
--values('Tam', 0.99)

--insert into Indirimler (IndirimCesidi, IndirimOrani)
--values('Yarým', 0.5)

--insert into Indirimler (IndirimCesidi, IndirimOrani)
--values('Ýndirimli', 0.75)


-- VERÝ GÝRÝÞLERÝ


insert into Uyruklar(UyrukID,Ad)
values ('JP','Japanese')

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

insert into OdemeTurlerý(OdemeID,Ad)
values(1,'Kredi Kartý')


insert into OdemeTurlerý(OdemeID,Ad)
values(2,'Nakit')

insert into UcretCesitleri(UcretID,Cesit)
values(1,'Euro')

insert into UcretCesitleri(UcretID,Cesit)
values(2,'Dolar')

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

insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(1,'Ayasofya','25','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(2,'Yerebatan Sarnýcý','30','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(3,'Pierre Loti','30','1')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(4,'Kýz Kulesi','20','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(5,'Adalar','20','1')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(6,'Dolmabahçe Sarayý','40','1')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(7,'Miniattürk','20','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(8,'Rumeli Hisarý','10','1')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(9,'Sultan Ahmet Camii','35','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(10,'Anadolu Hisarý','15','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(11,'Eyüp Sultan Camii','20','1')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(12,'Kapalý Çarþý','20','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(13,'Mýsýr Çarþýsý','20','2')
insert into Yerler(YerID,Ad,Ucret,UcretTuru)
values(1,'Atatürk Alberatomu','10','1')


insert into Rehberler(RehberID,Ad,Soyad,Cinsiyet,Telefon,Adres)
values(1,'Ozan','Temiz','Erkek','5556544343','')

insert into Rehberler(RehberID,Ad,Soyad,Cinsiyet,Telefon,Adres)
values(2,'Bahar','Sevgin','Kadýn','5556544344','')

insert into Rehberler(RehberID,Ad,Soyad,Cinsiyet,Telefon,Adres)
values(3,'Ömer','Uçar','Erkek','5556544345','')

insert into Rehberler(RehberID,Ad,Soyad,Cinsiyet,Telefon,Adres)
values(4,'Linda','Callahan','Kadýn','5556544346','')

insert into Rehberler(RehberID,Ad,Soyad,Cinsiyet,Telefon,Adres)
values(5,'Sevgi','Çakmak','Kadýn','5556544347','')



insert into RehberlerVeUyruk(RehberID,UyrukID)
values (1,'JP')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (2,'GR')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (3,'FIN')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (5,'GR')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (2,'NL')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (1,'FIN')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (4,'JP')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (2,'ENG')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (1,'ENG')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (3,'ENG')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (3,'GR')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (2,'JP')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (4,'UKR')
insert into RehberlerVeUyruk(RehberID,UyrukID)
values (5,'ENG')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
VALUES ('Levi', 'Acevedo', 'Kadýn', '06.11.2001', '11.01.2022', '1','IT', 'JP')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
VALUES ('Basil', 'Aguilar', 'Erkek', '04.22.2005', '08.11.2022', '2', 'GR', 'GR')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
VALUES ('Zenaida', 'Holder', 'Erkek', '01.09.1990', '02.04.2022', '3', 'GR', 'FIN')


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
VALUES ('Illana',' Browning', 'Kadýn', '01.28.2001', '01.05.2023', '5', 'ENG', 'GR')


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Raja',' Duke','Erkek','07.27.1993','08.09.2021','2','NL','NL')


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Isaiah',' Valdez','Erkek','01.06.2012','08.09.2022','1','FIN','FIN')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Gray',' Marshall','Kadýn','11.21.1990','07.08.2022','4','JP','JP')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Ora',' Fletcher','Kadýn','01.19.2008','03.04.2023','2','ENG','ENG')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Lavinia',' Lloyd','Kadýn','10.26.1996','06.03.2021','1','ENG','ENG')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Jenna',' Williams','Kadýn','01.05.1992','06.11..2022',3,'GR','GR')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Christian',' Nash','Erkek','09.08.1990','05.02.2022',3,'ENG','ENG')


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Basil',' Aguilar','Erkek','04.22.2009','09.09.2021',1,'GR','GR')



INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Brianna',' Everett', 'Erkek','03.09.1988','09.04.2022',2,'JP','JP')

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Geoffrey' ,'Knowles', 'Erkek','02.17.1995','06.01.2022',4,'UKR','UKR')


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu)
values ('Quinn',' Hamilton', 'Erkek','10.07.2022','04.12.2021',5,'ENG','ENG')

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(1,1)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(2,1)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(3,2)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(4,2)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(5,3)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(6,3)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(7,3)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(8,4)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(10,4)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(9,5)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(7,6)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(14,6)

INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(4,7)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(9,7)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(11,8)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(12,8)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(3,9)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(4,9)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(7,10)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(15,10)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(13,11)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(14,11)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(15,12)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(3,13)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(4,13)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(14,14)
INSERT INTO TuristlerVeYerler(YerID,TuristID)
values(15,14)

INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(1,55,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(2,50,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(3,85,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(4,55,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(5,10,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(6,60,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(7,30,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(8,35,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(9,30,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(10,50,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(11,40,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(12,10,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(13,50,1,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(14,30,2,1)
INSERT INTO Faturalar(FaturaID,ToplamTutar,OdemeTuru,IndirimID)
values(15,40,1,1)

INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(1,1)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(1,2)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(2.3)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(2,4)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(3,5)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(3,6)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(3,7)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(4,8)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(4,10)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(5,9)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(6,7)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(6,14)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(7,4)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(7,9)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(8,11)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(8,12)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(9,3)

INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(9,4)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(10,7)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(10,15)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(11,13)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(11,14)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(12,15)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(13,3)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(14,14)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(14,15)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(15,4)
INSERT INTO FaturalarveYerler(FaturaID,	YerID)
values(15,8)

