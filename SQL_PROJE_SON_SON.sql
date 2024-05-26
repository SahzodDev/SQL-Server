create database SQL_PROJE_ODEVI_121123_SON_SON
go
USE SQL_PROJE_ODEVI_121123_SON_SON
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

-- �ndirimler
insert into Indirimler (Cesit, Oran)
values ('Tam', 0),
('Yar�m', 0.5),
('�ndirimli', 0.25)

-- �deme T�rleri

insert into OdemeTurleri (Ad)
values ('Kredi Kart�'),
('Nakit')

-- �cret �e�itleri

insert into UcretCesitleri (Cesit)
values ('Euro'),
('Dolar')

-- Gidilecek Yerler

insert into GidilecekYerler (Ad, Ucret, UcretCesidi)
values ('Ayasofya', 25, 2), ('Yerebatan Sarn�c�', 30, 2), ('Pierre Loti', 30, 1), ('K�z Kulesi', 20, 2), ('Adalar', 20, 1), ('Dolmabah�e Saray�', 40, 1), ('Miniat�rk', 20, 2), ('Rumeli Hisar�', 10, 1), ('Sultan Ahmet Camii', 35, 2), ('Anadolu Hisar�', 15, 2), ('Ey�p Sultan Casmii', 20, 1), ('Kapal� �ar��', 20, 2), ('M�s�r �ar��s�', 20, 2), ('Atat�rk Alberatom', 10, 1)

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

--�LKELER
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


-- REHBERLER

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Ozan','Temiz','Erkek','5556544343')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Bahar','Sevgin','Kad�n','5556544344')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('�mer','U�ar','Erkek','5556544345')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Linda','Callahan','Kad�n','5556544346')

insert into Rehberler(Ad,Soyad,Cinsiyet,Telefon)
values('Sevgi','�akmak','Kad�n','5556544347')

-- Rehberler ve Uyruklar

insert into RehberlerVeUyruklar (RehberID, UyrukID)
values (1, 'JP'), (2, 'GR'), (3, 'FIN'), (5, 'GR'), (2, 'NL'), (1, 'FIN'), (4, 'JP'), (2, 'ENG'), (1, 'ENG'), (3, 'ENG'), (1, 'GR'), (2, 'JP'), (4, 'UKR'), (5, 'ENG')

--FATURALAR

INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(55,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(50,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(85,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(55,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(10,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(60,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(35,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(150,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(40,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(10,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(50,1,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(30,2,1)
INSERT INTO Faturalar(ToplamTutar,OdemeTuru,Indirim)
values(40,1,1)

-- TUR�STLER

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
VALUES ('Levi', 'Acevedo', 'Kad�n', '06.11.2001', '11.01.2022', 1,'IT', 'JP',1)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
VALUES ('Basil', 'Aguilar', 'Erkek', '04.22.2005', '08.11.2022', 2, 'GR', 'GR',2)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
VALUES ('Zenaida', 'Holder', 'Erkek', '01.09.1990', '02.04.2022', 3, 'GR', 'FIN',3)


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
VALUES ('Illana',' Browning', 'Kad�n', '01.28.2001', '01.05.2023', 5, 'ENG', 'GR',4)


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Raja',' Duke','Erkek','07.27.1993','08.09.2021',2,'NL','NL',5)


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Isaiah',' Valdez','Erkek','01.06.2012','08.09.2022',1,'FIN','FIN',6)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Gray',' Marshall','Kad�n','11.21.1990','07.08.2022',4,'JP','JP',7)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Ora',' Fletcher','Kad�n','01.19.2008','03.04.2023',2,'ENG','ENG',8)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Lavinia',' Lloyd','Kad�n','10.26.1996','06.03.2021',1,'ENG','ENG',9)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Jenna',' Williams','Kad�n','01.05.1992','06.11.2022',3,'GR','GR',10)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Christian',' Nash','Erkek','09.08.1990','05.02.2022',3,'ENG','ENG',11)


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Basil',' Aguilar','Erkek','04.22.2009','09.09.2021',1,'GR','GR',12)



INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Brianna',' Everett', 'Erkek','03.09.1988','09.04.2022',2,'JP','JP',13)

INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Geoffrey' ,'Knowles', 'Erkek','02.17.1995','06.01.2022',4,'UKR','UKR',14)


INSERT INTO Turistler (Ad, Soyad, Cinsiyet, DogumTarihi, GelisTarihi, Rehberi, Ulkesi, Uyrugu,FaturaID)
values ('Quinn',' Hamilton', 'Erkek','10.07.2022','04.12.2021',5,'ENG','ENG',15)


-- Turistler ve Yerler

insert into TuristlerVeYerler (YerID, TuristID)
values (1,1), (2,1), (3,2), (4,2), (5,3), (6,3), (1,3),
(7,4), (9,4), (8,5), (6,6), (13,6), (4,7), (8,7), (10,8), (3,9), (4,9), (6,10), (14,10), (12,11), (13,11), (14,12), (3,13), (4,13), (13,14), (14,14), (4,15), (7,15)

-- Faturalar ve Yerler

Insert Into FaturalarVeYerler(FaturaID,YerID)
VALUES(1,2),(1,3),(2,4),(2,5),(3,6),(3,1),(3,7),(4,9),(4,8),(5,6),
(6,13),(6,4),(7,8),(7,10),(8,11),(9,3),(9,4),(10,6),(10,14)
,(11,12),(11,13),(12,14),(13,3),(13,4),(14,13),(14,14),(15,4),(15,7)

-- D�zeltme

update Faturalar
set ToplamTutar=55
where FaturaID=1


update Faturalar
set ToplamTutar=50
where FaturaID=2

update Faturalar
set ToplamTutar=85
where FaturaID=3

update Faturalar
set ToplamTutar=55
where FaturaID=4


update Faturalar
set ToplamTutar=10
where FaturaID=5

update Faturalar
set ToplamTutar=60
where FaturaID=6
update Faturalar
set ToplamTutar=30
where FaturaID=7

update Faturalar
set ToplamTutar=35
where FaturaID=8

update Faturalar
set ToplamTutar=50
where FaturaID=9

update Faturalar
set ToplamTutar=50
where FaturaID=10

update Faturalar
set ToplamTutar=40
where FaturaID=11

update Faturalar
set ToplamTutar=10
where FaturaID=12

update Faturalar
set ToplamTutar=50
where FaturaID=13


update Faturalar
set ToplamTutar=30
where FaturaID=14
update Faturalar
set ToplamTutar=40
where FaturaID=15

-- QUERRYLER

--1-Rehberlerimin bu zamana kadar ilgilendikleri t�m turistleri �lke ve uyruk bilgileri ile getiriniz.

SELECT r.Ad as RehberAdi,t.Ad as TuristAdi, t.Ulkesi, t.Uyrugu
FROM Turistler t join Rehberler r on t.Rehberi = r.RehberID
order by r.Ad

-- D�zeltme



--2-Her bir tur i�in indirimli, tam, yar�m fiyat�n� listeleyen sorguyu yaz�n. Zam veya indirim uygulanm�� turlar�n da ge�mi�e y�nelik t�m fiyat bilgisi gelsin.
--Rapor �u �ekilde olmal�;
--Ayasofya | Tam | 120 | 2015-05-05
--Ayasofya | Yar�m | 60 | 2015-05-05   ....vb

SELECT 
  gy.Ad,
  c.Cesit,
  CASE c.Cesit
    WHEN 'Tam' THEN gy.Ucret * (1 - i.Oran)
    WHEN 'Yar�m' THEN gy.Ucret * (1 - i.Oran)
    when '�ndirimli' then gy.Ucret * (1 - i.Oran)
    ELSE gy.Ucret  
  END as Fiyat
FROM 
  GidilecekYerler gy
CROSS JOIN 
  (SELECT DISTINCT Cesit FROM Indirimler) c
LEFT JOIN 
  Indirimler i ON c.Cesit = i.Cesit
  order by gy.Ad


--3-�u zamana kadar yap�lan en pahal� tura hangi turistim dahil olmu�, bu turun �demesini kim yapm�� ve bu turiste hangi tur rehberi atanm��? Ayn� fiyat bilgisine sahip di�er kay�tlar da gelsin.

select distinct f.FaturaID, r.Ad as Rehberi, t.Ad as TuristAd, f.ToplamTutar
from Faturalar f join Turistler t on f.FaturaID = t.FaturaID join Rehberler r on t.Rehberi = r.RehberID join FaturalarVeYerler fy on f.FaturaID = fy.FaturaID join GidilecekYerler y on fy.YerID = y.YerID
where f.ToplamTutar = (select max(f1.ToplamTutar) from Faturalar f1) -- Sadece bir tane en pahal� tur mevcut.

--4-Almanya uyruklu turistlerimden tam bilet ile tura kat�lan turistlerim nereleri hangi tur rehberi ile ziyaret etmi�.

select t.Ad as TuristD, t.Soyad as TuristSoyad, y.Ad YeraD, r.Ad RehberAd, r.Soyad RehberSoyad
from Turistler t join TuristlerVeYerler ty on t.TuristID = ty.TuristID join GidilecekYerler y on ty.YerID = y.YerID join Rehberler r on t.Rehberi = r.RehberID join Faturalar f on t.FaturaID = f.FaturaID join Indirimler i on f.Indirim = i.IndirimID join Uyruklar u on t.Uyrugu = u.UyrukID
WHERE i.Cesit = 'Tam' and u.Ad = 'Dutch' -- Dutch alman de�il hollandal� demek :(

-- D�zeltme

alter table Turistler
add Dil nvarchar(50) -- Turistin bildi�i dili belirtmesi i�in yeni bir kolon olu�turulur.

update Turistler
set Dil = 'Russian'
where TuristID = 1

update Turistler
set Dil = 'Greek'
where TuristID = 2

update Turistler
set Dil = 'Finnish'
where TuristID = 3

update Turistler
set Dil = 'Greek'
where TuristID = 4

update Turistler
set Dil = 'Dutch'
where TuristID = 5

update Turistler
set Dil = 'Finnish'
where TuristID = 6

update Turistler
set Dil = 'Japanese'
where TuristID = 7

update Turistler
set Dil = 'English'
where TuristID = 8

update Turistler
set Dil = 'English'
where TuristID = 9

update Turistler
set Dil = 'Greek'
where TuristID = 10

update Turistler
set Dil = 'English'
where TuristID = 11

update Turistler
set Dil = 'Greek'
where TuristID = 12

update Turistler
set Dil = 'Japanese'
where TuristID = 13

update Turistler
set Dil = 'English'
where TuristID = 14

update Turistler
set Dil = 'English'
where TuristID = 15

--5-�ngilizce bildi�i halde �lkesi de uyru�u da �ngiltere olmayan turistlere rehberlik eden tur rehberlerim kimler? �lgilendi�i turist bilgileri ile beraber raporlans�n.

select t.*, r.Ad RehberAd
from Turistler t join Rehberler r on t.Rehberi = r.RehberID join Uyruklar u on t.Uyrugu = u.UyrukID join Ulkeler ul on t.Ulkesi = ul.UlkeID
where t.Dil = 'English' and u.Ad != 'English' and ul.Ad != 'England'


--6-Listemde oldu�u halde rehberlerimin bildi�i diller aras�nda yer almayan diller hangileridir?

select distinct t.Dil
from Turistler t join Rehberler r on t.Rehberi = r.RehberID join RehberlerVeUyruklar ru on r.RehberID = ru.RehberID join Uyruklar u on ru.UyrukID = u.UyrukID 
where t.Dil not in (select u.Ad from Uyruklar u join RehberlerVeUyruklar ru on u.UyrukID = ru.UyrukID join Rehberler r on r.RehberID = ru.RehberID where u.UyrukID in (select ru1.UyrukID from RehberlerVeUyruklar ru1))

--7-�lkesi Japonya olan m��terilerim fatura �demelerini hangi para biriminde yapm��lar. (Turist Ad, Soyad, �lke, FaturaTarihi, �deme�ekli, ParaBirimi)

select distinct t.Ad 'Turist Ad', t.Soyad 'Turist Soyad', ul.Ad '�lke Ad', t.GelisTarihi 'Fatura Tarihi', od.Ad '�deme �ekli', uc.Cesit 'Para Birimi'
from Turistler t join Faturalar f on t.FaturaID = f.FaturaID join FaturalarVeYerler fy on f.FaturaID = fy.FaturaID join GidilecekYerler gy on fy.YerID = gy.YerID join UcretCesitleri uc on gy.UcretCesidi = uc.UcretID join Ulkeler ul on t.Ulkesi = ul.UlkeID join OdemeTurleri od on f.OdemeTuru = od.OdemeID
where ul.Ad = 'Japan'

--8-Nakit �deme yapmamay� tercih eden m��terilerim hangi �lkelerden (Sorguyu di�er �deme �ekil(ler)ini bilmiyormu� gibi yaz�n�z)

select distinct ul.Ad '�lke Ad�'
from Turistler t join Faturalar f on t.FaturaID = f.FaturaID join Ulkeler ul on t.Ulkesi = ul.UlkeID join OdemeTurleri od on f.OdemeTuru = od.OdemeID
where od.Ad != 'Nakit'

