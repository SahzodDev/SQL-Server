

create database GameDB

use GameDB

create table Gamers

(
	GamerID int primary key identity(1,1),
	GamerName nvarchar(50),
	Age int,
	BirthDate datetime
)

create table Publishers

(
	PublisherID int primary key identity(1,1),
	PublisherName nvarchar(50),
	PublisherValue money
)

create table Games

(
	GameID int primary key identity(1, 1),
	GameName nvarchar(50),
	ReleaseDate datetime,
	GameType nvarchar(50),
	PublisherID int foreign key references Publishers(PublisherID)
)

create table Tournaments

(
	TournamentID int primary key identity(1,1),
	TournamentName nvarchar(50),
	TournamentPrize money
)

create table GamesAndGamers

(
	GamerID int,
	GameID int,
	primary key (GamerID, GameID),
	foreign key (GamerID) references Gamers(GamerID),
	foreign key (GameID) references Games(GameID)
)

create table GamerDetails

(
	GamerDetailID int primary key identity(1,1),
	Value money,
	BestGameID int foreign key references Games(GameID),
	GamerID int foreign key references Gamers(GamerID)
)

create table GamerDetailsTournaments

(
	GamerDetailID int,
	TournamentID int,
	primary key (GamerDetailID, TournamentID),
	foreign key (GamerDetailID) references GamerDetails(GamerDetailID),
	foreign key (TournamentID) references Tournaments(TournamentID)
)

alter table GamerDetails
add constraint UC_GamerID unique (GamerID)