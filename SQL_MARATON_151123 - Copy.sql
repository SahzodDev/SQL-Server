CREATE DATABASE BankaHesapDB
go
use BankaHesapDB
go


create table Musteriler
(
	MusteriID int primary key identity(1,1),
	MusteriNo int not null,
	MusteriFirstName nvarchar(50) not null,
	MusteriLastName nvarchar(50) not null
)
go
create table IslemTipleri
(
	IslemTipiID int primary key identity(1,1),
	IslemTipi nvarchar(50) not null
)
go

create table Subeler
(
	SubeID int primary key identity(1,1),
	SubeNo int not null,
	SubeAdi nvarchar(50) not null
)

go

create table ParaCinsleri
(
	ParaCinsiID int primary key identity(1,1),
	ParaCinsi varchar(10) not null
)
go

create table IslemKanallari
(
	IslemKanaliID int primary key identity(1,1),
	KanalAdi nvarchar(50) not null
)

go

create table Hesaplar
(
	HesapID int primary key identity(1,1),
	HesapNo int not null,
	MusteriID int foreign key references Musteriler(MusteriID),
	HesapAdi nvarchar(50) not null,
	HesapCinsi int foreign key references ParaCinsleri(ParaCinsiID),
	HesapSubesi int foreign key references Subeler(SubeID)
)

go

create table Islemler
(
	IslemID int primary key identity(1,1),
	IslemNo int not null,
	Miktar money not null,
	IslemKanali int foreign key references IslemKanallari(IslemKanaliID),
	MiktarTuru int foreign key references ParaCinsleri(ParaCinsiID),
	IslemTuru int foreign key references IslemTipleri(IslemTipiID),
	IslemTarihi date
)


go

create table HesapBirlestirme
(
HesapID int foreign key references Hesaplar(HesapID),
ÝslemID int foreign key references Islemler(IslemID)

)

go

insert into Musteriler(MusteriNo,MusteriFirstName,MusteriLastName)
values('100','Ali','Kara'),
('101','Ayse','Sarý')


insert into IslemTipleri(IslemTipi)
values('Para Çekme'),('Para Yatýrma'),('Fatura Ödeme')

insert into Subeler(SubeNo,SubeAdi)
values(74,'Bartýn'),(67,'Zonguldak'),(78,'Karabük')

insert into IslemKanallari(KanalAdi)
values ('Atm'), ('Ýnternet'),('Þube')


insert into ParaCinsleri(ParaCinsi)
values('TL'),('Euro'),('USD')

insert into Hesaplar(HesapNo,MusteriID,HesapAdi,HesapCinsi,HesapSubesi)
values(7410010,1,10,1,1),
(6710011,1,11,2,2),
(7810111,2,12,3,3),
(7410110,2,10,1,1)

insert into Islemler(IslemNo,Miktar,IslemKanali,MiktarTuru,IslemTuru,IslemTarihi)
values(100001,400,1,1,2,'2023-01-02'),
(100002,200,1,1,1,'2023-01-25'),
(100003,89,2,1,3,'2023-01-20'),
(100025,200,3,2,2,'2023-01-15'),
(100058,100,1,3,1,'2023-02-02'),
(101005,200,3,1,2,'2023-01-20'),
(101048,115,2,1,3,'2023-01-20')


insert into hesapBirlestirme(hesapID,ÝslemID)
values(1,1),(1,2),(1,3),(2,4),(3,5),(4,6),(4,7)

go
create view CreateViews

as

select h.HesapNo, m.MusteriNo, m.MusteriFirstName + ' ' + m.MusteriLastName as 'Müþteri Ad', sub.SubeNo, sub.SubeAdi, h.HesapAdi, pc.ParaCinsi as 'Hesap Cinsi', i.IslemNo, ik.KanalAdi, i.Miktar, pc1.ParaCinsi 'Miktar Cinsi', it.IslemTipi, i.IslemTarihi
from Hesaplar h join Musteriler m on h.MusteriID = m.MusteriID join HesapBirlestirme hb on h.HesapID = hb.HesapID join Islemler i on hb.ÝslemID = i.IslemID join Subeler sub on sub.SubeID = h.HesapSubesi join ParaCinsleri pc on h.HesapCinsi = pc.ParaCinsiID join IslemKanallari ik on i.IslemKanali = ik.IslemKanaliID join IslemTipleri it on i.IslemTuru = it.IslemTipiID join ParaCinsleri pc1 on pc1.ParaCinsiID = i.MiktarTuru

select * from CreateViews