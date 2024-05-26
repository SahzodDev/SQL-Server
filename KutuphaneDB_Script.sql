USE [master]
GO
/****** Object:  Database [kutuphane]    Script Date: 14.11.2023 11:16:06 ******/
CREATE DATABASE [kutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kutuphane', FILENAME = N'C:\Program Files (x86)\SQL_Pratik\kutuphane.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kutuphane_log', FILENAME = N'C:\Program Files (x86)\SQL_Pratik\kutuphane_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kutuphane] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kutuphane].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [kutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kutuphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kutuphane] SET RECOVERY FULL 
GO
ALTER DATABASE [kutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [kutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kutuphane] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kutuphane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kutuphane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kutuphane', N'ON'
GO
ALTER DATABASE [kutuphane] SET QUERY_STORE = OFF
GO
USE [kutuphane]
GO
/****** Object:  Table [dbo].[islem]    Script Date: 14.11.2023 11:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islem](
	[islemno] [int] IDENTITY(1,1) NOT NULL,
	[ogrno] [int] NULL,
	[kitapno] [int] NULL,
	[atarih] [datetime] NULL,
	[vtarih] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitap]    Script Date: 14.11.2023 11:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitap](
	[kitapno] [int] IDENTITY(1,1) NOT NULL,
	[isbnno] [char](20) NULL,
	[kitapadi] [varchar](100) NULL,
	[yazarno] [int] NULL,
	[turno] [int] NULL,
	[sayfasayisi] [int] NULL,
	[puan] [int] NULL,
 CONSTRAINT [PK_kitap] PRIMARY KEY CLUSTERED 
(
	[kitapno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 14.11.2023 11:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci](
	[ogrno] [int] IDENTITY(1,1) NOT NULL,
	[ograd] [nchar](10) NULL,
	[ogrsoyad] [nchar](20) NULL,
	[cinsiyet] [nchar](1) NULL,
	[dtarih] [datetime] NULL,
	[sinif] [nchar](4) NULL,
	[puan] [bigint] NULL,
 CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED 
(
	[ogrno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tur]    Script Date: 14.11.2023 11:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tur](
	[turno] [int] IDENTITY(1,1) NOT NULL,
	[turadi] [nchar](30) NULL,
 CONSTRAINT [PK_tur] PRIMARY KEY CLUSTERED 
(
	[turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yazar]    Script Date: 14.11.2023 11:16:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yazar](
	[yazarno] [int] IDENTITY(1,1) NOT NULL,
	[yazarad] [nchar](20) NULL,
	[yazarsoyad] [nchar](20) NULL,
 CONSTRAINT [PK_yazar] PRIMARY KEY CLUSTERED 
(
	[yazarno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[islem] ON 
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1, 73, 10, CAST(N'2006-01-01T00:00:00.000' AS DateTime), CAST(N'2006-01-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (2, 6, 17, CAST(N'2006-01-02T00:00:00.000' AS DateTime), CAST(N'2006-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (3, 59, 11, CAST(N'2006-01-03T00:00:00.000' AS DateTime), CAST(N'2006-01-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (4, 60, 42, CAST(N'2006-01-03T00:00:00.000' AS DateTime), CAST(N'2006-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (5, 27, 2, CAST(N'2006-01-03T00:00:00.000' AS DateTime), CAST(N'2006-01-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (6, 36, 2, CAST(N'2006-01-04T00:00:00.000' AS DateTime), CAST(N'2006-01-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (7, 20, 39, CAST(N'2006-01-05T00:00:00.000' AS DateTime), CAST(N'2006-01-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (8, 79, 38, CAST(N'2006-01-05T00:00:00.000' AS DateTime), CAST(N'2006-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (9, 29, 37, CAST(N'2006-01-06T00:00:00.000' AS DateTime), CAST(N'2006-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (10, 76, 30, CAST(N'2006-01-08T00:00:00.000' AS DateTime), CAST(N'2006-01-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (11, 63, 23, CAST(N'2006-01-08T00:00:00.000' AS DateTime), CAST(N'2006-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (12, 63, 31, CAST(N'2006-01-09T00:00:00.000' AS DateTime), CAST(N'2006-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (13, 27, 15, CAST(N'2006-01-10T00:00:00.000' AS DateTime), CAST(N'2006-01-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (14, 7, 37, CAST(N'2006-01-11T00:00:00.000' AS DateTime), CAST(N'2006-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (15, 58, 36, CAST(N'2006-01-11T00:00:00.000' AS DateTime), CAST(N'2006-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (16, 90, 16, CAST(N'2006-01-12T00:00:00.000' AS DateTime), CAST(N'2006-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (17, 33, 44, CAST(N'2006-01-13T00:00:00.000' AS DateTime), CAST(N'2006-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (18, 19, 37, CAST(N'2006-01-13T00:00:00.000' AS DateTime), CAST(N'2006-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (19, 11, 6, CAST(N'2006-01-13T00:00:00.000' AS DateTime), CAST(N'2006-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (20, 38, 27, CAST(N'2006-01-14T00:00:00.000' AS DateTime), CAST(N'2006-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (21, 93, 31, CAST(N'2006-01-14T00:00:00.000' AS DateTime), CAST(N'2006-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (22, 48, 8, CAST(N'2006-01-15T00:00:00.000' AS DateTime), CAST(N'2006-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (23, 19, 34, CAST(N'2006-01-15T00:00:00.000' AS DateTime), CAST(N'2006-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (24, 58, 35, CAST(N'2006-01-16T00:00:00.000' AS DateTime), CAST(N'2006-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (25, 32, 24, CAST(N'2006-01-16T00:00:00.000' AS DateTime), CAST(N'2006-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (26, 81, 19, CAST(N'2006-01-17T00:00:00.000' AS DateTime), CAST(N'2006-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (27, 24, 20, CAST(N'2006-01-17T00:00:00.000' AS DateTime), CAST(N'2006-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (28, 77, 21, CAST(N'2006-01-18T00:00:00.000' AS DateTime), CAST(N'2006-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (29, 42, 8, CAST(N'2006-01-19T00:00:00.000' AS DateTime), CAST(N'2006-02-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (30, 18, 28, CAST(N'2006-01-19T00:00:00.000' AS DateTime), CAST(N'2006-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (31, 97, 39, CAST(N'2006-01-19T00:00:00.000' AS DateTime), CAST(N'2006-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (32, 4, 23, CAST(N'2006-01-20T00:00:00.000' AS DateTime), CAST(N'2006-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (33, 81, 34, CAST(N'2006-01-21T00:00:00.000' AS DateTime), CAST(N'2006-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (34, 43, 28, CAST(N'2006-01-21T00:00:00.000' AS DateTime), CAST(N'2006-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (35, 82, 42, CAST(N'2006-01-22T00:00:00.000' AS DateTime), CAST(N'2006-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (36, 12, 34, CAST(N'2006-01-23T00:00:00.000' AS DateTime), CAST(N'2006-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (37, 27, 8, CAST(N'2006-01-24T00:00:00.000' AS DateTime), CAST(N'2006-02-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (38, 66, 3, CAST(N'2006-01-25T00:00:00.000' AS DateTime), CAST(N'2006-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (39, 49, 14, CAST(N'2006-01-25T00:00:00.000' AS DateTime), CAST(N'2006-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (40, 31, 1, CAST(N'2006-01-25T00:00:00.000' AS DateTime), CAST(N'2006-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (41, 21, 43, CAST(N'2006-01-27T00:00:00.000' AS DateTime), CAST(N'2006-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (42, 35, 23, CAST(N'2006-01-27T00:00:00.000' AS DateTime), CAST(N'2006-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (43, 19, 44, CAST(N'2006-01-28T00:00:00.000' AS DateTime), CAST(N'2006-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (44, 6, 17, CAST(N'2006-01-28T00:00:00.000' AS DateTime), CAST(N'2006-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (45, 36, 15, CAST(N'2006-01-28T00:00:00.000' AS DateTime), CAST(N'2006-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (46, 73, 36, CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'2006-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (47, 82, 23, CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'2006-02-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (48, 4, 5, CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'2006-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (49, 70, 8, CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'2006-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (50, 65, 19, CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'2006-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (51, 23, 4, CAST(N'2006-02-03T00:00:00.000' AS DateTime), CAST(N'2006-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (52, 60, 18, CAST(N'2006-02-03T00:00:00.000' AS DateTime), CAST(N'2006-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (53, 75, 44, CAST(N'2006-02-04T00:00:00.000' AS DateTime), CAST(N'2006-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (54, 43, 34, CAST(N'2006-02-04T00:00:00.000' AS DateTime), CAST(N'2006-02-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (55, 51, 14, CAST(N'2006-02-05T00:00:00.000' AS DateTime), CAST(N'2006-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (56, 29, 1, CAST(N'2006-02-06T00:00:00.000' AS DateTime), CAST(N'2006-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (57, 85, 14, CAST(N'2006-02-07T00:00:00.000' AS DateTime), CAST(N'2006-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (58, 5, 38, CAST(N'2006-02-07T00:00:00.000' AS DateTime), CAST(N'2006-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (59, 36, 11, CAST(N'2006-02-08T00:00:00.000' AS DateTime), CAST(N'2006-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (60, 64, 41, CAST(N'2006-02-09T00:00:00.000' AS DateTime), CAST(N'2006-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (61, 3, 1, CAST(N'2006-02-10T00:00:00.000' AS DateTime), CAST(N'2006-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (62, 53, 8, CAST(N'2006-02-10T00:00:00.000' AS DateTime), CAST(N'2006-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (63, 31, 32, CAST(N'2006-02-10T00:00:00.000' AS DateTime), CAST(N'2006-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (64, 56, 3, CAST(N'2006-02-10T00:00:00.000' AS DateTime), CAST(N'2006-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (65, 66, 37, CAST(N'2006-02-11T00:00:00.000' AS DateTime), CAST(N'2006-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (66, 96, 23, CAST(N'2006-02-11T00:00:00.000' AS DateTime), CAST(N'2006-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (67, 53, 15, CAST(N'2006-02-12T00:00:00.000' AS DateTime), CAST(N'2006-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (68, 3, 20, CAST(N'2006-02-13T00:00:00.000' AS DateTime), CAST(N'2006-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (69, 36, 12, CAST(N'2006-02-13T00:00:00.000' AS DateTime), CAST(N'2006-02-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (70, 29, 31, CAST(N'2006-02-15T00:00:00.000' AS DateTime), CAST(N'2006-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (71, 89, 21, CAST(N'2006-02-16T00:00:00.000' AS DateTime), CAST(N'2006-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (72, 1, 27, CAST(N'2006-02-16T00:00:00.000' AS DateTime), CAST(N'2006-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (73, 68, 8, CAST(N'2006-02-17T00:00:00.000' AS DateTime), CAST(N'2006-02-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (74, 83, 2, CAST(N'2006-02-20T00:00:00.000' AS DateTime), CAST(N'2006-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (75, 50, 34, CAST(N'2006-02-20T00:00:00.000' AS DateTime), CAST(N'2006-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (76, 8, 1, CAST(N'2006-02-20T00:00:00.000' AS DateTime), CAST(N'2006-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (77, 71, 10, CAST(N'2006-02-20T00:00:00.000' AS DateTime), CAST(N'2006-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (78, 20, 2, CAST(N'2006-02-21T00:00:00.000' AS DateTime), CAST(N'2006-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (79, 8, 20, CAST(N'2006-02-21T00:00:00.000' AS DateTime), CAST(N'2006-02-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (80, 83, 12, CAST(N'2006-02-21T00:00:00.000' AS DateTime), CAST(N'2006-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (81, 37, 6, CAST(N'2006-02-22T00:00:00.000' AS DateTime), CAST(N'2006-02-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (82, 16, 14, CAST(N'2006-02-22T00:00:00.000' AS DateTime), CAST(N'2006-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (83, 50, 3, CAST(N'2006-02-23T00:00:00.000' AS DateTime), CAST(N'2006-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (84, 25, 32, CAST(N'2006-02-23T00:00:00.000' AS DateTime), CAST(N'2006-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (85, 62, 4, CAST(N'2006-02-24T00:00:00.000' AS DateTime), CAST(N'2006-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (86, 75, 25, CAST(N'2006-02-24T00:00:00.000' AS DateTime), CAST(N'2006-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (87, 14, 37, CAST(N'2006-02-25T00:00:00.000' AS DateTime), CAST(N'2006-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (88, 39, 6, CAST(N'2006-02-26T00:00:00.000' AS DateTime), CAST(N'2006-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (89, 82, 10, CAST(N'2006-02-26T00:00:00.000' AS DateTime), CAST(N'2006-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (90, 88, 37, CAST(N'2006-02-26T00:00:00.000' AS DateTime), CAST(N'2006-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (91, 37, 20, CAST(N'2006-02-27T00:00:00.000' AS DateTime), CAST(N'2006-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (92, 96, 35, CAST(N'2006-02-28T00:00:00.000' AS DateTime), CAST(N'2006-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (93, 88, 11, CAST(N'2006-02-28T00:00:00.000' AS DateTime), CAST(N'2006-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (94, 82, 32, CAST(N'2006-03-01T00:00:00.000' AS DateTime), CAST(N'2006-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (95, 37, 39, CAST(N'2006-03-01T00:00:00.000' AS DateTime), CAST(N'2006-03-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (96, 41, 10, CAST(N'2006-03-01T00:00:00.000' AS DateTime), CAST(N'2006-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (97, 43, 16, CAST(N'2006-03-02T00:00:00.000' AS DateTime), CAST(N'2006-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (98, 45, 33, CAST(N'2006-03-03T00:00:00.000' AS DateTime), CAST(N'2006-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (99, 61, 32, CAST(N'2006-03-04T00:00:00.000' AS DateTime), CAST(N'2006-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (100, 41, 10, CAST(N'2006-03-05T00:00:00.000' AS DateTime), CAST(N'2006-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (101, 56, 37, CAST(N'2006-03-07T00:00:00.000' AS DateTime), CAST(N'2006-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (102, 36, 14, CAST(N'2006-03-07T00:00:00.000' AS DateTime), CAST(N'2006-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (103, 13, 16, CAST(N'2006-03-08T00:00:00.000' AS DateTime), CAST(N'2006-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (104, 10, 20, CAST(N'2006-03-08T00:00:00.000' AS DateTime), CAST(N'2006-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (105, 64, 15, CAST(N'2006-03-08T00:00:00.000' AS DateTime), CAST(N'2006-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (106, 56, 38, CAST(N'2006-03-09T00:00:00.000' AS DateTime), CAST(N'2006-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (107, 40, 34, CAST(N'2006-03-09T00:00:00.000' AS DateTime), CAST(N'2006-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (108, 54, 43, CAST(N'2006-03-09T00:00:00.000' AS DateTime), CAST(N'2006-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (109, 30, 14, CAST(N'2006-03-10T00:00:00.000' AS DateTime), CAST(N'2006-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (110, 38, 10, CAST(N'2006-03-12T00:00:00.000' AS DateTime), CAST(N'2006-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (111, 47, 7, CAST(N'2006-03-12T00:00:00.000' AS DateTime), CAST(N'2006-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (112, 57, 27, CAST(N'2006-03-12T00:00:00.000' AS DateTime), CAST(N'2006-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (113, 83, 12, CAST(N'2006-03-13T00:00:00.000' AS DateTime), CAST(N'2006-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (114, 96, 22, CAST(N'2006-03-13T00:00:00.000' AS DateTime), CAST(N'2006-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (115, 48, 7, CAST(N'2006-03-13T00:00:00.000' AS DateTime), CAST(N'2006-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (116, 81, 7, CAST(N'2006-03-15T00:00:00.000' AS DateTime), CAST(N'2006-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (117, 21, 43, CAST(N'2006-03-15T00:00:00.000' AS DateTime), CAST(N'2006-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (118, 57, 14, CAST(N'2006-03-16T00:00:00.000' AS DateTime), CAST(N'2006-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (119, 88, 13, CAST(N'2006-03-16T00:00:00.000' AS DateTime), CAST(N'2006-03-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (120, 87, 40, CAST(N'2006-03-17T00:00:00.000' AS DateTime), CAST(N'2006-04-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (121, 57, 33, CAST(N'2006-03-17T00:00:00.000' AS DateTime), CAST(N'2006-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (122, 59, 14, CAST(N'2006-03-17T00:00:00.000' AS DateTime), CAST(N'2006-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (123, 67, 32, CAST(N'2006-03-17T00:00:00.000' AS DateTime), CAST(N'2006-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (124, 42, 28, CAST(N'2006-03-18T00:00:00.000' AS DateTime), CAST(N'2006-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (125, 5, 43, CAST(N'2006-03-20T00:00:00.000' AS DateTime), CAST(N'2006-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (126, 43, 35, CAST(N'2006-03-20T00:00:00.000' AS DateTime), CAST(N'2006-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (127, 40, 37, CAST(N'2006-03-20T00:00:00.000' AS DateTime), CAST(N'2006-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (128, 90, 29, CAST(N'2006-03-21T00:00:00.000' AS DateTime), CAST(N'2006-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (129, 74, 2, CAST(N'2006-03-21T00:00:00.000' AS DateTime), CAST(N'2006-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (130, 58, 20, CAST(N'2006-03-22T00:00:00.000' AS DateTime), CAST(N'2006-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (131, 31, 13, CAST(N'2006-03-22T00:00:00.000' AS DateTime), CAST(N'2006-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (132, 47, 29, CAST(N'2006-03-23T00:00:00.000' AS DateTime), CAST(N'2006-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (133, 81, 34, CAST(N'2006-03-23T00:00:00.000' AS DateTime), CAST(N'2006-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (134, 34, 20, CAST(N'2006-03-24T00:00:00.000' AS DateTime), CAST(N'2006-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (135, 63, 44, CAST(N'2006-03-24T00:00:00.000' AS DateTime), CAST(N'2006-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (136, 33, 28, CAST(N'2006-03-26T00:00:00.000' AS DateTime), CAST(N'2006-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (137, 13, 40, CAST(N'2006-03-28T00:00:00.000' AS DateTime), CAST(N'2006-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (138, 55, 9, CAST(N'2006-04-03T00:00:00.000' AS DateTime), CAST(N'2006-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (139, 66, 4, CAST(N'2006-04-05T00:00:00.000' AS DateTime), CAST(N'2006-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (140, 59, 20, CAST(N'2006-04-06T00:00:00.000' AS DateTime), CAST(N'2006-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (141, 75, 31, CAST(N'2006-04-07T00:00:00.000' AS DateTime), CAST(N'2006-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (142, 81, 20, CAST(N'2006-04-07T00:00:00.000' AS DateTime), CAST(N'2006-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (143, 46, 9, CAST(N'2006-04-09T00:00:00.000' AS DateTime), CAST(N'2006-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (144, 32, 18, CAST(N'2006-04-10T00:00:00.000' AS DateTime), CAST(N'2006-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (145, 88, 35, CAST(N'2006-04-12T00:00:00.000' AS DateTime), CAST(N'2006-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (146, 98, 12, CAST(N'2006-04-12T00:00:00.000' AS DateTime), CAST(N'2006-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (147, 54, 17, CAST(N'2006-04-13T00:00:00.000' AS DateTime), CAST(N'2006-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (148, 17, 2, CAST(N'2006-04-15T00:00:00.000' AS DateTime), CAST(N'2006-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (149, 79, 13, CAST(N'2006-04-15T00:00:00.000' AS DateTime), CAST(N'2006-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (150, 55, 5, CAST(N'2006-04-15T00:00:00.000' AS DateTime), CAST(N'2006-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (151, 69, 30, CAST(N'2006-04-15T00:00:00.000' AS DateTime), CAST(N'2006-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (152, 18, 28, CAST(N'2006-04-16T00:00:00.000' AS DateTime), CAST(N'2006-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (153, 68, 2, CAST(N'2006-04-16T00:00:00.000' AS DateTime), CAST(N'2006-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (154, 45, 23, CAST(N'2006-04-17T00:00:00.000' AS DateTime), CAST(N'2006-04-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (155, 91, 35, CAST(N'2006-04-17T00:00:00.000' AS DateTime), CAST(N'2006-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (156, 30, 7, CAST(N'2006-04-18T00:00:00.000' AS DateTime), CAST(N'2006-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (157, 2, 26, CAST(N'2006-04-18T00:00:00.000' AS DateTime), CAST(N'2006-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (158, 36, 27, CAST(N'2006-04-18T00:00:00.000' AS DateTime), CAST(N'2006-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (159, 35, 42, CAST(N'2006-04-19T00:00:00.000' AS DateTime), CAST(N'2006-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (160, 80, 12, CAST(N'2006-04-20T00:00:00.000' AS DateTime), CAST(N'2006-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (161, 21, 26, CAST(N'2006-04-21T00:00:00.000' AS DateTime), CAST(N'2006-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (162, 77, 8, CAST(N'2006-04-22T00:00:00.000' AS DateTime), CAST(N'2006-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (163, 20, 16, CAST(N'2006-04-22T00:00:00.000' AS DateTime), CAST(N'2006-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (164, 51, 22, CAST(N'2006-04-22T00:00:00.000' AS DateTime), CAST(N'2006-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (165, 78, 19, CAST(N'2006-04-24T00:00:00.000' AS DateTime), CAST(N'2006-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (166, 50, 36, CAST(N'2006-04-24T00:00:00.000' AS DateTime), CAST(N'2006-05-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (167, 71, 40, CAST(N'2006-04-26T00:00:00.000' AS DateTime), CAST(N'2006-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (168, 11, 31, CAST(N'2006-04-27T00:00:00.000' AS DateTime), CAST(N'2006-05-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (169, 67, 6, CAST(N'2006-04-28T00:00:00.000' AS DateTime), CAST(N'2006-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (170, 87, 37, CAST(N'2006-05-01T00:00:00.000' AS DateTime), CAST(N'2006-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (171, 32, 35, CAST(N'2006-05-02T00:00:00.000' AS DateTime), CAST(N'2006-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (172, 6, 30, CAST(N'2006-05-04T00:00:00.000' AS DateTime), CAST(N'2006-05-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (173, 55, 14, CAST(N'2006-05-05T00:00:00.000' AS DateTime), CAST(N'2006-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (174, 72, 17, CAST(N'2006-05-05T00:00:00.000' AS DateTime), CAST(N'2006-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (175, 21, 14, CAST(N'2006-05-06T00:00:00.000' AS DateTime), CAST(N'2006-05-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (176, 17, 32, CAST(N'2006-05-06T00:00:00.000' AS DateTime), CAST(N'2006-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (177, 22, 21, CAST(N'2006-05-07T00:00:00.000' AS DateTime), CAST(N'2006-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (178, 20, 12, CAST(N'2006-05-07T00:00:00.000' AS DateTime), CAST(N'2006-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (179, 39, 17, CAST(N'2006-05-08T00:00:00.000' AS DateTime), CAST(N'2006-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (180, 45, 12, CAST(N'2006-05-08T00:00:00.000' AS DateTime), CAST(N'2006-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (181, 24, 43, CAST(N'2006-05-08T00:00:00.000' AS DateTime), CAST(N'2006-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (182, 67, 38, CAST(N'2006-05-09T00:00:00.000' AS DateTime), CAST(N'2006-05-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (183, 65, 14, CAST(N'2006-05-10T00:00:00.000' AS DateTime), CAST(N'2006-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (184, 79, 7, CAST(N'2006-05-10T00:00:00.000' AS DateTime), CAST(N'2006-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (185, 50, 20, CAST(N'2006-05-10T00:00:00.000' AS DateTime), CAST(N'2006-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (186, 86, 15, CAST(N'2006-05-11T00:00:00.000' AS DateTime), CAST(N'2006-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (187, 48, 19, CAST(N'2006-05-11T00:00:00.000' AS DateTime), CAST(N'2006-05-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (188, 17, 35, CAST(N'2006-05-11T00:00:00.000' AS DateTime), CAST(N'2006-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (189, 87, 19, CAST(N'2006-05-12T00:00:00.000' AS DateTime), CAST(N'2006-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (190, 19, 40, CAST(N'2006-05-14T00:00:00.000' AS DateTime), CAST(N'2006-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (191, 33, 9, CAST(N'2006-05-14T00:00:00.000' AS DateTime), CAST(N'2006-05-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (192, 63, 17, CAST(N'2006-05-15T00:00:00.000' AS DateTime), CAST(N'2006-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (193, 12, 16, CAST(N'2006-05-15T00:00:00.000' AS DateTime), CAST(N'2006-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (194, 16, 33, CAST(N'2006-05-16T00:00:00.000' AS DateTime), CAST(N'2006-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (195, 35, 9, CAST(N'2006-05-18T00:00:00.000' AS DateTime), CAST(N'2006-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (196, 48, 7, CAST(N'2006-05-18T00:00:00.000' AS DateTime), CAST(N'2006-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (197, 22, 30, CAST(N'2006-05-19T00:00:00.000' AS DateTime), CAST(N'2006-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (198, 74, 25, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2006-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (199, 52, 38, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2006-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (200, 29, 29, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2006-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (201, 34, 31, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2006-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (202, 60, 18, CAST(N'2006-05-20T00:00:00.000' AS DateTime), CAST(N'2006-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (203, 64, 16, CAST(N'2006-05-21T00:00:00.000' AS DateTime), CAST(N'2006-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (204, 14, 17, CAST(N'2006-05-24T00:00:00.000' AS DateTime), CAST(N'2006-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (205, 81, 42, CAST(N'2006-05-24T00:00:00.000' AS DateTime), CAST(N'2006-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (206, 22, 36, CAST(N'2006-05-24T00:00:00.000' AS DateTime), CAST(N'2006-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (207, 17, 16, CAST(N'2006-05-24T00:00:00.000' AS DateTime), CAST(N'2006-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (208, 95, 6, CAST(N'2006-05-26T00:00:00.000' AS DateTime), CAST(N'2006-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (209, 75, 21, CAST(N'2006-05-27T00:00:00.000' AS DateTime), CAST(N'2006-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (210, 47, 5, CAST(N'2006-05-28T00:00:00.000' AS DateTime), CAST(N'2006-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (211, 34, 21, CAST(N'2006-05-28T00:00:00.000' AS DateTime), CAST(N'2006-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (212, 5, 43, CAST(N'2006-05-28T00:00:00.000' AS DateTime), CAST(N'2006-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (213, 26, 23, CAST(N'2006-06-02T00:00:00.000' AS DateTime), CAST(N'2006-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (214, 34, 34, CAST(N'2006-06-02T00:00:00.000' AS DateTime), CAST(N'2006-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (215, 92, 19, CAST(N'2006-06-03T00:00:00.000' AS DateTime), CAST(N'2006-06-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (216, 34, 43, CAST(N'2006-06-03T00:00:00.000' AS DateTime), CAST(N'2006-06-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (217, 90, 16, CAST(N'2006-06-03T00:00:00.000' AS DateTime), CAST(N'2006-06-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (218, 95, 38, CAST(N'2006-06-03T00:00:00.000' AS DateTime), CAST(N'2006-06-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (219, 67, 16, CAST(N'2006-06-03T00:00:00.000' AS DateTime), CAST(N'2006-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (220, 54, 27, CAST(N'2006-06-05T00:00:00.000' AS DateTime), CAST(N'2006-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (221, 55, 40, CAST(N'2006-06-05T00:00:00.000' AS DateTime), CAST(N'2006-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (222, 14, 27, CAST(N'2006-06-07T00:00:00.000' AS DateTime), CAST(N'2006-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (223, 2, 36, CAST(N'2006-06-08T00:00:00.000' AS DateTime), CAST(N'2006-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (224, 79, 38, CAST(N'2006-06-09T00:00:00.000' AS DateTime), CAST(N'2006-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (225, 44, 39, CAST(N'2006-06-10T00:00:00.000' AS DateTime), CAST(N'2006-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (226, 72, 10, CAST(N'2006-06-10T00:00:00.000' AS DateTime), CAST(N'2006-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (227, 72, 41, CAST(N'2006-06-10T00:00:00.000' AS DateTime), CAST(N'2006-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (228, 46, 18, CAST(N'2006-06-11T00:00:00.000' AS DateTime), CAST(N'2006-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (229, 50, 42, CAST(N'2006-06-12T00:00:00.000' AS DateTime), CAST(N'2006-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (230, 20, 16, CAST(N'2006-06-12T00:00:00.000' AS DateTime), CAST(N'2006-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (231, 62, 33, CAST(N'2006-06-13T00:00:00.000' AS DateTime), CAST(N'2006-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (232, 18, 41, CAST(N'2006-06-14T00:00:00.000' AS DateTime), CAST(N'2006-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (233, 53, 38, CAST(N'2006-06-15T00:00:00.000' AS DateTime), CAST(N'2006-07-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (234, 67, 44, CAST(N'2006-06-16T00:00:00.000' AS DateTime), CAST(N'2006-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (235, 73, 9, CAST(N'2006-06-17T00:00:00.000' AS DateTime), CAST(N'2006-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (236, 23, 1, CAST(N'2006-06-20T00:00:00.000' AS DateTime), CAST(N'2006-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (237, 98, 8, CAST(N'2006-06-21T00:00:00.000' AS DateTime), CAST(N'2006-07-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (238, 85, 2, CAST(N'2006-06-22T00:00:00.000' AS DateTime), CAST(N'2006-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (239, 40, 19, CAST(N'2006-06-22T00:00:00.000' AS DateTime), CAST(N'2006-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (240, 31, 28, CAST(N'2006-06-24T00:00:00.000' AS DateTime), CAST(N'2006-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (241, 48, 28, CAST(N'2006-06-24T00:00:00.000' AS DateTime), CAST(N'2006-07-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (242, 85, 33, CAST(N'2006-06-24T00:00:00.000' AS DateTime), CAST(N'2006-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (243, 20, 38, CAST(N'2006-06-25T00:00:00.000' AS DateTime), CAST(N'2006-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (244, 22, 43, CAST(N'2006-06-25T00:00:00.000' AS DateTime), CAST(N'2006-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (245, 70, 44, CAST(N'2006-06-25T00:00:00.000' AS DateTime), CAST(N'2006-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (246, 30, 9, CAST(N'2006-06-25T00:00:00.000' AS DateTime), CAST(N'2006-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (247, 31, 43, CAST(N'2006-06-25T00:00:00.000' AS DateTime), CAST(N'2006-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (248, 49, 25, CAST(N'2006-06-26T00:00:00.000' AS DateTime), CAST(N'2006-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (249, 75, 36, CAST(N'2006-06-26T00:00:00.000' AS DateTime), CAST(N'2006-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (250, 96, 8, CAST(N'2006-06-27T00:00:00.000' AS DateTime), CAST(N'2006-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (251, 22, 21, CAST(N'2006-06-28T00:00:00.000' AS DateTime), CAST(N'2006-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (252, 10, 37, CAST(N'2006-07-01T00:00:00.000' AS DateTime), CAST(N'2006-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (253, 20, 37, CAST(N'2006-07-02T00:00:00.000' AS DateTime), CAST(N'2006-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (254, 83, 3, CAST(N'2006-07-02T00:00:00.000' AS DateTime), CAST(N'2006-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (255, 23, 26, CAST(N'2006-07-03T00:00:00.000' AS DateTime), CAST(N'2006-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (256, 93, 37, CAST(N'2006-07-04T00:00:00.000' AS DateTime), CAST(N'2006-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (257, 52, 14, CAST(N'2006-07-04T00:00:00.000' AS DateTime), CAST(N'2006-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (258, 21, 30, CAST(N'2006-07-05T00:00:00.000' AS DateTime), CAST(N'2006-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (259, 3, 4, CAST(N'2006-07-05T00:00:00.000' AS DateTime), CAST(N'2006-07-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (260, 14, 29, CAST(N'2006-07-06T00:00:00.000' AS DateTime), CAST(N'2006-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (261, 80, 19, CAST(N'2006-07-07T00:00:00.000' AS DateTime), CAST(N'2006-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (262, 59, 43, CAST(N'2006-07-07T00:00:00.000' AS DateTime), CAST(N'2006-07-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (263, 23, 1, CAST(N'2006-07-07T00:00:00.000' AS DateTime), CAST(N'2006-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (264, 5, 10, CAST(N'2006-07-09T00:00:00.000' AS DateTime), CAST(N'2006-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (265, 28, 6, CAST(N'2006-07-09T00:00:00.000' AS DateTime), CAST(N'2006-07-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (266, 10, 23, CAST(N'2006-07-10T00:00:00.000' AS DateTime), CAST(N'2006-07-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (267, 30, 3, CAST(N'2006-07-10T00:00:00.000' AS DateTime), CAST(N'2006-07-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (268, 58, 26, CAST(N'2006-07-11T00:00:00.000' AS DateTime), CAST(N'2006-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (269, 50, 33, CAST(N'2006-07-11T00:00:00.000' AS DateTime), CAST(N'2006-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (270, 7, 43, CAST(N'2006-07-12T00:00:00.000' AS DateTime), CAST(N'2006-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (271, 90, 40, CAST(N'2006-07-13T00:00:00.000' AS DateTime), CAST(N'2006-07-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (272, 20, 41, CAST(N'2006-07-13T00:00:00.000' AS DateTime), CAST(N'2006-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (273, 61, 27, CAST(N'2006-07-14T00:00:00.000' AS DateTime), CAST(N'2006-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (274, 52, 34, CAST(N'2006-07-15T00:00:00.000' AS DateTime), CAST(N'2006-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (275, 56, 17, CAST(N'2006-07-15T00:00:00.000' AS DateTime), CAST(N'2006-08-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (276, 75, 20, CAST(N'2006-07-15T00:00:00.000' AS DateTime), CAST(N'2006-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (277, 70, 39, CAST(N'2006-07-16T00:00:00.000' AS DateTime), CAST(N'2006-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (278, 66, 16, CAST(N'2006-07-16T00:00:00.000' AS DateTime), CAST(N'2006-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (279, 65, 3, CAST(N'2006-07-16T00:00:00.000' AS DateTime), CAST(N'2006-08-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (280, 42, 18, CAST(N'2006-07-17T00:00:00.000' AS DateTime), CAST(N'2006-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (281, 53, 2, CAST(N'2006-07-17T00:00:00.000' AS DateTime), CAST(N'2006-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (282, 21, 26, CAST(N'2006-07-18T00:00:00.000' AS DateTime), CAST(N'2006-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (283, 45, 21, CAST(N'2006-07-18T00:00:00.000' AS DateTime), CAST(N'2006-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (284, 65, 5, CAST(N'2006-07-21T00:00:00.000' AS DateTime), CAST(N'2006-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (285, 19, 17, CAST(N'2006-07-21T00:00:00.000' AS DateTime), CAST(N'2006-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (286, 98, 27, CAST(N'2006-07-21T00:00:00.000' AS DateTime), CAST(N'2006-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (287, 59, 32, CAST(N'2006-07-21T00:00:00.000' AS DateTime), CAST(N'2006-07-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (288, 33, 16, CAST(N'2006-07-22T00:00:00.000' AS DateTime), CAST(N'2006-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (289, 95, 33, CAST(N'2006-07-22T00:00:00.000' AS DateTime), CAST(N'2006-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (290, 87, 38, CAST(N'2006-07-23T00:00:00.000' AS DateTime), CAST(N'2006-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (291, 4, 19, CAST(N'2006-07-25T00:00:00.000' AS DateTime), CAST(N'2006-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (292, 87, 12, CAST(N'2006-07-26T00:00:00.000' AS DateTime), CAST(N'2006-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (293, 54, 28, CAST(N'2006-07-26T00:00:00.000' AS DateTime), CAST(N'2006-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (294, 53, 38, CAST(N'2006-07-27T00:00:00.000' AS DateTime), CAST(N'2006-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (295, 13, 10, CAST(N'2006-07-27T00:00:00.000' AS DateTime), CAST(N'2006-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (296, 6, 33, CAST(N'2006-08-01T00:00:00.000' AS DateTime), CAST(N'2006-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (297, 26, 27, CAST(N'2006-08-02T00:00:00.000' AS DateTime), CAST(N'2006-08-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (298, 13, 32, CAST(N'2006-08-03T00:00:00.000' AS DateTime), CAST(N'2006-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (299, 18, 21, CAST(N'2006-08-03T00:00:00.000' AS DateTime), CAST(N'2006-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (300, 48, 21, CAST(N'2006-08-03T00:00:00.000' AS DateTime), CAST(N'2006-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (301, 72, 29, CAST(N'2006-08-04T00:00:00.000' AS DateTime), CAST(N'2006-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (302, 64, 6, CAST(N'2006-08-04T00:00:00.000' AS DateTime), CAST(N'2006-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (303, 91, 15, CAST(N'2006-08-05T00:00:00.000' AS DateTime), CAST(N'2006-08-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (304, 57, 31, CAST(N'2006-08-05T00:00:00.000' AS DateTime), CAST(N'2006-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (305, 29, 16, CAST(N'2006-08-06T00:00:00.000' AS DateTime), CAST(N'2006-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (306, 86, 11, CAST(N'2006-08-06T00:00:00.000' AS DateTime), CAST(N'2006-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (307, 40, 3, CAST(N'2006-08-06T00:00:00.000' AS DateTime), CAST(N'2006-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (308, 92, 16, CAST(N'2006-08-06T00:00:00.000' AS DateTime), CAST(N'2006-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (309, 48, 9, CAST(N'2006-08-08T00:00:00.000' AS DateTime), CAST(N'2006-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (310, 36, 11, CAST(N'2006-08-08T00:00:00.000' AS DateTime), CAST(N'2006-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (311, 5, 27, CAST(N'2006-08-08T00:00:00.000' AS DateTime), CAST(N'2006-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (312, 73, 20, CAST(N'2006-08-11T00:00:00.000' AS DateTime), CAST(N'2006-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (313, 35, 7, CAST(N'2006-08-11T00:00:00.000' AS DateTime), CAST(N'2006-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (314, 77, 11, CAST(N'2006-08-12T00:00:00.000' AS DateTime), CAST(N'2006-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (315, 76, 19, CAST(N'2006-08-13T00:00:00.000' AS DateTime), CAST(N'2006-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (316, 15, 3, CAST(N'2006-08-14T00:00:00.000' AS DateTime), CAST(N'2006-08-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (317, 18, 34, CAST(N'2006-08-14T00:00:00.000' AS DateTime), CAST(N'2006-08-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (318, 4, 6, CAST(N'2006-08-15T00:00:00.000' AS DateTime), CAST(N'2006-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (319, 11, 15, CAST(N'2006-08-17T00:00:00.000' AS DateTime), CAST(N'2006-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (320, 81, 35, CAST(N'2006-08-17T00:00:00.000' AS DateTime), CAST(N'2006-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (321, 16, 40, CAST(N'2006-08-17T00:00:00.000' AS DateTime), CAST(N'2006-08-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (322, 23, 26, CAST(N'2006-08-18T00:00:00.000' AS DateTime), CAST(N'2006-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (323, 12, 5, CAST(N'2006-08-18T00:00:00.000' AS DateTime), CAST(N'2006-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (324, 99, 10, CAST(N'2006-08-18T00:00:00.000' AS DateTime), CAST(N'2006-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (325, 77, 14, CAST(N'2006-08-20T00:00:00.000' AS DateTime), CAST(N'2006-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (326, 89, 42, CAST(N'2006-08-21T00:00:00.000' AS DateTime), CAST(N'2006-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (327, 50, 31, CAST(N'2006-08-21T00:00:00.000' AS DateTime), CAST(N'2006-08-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (328, 18, 20, CAST(N'2006-08-22T00:00:00.000' AS DateTime), CAST(N'2006-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (329, 5, 13, CAST(N'2006-08-22T00:00:00.000' AS DateTime), CAST(N'2006-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (330, 76, 18, CAST(N'2006-08-23T00:00:00.000' AS DateTime), CAST(N'2006-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (331, 71, 3, CAST(N'2006-08-23T00:00:00.000' AS DateTime), CAST(N'2006-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (332, 77, 25, CAST(N'2006-08-23T00:00:00.000' AS DateTime), CAST(N'2006-08-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (333, 52, 27, CAST(N'2006-08-24T00:00:00.000' AS DateTime), CAST(N'2006-08-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (334, 58, 33, CAST(N'2006-08-27T00:00:00.000' AS DateTime), CAST(N'2006-09-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (335, 81, 36, CAST(N'2006-08-28T00:00:00.000' AS DateTime), CAST(N'2006-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (336, 62, 36, CAST(N'2006-09-01T00:00:00.000' AS DateTime), CAST(N'2006-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (337, 47, 34, CAST(N'2006-09-01T00:00:00.000' AS DateTime), CAST(N'2006-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (338, 46, 31, CAST(N'2006-09-01T00:00:00.000' AS DateTime), CAST(N'2006-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (339, 22, 2, CAST(N'2006-09-01T00:00:00.000' AS DateTime), CAST(N'2006-09-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (340, 88, 12, CAST(N'2006-09-01T00:00:00.000' AS DateTime), CAST(N'2006-09-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (341, 50, 2, CAST(N'2006-09-02T00:00:00.000' AS DateTime), CAST(N'2006-09-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (342, 59, 35, CAST(N'2006-09-03T00:00:00.000' AS DateTime), CAST(N'2006-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (343, 71, 22, CAST(N'2006-09-04T00:00:00.000' AS DateTime), CAST(N'2006-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (344, 58, 18, CAST(N'2006-09-04T00:00:00.000' AS DateTime), CAST(N'2006-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (345, 83, 9, CAST(N'2006-09-07T00:00:00.000' AS DateTime), CAST(N'2006-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (346, 28, 9, CAST(N'2006-09-07T00:00:00.000' AS DateTime), CAST(N'2006-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (347, 91, 37, CAST(N'2006-09-08T00:00:00.000' AS DateTime), CAST(N'2006-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (348, 2, 23, CAST(N'2006-09-09T00:00:00.000' AS DateTime), CAST(N'2006-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (349, 36, 25, CAST(N'2006-09-09T00:00:00.000' AS DateTime), CAST(N'2006-09-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (350, 36, 29, CAST(N'2006-09-09T00:00:00.000' AS DateTime), CAST(N'2006-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (351, 60, 29, CAST(N'2006-09-10T00:00:00.000' AS DateTime), CAST(N'2006-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (352, 2, 16, CAST(N'2006-09-10T00:00:00.000' AS DateTime), CAST(N'2006-09-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (353, 61, 13, CAST(N'2006-09-12T00:00:00.000' AS DateTime), CAST(N'2006-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (354, 80, 13, CAST(N'2006-09-12T00:00:00.000' AS DateTime), CAST(N'2006-09-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (355, 93, 27, CAST(N'2006-09-13T00:00:00.000' AS DateTime), CAST(N'2006-09-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (356, 5, 3, CAST(N'2006-09-14T00:00:00.000' AS DateTime), CAST(N'2006-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (357, 16, 23, CAST(N'2006-09-14T00:00:00.000' AS DateTime), CAST(N'2006-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (358, 1, 2, CAST(N'2006-09-16T00:00:00.000' AS DateTime), CAST(N'2006-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (359, 92, 6, CAST(N'2006-09-18T00:00:00.000' AS DateTime), CAST(N'2006-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (360, 23, 4, CAST(N'2006-09-22T00:00:00.000' AS DateTime), CAST(N'2006-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (361, 92, 22, CAST(N'2006-09-22T00:00:00.000' AS DateTime), CAST(N'2006-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (362, 12, 7, CAST(N'2006-09-23T00:00:00.000' AS DateTime), CAST(N'2006-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (363, 77, 41, CAST(N'2006-09-23T00:00:00.000' AS DateTime), CAST(N'2006-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (364, 6, 4, CAST(N'2006-09-23T00:00:00.000' AS DateTime), CAST(N'2006-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (365, 70, 18, CAST(N'2006-09-24T00:00:00.000' AS DateTime), CAST(N'2006-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (366, 64, 34, CAST(N'2006-09-25T00:00:00.000' AS DateTime), CAST(N'2006-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (367, 80, 28, CAST(N'2006-09-26T00:00:00.000' AS DateTime), CAST(N'2006-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (368, 66, 29, CAST(N'2006-09-26T00:00:00.000' AS DateTime), CAST(N'2006-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (369, 78, 38, CAST(N'2006-09-26T00:00:00.000' AS DateTime), CAST(N'2006-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (370, 95, 41, CAST(N'2006-09-27T00:00:00.000' AS DateTime), CAST(N'2006-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (371, 32, 13, CAST(N'2006-10-01T00:00:00.000' AS DateTime), CAST(N'2006-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (372, 61, 10, CAST(N'2006-10-02T00:00:00.000' AS DateTime), CAST(N'2006-10-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (373, 98, 17, CAST(N'2006-10-02T00:00:00.000' AS DateTime), CAST(N'2006-10-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (374, 85, 40, CAST(N'2006-10-02T00:00:00.000' AS DateTime), CAST(N'2006-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (375, 67, 8, CAST(N'2006-10-02T00:00:00.000' AS DateTime), CAST(N'2006-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (376, 16, 9, CAST(N'2006-10-04T00:00:00.000' AS DateTime), CAST(N'2006-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (377, 89, 34, CAST(N'2006-10-04T00:00:00.000' AS DateTime), CAST(N'2006-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (378, 36, 35, CAST(N'2006-10-04T00:00:00.000' AS DateTime), CAST(N'2006-10-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (379, 25, 3, CAST(N'2006-10-05T00:00:00.000' AS DateTime), CAST(N'2006-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (380, 21, 39, CAST(N'2006-10-05T00:00:00.000' AS DateTime), CAST(N'2006-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (381, 61, 31, CAST(N'2006-10-07T00:00:00.000' AS DateTime), CAST(N'2006-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (382, 25, 34, CAST(N'2006-10-08T00:00:00.000' AS DateTime), CAST(N'2006-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (383, 65, 39, CAST(N'2006-10-09T00:00:00.000' AS DateTime), CAST(N'2006-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (384, 83, 12, CAST(N'2006-10-09T00:00:00.000' AS DateTime), CAST(N'2006-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (385, 54, 5, CAST(N'2006-10-10T00:00:00.000' AS DateTime), CAST(N'2006-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (386, 15, 41, CAST(N'2006-10-10T00:00:00.000' AS DateTime), CAST(N'2006-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (387, 39, 37, CAST(N'2006-10-11T00:00:00.000' AS DateTime), CAST(N'2006-10-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (388, 99, 34, CAST(N'2006-10-11T00:00:00.000' AS DateTime), CAST(N'2006-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (389, 33, 16, CAST(N'2006-10-13T00:00:00.000' AS DateTime), CAST(N'2006-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (390, 82, 38, CAST(N'2006-10-14T00:00:00.000' AS DateTime), CAST(N'2006-10-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (391, 87, 39, CAST(N'2006-10-15T00:00:00.000' AS DateTime), CAST(N'2006-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (392, 31, 13, CAST(N'2006-10-15T00:00:00.000' AS DateTime), CAST(N'2006-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (393, 4, 32, CAST(N'2006-10-15T00:00:00.000' AS DateTime), CAST(N'2006-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (394, 32, 37, CAST(N'2006-10-16T00:00:00.000' AS DateTime), CAST(N'2006-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (395, 58, 36, CAST(N'2006-10-16T00:00:00.000' AS DateTime), CAST(N'2006-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (396, 42, 17, CAST(N'2006-10-16T00:00:00.000' AS DateTime), CAST(N'2006-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (397, 36, 36, CAST(N'2006-10-16T00:00:00.000' AS DateTime), CAST(N'2006-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (398, 53, 8, CAST(N'2006-10-16T00:00:00.000' AS DateTime), CAST(N'2006-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (399, 28, 42, CAST(N'2006-10-17T00:00:00.000' AS DateTime), CAST(N'2006-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (400, 27, 6, CAST(N'2006-10-17T00:00:00.000' AS DateTime), CAST(N'2006-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (401, 63, 12, CAST(N'2006-10-18T00:00:00.000' AS DateTime), CAST(N'2006-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (402, 83, 22, CAST(N'2006-10-18T00:00:00.000' AS DateTime), CAST(N'2006-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (403, 68, 19, CAST(N'2006-10-19T00:00:00.000' AS DateTime), CAST(N'2006-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (404, 15, 17, CAST(N'2006-10-19T00:00:00.000' AS DateTime), CAST(N'2006-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (405, 79, 37, CAST(N'2006-10-20T00:00:00.000' AS DateTime), CAST(N'2006-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (406, 41, 34, CAST(N'2006-10-20T00:00:00.000' AS DateTime), CAST(N'2006-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (407, 99, 1, CAST(N'2006-10-20T00:00:00.000' AS DateTime), CAST(N'2006-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (408, 82, 43, CAST(N'2006-10-21T00:00:00.000' AS DateTime), CAST(N'2006-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (409, 84, 25, CAST(N'2006-10-23T00:00:00.000' AS DateTime), CAST(N'2006-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (410, 23, 34, CAST(N'2006-10-24T00:00:00.000' AS DateTime), CAST(N'2006-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (411, 40, 1, CAST(N'2006-10-26T00:00:00.000' AS DateTime), CAST(N'2006-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (412, 33, 30, CAST(N'2006-10-26T00:00:00.000' AS DateTime), CAST(N'2006-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (413, 95, 16, CAST(N'2006-10-26T00:00:00.000' AS DateTime), CAST(N'2006-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (414, 24, 28, CAST(N'2006-10-26T00:00:00.000' AS DateTime), CAST(N'2006-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (415, 34, 18, CAST(N'2006-10-27T00:00:00.000' AS DateTime), CAST(N'2006-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (416, 18, 41, CAST(N'2006-10-27T00:00:00.000' AS DateTime), CAST(N'2006-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (417, 78, 29, CAST(N'2006-10-28T00:00:00.000' AS DateTime), CAST(N'2006-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (418, 19, 1, CAST(N'2006-11-01T00:00:00.000' AS DateTime), CAST(N'2006-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (419, 17, 21, CAST(N'2006-11-01T00:00:00.000' AS DateTime), CAST(N'2006-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (420, 58, 30, CAST(N'2006-11-02T00:00:00.000' AS DateTime), CAST(N'2006-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (421, 58, 35, CAST(N'2006-11-02T00:00:00.000' AS DateTime), CAST(N'2006-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (422, 30, 35, CAST(N'2006-11-02T00:00:00.000' AS DateTime), CAST(N'2006-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (423, 58, 35, CAST(N'2006-11-03T00:00:00.000' AS DateTime), CAST(N'2006-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (424, 42, 17, CAST(N'2006-11-03T00:00:00.000' AS DateTime), CAST(N'2006-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (425, 53, 30, CAST(N'2006-11-03T00:00:00.000' AS DateTime), CAST(N'2006-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (426, 38, 27, CAST(N'2006-11-04T00:00:00.000' AS DateTime), CAST(N'2006-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (427, 30, 8, CAST(N'2006-11-04T00:00:00.000' AS DateTime), CAST(N'2006-11-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (428, 87, 29, CAST(N'2006-11-05T00:00:00.000' AS DateTime), CAST(N'2006-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (429, 62, 25, CAST(N'2006-11-05T00:00:00.000' AS DateTime), CAST(N'2006-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (430, 27, 2, CAST(N'2006-11-05T00:00:00.000' AS DateTime), CAST(N'2006-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (431, 83, 22, CAST(N'2006-11-06T00:00:00.000' AS DateTime), CAST(N'2006-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (432, 12, 19, CAST(N'2006-11-07T00:00:00.000' AS DateTime), CAST(N'2006-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (433, 53, 44, CAST(N'2006-11-08T00:00:00.000' AS DateTime), CAST(N'2006-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (434, 70, 3, CAST(N'2006-11-10T00:00:00.000' AS DateTime), CAST(N'2006-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (435, 93, 14, CAST(N'2006-11-10T00:00:00.000' AS DateTime), CAST(N'2006-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (436, 43, 39, CAST(N'2006-11-10T00:00:00.000' AS DateTime), CAST(N'2006-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (437, 71, 8, CAST(N'2006-11-10T00:00:00.000' AS DateTime), CAST(N'2006-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (438, 83, 32, CAST(N'2006-11-11T00:00:00.000' AS DateTime), CAST(N'2006-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (439, 12, 14, CAST(N'2006-11-11T00:00:00.000' AS DateTime), CAST(N'2006-11-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (440, 17, 44, CAST(N'2006-11-12T00:00:00.000' AS DateTime), CAST(N'2006-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (441, 51, 19, CAST(N'2006-11-13T00:00:00.000' AS DateTime), CAST(N'2006-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (442, 36, 3, CAST(N'2006-11-15T00:00:00.000' AS DateTime), CAST(N'2006-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (443, 19, 38, CAST(N'2006-11-15T00:00:00.000' AS DateTime), CAST(N'2006-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (444, 51, 42, CAST(N'2006-11-15T00:00:00.000' AS DateTime), CAST(N'2006-11-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (445, 48, 5, CAST(N'2006-11-17T00:00:00.000' AS DateTime), CAST(N'2006-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (446, 76, 41, CAST(N'2006-11-18T00:00:00.000' AS DateTime), CAST(N'2006-12-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (447, 48, 31, CAST(N'2006-11-18T00:00:00.000' AS DateTime), CAST(N'2006-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (448, 36, 8, CAST(N'2006-11-19T00:00:00.000' AS DateTime), CAST(N'2006-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (449, 84, 25, CAST(N'2006-11-19T00:00:00.000' AS DateTime), CAST(N'2006-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (450, 64, 32, CAST(N'2006-11-19T00:00:00.000' AS DateTime), CAST(N'2006-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (451, 19, 30, CAST(N'2006-11-19T00:00:00.000' AS DateTime), CAST(N'2006-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (452, 9, 4, CAST(N'2006-11-20T00:00:00.000' AS DateTime), CAST(N'2006-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (453, 88, 36, CAST(N'2006-11-22T00:00:00.000' AS DateTime), CAST(N'2006-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (454, 30, 15, CAST(N'2006-11-23T00:00:00.000' AS DateTime), CAST(N'2006-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (455, 71, 16, CAST(N'2006-11-23T00:00:00.000' AS DateTime), CAST(N'2006-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (456, 27, 43, CAST(N'2006-11-24T00:00:00.000' AS DateTime), CAST(N'2006-12-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (457, 82, 5, CAST(N'2006-11-26T00:00:00.000' AS DateTime), CAST(N'2006-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (458, 61, 3, CAST(N'2006-11-27T00:00:00.000' AS DateTime), CAST(N'2006-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (459, 71, 34, CAST(N'2006-11-28T00:00:00.000' AS DateTime), CAST(N'2006-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (460, 27, 27, CAST(N'2006-11-28T00:00:00.000' AS DateTime), CAST(N'2006-12-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (461, 89, 23, CAST(N'2006-11-28T00:00:00.000' AS DateTime), CAST(N'2006-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (462, 27, 19, CAST(N'2007-01-01T00:00:00.000' AS DateTime), CAST(N'2007-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (463, 74, 36, CAST(N'2007-01-01T00:00:00.000' AS DateTime), CAST(N'2007-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (464, 13, 3, CAST(N'2007-01-02T00:00:00.000' AS DateTime), CAST(N'2007-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (465, 50, 37, CAST(N'2007-01-02T00:00:00.000' AS DateTime), CAST(N'2007-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (466, 2, 31, CAST(N'2007-01-02T00:00:00.000' AS DateTime), CAST(N'2007-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (467, 46, 41, CAST(N'2007-01-02T00:00:00.000' AS DateTime), CAST(N'2007-01-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (468, 10, 41, CAST(N'2007-01-04T00:00:00.000' AS DateTime), CAST(N'2007-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (469, 66, 1, CAST(N'2007-01-04T00:00:00.000' AS DateTime), CAST(N'2007-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (470, 23, 17, CAST(N'2007-01-06T00:00:00.000' AS DateTime), CAST(N'2007-01-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (471, 2, 5, CAST(N'2007-01-10T00:00:00.000' AS DateTime), CAST(N'2007-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (472, 13, 25, CAST(N'2007-01-10T00:00:00.000' AS DateTime), CAST(N'2007-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (473, 50, 14, CAST(N'2007-01-11T00:00:00.000' AS DateTime), CAST(N'2007-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (474, 35, 15, CAST(N'2007-01-13T00:00:00.000' AS DateTime), CAST(N'2007-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (475, 62, 15, CAST(N'2007-01-14T00:00:00.000' AS DateTime), CAST(N'2007-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (476, 25, 11, CAST(N'2007-01-15T00:00:00.000' AS DateTime), CAST(N'2007-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (477, 85, 9, CAST(N'2007-01-16T00:00:00.000' AS DateTime), CAST(N'2007-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (478, 19, 15, CAST(N'2007-01-16T00:00:00.000' AS DateTime), CAST(N'2007-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (479, 34, 34, CAST(N'2007-01-17T00:00:00.000' AS DateTime), CAST(N'2007-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (480, 91, 13, CAST(N'2007-01-17T00:00:00.000' AS DateTime), CAST(N'2007-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (481, 58, 30, CAST(N'2007-01-17T00:00:00.000' AS DateTime), CAST(N'2007-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (482, 26, 42, CAST(N'2007-01-19T00:00:00.000' AS DateTime), CAST(N'2007-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (483, 91, 30, CAST(N'2007-01-19T00:00:00.000' AS DateTime), CAST(N'2007-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (484, 36, 19, CAST(N'2007-01-20T00:00:00.000' AS DateTime), CAST(N'2007-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (485, 49, 23, CAST(N'2007-01-20T00:00:00.000' AS DateTime), CAST(N'2007-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (486, 14, 13, CAST(N'2007-01-21T00:00:00.000' AS DateTime), CAST(N'2007-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (487, 45, 28, CAST(N'2007-01-21T00:00:00.000' AS DateTime), CAST(N'2007-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (488, 16, 10, CAST(N'2007-01-21T00:00:00.000' AS DateTime), CAST(N'2007-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (489, 22, 24, CAST(N'2007-01-22T00:00:00.000' AS DateTime), CAST(N'2007-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (490, 81, 14, CAST(N'2007-01-23T00:00:00.000' AS DateTime), CAST(N'2007-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (491, 5, 43, CAST(N'2007-01-23T00:00:00.000' AS DateTime), CAST(N'2007-02-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (492, 51, 23, CAST(N'2007-01-23T00:00:00.000' AS DateTime), CAST(N'2007-02-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (493, 24, 15, CAST(N'2007-01-25T00:00:00.000' AS DateTime), CAST(N'2007-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (494, 12, 11, CAST(N'2007-01-25T00:00:00.000' AS DateTime), CAST(N'2007-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (495, 48, 33, CAST(N'2007-01-26T00:00:00.000' AS DateTime), CAST(N'2007-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (496, 79, 44, CAST(N'2007-01-26T00:00:00.000' AS DateTime), CAST(N'2007-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (497, 66, 33, CAST(N'2007-01-27T00:00:00.000' AS DateTime), CAST(N'2007-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (498, 45, 44, CAST(N'2007-01-27T00:00:00.000' AS DateTime), CAST(N'2007-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (499, 35, 38, CAST(N'2007-01-28T00:00:00.000' AS DateTime), CAST(N'2007-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (500, 64, 5, CAST(N'2007-02-02T00:00:00.000' AS DateTime), CAST(N'2007-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (501, 3, 9, CAST(N'2007-02-02T00:00:00.000' AS DateTime), CAST(N'2007-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (502, 54, 28, CAST(N'2007-02-02T00:00:00.000' AS DateTime), CAST(N'2007-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (503, 28, 11, CAST(N'2007-02-03T00:00:00.000' AS DateTime), CAST(N'2007-02-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (504, 63, 32, CAST(N'2007-02-03T00:00:00.000' AS DateTime), CAST(N'2007-02-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (505, 92, 26, CAST(N'2007-02-03T00:00:00.000' AS DateTime), CAST(N'2007-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (506, 51, 5, CAST(N'2007-02-04T00:00:00.000' AS DateTime), CAST(N'2007-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (507, 64, 25, CAST(N'2007-02-05T00:00:00.000' AS DateTime), CAST(N'2007-02-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (508, 18, 42, CAST(N'2007-02-05T00:00:00.000' AS DateTime), CAST(N'2007-02-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (509, 36, 5, CAST(N'2007-02-08T00:00:00.000' AS DateTime), CAST(N'2007-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (510, 31, 38, CAST(N'2007-02-08T00:00:00.000' AS DateTime), CAST(N'2007-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (511, 89, 31, CAST(N'2007-02-08T00:00:00.000' AS DateTime), CAST(N'2007-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (512, 29, 16, CAST(N'2007-02-09T00:00:00.000' AS DateTime), CAST(N'2007-02-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (513, 2, 37, CAST(N'2007-02-10T00:00:00.000' AS DateTime), CAST(N'2007-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (514, 47, 28, CAST(N'2007-02-11T00:00:00.000' AS DateTime), CAST(N'2007-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (515, 46, 35, CAST(N'2007-02-12T00:00:00.000' AS DateTime), CAST(N'2007-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (516, 95, 2, CAST(N'2007-02-14T00:00:00.000' AS DateTime), CAST(N'2007-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (517, 83, 2, CAST(N'2007-02-14T00:00:00.000' AS DateTime), CAST(N'2007-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (518, 16, 5, CAST(N'2007-02-14T00:00:00.000' AS DateTime), CAST(N'2007-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (519, 51, 25, CAST(N'2007-02-15T00:00:00.000' AS DateTime), CAST(N'2007-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (520, 75, 37, CAST(N'2007-02-15T00:00:00.000' AS DateTime), CAST(N'2007-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (521, 42, 41, CAST(N'2007-02-15T00:00:00.000' AS DateTime), CAST(N'2007-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (522, 81, 39, CAST(N'2007-02-16T00:00:00.000' AS DateTime), CAST(N'2007-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (523, 29, 38, CAST(N'2007-02-17T00:00:00.000' AS DateTime), CAST(N'2007-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (524, 16, 1, CAST(N'2007-02-17T00:00:00.000' AS DateTime), CAST(N'2007-02-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (525, 81, 5, CAST(N'2007-02-17T00:00:00.000' AS DateTime), CAST(N'2007-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (526, 50, 29, CAST(N'2007-02-18T00:00:00.000' AS DateTime), CAST(N'2007-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (527, 66, 15, CAST(N'2007-02-18T00:00:00.000' AS DateTime), CAST(N'2007-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (528, 9, 28, CAST(N'2007-02-18T00:00:00.000' AS DateTime), CAST(N'2007-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (529, 11, 38, CAST(N'2007-02-18T00:00:00.000' AS DateTime), CAST(N'2007-03-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (530, 15, 40, CAST(N'2007-02-19T00:00:00.000' AS DateTime), CAST(N'2007-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (531, 1, 5, CAST(N'2007-02-20T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (532, 61, 17, CAST(N'2007-02-20T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (533, 89, 19, CAST(N'2007-02-20T00:00:00.000' AS DateTime), CAST(N'2007-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (534, 79, 16, CAST(N'2007-02-21T00:00:00.000' AS DateTime), CAST(N'2007-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (535, 34, 22, CAST(N'2007-02-22T00:00:00.000' AS DateTime), CAST(N'2007-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (536, 97, 30, CAST(N'2007-02-23T00:00:00.000' AS DateTime), CAST(N'2007-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (537, 71, 18, CAST(N'2007-02-23T00:00:00.000' AS DateTime), CAST(N'2007-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (538, 37, 23, CAST(N'2007-02-24T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (539, 10, 13, CAST(N'2007-02-24T00:00:00.000' AS DateTime), CAST(N'2007-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (540, 94, 16, CAST(N'2007-02-24T00:00:00.000' AS DateTime), CAST(N'2007-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (541, 97, 25, CAST(N'2007-02-25T00:00:00.000' AS DateTime), CAST(N'2007-03-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (542, 78, 23, CAST(N'2007-02-26T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (543, 97, 39, CAST(N'2007-02-27T00:00:00.000' AS DateTime), CAST(N'2007-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (544, 54, 10, CAST(N'2007-02-27T00:00:00.000' AS DateTime), CAST(N'2007-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (545, 74, 29, CAST(N'2007-02-27T00:00:00.000' AS DateTime), CAST(N'2007-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (546, 26, 12, CAST(N'2007-03-01T00:00:00.000' AS DateTime), CAST(N'2007-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (547, 35, 24, CAST(N'2007-03-02T00:00:00.000' AS DateTime), CAST(N'2007-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (548, 76, 5, CAST(N'2007-03-02T00:00:00.000' AS DateTime), CAST(N'2007-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (549, 10, 30, CAST(N'2007-03-03T00:00:00.000' AS DateTime), CAST(N'2007-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (550, 71, 17, CAST(N'2007-03-03T00:00:00.000' AS DateTime), CAST(N'2007-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (551, 42, 3, CAST(N'2007-03-05T00:00:00.000' AS DateTime), CAST(N'2007-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (552, 6, 12, CAST(N'2007-03-05T00:00:00.000' AS DateTime), CAST(N'2007-03-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (553, 68, 24, CAST(N'2007-03-06T00:00:00.000' AS DateTime), CAST(N'2007-03-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (554, 5, 28, CAST(N'2007-03-07T00:00:00.000' AS DateTime), CAST(N'2007-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (555, 92, 27, CAST(N'2007-03-10T00:00:00.000' AS DateTime), CAST(N'2007-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (556, 51, 42, CAST(N'2007-03-10T00:00:00.000' AS DateTime), CAST(N'2007-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (557, 57, 5, CAST(N'2007-03-10T00:00:00.000' AS DateTime), CAST(N'2007-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (558, 73, 16, CAST(N'2007-03-11T00:00:00.000' AS DateTime), CAST(N'2007-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (559, 4, 42, CAST(N'2007-03-11T00:00:00.000' AS DateTime), CAST(N'2007-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (560, 67, 17, CAST(N'2007-03-12T00:00:00.000' AS DateTime), CAST(N'2007-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (561, 87, 42, CAST(N'2007-03-12T00:00:00.000' AS DateTime), CAST(N'2007-03-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (562, 98, 4, CAST(N'2007-03-12T00:00:00.000' AS DateTime), CAST(N'2007-03-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (563, 61, 2, CAST(N'2007-03-13T00:00:00.000' AS DateTime), CAST(N'2007-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (564, 94, 32, CAST(N'2007-03-13T00:00:00.000' AS DateTime), CAST(N'2007-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (565, 38, 31, CAST(N'2007-03-13T00:00:00.000' AS DateTime), CAST(N'2007-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (566, 1, 11, CAST(N'2007-03-15T00:00:00.000' AS DateTime), CAST(N'2007-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (567, 43, 42, CAST(N'2007-03-16T00:00:00.000' AS DateTime), CAST(N'2007-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (568, 18, 41, CAST(N'2007-03-16T00:00:00.000' AS DateTime), CAST(N'2007-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (569, 5, 29, CAST(N'2007-03-16T00:00:00.000' AS DateTime), CAST(N'2007-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (570, 72, 26, CAST(N'2007-03-16T00:00:00.000' AS DateTime), CAST(N'2007-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (571, 41, 33, CAST(N'2007-03-16T00:00:00.000' AS DateTime), CAST(N'2007-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (572, 11, 2, CAST(N'2007-03-17T00:00:00.000' AS DateTime), CAST(N'2007-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (573, 85, 15, CAST(N'2007-03-18T00:00:00.000' AS DateTime), CAST(N'2007-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (574, 68, 9, CAST(N'2007-03-18T00:00:00.000' AS DateTime), CAST(N'2007-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (575, 34, 17, CAST(N'2007-03-19T00:00:00.000' AS DateTime), CAST(N'2007-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (576, 69, 18, CAST(N'2007-03-19T00:00:00.000' AS DateTime), CAST(N'2007-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (577, 23, 2, CAST(N'2007-03-21T00:00:00.000' AS DateTime), CAST(N'2007-03-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (578, 89, 11, CAST(N'2007-03-21T00:00:00.000' AS DateTime), CAST(N'2007-03-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (579, 59, 15, CAST(N'2007-03-22T00:00:00.000' AS DateTime), CAST(N'2007-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (580, 81, 28, CAST(N'2007-03-22T00:00:00.000' AS DateTime), CAST(N'2007-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (581, 70, 19, CAST(N'2007-03-22T00:00:00.000' AS DateTime), CAST(N'2007-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (582, 34, 28, CAST(N'2007-03-23T00:00:00.000' AS DateTime), CAST(N'2007-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (583, 10, 25, CAST(N'2007-03-23T00:00:00.000' AS DateTime), CAST(N'2007-03-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (584, 81, 34, CAST(N'2007-03-23T00:00:00.000' AS DateTime), CAST(N'2007-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (585, 73, 29, CAST(N'2007-03-27T00:00:00.000' AS DateTime), CAST(N'2007-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (586, 17, 16, CAST(N'2007-03-27T00:00:00.000' AS DateTime), CAST(N'2007-04-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (587, 44, 32, CAST(N'2007-03-27T00:00:00.000' AS DateTime), CAST(N'2007-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (588, 7, 2, CAST(N'2007-03-28T00:00:00.000' AS DateTime), CAST(N'2007-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (589, 46, 38, CAST(N'2007-04-01T00:00:00.000' AS DateTime), CAST(N'2007-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (590, 39, 2, CAST(N'2007-04-02T00:00:00.000' AS DateTime), CAST(N'2007-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (591, 44, 25, CAST(N'2007-04-03T00:00:00.000' AS DateTime), CAST(N'2007-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (592, 62, 28, CAST(N'2007-04-04T00:00:00.000' AS DateTime), CAST(N'2007-04-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (593, 97, 43, CAST(N'2007-04-05T00:00:00.000' AS DateTime), CAST(N'2007-04-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (594, 28, 11, CAST(N'2007-04-06T00:00:00.000' AS DateTime), CAST(N'2007-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (595, 51, 32, CAST(N'2007-04-09T00:00:00.000' AS DateTime), CAST(N'2007-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (596, 79, 5, CAST(N'2007-04-09T00:00:00.000' AS DateTime), CAST(N'2007-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (597, 94, 27, CAST(N'2007-04-11T00:00:00.000' AS DateTime), CAST(N'2007-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (598, 23, 4, CAST(N'2007-04-11T00:00:00.000' AS DateTime), CAST(N'2007-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (599, 6, 13, CAST(N'2007-04-11T00:00:00.000' AS DateTime), CAST(N'2007-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (600, 93, 41, CAST(N'2007-04-11T00:00:00.000' AS DateTime), CAST(N'2007-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (601, 86, 37, CAST(N'2007-04-13T00:00:00.000' AS DateTime), CAST(N'2007-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (602, 69, 20, CAST(N'2007-04-15T00:00:00.000' AS DateTime), CAST(N'2007-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (603, 9, 39, CAST(N'2007-04-15T00:00:00.000' AS DateTime), CAST(N'2007-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (604, 57, 18, CAST(N'2007-04-16T00:00:00.000' AS DateTime), CAST(N'2007-04-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (605, 82, 40, CAST(N'2007-04-16T00:00:00.000' AS DateTime), CAST(N'2007-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (606, 11, 14, CAST(N'2007-04-16T00:00:00.000' AS DateTime), CAST(N'2007-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (607, 69, 42, CAST(N'2007-04-16T00:00:00.000' AS DateTime), CAST(N'2007-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (608, 69, 29, CAST(N'2007-04-17T00:00:00.000' AS DateTime), CAST(N'2007-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (609, 28, 38, CAST(N'2007-04-18T00:00:00.000' AS DateTime), CAST(N'2007-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (610, 46, 38, CAST(N'2007-04-18T00:00:00.000' AS DateTime), CAST(N'2007-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (611, 1, 32, CAST(N'2007-04-18T00:00:00.000' AS DateTime), CAST(N'2007-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (612, 91, 3, CAST(N'2007-04-19T00:00:00.000' AS DateTime), CAST(N'2007-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (613, 15, 35, CAST(N'2007-04-19T00:00:00.000' AS DateTime), CAST(N'2007-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (614, 11, 4, CAST(N'2007-04-19T00:00:00.000' AS DateTime), CAST(N'2007-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (615, 83, 32, CAST(N'2007-04-20T00:00:00.000' AS DateTime), CAST(N'2007-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (616, 10, 5, CAST(N'2007-04-20T00:00:00.000' AS DateTime), CAST(N'2007-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (617, 71, 31, CAST(N'2007-04-20T00:00:00.000' AS DateTime), CAST(N'2007-04-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (618, 30, 34, CAST(N'2007-04-20T00:00:00.000' AS DateTime), CAST(N'2007-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (619, 97, 44, CAST(N'2007-04-21T00:00:00.000' AS DateTime), CAST(N'2007-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (620, 24, 5, CAST(N'2007-04-21T00:00:00.000' AS DateTime), CAST(N'2007-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (621, 25, 32, CAST(N'2007-04-22T00:00:00.000' AS DateTime), CAST(N'2007-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (622, 35, 1, CAST(N'2007-04-22T00:00:00.000' AS DateTime), CAST(N'2007-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (623, 60, 18, CAST(N'2007-04-24T00:00:00.000' AS DateTime), CAST(N'2007-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (624, 1, 36, CAST(N'2007-04-24T00:00:00.000' AS DateTime), CAST(N'2007-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (625, 22, 38, CAST(N'2007-04-24T00:00:00.000' AS DateTime), CAST(N'2007-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (626, 2, 29, CAST(N'2007-04-25T00:00:00.000' AS DateTime), CAST(N'2007-04-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (627, 64, 22, CAST(N'2007-04-28T00:00:00.000' AS DateTime), CAST(N'2007-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (628, 14, 2, CAST(N'2007-04-28T00:00:00.000' AS DateTime), CAST(N'2007-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (629, 68, 37, CAST(N'2007-05-02T00:00:00.000' AS DateTime), CAST(N'2007-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (630, 88, 24, CAST(N'2007-05-02T00:00:00.000' AS DateTime), CAST(N'2007-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (631, 24, 41, CAST(N'2007-05-03T00:00:00.000' AS DateTime), CAST(N'2007-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (632, 67, 13, CAST(N'2007-05-03T00:00:00.000' AS DateTime), CAST(N'2007-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (633, 29, 27, CAST(N'2007-05-03T00:00:00.000' AS DateTime), CAST(N'2007-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (634, 96, 6, CAST(N'2007-05-03T00:00:00.000' AS DateTime), CAST(N'2007-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (635, 3, 11, CAST(N'2007-05-04T00:00:00.000' AS DateTime), CAST(N'2007-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (636, 42, 3, CAST(N'2007-05-05T00:00:00.000' AS DateTime), CAST(N'2007-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (637, 53, 38, CAST(N'2007-05-05T00:00:00.000' AS DateTime), CAST(N'2007-05-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (638, 53, 38, CAST(N'2007-05-06T00:00:00.000' AS DateTime), CAST(N'2007-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (639, 96, 7, CAST(N'2007-05-08T00:00:00.000' AS DateTime), CAST(N'2007-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (640, 45, 43, CAST(N'2007-05-08T00:00:00.000' AS DateTime), CAST(N'2007-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (641, 9, 27, CAST(N'2007-05-10T00:00:00.000' AS DateTime), CAST(N'2007-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (642, 18, 39, CAST(N'2007-05-11T00:00:00.000' AS DateTime), CAST(N'2007-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (643, 91, 33, CAST(N'2007-05-11T00:00:00.000' AS DateTime), CAST(N'2007-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (644, 71, 41, CAST(N'2007-05-11T00:00:00.000' AS DateTime), CAST(N'2007-05-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (645, 47, 9, CAST(N'2007-05-12T00:00:00.000' AS DateTime), CAST(N'2007-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (646, 81, 8, CAST(N'2007-05-12T00:00:00.000' AS DateTime), CAST(N'2007-05-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (647, 89, 37, CAST(N'2007-05-14T00:00:00.000' AS DateTime), CAST(N'2007-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (648, 53, 11, CAST(N'2007-05-15T00:00:00.000' AS DateTime), CAST(N'2007-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (649, 92, 39, CAST(N'2007-05-15T00:00:00.000' AS DateTime), CAST(N'2007-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (650, 61, 33, CAST(N'2007-05-16T00:00:00.000' AS DateTime), CAST(N'2007-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (651, 67, 38, CAST(N'2007-05-16T00:00:00.000' AS DateTime), CAST(N'2007-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (652, 35, 8, CAST(N'2007-05-17T00:00:00.000' AS DateTime), CAST(N'2007-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (653, 92, 24, CAST(N'2007-05-17T00:00:00.000' AS DateTime), CAST(N'2007-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (654, 98, 14, CAST(N'2007-05-17T00:00:00.000' AS DateTime), CAST(N'2007-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (655, 78, 33, CAST(N'2007-05-18T00:00:00.000' AS DateTime), CAST(N'2007-05-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (656, 48, 33, CAST(N'2007-05-19T00:00:00.000' AS DateTime), CAST(N'2007-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (657, 45, 21, CAST(N'2007-05-20T00:00:00.000' AS DateTime), CAST(N'2007-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (658, 61, 9, CAST(N'2007-05-21T00:00:00.000' AS DateTime), CAST(N'2007-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (659, 73, 38, CAST(N'2007-05-21T00:00:00.000' AS DateTime), CAST(N'2007-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (660, 55, 11, CAST(N'2007-05-22T00:00:00.000' AS DateTime), CAST(N'2007-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (661, 29, 14, CAST(N'2007-05-22T00:00:00.000' AS DateTime), CAST(N'2007-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (662, 53, 23, CAST(N'2007-05-22T00:00:00.000' AS DateTime), CAST(N'2007-05-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (663, 99, 24, CAST(N'2007-05-23T00:00:00.000' AS DateTime), CAST(N'2007-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (664, 80, 19, CAST(N'2007-05-24T00:00:00.000' AS DateTime), CAST(N'2007-05-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (665, 90, 44, CAST(N'2007-05-24T00:00:00.000' AS DateTime), CAST(N'2007-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (666, 55, 40, CAST(N'2007-05-24T00:00:00.000' AS DateTime), CAST(N'2007-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (667, 46, 29, CAST(N'2007-05-24T00:00:00.000' AS DateTime), CAST(N'2007-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (668, 4, 8, CAST(N'2007-05-25T00:00:00.000' AS DateTime), CAST(N'2007-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (669, 28, 26, CAST(N'2007-05-27T00:00:00.000' AS DateTime), CAST(N'2007-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (670, 86, 28, CAST(N'2007-05-27T00:00:00.000' AS DateTime), CAST(N'2007-06-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (671, 1, 38, CAST(N'2007-05-27T00:00:00.000' AS DateTime), CAST(N'2007-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (672, 63, 2, CAST(N'2007-05-28T00:00:00.000' AS DateTime), CAST(N'2007-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (673, 86, 22, CAST(N'2007-05-28T00:00:00.000' AS DateTime), CAST(N'2007-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (674, 54, 38, CAST(N'2007-06-01T00:00:00.000' AS DateTime), CAST(N'2007-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (675, 87, 3, CAST(N'2007-06-01T00:00:00.000' AS DateTime), CAST(N'2007-06-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (676, 6, 21, CAST(N'2007-06-01T00:00:00.000' AS DateTime), CAST(N'2007-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (677, 82, 27, CAST(N'2007-06-02T00:00:00.000' AS DateTime), CAST(N'2007-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (678, 73, 42, CAST(N'2007-06-03T00:00:00.000' AS DateTime), CAST(N'2007-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (679, 66, 30, CAST(N'2007-06-03T00:00:00.000' AS DateTime), CAST(N'2007-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (680, 86, 15, CAST(N'2007-06-03T00:00:00.000' AS DateTime), CAST(N'2007-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (681, 76, 16, CAST(N'2007-06-04T00:00:00.000' AS DateTime), CAST(N'2007-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (682, 76, 42, CAST(N'2007-06-04T00:00:00.000' AS DateTime), CAST(N'2007-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (683, 83, 27, CAST(N'2007-06-04T00:00:00.000' AS DateTime), CAST(N'2007-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (684, 58, 7, CAST(N'2007-06-04T00:00:00.000' AS DateTime), CAST(N'2007-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (685, 83, 1, CAST(N'2007-06-05T00:00:00.000' AS DateTime), CAST(N'2007-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (686, 69, 4, CAST(N'2007-06-05T00:00:00.000' AS DateTime), CAST(N'2007-06-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (687, 8, 34, CAST(N'2007-06-05T00:00:00.000' AS DateTime), CAST(N'2007-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (688, 68, 13, CAST(N'2007-06-07T00:00:00.000' AS DateTime), CAST(N'2007-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (689, 2, 28, CAST(N'2007-06-09T00:00:00.000' AS DateTime), CAST(N'2007-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (690, 88, 11, CAST(N'2007-06-09T00:00:00.000' AS DateTime), CAST(N'2007-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (691, 95, 10, CAST(N'2007-06-09T00:00:00.000' AS DateTime), CAST(N'2007-06-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (692, 38, 19, CAST(N'2007-06-10T00:00:00.000' AS DateTime), CAST(N'2007-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (693, 79, 14, CAST(N'2007-06-11T00:00:00.000' AS DateTime), CAST(N'2007-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (694, 30, 4, CAST(N'2007-06-11T00:00:00.000' AS DateTime), CAST(N'2007-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (695, 4, 30, CAST(N'2007-06-11T00:00:00.000' AS DateTime), CAST(N'2007-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (696, 54, 17, CAST(N'2007-06-11T00:00:00.000' AS DateTime), CAST(N'2007-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (697, 64, 18, CAST(N'2007-06-11T00:00:00.000' AS DateTime), CAST(N'2007-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (698, 79, 28, CAST(N'2007-06-12T00:00:00.000' AS DateTime), CAST(N'2007-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (699, 32, 39, CAST(N'2007-06-14T00:00:00.000' AS DateTime), CAST(N'2007-07-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (700, 38, 44, CAST(N'2007-06-14T00:00:00.000' AS DateTime), CAST(N'2007-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (701, 5, 35, CAST(N'2007-06-15T00:00:00.000' AS DateTime), CAST(N'2007-07-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (702, 35, 42, CAST(N'2007-06-16T00:00:00.000' AS DateTime), CAST(N'2007-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (703, 26, 36, CAST(N'2007-06-17T00:00:00.000' AS DateTime), CAST(N'2007-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (704, 42, 33, CAST(N'2007-06-17T00:00:00.000' AS DateTime), CAST(N'2007-07-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (705, 38, 18, CAST(N'2007-06-17T00:00:00.000' AS DateTime), CAST(N'2007-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (706, 29, 16, CAST(N'2007-06-18T00:00:00.000' AS DateTime), CAST(N'2007-06-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (707, 23, 7, CAST(N'2007-06-19T00:00:00.000' AS DateTime), CAST(N'2007-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (708, 76, 16, CAST(N'2007-06-19T00:00:00.000' AS DateTime), CAST(N'2007-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (709, 18, 30, CAST(N'2007-06-21T00:00:00.000' AS DateTime), CAST(N'2007-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (710, 23, 40, CAST(N'2007-06-22T00:00:00.000' AS DateTime), CAST(N'2007-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (711, 63, 21, CAST(N'2007-06-22T00:00:00.000' AS DateTime), CAST(N'2007-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (712, 28, 22, CAST(N'2007-06-22T00:00:00.000' AS DateTime), CAST(N'2007-07-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (713, 2, 11, CAST(N'2007-06-22T00:00:00.000' AS DateTime), CAST(N'2007-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (714, 27, 12, CAST(N'2007-06-24T00:00:00.000' AS DateTime), CAST(N'2007-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (715, 45, 16, CAST(N'2007-06-24T00:00:00.000' AS DateTime), CAST(N'2007-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (716, 95, 16, CAST(N'2007-06-27T00:00:00.000' AS DateTime), CAST(N'2007-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (717, 54, 25, CAST(N'2007-06-27T00:00:00.000' AS DateTime), CAST(N'2007-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (718, 69, 8, CAST(N'2007-06-27T00:00:00.000' AS DateTime), CAST(N'2007-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (719, 11, 8, CAST(N'2007-06-27T00:00:00.000' AS DateTime), CAST(N'2007-07-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (720, 76, 15, CAST(N'2007-06-28T00:00:00.000' AS DateTime), CAST(N'2007-07-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (721, 75, 9, CAST(N'2007-07-01T00:00:00.000' AS DateTime), CAST(N'2007-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (722, 28, 21, CAST(N'2007-07-02T00:00:00.000' AS DateTime), CAST(N'2007-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (723, 13, 40, CAST(N'2007-07-03T00:00:00.000' AS DateTime), CAST(N'2007-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (724, 69, 36, CAST(N'2007-07-04T00:00:00.000' AS DateTime), CAST(N'2007-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (725, 54, 44, CAST(N'2007-07-04T00:00:00.000' AS DateTime), CAST(N'2007-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (726, 16, 28, CAST(N'2007-07-05T00:00:00.000' AS DateTime), CAST(N'2007-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (727, 35, 26, CAST(N'2007-07-05T00:00:00.000' AS DateTime), CAST(N'2007-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (728, 81, 7, CAST(N'2007-07-06T00:00:00.000' AS DateTime), CAST(N'2007-07-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (729, 34, 22, CAST(N'2007-07-06T00:00:00.000' AS DateTime), CAST(N'2007-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (730, 5, 18, CAST(N'2007-07-07T00:00:00.000' AS DateTime), CAST(N'2007-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (731, 20, 39, CAST(N'2007-07-09T00:00:00.000' AS DateTime), CAST(N'2007-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (732, 90, 39, CAST(N'2007-07-10T00:00:00.000' AS DateTime), CAST(N'2007-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (733, 69, 34, CAST(N'2007-07-10T00:00:00.000' AS DateTime), CAST(N'2007-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (734, 35, 13, CAST(N'2007-07-10T00:00:00.000' AS DateTime), CAST(N'2007-07-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (735, 17, 43, CAST(N'2007-07-12T00:00:00.000' AS DateTime), CAST(N'2007-07-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (736, 8, 31, CAST(N'2007-07-14T00:00:00.000' AS DateTime), CAST(N'2007-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (737, 73, 42, CAST(N'2007-07-15T00:00:00.000' AS DateTime), CAST(N'2007-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (738, 75, 29, CAST(N'2007-07-15T00:00:00.000' AS DateTime), CAST(N'2007-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (739, 49, 17, CAST(N'2007-07-17T00:00:00.000' AS DateTime), CAST(N'2007-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (740, 24, 15, CAST(N'2007-07-17T00:00:00.000' AS DateTime), CAST(N'2007-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (741, 18, 5, CAST(N'2007-07-18T00:00:00.000' AS DateTime), CAST(N'2007-07-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (742, 39, 28, CAST(N'2007-07-20T00:00:00.000' AS DateTime), CAST(N'2007-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (743, 8, 35, CAST(N'2007-07-20T00:00:00.000' AS DateTime), CAST(N'2007-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (744, 16, 2, CAST(N'2007-07-22T00:00:00.000' AS DateTime), CAST(N'2007-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (745, 25, 19, CAST(N'2007-07-22T00:00:00.000' AS DateTime), CAST(N'2007-07-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (746, 30, 28, CAST(N'2007-07-22T00:00:00.000' AS DateTime), CAST(N'2007-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (747, 65, 19, CAST(N'2007-07-22T00:00:00.000' AS DateTime), CAST(N'2007-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (748, 41, 15, CAST(N'2007-07-23T00:00:00.000' AS DateTime), CAST(N'2007-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (749, 13, 39, CAST(N'2007-07-23T00:00:00.000' AS DateTime), CAST(N'2007-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (750, 21, 32, CAST(N'2007-07-23T00:00:00.000' AS DateTime), CAST(N'2007-08-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (751, 52, 30, CAST(N'2007-07-24T00:00:00.000' AS DateTime), CAST(N'2007-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (752, 40, 42, CAST(N'2007-07-24T00:00:00.000' AS DateTime), CAST(N'2007-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (753, 25, 21, CAST(N'2007-07-24T00:00:00.000' AS DateTime), CAST(N'2007-07-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (754, 64, 32, CAST(N'2007-07-25T00:00:00.000' AS DateTime), CAST(N'2007-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (755, 54, 40, CAST(N'2007-07-25T00:00:00.000' AS DateTime), CAST(N'2007-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (756, 11, 26, CAST(N'2007-07-25T00:00:00.000' AS DateTime), CAST(N'2007-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (757, 4, 42, CAST(N'2007-07-27T00:00:00.000' AS DateTime), CAST(N'2007-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (758, 95, 5, CAST(N'2007-07-27T00:00:00.000' AS DateTime), CAST(N'2007-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (759, 69, 3, CAST(N'2007-07-28T00:00:00.000' AS DateTime), CAST(N'2007-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (760, 95, 28, CAST(N'2007-08-02T00:00:00.000' AS DateTime), CAST(N'2007-08-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (761, 58, 44, CAST(N'2007-08-02T00:00:00.000' AS DateTime), CAST(N'2007-08-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (762, 15, 28, CAST(N'2007-08-03T00:00:00.000' AS DateTime), CAST(N'2007-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (763, 95, 9, CAST(N'2007-08-03T00:00:00.000' AS DateTime), CAST(N'2007-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (764, 39, 14, CAST(N'2007-08-04T00:00:00.000' AS DateTime), CAST(N'2007-08-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (765, 47, 1, CAST(N'2007-08-04T00:00:00.000' AS DateTime), CAST(N'2007-08-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (766, 82, 18, CAST(N'2007-08-05T00:00:00.000' AS DateTime), CAST(N'2007-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (767, 8, 43, CAST(N'2007-08-06T00:00:00.000' AS DateTime), CAST(N'2007-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (768, 64, 8, CAST(N'2007-08-07T00:00:00.000' AS DateTime), CAST(N'2007-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (769, 91, 5, CAST(N'2007-08-07T00:00:00.000' AS DateTime), CAST(N'2007-08-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (770, 70, 34, CAST(N'2007-08-08T00:00:00.000' AS DateTime), CAST(N'2007-08-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (771, 53, 29, CAST(N'2007-08-09T00:00:00.000' AS DateTime), CAST(N'2007-08-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (772, 39, 21, CAST(N'2007-08-11T00:00:00.000' AS DateTime), CAST(N'2007-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (773, 54, 14, CAST(N'2007-08-11T00:00:00.000' AS DateTime), CAST(N'2007-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (774, 9, 9, CAST(N'2007-08-11T00:00:00.000' AS DateTime), CAST(N'2007-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (775, 46, 37, CAST(N'2007-08-13T00:00:00.000' AS DateTime), CAST(N'2007-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (776, 21, 32, CAST(N'2007-08-14T00:00:00.000' AS DateTime), CAST(N'2007-08-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (777, 69, 30, CAST(N'2007-08-16T00:00:00.000' AS DateTime), CAST(N'2007-08-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (778, 64, 33, CAST(N'2007-08-16T00:00:00.000' AS DateTime), CAST(N'2007-08-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (779, 54, 28, CAST(N'2007-08-18T00:00:00.000' AS DateTime), CAST(N'2007-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (780, 47, 18, CAST(N'2007-08-19T00:00:00.000' AS DateTime), CAST(N'2007-09-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (781, 16, 28, CAST(N'2007-08-19T00:00:00.000' AS DateTime), CAST(N'2007-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (782, 5, 25, CAST(N'2007-08-19T00:00:00.000' AS DateTime), CAST(N'2007-08-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (783, 90, 3, CAST(N'2007-08-19T00:00:00.000' AS DateTime), CAST(N'2007-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (784, 75, 18, CAST(N'2007-08-21T00:00:00.000' AS DateTime), CAST(N'2007-09-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (785, 9, 39, CAST(N'2007-08-22T00:00:00.000' AS DateTime), CAST(N'2007-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (786, 8, 39, CAST(N'2007-08-23T00:00:00.000' AS DateTime), CAST(N'2007-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (787, 14, 1, CAST(N'2007-08-23T00:00:00.000' AS DateTime), CAST(N'2007-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (788, 53, 25, CAST(N'2007-08-24T00:00:00.000' AS DateTime), CAST(N'2007-08-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (789, 18, 1, CAST(N'2007-08-24T00:00:00.000' AS DateTime), CAST(N'2007-08-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (790, 44, 27, CAST(N'2007-08-26T00:00:00.000' AS DateTime), CAST(N'2007-09-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (791, 87, 41, CAST(N'2007-08-27T00:00:00.000' AS DateTime), CAST(N'2007-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (792, 30, 34, CAST(N'2007-08-27T00:00:00.000' AS DateTime), CAST(N'2007-09-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (793, 92, 30, CAST(N'2007-08-27T00:00:00.000' AS DateTime), CAST(N'2007-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (794, 87, 23, CAST(N'2007-08-28T00:00:00.000' AS DateTime), CAST(N'2007-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (795, 30, 16, CAST(N'2007-08-28T00:00:00.000' AS DateTime), CAST(N'2007-09-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (796, 76, 33, CAST(N'2007-08-28T00:00:00.000' AS DateTime), CAST(N'2007-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (797, 70, 21, CAST(N'2007-09-01T00:00:00.000' AS DateTime), CAST(N'2007-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (798, 6, 4, CAST(N'2007-09-03T00:00:00.000' AS DateTime), CAST(N'2007-09-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (799, 34, 36, CAST(N'2007-09-03T00:00:00.000' AS DateTime), CAST(N'2007-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (800, 20, 12, CAST(N'2007-09-03T00:00:00.000' AS DateTime), CAST(N'2007-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (801, 21, 18, CAST(N'2007-09-04T00:00:00.000' AS DateTime), CAST(N'2007-09-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (802, 96, 3, CAST(N'2007-09-05T00:00:00.000' AS DateTime), CAST(N'2007-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (803, 35, 16, CAST(N'2007-09-05T00:00:00.000' AS DateTime), CAST(N'2007-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (804, 15, 5, CAST(N'2007-09-07T00:00:00.000' AS DateTime), CAST(N'2007-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (805, 25, 29, CAST(N'2007-09-07T00:00:00.000' AS DateTime), CAST(N'2007-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (806, 96, 2, CAST(N'2007-09-08T00:00:00.000' AS DateTime), CAST(N'2007-09-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (807, 98, 10, CAST(N'2007-09-08T00:00:00.000' AS DateTime), CAST(N'2007-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (808, 85, 32, CAST(N'2007-09-09T00:00:00.000' AS DateTime), CAST(N'2007-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (809, 61, 41, CAST(N'2007-09-09T00:00:00.000' AS DateTime), CAST(N'2007-09-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (810, 78, 18, CAST(N'2007-09-09T00:00:00.000' AS DateTime), CAST(N'2007-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (811, 96, 10, CAST(N'2007-09-11T00:00:00.000' AS DateTime), CAST(N'2007-09-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (812, 84, 12, CAST(N'2007-09-14T00:00:00.000' AS DateTime), CAST(N'2007-10-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (813, 87, 29, CAST(N'2007-09-14T00:00:00.000' AS DateTime), CAST(N'2007-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (814, 45, 34, CAST(N'2007-09-14T00:00:00.000' AS DateTime), CAST(N'2007-09-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (815, 68, 4, CAST(N'2007-09-14T00:00:00.000' AS DateTime), CAST(N'2007-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (816, 2, 7, CAST(N'2007-09-15T00:00:00.000' AS DateTime), CAST(N'2007-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (817, 37, 33, CAST(N'2007-09-16T00:00:00.000' AS DateTime), CAST(N'2007-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (818, 37, 7, CAST(N'2007-09-16T00:00:00.000' AS DateTime), CAST(N'2007-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (819, 45, 4, CAST(N'2007-09-17T00:00:00.000' AS DateTime), CAST(N'2007-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (820, 10, 32, CAST(N'2007-09-17T00:00:00.000' AS DateTime), CAST(N'2007-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (821, 3, 36, CAST(N'2007-09-18T00:00:00.000' AS DateTime), CAST(N'2007-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (822, 35, 18, CAST(N'2007-09-18T00:00:00.000' AS DateTime), CAST(N'2007-09-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (823, 39, 34, CAST(N'2007-09-18T00:00:00.000' AS DateTime), CAST(N'2007-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (824, 83, 6, CAST(N'2007-09-18T00:00:00.000' AS DateTime), CAST(N'2007-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (825, 47, 13, CAST(N'2007-09-19T00:00:00.000' AS DateTime), CAST(N'2007-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (826, 75, 38, CAST(N'2007-09-19T00:00:00.000' AS DateTime), CAST(N'2007-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (827, 2, 30, CAST(N'2007-09-19T00:00:00.000' AS DateTime), CAST(N'2007-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (828, 34, 5, CAST(N'2007-09-20T00:00:00.000' AS DateTime), CAST(N'2007-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (829, 27, 29, CAST(N'2007-09-24T00:00:00.000' AS DateTime), CAST(N'2007-09-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (830, 65, 35, CAST(N'2007-09-25T00:00:00.000' AS DateTime), CAST(N'2007-09-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (831, 7, 19, CAST(N'2007-09-25T00:00:00.000' AS DateTime), CAST(N'2007-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (832, 69, 36, CAST(N'2007-09-26T00:00:00.000' AS DateTime), CAST(N'2007-10-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (833, 59, 27, CAST(N'2007-09-27T00:00:00.000' AS DateTime), CAST(N'2007-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (834, 99, 42, CAST(N'2007-09-28T00:00:00.000' AS DateTime), CAST(N'2007-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (835, 4, 42, CAST(N'2007-09-28T00:00:00.000' AS DateTime), CAST(N'2007-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (836, 21, 30, CAST(N'2007-09-28T00:00:00.000' AS DateTime), CAST(N'2007-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (837, 25, 19, CAST(N'2007-10-01T00:00:00.000' AS DateTime), CAST(N'2007-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (838, 88, 3, CAST(N'2007-10-02T00:00:00.000' AS DateTime), CAST(N'2007-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (839, 9, 12, CAST(N'2007-10-03T00:00:00.000' AS DateTime), CAST(N'2007-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (840, 39, 30, CAST(N'2007-10-03T00:00:00.000' AS DateTime), CAST(N'2007-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (841, 71, 30, CAST(N'2007-10-04T00:00:00.000' AS DateTime), CAST(N'2007-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (842, 24, 3, CAST(N'2007-10-05T00:00:00.000' AS DateTime), CAST(N'2007-10-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (843, 78, 12, CAST(N'2007-10-07T00:00:00.000' AS DateTime), CAST(N'2007-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (844, 38, 38, CAST(N'2007-10-10T00:00:00.000' AS DateTime), CAST(N'2007-10-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (845, 47, 32, CAST(N'2007-10-11T00:00:00.000' AS DateTime), CAST(N'2007-10-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (846, 66, 36, CAST(N'2007-10-11T00:00:00.000' AS DateTime), CAST(N'2007-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (847, 4, 33, CAST(N'2007-10-11T00:00:00.000' AS DateTime), CAST(N'2007-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (848, 50, 8, CAST(N'2007-10-12T00:00:00.000' AS DateTime), CAST(N'2007-10-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (849, 79, 32, CAST(N'2007-10-12T00:00:00.000' AS DateTime), CAST(N'2007-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (850, 53, 7, CAST(N'2007-10-12T00:00:00.000' AS DateTime), CAST(N'2007-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (851, 21, 39, CAST(N'2007-10-12T00:00:00.000' AS DateTime), CAST(N'2007-10-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (852, 50, 21, CAST(N'2007-10-13T00:00:00.000' AS DateTime), CAST(N'2007-10-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (853, 40, 12, CAST(N'2007-10-13T00:00:00.000' AS DateTime), CAST(N'2007-10-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (854, 72, 14, CAST(N'2007-10-14T00:00:00.000' AS DateTime), CAST(N'2007-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (855, 95, 38, CAST(N'2007-10-15T00:00:00.000' AS DateTime), CAST(N'2007-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (856, 22, 21, CAST(N'2007-10-15T00:00:00.000' AS DateTime), CAST(N'2007-10-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (857, 45, 38, CAST(N'2007-10-17T00:00:00.000' AS DateTime), CAST(N'2007-10-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (858, 91, 10, CAST(N'2007-10-17T00:00:00.000' AS DateTime), CAST(N'2007-10-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (859, 51, 14, CAST(N'2007-10-18T00:00:00.000' AS DateTime), CAST(N'2007-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (860, 99, 38, CAST(N'2007-10-18T00:00:00.000' AS DateTime), CAST(N'2007-10-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (861, 44, 24, CAST(N'2007-10-19T00:00:00.000' AS DateTime), CAST(N'2007-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (862, 47, 21, CAST(N'2007-10-20T00:00:00.000' AS DateTime), CAST(N'2007-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (863, 72, 12, CAST(N'2007-10-21T00:00:00.000' AS DateTime), CAST(N'2007-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (864, 43, 42, CAST(N'2007-10-21T00:00:00.000' AS DateTime), CAST(N'2007-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (865, 8, 19, CAST(N'2007-10-22T00:00:00.000' AS DateTime), CAST(N'2007-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (866, 38, 25, CAST(N'2007-10-23T00:00:00.000' AS DateTime), CAST(N'2007-11-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (867, 92, 27, CAST(N'2007-10-23T00:00:00.000' AS DateTime), CAST(N'2007-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (868, 48, 17, CAST(N'2007-10-23T00:00:00.000' AS DateTime), CAST(N'2007-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (869, 4, 25, CAST(N'2007-10-24T00:00:00.000' AS DateTime), CAST(N'2007-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (870, 55, 7, CAST(N'2007-10-25T00:00:00.000' AS DateTime), CAST(N'2007-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (871, 60, 28, CAST(N'2007-10-27T00:00:00.000' AS DateTime), CAST(N'2007-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (872, 88, 37, CAST(N'2007-10-27T00:00:00.000' AS DateTime), CAST(N'2007-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (873, 35, 24, CAST(N'2007-10-27T00:00:00.000' AS DateTime), CAST(N'2007-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (874, 48, 16, CAST(N'2007-10-28T00:00:00.000' AS DateTime), CAST(N'2007-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (875, 35, 16, CAST(N'2007-10-28T00:00:00.000' AS DateTime), CAST(N'2007-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (876, 8, 26, CAST(N'2007-10-28T00:00:00.000' AS DateTime), CAST(N'2007-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (877, 45, 39, CAST(N'2007-11-01T00:00:00.000' AS DateTime), CAST(N'2007-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (878, 68, 21, CAST(N'2007-11-02T00:00:00.000' AS DateTime), CAST(N'2007-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (879, 20, 42, CAST(N'2007-11-03T00:00:00.000' AS DateTime), CAST(N'2007-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (880, 24, 33, CAST(N'2007-11-04T00:00:00.000' AS DateTime), CAST(N'2007-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (881, 90, 27, CAST(N'2007-11-04T00:00:00.000' AS DateTime), CAST(N'2007-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (882, 27, 6, CAST(N'2007-11-05T00:00:00.000' AS DateTime), CAST(N'2007-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (883, 2, 30, CAST(N'2007-11-07T00:00:00.000' AS DateTime), CAST(N'2007-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (884, 15, 13, CAST(N'2007-11-08T00:00:00.000' AS DateTime), CAST(N'2007-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (885, 81, 3, CAST(N'2007-11-09T00:00:00.000' AS DateTime), CAST(N'2007-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (886, 91, 18, CAST(N'2007-11-10T00:00:00.000' AS DateTime), CAST(N'2007-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (887, 9, 25, CAST(N'2007-11-10T00:00:00.000' AS DateTime), CAST(N'2007-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (888, 18, 38, CAST(N'2007-11-11T00:00:00.000' AS DateTime), CAST(N'2007-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (889, 66, 35, CAST(N'2007-11-11T00:00:00.000' AS DateTime), CAST(N'2007-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (890, 77, 7, CAST(N'2007-11-12T00:00:00.000' AS DateTime), CAST(N'2007-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (891, 34, 35, CAST(N'2007-11-12T00:00:00.000' AS DateTime), CAST(N'2007-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (892, 8, 36, CAST(N'2007-11-12T00:00:00.000' AS DateTime), CAST(N'2007-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (893, 82, 10, CAST(N'2007-11-13T00:00:00.000' AS DateTime), CAST(N'2007-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (894, 28, 12, CAST(N'2007-11-13T00:00:00.000' AS DateTime), CAST(N'2007-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (895, 86, 44, CAST(N'2007-11-13T00:00:00.000' AS DateTime), CAST(N'2007-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (896, 28, 13, CAST(N'2007-11-14T00:00:00.000' AS DateTime), CAST(N'2007-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (897, 73, 2, CAST(N'2007-11-15T00:00:00.000' AS DateTime), CAST(N'2007-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (898, 69, 4, CAST(N'2007-11-16T00:00:00.000' AS DateTime), CAST(N'2007-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (899, 54, 32, CAST(N'2007-11-17T00:00:00.000' AS DateTime), CAST(N'2007-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (900, 48, 36, CAST(N'2007-11-17T00:00:00.000' AS DateTime), CAST(N'2007-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (901, 62, 15, CAST(N'2007-11-18T00:00:00.000' AS DateTime), CAST(N'2007-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (902, 9, 1, CAST(N'2007-11-18T00:00:00.000' AS DateTime), CAST(N'2007-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (903, 44, 27, CAST(N'2007-11-19T00:00:00.000' AS DateTime), CAST(N'2007-12-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (904, 28, 34, CAST(N'2007-11-19T00:00:00.000' AS DateTime), CAST(N'2007-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (905, 13, 35, CAST(N'2007-11-19T00:00:00.000' AS DateTime), CAST(N'2007-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (906, 98, 40, CAST(N'2007-11-19T00:00:00.000' AS DateTime), CAST(N'2007-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (907, 91, 6, CAST(N'2007-11-19T00:00:00.000' AS DateTime), CAST(N'2007-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (908, 72, 36, CAST(N'2007-11-20T00:00:00.000' AS DateTime), CAST(N'2007-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (909, 61, 31, CAST(N'2007-11-20T00:00:00.000' AS DateTime), CAST(N'2007-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (910, 90, 8, CAST(N'2007-11-20T00:00:00.000' AS DateTime), CAST(N'2007-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (911, 65, 41, CAST(N'2007-11-21T00:00:00.000' AS DateTime), CAST(N'2007-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (912, 70, 13, CAST(N'2007-11-21T00:00:00.000' AS DateTime), CAST(N'2007-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (913, 34, 42, CAST(N'2007-11-22T00:00:00.000' AS DateTime), CAST(N'2007-12-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (914, 39, 19, CAST(N'2007-11-22T00:00:00.000' AS DateTime), CAST(N'2007-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (915, 52, 6, CAST(N'2007-11-23T00:00:00.000' AS DateTime), CAST(N'2007-12-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (916, 17, 9, CAST(N'2007-11-23T00:00:00.000' AS DateTime), CAST(N'2007-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (917, 77, 44, CAST(N'2007-11-24T00:00:00.000' AS DateTime), CAST(N'2007-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (918, 9, 9, CAST(N'2007-11-25T00:00:00.000' AS DateTime), CAST(N'2007-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (919, 36, 8, CAST(N'2007-11-27T00:00:00.000' AS DateTime), CAST(N'2007-12-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (920, 45, 33, CAST(N'2007-11-28T00:00:00.000' AS DateTime), CAST(N'2007-12-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (921, 16, 8, CAST(N'2007-11-28T00:00:00.000' AS DateTime), CAST(N'2007-12-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (922, 26, 35, CAST(N'2008-01-01T00:00:00.000' AS DateTime), CAST(N'2008-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (923, 68, 27, CAST(N'2008-01-02T00:00:00.000' AS DateTime), CAST(N'2008-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (924, 5, 5, CAST(N'2008-01-02T00:00:00.000' AS DateTime), CAST(N'2008-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (925, 45, 9, CAST(N'2008-01-02T00:00:00.000' AS DateTime), CAST(N'2008-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (926, 52, 38, CAST(N'2008-01-04T00:00:00.000' AS DateTime), CAST(N'2008-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (927, 39, 25, CAST(N'2008-01-06T00:00:00.000' AS DateTime), CAST(N'2008-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (928, 11, 39, CAST(N'2008-01-06T00:00:00.000' AS DateTime), CAST(N'2008-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (929, 7, 1, CAST(N'2008-01-06T00:00:00.000' AS DateTime), CAST(N'2008-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (930, 29, 21, CAST(N'2008-01-06T00:00:00.000' AS DateTime), CAST(N'2008-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (931, 59, 12, CAST(N'2008-01-06T00:00:00.000' AS DateTime), CAST(N'2008-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (932, 87, 37, CAST(N'2008-01-07T00:00:00.000' AS DateTime), CAST(N'2008-01-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (933, 39, 42, CAST(N'2008-01-08T00:00:00.000' AS DateTime), CAST(N'2008-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (934, 40, 18, CAST(N'2008-01-09T00:00:00.000' AS DateTime), CAST(N'2008-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (935, 64, 18, CAST(N'2008-01-10T00:00:00.000' AS DateTime), CAST(N'2008-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (936, 51, 28, CAST(N'2008-01-10T00:00:00.000' AS DateTime), CAST(N'2008-01-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (937, 17, 40, CAST(N'2008-01-10T00:00:00.000' AS DateTime), CAST(N'2008-01-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (938, 63, 44, CAST(N'2008-01-10T00:00:00.000' AS DateTime), CAST(N'2008-01-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (939, 21, 5, CAST(N'2008-01-11T00:00:00.000' AS DateTime), CAST(N'2008-01-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (940, 25, 22, CAST(N'2008-01-11T00:00:00.000' AS DateTime), CAST(N'2008-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (941, 70, 41, CAST(N'2008-01-11T00:00:00.000' AS DateTime), CAST(N'2008-01-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (942, 46, 7, CAST(N'2008-01-12T00:00:00.000' AS DateTime), CAST(N'2008-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (943, 15, 38, CAST(N'2008-01-12T00:00:00.000' AS DateTime), CAST(N'2008-01-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (944, 69, 21, CAST(N'2008-01-13T00:00:00.000' AS DateTime), CAST(N'2008-01-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (945, 10, 31, CAST(N'2008-01-14T00:00:00.000' AS DateTime), CAST(N'2008-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (946, 78, 14, CAST(N'2008-01-14T00:00:00.000' AS DateTime), CAST(N'2008-01-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (947, 3, 17, CAST(N'2008-01-14T00:00:00.000' AS DateTime), CAST(N'2008-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (948, 73, 36, CAST(N'2008-01-15T00:00:00.000' AS DateTime), CAST(N'2008-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (949, 21, 18, CAST(N'2008-01-15T00:00:00.000' AS DateTime), CAST(N'2008-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (950, 8, 38, CAST(N'2008-01-16T00:00:00.000' AS DateTime), CAST(N'2008-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (951, 51, 8, CAST(N'2008-01-16T00:00:00.000' AS DateTime), CAST(N'2008-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (952, 92, 30, CAST(N'2008-01-18T00:00:00.000' AS DateTime), CAST(N'2008-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (953, 57, 13, CAST(N'2008-01-18T00:00:00.000' AS DateTime), CAST(N'2008-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (954, 66, 41, CAST(N'2008-01-18T00:00:00.000' AS DateTime), CAST(N'2008-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (955, 59, 24, CAST(N'2008-01-18T00:00:00.000' AS DateTime), CAST(N'2008-02-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (956, 99, 29, CAST(N'2008-01-18T00:00:00.000' AS DateTime), CAST(N'2008-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (957, 48, 44, CAST(N'2008-01-19T00:00:00.000' AS DateTime), CAST(N'2008-02-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (958, 62, 13, CAST(N'2008-01-19T00:00:00.000' AS DateTime), CAST(N'2008-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (959, 71, 27, CAST(N'2008-01-20T00:00:00.000' AS DateTime), CAST(N'2008-02-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (960, 94, 39, CAST(N'2008-01-20T00:00:00.000' AS DateTime), CAST(N'2008-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (961, 79, 17, CAST(N'2008-01-21T00:00:00.000' AS DateTime), CAST(N'2008-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (962, 54, 35, CAST(N'2008-01-22T00:00:00.000' AS DateTime), CAST(N'2008-02-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (963, 11, 20, CAST(N'2008-01-25T00:00:00.000' AS DateTime), CAST(N'2008-01-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (964, 56, 21, CAST(N'2008-01-25T00:00:00.000' AS DateTime), CAST(N'2008-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (965, 51, 25, CAST(N'2008-01-26T00:00:00.000' AS DateTime), CAST(N'2008-02-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (966, 59, 23, CAST(N'2008-01-27T00:00:00.000' AS DateTime), CAST(N'2008-02-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (967, 87, 29, CAST(N'2008-01-27T00:00:00.000' AS DateTime), CAST(N'2008-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (968, 59, 28, CAST(N'2008-01-27T00:00:00.000' AS DateTime), CAST(N'2008-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (969, 34, 7, CAST(N'2008-01-27T00:00:00.000' AS DateTime), CAST(N'2008-02-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (970, 63, 7, CAST(N'2008-01-27T00:00:00.000' AS DateTime), CAST(N'2008-01-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (971, 84, 28, CAST(N'2008-01-28T00:00:00.000' AS DateTime), CAST(N'2008-02-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (972, 17, 21, CAST(N'2008-02-01T00:00:00.000' AS DateTime), CAST(N'2008-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (973, 39, 9, CAST(N'2008-02-03T00:00:00.000' AS DateTime), CAST(N'2008-02-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (974, 70, 24, CAST(N'2008-02-05T00:00:00.000' AS DateTime), CAST(N'2008-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (975, 36, 27, CAST(N'2008-02-05T00:00:00.000' AS DateTime), CAST(N'2008-02-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (976, 36, 39, CAST(N'2008-02-06T00:00:00.000' AS DateTime), CAST(N'2008-02-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (977, 74, 44, CAST(N'2008-02-06T00:00:00.000' AS DateTime), CAST(N'2008-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (978, 88, 32, CAST(N'2008-02-06T00:00:00.000' AS DateTime), CAST(N'2008-02-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (979, 51, 33, CAST(N'2008-02-07T00:00:00.000' AS DateTime), CAST(N'2008-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (980, 79, 19, CAST(N'2008-02-07T00:00:00.000' AS DateTime), CAST(N'2008-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (981, 86, 33, CAST(N'2008-02-08T00:00:00.000' AS DateTime), CAST(N'2008-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (982, 16, 39, CAST(N'2008-02-09T00:00:00.000' AS DateTime), CAST(N'2008-02-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (983, 29, 6, CAST(N'2008-02-11T00:00:00.000' AS DateTime), CAST(N'2008-02-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (984, 32, 43, CAST(N'2008-02-13T00:00:00.000' AS DateTime), CAST(N'2008-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (985, 95, 2, CAST(N'2008-02-14T00:00:00.000' AS DateTime), CAST(N'2008-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (986, 82, 33, CAST(N'2008-02-14T00:00:00.000' AS DateTime), CAST(N'2008-02-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (987, 97, 39, CAST(N'2008-02-14T00:00:00.000' AS DateTime), CAST(N'2008-02-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (988, 89, 7, CAST(N'2008-02-15T00:00:00.000' AS DateTime), CAST(N'2008-02-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (989, 40, 12, CAST(N'2008-02-16T00:00:00.000' AS DateTime), CAST(N'2008-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (990, 95, 32, CAST(N'2008-02-17T00:00:00.000' AS DateTime), CAST(N'2008-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (991, 99, 13, CAST(N'2008-02-18T00:00:00.000' AS DateTime), CAST(N'2008-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (992, 67, 38, CAST(N'2008-02-19T00:00:00.000' AS DateTime), CAST(N'2008-02-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (993, 82, 26, CAST(N'2008-02-22T00:00:00.000' AS DateTime), CAST(N'2008-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (994, 65, 34, CAST(N'2008-02-23T00:00:00.000' AS DateTime), CAST(N'2008-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (995, 66, 31, CAST(N'2008-02-24T00:00:00.000' AS DateTime), CAST(N'2008-02-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (996, 30, 11, CAST(N'2008-02-26T00:00:00.000' AS DateTime), CAST(N'2008-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (997, 7, 18, CAST(N'2008-02-27T00:00:00.000' AS DateTime), CAST(N'2008-03-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (998, 85, 22, CAST(N'2008-02-28T00:00:00.000' AS DateTime), CAST(N'2008-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (999, 83, 42, CAST(N'2008-02-28T00:00:00.000' AS DateTime), CAST(N'2008-03-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1000, 84, 42, CAST(N'2008-02-28T00:00:00.000' AS DateTime), CAST(N'2008-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1001, 20, 40, CAST(N'2008-02-28T00:00:00.000' AS DateTime), CAST(N'2008-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1002, 26, 7, CAST(N'2008-02-28T00:00:00.000' AS DateTime), CAST(N'2008-03-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1003, 23, 18, CAST(N'2008-03-01T00:00:00.000' AS DateTime), CAST(N'2008-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1004, 26, 39, CAST(N'2008-03-01T00:00:00.000' AS DateTime), CAST(N'2008-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1005, 60, 3, CAST(N'2008-03-02T00:00:00.000' AS DateTime), CAST(N'2008-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1006, 37, 31, CAST(N'2008-03-03T00:00:00.000' AS DateTime), CAST(N'2008-03-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1007, 97, 12, CAST(N'2008-03-03T00:00:00.000' AS DateTime), CAST(N'2008-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1008, 6, 31, CAST(N'2008-03-03T00:00:00.000' AS DateTime), CAST(N'2008-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1009, 87, 37, CAST(N'2008-03-04T00:00:00.000' AS DateTime), CAST(N'2008-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1010, 80, 28, CAST(N'2008-03-06T00:00:00.000' AS DateTime), CAST(N'2008-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1011, 93, 19, CAST(N'2008-03-07T00:00:00.000' AS DateTime), CAST(N'2008-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1012, 47, 36, CAST(N'2008-03-07T00:00:00.000' AS DateTime), CAST(N'2008-03-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1013, 88, 19, CAST(N'2008-03-07T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1014, 87, 26, CAST(N'2008-03-07T00:00:00.000' AS DateTime), CAST(N'2008-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1015, 28, 3, CAST(N'2008-03-07T00:00:00.000' AS DateTime), CAST(N'2008-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1016, 92, 18, CAST(N'2008-03-08T00:00:00.000' AS DateTime), CAST(N'2008-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1017, 91, 6, CAST(N'2008-03-08T00:00:00.000' AS DateTime), CAST(N'2008-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1018, 61, 30, CAST(N'2008-03-08T00:00:00.000' AS DateTime), CAST(N'2008-03-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1019, 78, 7, CAST(N'2008-03-09T00:00:00.000' AS DateTime), CAST(N'2008-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1020, 3, 33, CAST(N'2008-03-12T00:00:00.000' AS DateTime), CAST(N'2008-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1021, 5, 17, CAST(N'2008-03-12T00:00:00.000' AS DateTime), CAST(N'2008-03-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1022, 90, 37, CAST(N'2008-03-12T00:00:00.000' AS DateTime), CAST(N'2008-03-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1023, 85, 41, CAST(N'2008-03-13T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1024, 93, 14, CAST(N'2008-03-15T00:00:00.000' AS DateTime), CAST(N'2008-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1025, 78, 39, CAST(N'2008-03-16T00:00:00.000' AS DateTime), CAST(N'2008-03-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1026, 68, 9, CAST(N'2008-03-17T00:00:00.000' AS DateTime), CAST(N'2008-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1027, 81, 4, CAST(N'2008-03-18T00:00:00.000' AS DateTime), CAST(N'2008-03-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1028, 41, 2, CAST(N'2008-03-18T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1029, 98, 22, CAST(N'2008-03-18T00:00:00.000' AS DateTime), CAST(N'2008-04-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1030, 11, 28, CAST(N'2008-03-19T00:00:00.000' AS DateTime), CAST(N'2008-04-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1031, 18, 28, CAST(N'2008-03-19T00:00:00.000' AS DateTime), CAST(N'2008-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1032, 2, 4, CAST(N'2008-03-20T00:00:00.000' AS DateTime), CAST(N'2008-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1033, 50, 31, CAST(N'2008-03-20T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1034, 33, 30, CAST(N'2008-03-20T00:00:00.000' AS DateTime), CAST(N'2008-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1035, 5, 15, CAST(N'2008-03-21T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1036, 95, 13, CAST(N'2008-03-22T00:00:00.000' AS DateTime), CAST(N'2008-03-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1037, 21, 11, CAST(N'2008-03-22T00:00:00.000' AS DateTime), CAST(N'2008-04-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1038, 41, 22, CAST(N'2008-03-23T00:00:00.000' AS DateTime), CAST(N'2008-04-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1039, 8, 5, CAST(N'2008-03-23T00:00:00.000' AS DateTime), CAST(N'2008-03-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1040, 92, 20, CAST(N'2008-03-24T00:00:00.000' AS DateTime), CAST(N'2008-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1041, 46, 15, CAST(N'2008-03-24T00:00:00.000' AS DateTime), CAST(N'2008-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1042, 57, 16, CAST(N'2008-03-24T00:00:00.000' AS DateTime), CAST(N'2008-03-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1043, 20, 12, CAST(N'2008-03-25T00:00:00.000' AS DateTime), CAST(N'2008-03-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1044, 14, 21, CAST(N'2008-03-26T00:00:00.000' AS DateTime), CAST(N'2008-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1045, 24, 44, CAST(N'2008-03-26T00:00:00.000' AS DateTime), CAST(N'2008-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1046, 16, 26, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-03-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1047, 76, 1, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1048, 21, 25, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-04-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1049, 41, 16, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-03-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1050, 80, 23, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-03-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1051, 50, 26, CAST(N'2008-03-27T00:00:00.000' AS DateTime), CAST(N'2008-04-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1052, 83, 17, CAST(N'2008-03-28T00:00:00.000' AS DateTime), CAST(N'2008-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1053, 18, 26, CAST(N'2008-04-01T00:00:00.000' AS DateTime), CAST(N'2008-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1054, 23, 14, CAST(N'2008-04-01T00:00:00.000' AS DateTime), CAST(N'2008-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1055, 9, 22, CAST(N'2008-04-02T00:00:00.000' AS DateTime), CAST(N'2008-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1056, 92, 4, CAST(N'2008-04-02T00:00:00.000' AS DateTime), CAST(N'2008-04-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1057, 22, 8, CAST(N'2008-04-04T00:00:00.000' AS DateTime), CAST(N'2008-04-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1058, 48, 42, CAST(N'2008-04-04T00:00:00.000' AS DateTime), CAST(N'2008-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1059, 96, 26, CAST(N'2008-04-04T00:00:00.000' AS DateTime), CAST(N'2008-04-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1060, 19, 23, CAST(N'2008-04-05T00:00:00.000' AS DateTime), CAST(N'2008-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1061, 20, 34, CAST(N'2008-04-05T00:00:00.000' AS DateTime), CAST(N'2008-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1062, 47, 7, CAST(N'2008-04-06T00:00:00.000' AS DateTime), CAST(N'2008-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1063, 85, 7, CAST(N'2008-04-07T00:00:00.000' AS DateTime), CAST(N'2008-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1064, 18, 15, CAST(N'2008-04-07T00:00:00.000' AS DateTime), CAST(N'2008-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1065, 20, 41, CAST(N'2008-04-08T00:00:00.000' AS DateTime), CAST(N'2008-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1066, 49, 23, CAST(N'2008-04-08T00:00:00.000' AS DateTime), CAST(N'2008-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1067, 94, 6, CAST(N'2008-04-08T00:00:00.000' AS DateTime), CAST(N'2008-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1068, 8, 5, CAST(N'2008-04-09T00:00:00.000' AS DateTime), CAST(N'2008-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1069, 29, 33, CAST(N'2008-04-09T00:00:00.000' AS DateTime), CAST(N'2008-04-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1070, 10, 21, CAST(N'2008-04-10T00:00:00.000' AS DateTime), CAST(N'2008-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1071, 4, 13, CAST(N'2008-04-10T00:00:00.000' AS DateTime), CAST(N'2008-04-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1072, 20, 23, CAST(N'2008-04-10T00:00:00.000' AS DateTime), CAST(N'2008-04-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1073, 23, 30, CAST(N'2008-04-11T00:00:00.000' AS DateTime), CAST(N'2008-04-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1074, 66, 26, CAST(N'2008-04-12T00:00:00.000' AS DateTime), CAST(N'2008-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1075, 97, 38, CAST(N'2008-04-12T00:00:00.000' AS DateTime), CAST(N'2008-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1076, 52, 27, CAST(N'2008-04-17T00:00:00.000' AS DateTime), CAST(N'2008-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1077, 33, 34, CAST(N'2008-04-18T00:00:00.000' AS DateTime), CAST(N'2008-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1078, 27, 43, CAST(N'2008-04-18T00:00:00.000' AS DateTime), CAST(N'2008-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1079, 65, 16, CAST(N'2008-04-19T00:00:00.000' AS DateTime), CAST(N'2008-04-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1080, 23, 17, CAST(N'2008-04-19T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1081, 16, 19, CAST(N'2008-04-20T00:00:00.000' AS DateTime), CAST(N'2008-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1082, 63, 6, CAST(N'2008-04-22T00:00:00.000' AS DateTime), CAST(N'2008-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1083, 63, 30, CAST(N'2008-04-24T00:00:00.000' AS DateTime), CAST(N'2008-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1084, 99, 9, CAST(N'2008-04-24T00:00:00.000' AS DateTime), CAST(N'2008-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1085, 26, 5, CAST(N'2008-04-24T00:00:00.000' AS DateTime), CAST(N'2008-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1086, 86, 43, CAST(N'2008-04-25T00:00:00.000' AS DateTime), CAST(N'2008-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1087, 49, 8, CAST(N'2008-04-25T00:00:00.000' AS DateTime), CAST(N'2008-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1088, 88, 29, CAST(N'2008-04-26T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1089, 79, 31, CAST(N'2008-04-26T00:00:00.000' AS DateTime), CAST(N'2008-05-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1090, 20, 10, CAST(N'2008-04-26T00:00:00.000' AS DateTime), CAST(N'2008-04-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1091, 66, 26, CAST(N'2008-04-27T00:00:00.000' AS DateTime), CAST(N'2008-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1092, 2, 7, CAST(N'2008-04-27T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1093, 53, 3, CAST(N'2008-04-28T00:00:00.000' AS DateTime), CAST(N'2008-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1094, 68, 31, CAST(N'2008-04-28T00:00:00.000' AS DateTime), CAST(N'2008-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1095, 96, 4, CAST(N'2008-04-28T00:00:00.000' AS DateTime), CAST(N'2008-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1096, 18, 25, CAST(N'2008-05-01T00:00:00.000' AS DateTime), CAST(N'2008-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1097, 95, 36, CAST(N'2008-05-01T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1098, 15, 5, CAST(N'2008-05-01T00:00:00.000' AS DateTime), CAST(N'2008-05-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1099, 40, 4, CAST(N'2008-05-02T00:00:00.000' AS DateTime), CAST(N'2008-05-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1100, 56, 13, CAST(N'2008-05-02T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1101, 47, 31, CAST(N'2008-05-03T00:00:00.000' AS DateTime), CAST(N'2008-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1102, 35, 21, CAST(N'2008-05-04T00:00:00.000' AS DateTime), CAST(N'2008-05-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1103, 31, 5, CAST(N'2008-05-04T00:00:00.000' AS DateTime), CAST(N'2008-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1104, 40, 27, CAST(N'2008-05-04T00:00:00.000' AS DateTime), CAST(N'2008-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1105, 21, 2, CAST(N'2008-05-05T00:00:00.000' AS DateTime), CAST(N'2008-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1106, 73, 20, CAST(N'2008-05-05T00:00:00.000' AS DateTime), CAST(N'2008-05-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1107, 54, 26, CAST(N'2008-05-06T00:00:00.000' AS DateTime), CAST(N'2008-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1108, 48, 34, CAST(N'2008-05-07T00:00:00.000' AS DateTime), CAST(N'2008-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1109, 4, 18, CAST(N'2008-05-07T00:00:00.000' AS DateTime), CAST(N'2008-05-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1110, 41, 32, CAST(N'2008-05-07T00:00:00.000' AS DateTime), CAST(N'2008-05-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1111, 88, 15, CAST(N'2008-05-08T00:00:00.000' AS DateTime), CAST(N'2008-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1112, 82, 17, CAST(N'2008-05-08T00:00:00.000' AS DateTime), CAST(N'2008-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1113, 55, 38, CAST(N'2008-05-08T00:00:00.000' AS DateTime), CAST(N'2008-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1114, 87, 42, CAST(N'2008-05-09T00:00:00.000' AS DateTime), CAST(N'2008-05-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1115, 13, 37, CAST(N'2008-05-09T00:00:00.000' AS DateTime), CAST(N'2008-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1116, 89, 20, CAST(N'2008-05-10T00:00:00.000' AS DateTime), CAST(N'2008-05-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1117, 87, 11, CAST(N'2008-05-10T00:00:00.000' AS DateTime), CAST(N'2008-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1118, 10, 7, CAST(N'2008-05-12T00:00:00.000' AS DateTime), CAST(N'2008-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1119, 54, 4, CAST(N'2008-05-12T00:00:00.000' AS DateTime), CAST(N'2008-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1120, 73, 33, CAST(N'2008-05-12T00:00:00.000' AS DateTime), CAST(N'2008-05-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1121, 10, 32, CAST(N'2008-05-13T00:00:00.000' AS DateTime), CAST(N'2008-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1122, 71, 43, CAST(N'2008-05-13T00:00:00.000' AS DateTime), CAST(N'2008-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1123, 27, 2, CAST(N'2008-05-14T00:00:00.000' AS DateTime), CAST(N'2008-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1124, 44, 39, CAST(N'2008-05-14T00:00:00.000' AS DateTime), CAST(N'2008-05-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1125, 21, 14, CAST(N'2008-05-15T00:00:00.000' AS DateTime), CAST(N'2008-05-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1126, 98, 33, CAST(N'2008-05-15T00:00:00.000' AS DateTime), CAST(N'2008-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1127, 94, 3, CAST(N'2008-05-15T00:00:00.000' AS DateTime), CAST(N'2008-06-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1128, 25, 23, CAST(N'2008-05-16T00:00:00.000' AS DateTime), CAST(N'2008-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1129, 6, 10, CAST(N'2008-05-17T00:00:00.000' AS DateTime), CAST(N'2008-06-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1130, 40, 28, CAST(N'2008-05-17T00:00:00.000' AS DateTime), CAST(N'2008-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1131, 79, 30, CAST(N'2008-05-18T00:00:00.000' AS DateTime), CAST(N'2008-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1132, 4, 15, CAST(N'2008-05-19T00:00:00.000' AS DateTime), CAST(N'2008-06-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1133, 55, 10, CAST(N'2008-05-19T00:00:00.000' AS DateTime), CAST(N'2008-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1134, 73, 12, CAST(N'2008-05-21T00:00:00.000' AS DateTime), CAST(N'2008-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1135, 84, 19, CAST(N'2008-05-21T00:00:00.000' AS DateTime), CAST(N'2008-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1136, 67, 4, CAST(N'2008-05-21T00:00:00.000' AS DateTime), CAST(N'2008-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1137, 52, 32, CAST(N'2008-05-21T00:00:00.000' AS DateTime), CAST(N'2008-05-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1138, 63, 25, CAST(N'2008-05-21T00:00:00.000' AS DateTime), CAST(N'2008-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1139, 35, 16, CAST(N'2008-05-24T00:00:00.000' AS DateTime), CAST(N'2008-05-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1140, 55, 34, CAST(N'2008-05-24T00:00:00.000' AS DateTime), CAST(N'2008-05-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1141, 17, 38, CAST(N'2008-05-24T00:00:00.000' AS DateTime), CAST(N'2008-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1142, 42, 17, CAST(N'2008-05-25T00:00:00.000' AS DateTime), CAST(N'2008-06-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1143, 86, 30, CAST(N'2008-05-25T00:00:00.000' AS DateTime), CAST(N'2008-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1144, 50, 43, CAST(N'2008-05-27T00:00:00.000' AS DateTime), CAST(N'2008-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1145, 79, 24, CAST(N'2008-05-28T00:00:00.000' AS DateTime), CAST(N'2008-06-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1146, 76, 3, CAST(N'2008-06-03T00:00:00.000' AS DateTime), CAST(N'2008-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1147, 6, 41, CAST(N'2008-06-03T00:00:00.000' AS DateTime), CAST(N'2008-06-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1148, 3, 11, CAST(N'2008-06-03T00:00:00.000' AS DateTime), CAST(N'2008-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1149, 90, 21, CAST(N'2008-06-04T00:00:00.000' AS DateTime), CAST(N'2008-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1150, 34, 39, CAST(N'2008-06-04T00:00:00.000' AS DateTime), CAST(N'2008-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1151, 39, 28, CAST(N'2008-06-04T00:00:00.000' AS DateTime), CAST(N'2008-06-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1152, 38, 20, CAST(N'2008-06-04T00:00:00.000' AS DateTime), CAST(N'2008-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1153, 79, 40, CAST(N'2008-06-05T00:00:00.000' AS DateTime), CAST(N'2008-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1154, 50, 22, CAST(N'2008-06-05T00:00:00.000' AS DateTime), CAST(N'2008-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1155, 32, 8, CAST(N'2008-06-06T00:00:00.000' AS DateTime), CAST(N'2008-06-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1156, 94, 40, CAST(N'2008-06-06T00:00:00.000' AS DateTime), CAST(N'2008-06-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1157, 8, 1, CAST(N'2008-06-06T00:00:00.000' AS DateTime), CAST(N'2008-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1158, 87, 32, CAST(N'2008-06-08T00:00:00.000' AS DateTime), CAST(N'2008-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1159, 7, 14, CAST(N'2008-06-09T00:00:00.000' AS DateTime), CAST(N'2008-06-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1160, 6, 24, CAST(N'2008-06-09T00:00:00.000' AS DateTime), CAST(N'2008-06-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1161, 61, 8, CAST(N'2008-06-09T00:00:00.000' AS DateTime), CAST(N'2008-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1162, 36, 1, CAST(N'2008-06-09T00:00:00.000' AS DateTime), CAST(N'2008-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1163, 28, 11, CAST(N'2008-06-10T00:00:00.000' AS DateTime), CAST(N'2008-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1164, 90, 33, CAST(N'2008-06-10T00:00:00.000' AS DateTime), CAST(N'2008-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1165, 70, 21, CAST(N'2008-06-11T00:00:00.000' AS DateTime), CAST(N'2008-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1166, 38, 30, CAST(N'2008-06-11T00:00:00.000' AS DateTime), CAST(N'2008-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1167, 84, 40, CAST(N'2008-06-13T00:00:00.000' AS DateTime), CAST(N'2008-06-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1168, 75, 24, CAST(N'2008-06-13T00:00:00.000' AS DateTime), CAST(N'2008-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1169, 3, 27, CAST(N'2008-06-13T00:00:00.000' AS DateTime), CAST(N'2008-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1170, 84, 44, CAST(N'2008-06-13T00:00:00.000' AS DateTime), CAST(N'2008-06-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1171, 54, 40, CAST(N'2008-06-14T00:00:00.000' AS DateTime), CAST(N'2008-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1172, 37, 16, CAST(N'2008-06-14T00:00:00.000' AS DateTime), CAST(N'2008-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1173, 27, 12, CAST(N'2008-06-16T00:00:00.000' AS DateTime), CAST(N'2008-07-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1174, 10, 7, CAST(N'2008-06-16T00:00:00.000' AS DateTime), CAST(N'2008-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1175, 58, 23, CAST(N'2008-06-16T00:00:00.000' AS DateTime), CAST(N'2008-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1176, 18, 4, CAST(N'2008-06-17T00:00:00.000' AS DateTime), CAST(N'2008-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1177, 65, 12, CAST(N'2008-06-17T00:00:00.000' AS DateTime), CAST(N'2008-06-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1178, 6, 30, CAST(N'2008-06-19T00:00:00.000' AS DateTime), CAST(N'2008-07-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1179, 88, 44, CAST(N'2008-06-20T00:00:00.000' AS DateTime), CAST(N'2008-06-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1180, 36, 4, CAST(N'2008-06-20T00:00:00.000' AS DateTime), CAST(N'2008-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1181, 95, 36, CAST(N'2008-06-20T00:00:00.000' AS DateTime), CAST(N'2008-06-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1182, 34, 11, CAST(N'2008-06-21T00:00:00.000' AS DateTime), CAST(N'2008-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1183, 90, 36, CAST(N'2008-06-22T00:00:00.000' AS DateTime), CAST(N'2008-07-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1184, 18, 30, CAST(N'2008-06-22T00:00:00.000' AS DateTime), CAST(N'2008-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1185, 70, 8, CAST(N'2008-06-23T00:00:00.000' AS DateTime), CAST(N'2008-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1186, 67, 21, CAST(N'2008-06-23T00:00:00.000' AS DateTime), CAST(N'2008-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1187, 81, 14, CAST(N'2008-06-24T00:00:00.000' AS DateTime), CAST(N'2008-07-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1188, 33, 35, CAST(N'2008-06-24T00:00:00.000' AS DateTime), CAST(N'2008-07-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1189, 12, 10, CAST(N'2008-06-26T00:00:00.000' AS DateTime), CAST(N'2008-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1190, 5, 11, CAST(N'2008-06-26T00:00:00.000' AS DateTime), CAST(N'2008-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1191, 82, 39, CAST(N'2008-06-27T00:00:00.000' AS DateTime), CAST(N'2008-07-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1192, 10, 15, CAST(N'2008-06-28T00:00:00.000' AS DateTime), CAST(N'2008-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1193, 80, 27, CAST(N'2008-06-28T00:00:00.000' AS DateTime), CAST(N'2008-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1194, 90, 40, CAST(N'2008-07-01T00:00:00.000' AS DateTime), CAST(N'2008-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1195, 87, 17, CAST(N'2008-07-01T00:00:00.000' AS DateTime), CAST(N'2008-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1196, 57, 11, CAST(N'2008-07-02T00:00:00.000' AS DateTime), CAST(N'2008-07-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1197, 50, 13, CAST(N'2008-07-02T00:00:00.000' AS DateTime), CAST(N'2008-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1198, 36, 37, CAST(N'2008-07-03T00:00:00.000' AS DateTime), CAST(N'2008-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1199, 55, 12, CAST(N'2008-07-04T00:00:00.000' AS DateTime), CAST(N'2008-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1200, 47, 40, CAST(N'2008-07-04T00:00:00.000' AS DateTime), CAST(N'2008-07-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1201, 14, 13, CAST(N'2008-07-04T00:00:00.000' AS DateTime), CAST(N'2008-07-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1202, 96, 10, CAST(N'2008-07-05T00:00:00.000' AS DateTime), CAST(N'2008-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1203, 28, 37, CAST(N'2008-07-07T00:00:00.000' AS DateTime), CAST(N'2008-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1204, 66, 39, CAST(N'2008-07-07T00:00:00.000' AS DateTime), CAST(N'2008-07-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1205, 92, 21, CAST(N'2008-07-08T00:00:00.000' AS DateTime), CAST(N'2008-07-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1206, 78, 6, CAST(N'2008-07-08T00:00:00.000' AS DateTime), CAST(N'2008-07-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1207, 54, 34, CAST(N'2008-07-09T00:00:00.000' AS DateTime), CAST(N'2008-07-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1208, 8, 13, CAST(N'2008-07-09T00:00:00.000' AS DateTime), CAST(N'2008-07-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1209, 64, 2, CAST(N'2008-07-09T00:00:00.000' AS DateTime), CAST(N'2008-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1210, 87, 37, CAST(N'2008-07-09T00:00:00.000' AS DateTime), CAST(N'2008-07-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1211, 71, 17, CAST(N'2008-07-10T00:00:00.000' AS DateTime), CAST(N'2008-07-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1212, 15, 30, CAST(N'2008-07-10T00:00:00.000' AS DateTime), CAST(N'2008-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1213, 72, 44, CAST(N'2008-07-12T00:00:00.000' AS DateTime), CAST(N'2008-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1214, 75, 26, CAST(N'2008-07-12T00:00:00.000' AS DateTime), CAST(N'2008-07-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1215, 94, 19, CAST(N'2008-07-12T00:00:00.000' AS DateTime), CAST(N'2008-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1216, 65, 22, CAST(N'2008-07-12T00:00:00.000' AS DateTime), CAST(N'2008-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1217, 31, 34, CAST(N'2008-07-13T00:00:00.000' AS DateTime), CAST(N'2008-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1218, 4, 18, CAST(N'2008-07-13T00:00:00.000' AS DateTime), CAST(N'2008-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1219, 31, 36, CAST(N'2008-07-15T00:00:00.000' AS DateTime), CAST(N'2008-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1220, 4, 23, CAST(N'2008-07-15T00:00:00.000' AS DateTime), CAST(N'2008-08-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1221, 30, 13, CAST(N'2008-07-16T00:00:00.000' AS DateTime), CAST(N'2008-07-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1222, 42, 9, CAST(N'2008-07-17T00:00:00.000' AS DateTime), CAST(N'2008-08-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1223, 29, 5, CAST(N'2008-07-17T00:00:00.000' AS DateTime), CAST(N'2008-08-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1224, 99, 1, CAST(N'2008-07-19T00:00:00.000' AS DateTime), CAST(N'2008-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1225, 8, 34, CAST(N'2008-07-21T00:00:00.000' AS DateTime), CAST(N'2008-07-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1226, 46, 6, CAST(N'2008-07-23T00:00:00.000' AS DateTime), CAST(N'2008-07-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1227, 68, 9, CAST(N'2008-07-23T00:00:00.000' AS DateTime), CAST(N'2008-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1228, 33, 41, CAST(N'2008-07-23T00:00:00.000' AS DateTime), CAST(N'2008-07-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1229, 15, 25, CAST(N'2008-07-25T00:00:00.000' AS DateTime), CAST(N'2008-08-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1230, 2, 17, CAST(N'2008-07-26T00:00:00.000' AS DateTime), CAST(N'2008-07-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1231, 61, 37, CAST(N'2008-07-27T00:00:00.000' AS DateTime), CAST(N'2008-08-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1232, 73, 24, CAST(N'2008-07-27T00:00:00.000' AS DateTime), CAST(N'2008-08-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1233, 50, 39, CAST(N'2008-07-28T00:00:00.000' AS DateTime), CAST(N'2008-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1234, 8, 1, CAST(N'2008-07-28T00:00:00.000' AS DateTime), CAST(N'2008-07-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1235, 36, 28, CAST(N'2008-07-28T00:00:00.000' AS DateTime), CAST(N'2008-08-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1236, 70, 43, CAST(N'2008-08-01T00:00:00.000' AS DateTime), CAST(N'2008-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1237, 77, 43, CAST(N'2008-08-01T00:00:00.000' AS DateTime), CAST(N'2008-08-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1238, 49, 25, CAST(N'2008-08-01T00:00:00.000' AS DateTime), CAST(N'2008-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1239, 53, 19, CAST(N'2008-08-02T00:00:00.000' AS DateTime), CAST(N'2008-08-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1240, 19, 41, CAST(N'2008-08-02T00:00:00.000' AS DateTime), CAST(N'2008-08-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1241, 32, 36, CAST(N'2008-08-04T00:00:00.000' AS DateTime), CAST(N'2008-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1242, 52, 21, CAST(N'2008-08-05T00:00:00.000' AS DateTime), CAST(N'2008-08-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1243, 49, 7, CAST(N'2008-08-06T00:00:00.000' AS DateTime), CAST(N'2008-08-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1244, 20, 35, CAST(N'2008-08-07T00:00:00.000' AS DateTime), CAST(N'2008-08-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1245, 67, 4, CAST(N'2008-08-08T00:00:00.000' AS DateTime), CAST(N'2008-08-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1246, 13, 25, CAST(N'2008-08-09T00:00:00.000' AS DateTime), CAST(N'2008-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1247, 95, 40, CAST(N'2008-08-11T00:00:00.000' AS DateTime), CAST(N'2008-08-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1248, 63, 3, CAST(N'2008-08-13T00:00:00.000' AS DateTime), CAST(N'2008-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1249, 21, 8, CAST(N'2008-08-14T00:00:00.000' AS DateTime), CAST(N'2008-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1250, 15, 16, CAST(N'2008-08-14T00:00:00.000' AS DateTime), CAST(N'2008-08-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1251, 5, 41, CAST(N'2008-08-16T00:00:00.000' AS DateTime), CAST(N'2008-08-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1252, 49, 22, CAST(N'2008-08-16T00:00:00.000' AS DateTime), CAST(N'2008-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1253, 23, 36, CAST(N'2008-08-16T00:00:00.000' AS DateTime), CAST(N'2008-09-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1254, 98, 42, CAST(N'2008-08-16T00:00:00.000' AS DateTime), CAST(N'2008-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1255, 87, 24, CAST(N'2008-08-16T00:00:00.000' AS DateTime), CAST(N'2008-08-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1256, 86, 23, CAST(N'2008-08-17T00:00:00.000' AS DateTime), CAST(N'2008-08-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1257, 98, 22, CAST(N'2008-08-17T00:00:00.000' AS DateTime), CAST(N'2008-08-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1258, 82, 15, CAST(N'2008-08-18T00:00:00.000' AS DateTime), CAST(N'2008-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1259, 28, 23, CAST(N'2008-08-18T00:00:00.000' AS DateTime), CAST(N'2008-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1260, 12, 33, CAST(N'2008-08-18T00:00:00.000' AS DateTime), CAST(N'2008-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1261, 61, 14, CAST(N'2008-08-20T00:00:00.000' AS DateTime), CAST(N'2008-09-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1262, 14, 29, CAST(N'2008-08-20T00:00:00.000' AS DateTime), CAST(N'2008-08-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1263, 55, 35, CAST(N'2008-08-20T00:00:00.000' AS DateTime), CAST(N'2008-08-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1264, 57, 18, CAST(N'2008-08-21T00:00:00.000' AS DateTime), CAST(N'2008-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1265, 71, 29, CAST(N'2008-08-24T00:00:00.000' AS DateTime), CAST(N'2008-09-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1266, 25, 37, CAST(N'2008-08-25T00:00:00.000' AS DateTime), CAST(N'2008-09-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1267, 79, 41, CAST(N'2008-08-26T00:00:00.000' AS DateTime), CAST(N'2008-09-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1268, 21, 18, CAST(N'2008-08-27T00:00:00.000' AS DateTime), CAST(N'2008-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1269, 89, 15, CAST(N'2008-09-02T00:00:00.000' AS DateTime), CAST(N'2008-09-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1270, 10, 26, CAST(N'2008-09-02T00:00:00.000' AS DateTime), CAST(N'2008-09-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1271, 34, 10, CAST(N'2008-09-03T00:00:00.000' AS DateTime), CAST(N'2008-09-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1272, 25, 13, CAST(N'2008-09-04T00:00:00.000' AS DateTime), CAST(N'2008-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1273, 83, 3, CAST(N'2008-09-05T00:00:00.000' AS DateTime), CAST(N'2008-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1274, 17, 42, CAST(N'2008-09-05T00:00:00.000' AS DateTime), CAST(N'2008-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1275, 11, 21, CAST(N'2008-09-05T00:00:00.000' AS DateTime), CAST(N'2008-09-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1276, 24, 44, CAST(N'2008-09-07T00:00:00.000' AS DateTime), CAST(N'2008-09-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1277, 23, 20, CAST(N'2008-09-08T00:00:00.000' AS DateTime), CAST(N'2008-09-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1278, 90, 36, CAST(N'2008-09-09T00:00:00.000' AS DateTime), CAST(N'2008-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1279, 49, 25, CAST(N'2008-09-09T00:00:00.000' AS DateTime), CAST(N'2008-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1280, 50, 42, CAST(N'2008-09-10T00:00:00.000' AS DateTime), CAST(N'2008-09-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1281, 11, 35, CAST(N'2008-09-12T00:00:00.000' AS DateTime), CAST(N'2008-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1282, 49, 21, CAST(N'2008-09-13T00:00:00.000' AS DateTime), CAST(N'2008-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1283, 61, 2, CAST(N'2008-09-14T00:00:00.000' AS DateTime), CAST(N'2008-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1284, 40, 41, CAST(N'2008-09-16T00:00:00.000' AS DateTime), CAST(N'2008-09-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1285, 14, 3, CAST(N'2008-09-16T00:00:00.000' AS DateTime), CAST(N'2008-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1286, 6, 44, CAST(N'2008-09-16T00:00:00.000' AS DateTime), CAST(N'2008-09-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1287, 95, 44, CAST(N'2008-09-16T00:00:00.000' AS DateTime), CAST(N'2008-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1288, 54, 12, CAST(N'2008-09-17T00:00:00.000' AS DateTime), CAST(N'2008-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1289, 8, 43, CAST(N'2008-09-17T00:00:00.000' AS DateTime), CAST(N'2008-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1290, 40, 10, CAST(N'2008-09-17T00:00:00.000' AS DateTime), CAST(N'2008-09-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1291, 29, 3, CAST(N'2008-09-17T00:00:00.000' AS DateTime), CAST(N'2008-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1292, 44, 41, CAST(N'2008-09-17T00:00:00.000' AS DateTime), CAST(N'2008-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1293, 82, 28, CAST(N'2008-09-18T00:00:00.000' AS DateTime), CAST(N'2008-09-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1294, 35, 32, CAST(N'2008-09-20T00:00:00.000' AS DateTime), CAST(N'2008-10-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1295, 46, 44, CAST(N'2008-09-20T00:00:00.000' AS DateTime), CAST(N'2008-10-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1296, 67, 20, CAST(N'2008-09-21T00:00:00.000' AS DateTime), CAST(N'2008-10-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1297, 58, 16, CAST(N'2008-09-21T00:00:00.000' AS DateTime), CAST(N'2008-10-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1298, 19, 20, CAST(N'2008-09-22T00:00:00.000' AS DateTime), CAST(N'2008-09-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1299, 72, 19, CAST(N'2008-09-23T00:00:00.000' AS DateTime), CAST(N'2008-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1300, 63, 9, CAST(N'2008-09-24T00:00:00.000' AS DateTime), CAST(N'2008-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1301, 81, 22, CAST(N'2008-09-24T00:00:00.000' AS DateTime), CAST(N'2008-09-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1302, 49, 33, CAST(N'2008-09-25T00:00:00.000' AS DateTime), CAST(N'2008-09-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1303, 14, 4, CAST(N'2008-09-25T00:00:00.000' AS DateTime), CAST(N'2008-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1304, 48, 18, CAST(N'2008-09-25T00:00:00.000' AS DateTime), CAST(N'2008-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1305, 29, 5, CAST(N'2008-09-27T00:00:00.000' AS DateTime), CAST(N'2008-10-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1306, 70, 28, CAST(N'2008-09-28T00:00:00.000' AS DateTime), CAST(N'2008-10-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1307, 90, 12, CAST(N'2008-10-01T00:00:00.000' AS DateTime), CAST(N'2008-10-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1308, 29, 24, CAST(N'2008-10-02T00:00:00.000' AS DateTime), CAST(N'2008-10-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1309, 20, 16, CAST(N'2008-10-02T00:00:00.000' AS DateTime), CAST(N'2008-10-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1310, 7, 33, CAST(N'2008-10-03T00:00:00.000' AS DateTime), CAST(N'2008-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1311, 72, 40, CAST(N'2008-10-03T00:00:00.000' AS DateTime), CAST(N'2008-10-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1312, 28, 39, CAST(N'2008-10-03T00:00:00.000' AS DateTime), CAST(N'2008-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1313, 16, 14, CAST(N'2008-10-03T00:00:00.000' AS DateTime), CAST(N'2008-10-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1314, 95, 42, CAST(N'2008-10-04T00:00:00.000' AS DateTime), CAST(N'2008-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1315, 68, 13, CAST(N'2008-10-07T00:00:00.000' AS DateTime), CAST(N'2008-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1316, 4, 24, CAST(N'2008-10-07T00:00:00.000' AS DateTime), CAST(N'2008-10-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1317, 73, 6, CAST(N'2008-10-08T00:00:00.000' AS DateTime), CAST(N'2008-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1318, 86, 37, CAST(N'2008-10-08T00:00:00.000' AS DateTime), CAST(N'2008-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1319, 51, 12, CAST(N'2008-10-09T00:00:00.000' AS DateTime), CAST(N'2008-10-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1320, 30, 37, CAST(N'2008-10-10T00:00:00.000' AS DateTime), CAST(N'2008-10-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1321, 25, 44, CAST(N'2008-10-10T00:00:00.000' AS DateTime), CAST(N'2008-10-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1322, 16, 10, CAST(N'2008-10-10T00:00:00.000' AS DateTime), CAST(N'2008-10-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1323, 26, 3, CAST(N'2008-10-10T00:00:00.000' AS DateTime), CAST(N'2008-10-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1324, 97, 17, CAST(N'2008-10-11T00:00:00.000' AS DateTime), CAST(N'2008-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1325, 50, 21, CAST(N'2008-10-14T00:00:00.000' AS DateTime), CAST(N'2008-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1326, 21, 28, CAST(N'2008-10-14T00:00:00.000' AS DateTime), CAST(N'2008-10-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1327, 86, 19, CAST(N'2008-10-14T00:00:00.000' AS DateTime), CAST(N'2008-10-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1328, 7, 16, CAST(N'2008-10-15T00:00:00.000' AS DateTime), CAST(N'2008-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1329, 60, 35, CAST(N'2008-10-15T00:00:00.000' AS DateTime), CAST(N'2008-11-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1330, 80, 23, CAST(N'2008-10-16T00:00:00.000' AS DateTime), CAST(N'2008-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1331, 51, 14, CAST(N'2008-10-16T00:00:00.000' AS DateTime), CAST(N'2008-10-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1332, 99, 36, CAST(N'2008-10-18T00:00:00.000' AS DateTime), CAST(N'2008-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1333, 43, 5, CAST(N'2008-10-18T00:00:00.000' AS DateTime), CAST(N'2008-11-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1334, 91, 17, CAST(N'2008-10-18T00:00:00.000' AS DateTime), CAST(N'2008-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1335, 43, 4, CAST(N'2008-10-19T00:00:00.000' AS DateTime), CAST(N'2008-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1336, 92, 1, CAST(N'2008-10-19T00:00:00.000' AS DateTime), CAST(N'2008-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1337, 84, 15, CAST(N'2008-10-20T00:00:00.000' AS DateTime), CAST(N'2008-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1338, 60, 13, CAST(N'2008-10-20T00:00:00.000' AS DateTime), CAST(N'2008-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1339, 95, 30, CAST(N'2008-10-20T00:00:00.000' AS DateTime), CAST(N'2008-11-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1340, 42, 18, CAST(N'2008-10-22T00:00:00.000' AS DateTime), CAST(N'2008-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1341, 30, 4, CAST(N'2008-10-23T00:00:00.000' AS DateTime), CAST(N'2008-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1342, 85, 19, CAST(N'2008-10-25T00:00:00.000' AS DateTime), CAST(N'2008-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1343, 46, 23, CAST(N'2008-10-25T00:00:00.000' AS DateTime), CAST(N'2008-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1344, 59, 43, CAST(N'2008-10-26T00:00:00.000' AS DateTime), CAST(N'2008-11-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1345, 92, 2, CAST(N'2008-10-27T00:00:00.000' AS DateTime), CAST(N'2008-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1346, 58, 1, CAST(N'2008-10-27T00:00:00.000' AS DateTime), CAST(N'2008-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1347, 29, 41, CAST(N'2008-10-27T00:00:00.000' AS DateTime), CAST(N'2008-10-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1348, 22, 33, CAST(N'2008-10-28T00:00:00.000' AS DateTime), CAST(N'2008-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1349, 2, 7, CAST(N'2008-10-28T00:00:00.000' AS DateTime), CAST(N'2008-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1350, 93, 28, CAST(N'2008-11-01T00:00:00.000' AS DateTime), CAST(N'2008-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1351, 78, 14, CAST(N'2008-11-01T00:00:00.000' AS DateTime), CAST(N'2008-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1352, 8, 40, CAST(N'2008-11-02T00:00:00.000' AS DateTime), CAST(N'2008-11-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1353, 13, 21, CAST(N'2008-11-02T00:00:00.000' AS DateTime), CAST(N'2008-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1354, 15, 39, CAST(N'2008-11-03T00:00:00.000' AS DateTime), CAST(N'2008-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1355, 77, 37, CAST(N'2008-11-03T00:00:00.000' AS DateTime), CAST(N'2008-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1356, 92, 7, CAST(N'2008-11-03T00:00:00.000' AS DateTime), CAST(N'2008-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1357, 28, 40, CAST(N'2008-11-04T00:00:00.000' AS DateTime), CAST(N'2008-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1358, 85, 15, CAST(N'2008-11-04T00:00:00.000' AS DateTime), CAST(N'2008-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1359, 74, 24, CAST(N'2008-11-05T00:00:00.000' AS DateTime), CAST(N'2008-11-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1360, 75, 29, CAST(N'2008-11-05T00:00:00.000' AS DateTime), CAST(N'2008-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1361, 34, 29, CAST(N'2008-11-05T00:00:00.000' AS DateTime), CAST(N'2008-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1362, 17, 38, CAST(N'2008-11-05T00:00:00.000' AS DateTime), CAST(N'2008-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1363, 89, 13, CAST(N'2008-11-05T00:00:00.000' AS DateTime), CAST(N'2008-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1364, 55, 41, CAST(N'2008-11-06T00:00:00.000' AS DateTime), CAST(N'2008-11-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1365, 99, 37, CAST(N'2008-11-06T00:00:00.000' AS DateTime), CAST(N'2008-11-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1366, 3, 15, CAST(N'2008-11-07T00:00:00.000' AS DateTime), CAST(N'2008-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1367, 30, 42, CAST(N'2008-11-09T00:00:00.000' AS DateTime), CAST(N'2008-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1368, 42, 40, CAST(N'2008-11-09T00:00:00.000' AS DateTime), CAST(N'2008-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1369, 7, 20, CAST(N'2008-11-10T00:00:00.000' AS DateTime), CAST(N'2008-11-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1370, 91, 28, CAST(N'2008-11-11T00:00:00.000' AS DateTime), CAST(N'2008-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1371, 56, 25, CAST(N'2008-11-12T00:00:00.000' AS DateTime), CAST(N'2008-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1372, 8, 12, CAST(N'2008-11-14T00:00:00.000' AS DateTime), CAST(N'2008-11-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1373, 4, 32, CAST(N'2008-11-16T00:00:00.000' AS DateTime), CAST(N'2008-12-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1374, 80, 12, CAST(N'2008-11-17T00:00:00.000' AS DateTime), CAST(N'2008-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1375, 47, 30, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-11-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1376, 96, 4, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1377, 7, 34, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-12-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1378, 87, 25, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-11-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1379, 77, 3, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-11-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1380, 5, 40, CAST(N'2008-11-18T00:00:00.000' AS DateTime), CAST(N'2008-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1381, 96, 23, CAST(N'2008-11-20T00:00:00.000' AS DateTime), CAST(N'2008-11-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1382, 55, 31, CAST(N'2008-11-20T00:00:00.000' AS DateTime), CAST(N'2008-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1383, 8, 17, CAST(N'2008-11-21T00:00:00.000' AS DateTime), CAST(N'2008-11-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1384, 31, 33, CAST(N'2008-11-21T00:00:00.000' AS DateTime), CAST(N'2008-12-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1385, 98, 43, CAST(N'2008-11-21T00:00:00.000' AS DateTime), CAST(N'2008-11-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1386, 92, 7, CAST(N'2008-11-22T00:00:00.000' AS DateTime), CAST(N'2008-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1387, 99, 7, CAST(N'2008-11-22T00:00:00.000' AS DateTime), CAST(N'2008-11-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1388, 91, 1, CAST(N'2008-11-22T00:00:00.000' AS DateTime), CAST(N'2008-12-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1389, 94, 14, CAST(N'2008-11-24T00:00:00.000' AS DateTime), CAST(N'2008-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1390, 17, 24, CAST(N'2008-11-25T00:00:00.000' AS DateTime), CAST(N'2008-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1391, 5, 17, CAST(N'2008-11-25T00:00:00.000' AS DateTime), CAST(N'2008-11-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1392, 26, 33, CAST(N'2008-11-26T00:00:00.000' AS DateTime), CAST(N'2008-12-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1393, 64, 29, CAST(N'2008-11-26T00:00:00.000' AS DateTime), CAST(N'2008-11-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1394, 46, 12, CAST(N'2008-11-27T00:00:00.000' AS DateTime), CAST(N'2008-12-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1395, 3, 1, CAST(N'2008-11-27T00:00:00.000' AS DateTime), CAST(N'2008-12-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1396, 90, 6, CAST(N'2008-11-27T00:00:00.000' AS DateTime), CAST(N'2008-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1397, 23, 12, CAST(N'2008-11-27T00:00:00.000' AS DateTime), CAST(N'2008-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1398, 23, 9, CAST(N'2008-11-28T00:00:00.000' AS DateTime), CAST(N'2008-12-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1399, 37, 44, CAST(N'2008-11-28T00:00:00.000' AS DateTime), CAST(N'2008-11-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[islem] ([islemno], [ogrno], [kitapno], [atarih], [vtarih]) VALUES (1400, 6, 31, CAST(N'2008-11-28T00:00:00.000' AS DateTime), CAST(N'2008-12-08T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[islem] OFF
GO
SET IDENTITY_INSERT [dbo].[kitap] ON 
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (1, N'253-335-3934-16-4   ', N'Abdülhamidin Kurtlarla Dansı', 26, 3, 368, 22)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (2, N'295-115-3846-25-2   ', N'Ablamı Nereye Kaçırdılar', 6, 1, 220, 27)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (3, N'127-255-2542-27-4   ', N'Anayurttan Anadoluya', 18, 6, 311, 19)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (4, N'292-246-1768-30-4   ', N'Anneannem Gelin Oldu', 22, 4, 135, 15)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (5, N'133-135-1902-34-4   ', N'Antik Acılar', 10, 3, 179, 28)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (6, N'227-381-2011-10-2   ', N'Aşk Ve Öbür Cinler', 25, 1, 242, 18)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (7, N'295-374-1891-21-2   ', N'Aşksız İnsanlar', 22, 3, 346, 18)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (8, N'212-395-2870-16-8   ', N'Atuan Mezarları', 28, 6, 389, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (9, N'266-179-1159-15-2   ', N'Bahar İsyancıdır', 6, 4, 259, 25)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (10, N'141-285-1954-21-5   ', N'Benim Üniversitelerim', 27, 2, 391, 15)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (11, N'393-320-3629-26-4   ', N'Bir Gemide', 19, 6, 89, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (12, N'195-164-1129-21-1   ', N'Bir Ses Böler Geceyi', 6, 4, 265, 14)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (13, N'205-235-3170-13-6   ', N'Boğaziçi Şıngır Mıngır', 20, 6, 160, 14)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (14, N'128-392-2346-31-8   ', N'Borçlu Olduklarımız', 27, 5, 383, 14)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (15, N'233-100-3467-22-3   ', N'Büyücüler', 5, 6, 188, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (16, N'322-328-2571-13-7   ', N'Danışmanlık İncileri', 28, 5, 393, 20)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (17, N'260-357-1043-15-5   ', N'Dol Karabekir Dol', 6, 3, 338, 11)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (18, N'362-284-2000-13-6   ', N'Düşler Düşü', 5, 6, 109, 21)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (19, N'226-379-1465-26-3   ', N'Haset Ve Şükran', 12, 3, 151, 19)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (20, N'307-393-1346-24-1   ', N'İnsanlarımız 3', 27, 3, 134, 11)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (21, N'165-174-2247-28-1   ', N'Kadınlar Okulu', 15, 1, 391, 24)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (22, N'103-286-1279-21-2   ', N'Kapitalist Toplum', 23, 3, 161, 10)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (23, N'209-392-2760-28-7   ', N'Lal Masallar', 11, 5, 313, 26)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (24, N'381-215-2765-22-6   ', N'Makas', 15, 1, 320, 26)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (25, N'148-336-3787-29-4   ', N'Minima Morelia', 9, 4, 183, 22)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (26, N'218-194-3502-20-1   ', N'Raikin Annesi', 23, 6, 93, 13)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (27, N'251-275-2168-11-8   ', N'Rana', 8, 4, 135, 21)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (28, N'140-274-3728-27-3   ', N'Rengahenk', 12, 6, 149, 19)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (29, N'135-309-2577-18-8   ', N'Sarıkamıştan Esarete', 16, 5, 178, 18)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (30, N'398-276-1811-34-5   ', N'Savaş Sanatı', 20, 2, 256, 13)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (31, N'236-132-3581-29-1   ', N'Sessiz Arka Bahçeler', 8, 5, 248, 24)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (32, N'307-340-3979-23-4   ', N'Sıradışı Filozoflar', 26, 2, 314, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (33, N'301-164-2841-35-3   ', N'Telgrafhane', 19, 6, 293, 21)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (34, N'195-195-1004-17-3   ', N'Toprak', 23, 2, 230, 12)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (35, N'281-239-3080-17-5   ', N'Üsküdarda Sabah Oldu', 13, 5, 101, 20)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (36, N'226-265-1500-21-5   ', N'Yedi İklim Dört Bucak', 25, 2, 282, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (37, N'266-280-3443-17-7   ', N'Zararlı Alışkanlıklar', 10, 5, 203, 14)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (38, N'322-236-2524-16-2   ', N'Zengin Kadın', 28, 5, 304, 15)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (39, N'294-226-2889-15-1   ', N'Abluka', 7, 1, 220, 12)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (40, N'224-383-3420-14-8   ', N'Açlık', 20, 3, 294, 27)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (41, N'189-209-3005-20-5   ', N'Adı Aylin', 6, 2, 97, 22)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (42, N'399-158-2002-16-5   ', N'Aklın İsyanı', 24, 4, 297, 14)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (43, N'312-215-2630-27-2   ', N'Araba Sevdası', 11, 2, 168, 18)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (44, N'220-275-2636-35-7   ', N'Araf', 16, 1, 235, 16)
GO
INSERT [dbo].[kitap] ([kitapno], [isbnno], [kitapadi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (45, N'280-188-3589-22-8   ', N'Başarı Rehberi', 1, 4, 116, 14)
GO
SET IDENTITY_INSERT [dbo].[kitap] OFF
GO
SET IDENTITY_INSERT [dbo].[ogrenci] ON 
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (1, N'Hülya     ', N'Yiğit               ', N'K', CAST(N'1990-04-08T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (2, N'Niyazi    ', N'Sevinç              ', N'E', CAST(N'1990-11-11T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (3, N'İsmail    ', N'Sevinç              ', N'E', CAST(N'1990-04-17T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (4, N'Kenan     ', N'Emin                ', N'E', CAST(N'1988-02-23T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (5, N'Sema      ', N'Bakır               ', N'K', CAST(N'1990-04-07T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (6, N'Deniz     ', N'Kara                ', N'E', CAST(N'1989-07-21T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (7, N'Betül     ', N'Coşkun              ', N'K', CAST(N'1990-01-10T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (8, N'Sema      ', N'Rüzgar              ', N'K', CAST(N'1989-11-14T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (9, N'Fadime    ', N'Dönmez              ', N'K', CAST(N'1989-09-11T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (10, N'Rıza      ', N'Koç                 ', N'E', CAST(N'1990-01-26T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (11, N'Ceylan    ', N'Kabak               ', N'K', CAST(N'1988-02-02T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (12, N'Deniz     ', N'Akçakaya            ', N'E', CAST(N'1989-01-24T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (13, N'Kemal     ', N'Karapınar           ', N'E', CAST(N'1990-10-23T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (14, N'Derya     ', N'Yılbur              ', N'K', CAST(N'1990-08-12T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (15, N'Filiz     ', N'Akat                ', N'K', CAST(N'1989-09-09T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (16, N'Niyazi    ', N'Dönmez              ', N'E', CAST(N'1988-05-08T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (17, N'Sema      ', N'Sekmen              ', N'K', CAST(N'1990-08-16T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (18, N'İsmail    ', N'Balcı               ', N'E', CAST(N'1990-09-09T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (19, N'Ahmet     ', N'Yıldız              ', N'E', CAST(N'1989-04-25T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (20, N'Hasan     ', N'Alp                 ', N'E', CAST(N'1990-10-20T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (21, N'Derya     ', N'Şahin               ', N'K', CAST(N'1989-01-25T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (22, N'Süleyman  ', N'Rüzgar              ', N'E', CAST(N'1989-11-20T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (23, N'Fatma     ', N'Akçakaya            ', N'K', CAST(N'1989-11-23T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (24, N'Fidan     ', N'Taşdemir            ', N'K', CAST(N'1990-01-04T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (25, N'Cemil     ', N'Yazar               ', N'E', CAST(N'1988-07-13T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (26, N'Hülya     ', N'Yiğit               ', N'K', CAST(N'1990-01-03T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (27, N'Mustafa   ', N'Can                 ', N'E', CAST(N'1988-03-10T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (28, N'İsmail    ', N'Kara                ', N'E', CAST(N'1989-08-12T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (29, N'Ali       ', N'Çamak               ', N'E', CAST(N'1988-04-22T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (30, N'Mümtaz    ', N'Topal               ', N'E', CAST(N'1988-05-22T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (31, N'Filiz     ', N'Ezer                ', N'K', CAST(N'1989-03-26T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (32, N'İsmail    ', N'Yiğit               ', N'E', CAST(N'1990-10-10T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (33, N'Ayşe      ', N'Çamak               ', N'K', CAST(N'1989-07-22T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (34, N'Sabri     ', N'Can                 ', N'E', CAST(N'1989-02-26T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (35, N'Derya     ', N'Küçük               ', N'K', CAST(N'1989-05-28T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (36, N'Rıza      ', N'Yıldız              ', N'E', CAST(N'1989-10-11T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (37, N'Şenol     ', N'Dağ                 ', N'E', CAST(N'1989-04-14T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (38, N'Hülya     ', N'Balcı               ', N'K', CAST(N'1990-05-19T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (39, N'Hakkı     ', N'Akçakaya            ', N'E', CAST(N'1988-01-10T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (40, N'Süleyman  ', N'Kılıç               ', N'E', CAST(N'1988-02-09T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (41, N'Leyla     ', N'Dağ                 ', N'K', CAST(N'1988-10-12T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (42, N'Hakkı     ', N'Aktaş               ', N'E', CAST(N'1990-11-24T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (43, N'İlyas     ', N'Çamak               ', N'E', CAST(N'1988-11-06T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (44, N'Rıza      ', N'Karapınar           ', N'E', CAST(N'1989-07-23T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (45, N'Deniz     ', N'Güven               ', N'E', CAST(N'1990-10-09T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (46, N'Eşref     ', N'Demir               ', N'E', CAST(N'1990-07-11T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (47, N'Kenan     ', N'Can                 ', N'E', CAST(N'1990-07-16T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (48, N'Niyazi    ', N'Karakaya            ', N'E', CAST(N'1989-01-14T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (49, N'Kemal     ', N'Emin                ', N'E', CAST(N'1990-10-13T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (50, N'Fadime    ', N'Karakaş             ', N'K', CAST(N'1990-05-05T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (51, N'Şenol     ', N'Coşkun              ', N'E', CAST(N'1988-09-14T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (52, N'İlyas     ', N'Yılbur              ', N'E', CAST(N'1988-05-12T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (53, N'Sabri     ', N'Karakaya            ', N'E', CAST(N'1988-03-05T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (54, N'Filiz     ', N'Kabak               ', N'K', CAST(N'1989-03-21T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (55, N'Rıza      ', N'Anıl                ', N'E', CAST(N'1988-01-15T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (56, N'Zeynep    ', N'Sarıkaya            ', N'K', CAST(N'1989-05-08T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (57, N'Fidan     ', N'Kılıç               ', N'K', CAST(N'1989-04-04T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (58, N'Rıza      ', N'Karakaş             ', N'E', CAST(N'1988-04-06T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (59, N'Cemil     ', N'Kara                ', N'E', CAST(N'1989-10-15T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (60, N'Fatma     ', N'Karakaş             ', N'K', CAST(N'1990-10-16T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (61, N'Nazım     ', N'Başkara             ', N'E', CAST(N'1988-04-18T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (62, N'Mümtaz    ', N'Çamak               ', N'E', CAST(N'1989-05-23T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (63, N'Zeynep    ', N'Yiğit               ', N'K', CAST(N'1990-05-01T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (64, N'Leyla     ', N'Taşdemir            ', N'K', CAST(N'1989-10-08T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (65, N'Kenan     ', N'Başak               ', N'E', CAST(N'1988-06-11T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (66, N'Cemil     ', N'Topal               ', N'E', CAST(N'1988-04-08T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (67, N'Behlül    ', N'Emin                ', N'E', CAST(N'1990-11-06T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (68, N'Şenol     ', N'Karakaya            ', N'E', CAST(N'1990-08-02T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (69, N'Eşref     ', N'Küçük               ', N'E', CAST(N'1990-03-14T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (70, N'İnci      ', N'Can                 ', N'K', CAST(N'1990-10-16T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (71, N'Derya     ', N'Başak               ', N'K', CAST(N'1988-08-28T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (72, N'Leyla     ', N'Karapınar           ', N'K', CAST(N'1988-04-10T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (73, N'Deniz     ', N'Dönmez              ', N'E', CAST(N'1990-06-16T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (74, N'Mehmet    ', N'Dönmez              ', N'E', CAST(N'1990-08-15T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (75, N'Emine     ', N'Yılbur              ', N'K', CAST(N'1988-05-22T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (76, N'Pınar     ', N'Karakaya            ', N'K', CAST(N'1989-05-09T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (77, N'İnci      ', N'Alp                 ', N'K', CAST(N'1989-10-06T00:00:00.000' AS DateTime), N'9C  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (78, N'Pınar     ', N'Yıldız              ', N'K', CAST(N'1988-11-13T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (79, N'Şenol     ', N'Çelik               ', N'E', CAST(N'1989-09-13T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (80, N'Fidan     ', N'Bakır               ', N'K', CAST(N'1990-03-15T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (81, N'Remzi     ', N'Akat                ', N'E', CAST(N'1988-03-24T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (82, N'Emine     ', N'Alp                 ', N'K', CAST(N'1990-03-14T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (83, N'Kenan     ', N'Başkara             ', N'E', CAST(N'1990-04-28T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (84, N'Şakir     ', N'Kılıç               ', N'E', CAST(N'1990-11-11T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (85, N'Fidan     ', N'Kılıç               ', N'K', CAST(N'1988-11-12T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (86, N'Jale      ', N'Karapınar           ', N'K', CAST(N'1988-07-17T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (87, N'Süleyman  ', N'Kılıç               ', N'E', CAST(N'1988-02-05T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (88, N'Ceylan    ', N'Karakaya            ', N'K', CAST(N'1990-09-07T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (89, N'Niyazi    ', N'Yazar               ', N'E', CAST(N'1988-04-23T00:00:00.000' AS DateTime), N'10B ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (90, N'Deniz     ', N'Dağ                 ', N'E', CAST(N'1988-01-25T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (91, N'Rıza      ', N'Şahin               ', N'E', CAST(N'1990-09-28T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (92, N'Fatma     ', N'Başkara             ', N'K', CAST(N'1989-10-15T00:00:00.000' AS DateTime), N'10A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (93, N'Niyazi    ', N'Kabak               ', N'E', CAST(N'1989-08-02T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (94, N'Fadime    ', N'Ezer                ', N'K', CAST(N'1990-10-16T00:00:00.000' AS DateTime), N'11A ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (95, N'Kenan     ', N'Kılıç               ', N'E', CAST(N'1988-11-12T00:00:00.000' AS DateTime), N'9B  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (96, N'Şenol     ', N'Dönmez              ', N'E', CAST(N'1989-08-19T00:00:00.000' AS DateTime), N'10C ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (97, N'Leyla     ', N'Kabak               ', N'K', CAST(N'1988-10-02T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (98, N'Fatma     ', N'Balcı               ', N'K', CAST(N'1989-05-07T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (99, N'Eşref     ', N'Güven               ', N'E', CAST(N'1988-01-24T00:00:00.000' AS DateTime), N'9A  ', 0)
GO
INSERT [dbo].[ogrenci] ([ogrno], [ograd], [ogrsoyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (100, N'Jale      ', N'Sekmen              ', N'K', CAST(N'1988-04-15T00:00:00.000' AS DateTime), N'10B ', 0)
GO
SET IDENTITY_INSERT [dbo].[ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[tur] ON 
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (1, N'Dram                          ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (2, N'Komedi                        ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (3, N'Roman                         ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (4, N'Hikaye                        ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (5, N'Araştırma                     ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (6, N'Fıkra                         ')
GO
INSERT [dbo].[tur] ([turno], [turadi]) VALUES (7, N'Deneme                        ')
GO
SET IDENTITY_INSERT [dbo].[tur] OFF
GO
SET IDENTITY_INSERT [dbo].[yazar] ON 
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (1, N'Leyla               ', N'Çelik               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (2, N'Zeynep              ', N'Emin                ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (3, N'Ali                 ', N'Yazar               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (4, N'Deniz               ', N'Akpınar             ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (5, N'Mehmet              ', N'Çelik               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (6, N'Sabri               ', N'Demir               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (7, N'Kemal               ', N'Yılbur              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (8, N'Remzi               ', N'Rüzgar              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (9, N'Pınar               ', N'Karakaş             ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (10, N'Remzi               ', N'Rüzgar              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (11, N'Emin                ', N'Karakaş             ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (12, N'Leyla               ', N'Sevinç              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (13, N'Fidan               ', N'Akpınar             ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (14, N'Fadime              ', N'Balcı               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (15, N'Ceylan              ', N'Çelik               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (16, N'Derya               ', N'Balcı               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (17, N'Pınar               ', N'Sevinç              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (18, N'Kenan               ', N'Kabak               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (19, N'Sabri               ', N'Can                 ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (20, N'Emin                ', N'Kara                ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (21, N'Eşref               ', N'Kabak               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (22, N'Fidan               ', N'Aktaş               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (23, N'Zeynep              ', N'Bayrak              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (24, N'İsmail              ', N'Yiğit               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (25, N'Niyazi              ', N'Özcan               ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (26, N'Derya               ', N'Akçakaya            ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (27, N'Mine                ', N'Başkara             ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (28, N'Şakir               ', N'Kızıltepe           ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (29, N'Filiz               ', N'Yıldız              ')
GO
INSERT [dbo].[yazar] ([yazarno], [yazarad], [yazarsoyad]) VALUES (30, N'Kemal               ', N'Karakaya            ')
GO
SET IDENTITY_INSERT [dbo].[yazar] OFF
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_kitap1] FOREIGN KEY([kitapno])
REFERENCES [dbo].[kitap] ([kitapno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_kitap1]
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_ogrenci1] FOREIGN KEY([ogrno])
REFERENCES [dbo].[ogrenci] ([ogrno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_ogrenci1]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_tur] FOREIGN KEY([turno])
REFERENCES [dbo].[tur] ([turno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_tur]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_yazar] FOREIGN KEY([yazarno])
REFERENCES [dbo].[yazar] ([yazarno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_yazar]
GO
USE [master]
GO
ALTER DATABASE [kutuphane] SET  READ_WRITE 
GO
