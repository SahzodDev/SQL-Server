create database EducationDB2

use EducationDB2

go

create table Schools
(
	SchoolID int primary key identity(1,1),
	SchoolName nvarchar(50) Not null,
	SchoolAddress nvarchar(80)
)

create table Students
(
	StudentID int primary key identity(1,1),
	StudentName nvarchar(50) Not NUll,
	Age int,
	Gender nvarchar(10),
	SchoolNo int,
	SchoolID int foreign key references Schools(SchoolID),
	LaptopID int foreign key references Laptops(LaptopID)
)

create table Lessons
(
	LessonID int primary key identity(1,1),
	LessonName nvarchar(50) not null,
	Classroom nvarchar(25),
)

Create table Laptops
(
	LaptopID int primary key identity (1,1),
	Brand nvarchar(40),
	Model nvarchar(50)
)

create table StudentsAndLessons
(
	StudentID int,
	LessonID int,
	Primary key (StudentID, LessonID),
	Foreign key (StudentID) references Students(StudentID),
	Foreign key (LessonID) references Lessons(LessonID)
)

alter table Students
add constraint UC_Students unique (LaptopID)