USE [master]
GO
/****** Object:  Database [VUVZaposliSe]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE DATABASE [VUVZaposliSe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VUVZaposliSe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VUVZaposliSe.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VUVZaposliSe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VUVZaposliSe_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VUVZaposliSe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VUVZaposliSe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VUVZaposliSe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET ARITHABORT OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VUVZaposliSe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VUVZaposliSe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VUVZaposliSe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VUVZaposliSe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VUVZaposliSe] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VUVZaposliSe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VUVZaposliSe] SET  MULTI_USER 
GO
ALTER DATABASE [VUVZaposliSe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VUVZaposliSe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VUVZaposliSe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VUVZaposliSe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VUVZaposliSe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VUVZaposliSe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VUVZaposliSe] SET QUERY_STORE = OFF
GO
USE [VUVZaposliSe]
GO
/****** Object:  Schema [HangFire]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoriti]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoriti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PosaoId] [int] NOT NULL,
	[KorisnikId] [int] NOT NULL,
 CONSTRAINT [PK_Favoriti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gradovi]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gradovi](
	[GradId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Gradovi] PRIMARY KEY CLUSTERED 
(
	[GradId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorije]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorije](
	[KategorijaId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Kategorije] PRIMARY KEY CLUSTERED 
(
	[KategorijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[KorisnikId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](max) NOT NULL,
	[Prezime] [nvarchar](max) NOT NULL,
	[Adresa] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Sub] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pogodnosti]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pogodnosti](
	[PogodnostId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Pogodnosti] PRIMARY KEY CLUSTERED 
(
	[PogodnostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PogodnostPosao]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PogodnostPosao](
	[PogodnostId] [int] NOT NULL,
	[PosloviPosaoId] [int] NOT NULL,
 CONSTRAINT [PK_PogodnostPosao] PRIMARY KEY CLUSTERED 
(
	[PogodnostId] ASC,
	[PosloviPosaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosaoVjestina]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosaoVjestina](
	[PosloviPosaoId] [int] NOT NULL,
	[VjestineVjestinaId] [int] NOT NULL,
 CONSTRAINT [PK_PosaoVjestina] PRIMARY KEY CLUSTERED 
(
	[PosloviPosaoId] ASC,
	[VjestineVjestinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poslodavci]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poslodavci](
	[PoslodavacId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[Sjediste] [nvarchar](max) NOT NULL,
	[Oib] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Telefon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Poslodavci] PRIMARY KEY CLUSTERED 
(
	[PoslodavacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poslovi]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poslovi](
	[PosaoId] [int] IDENTITY(1,1) NOT NULL,
	[Opis] [varchar](max) NOT NULL,
	[DatumAktivnosti] [datetime2](7) NOT NULL,
	[Lokacija] [nvarchar](max) NOT NULL,
	[BrojRadnika] [int] NOT NULL,
	[Satnica] [decimal](10, 2) NOT NULL,
	[KategorijaId] [int] NOT NULL,
	[PoslodavacId] [int] NOT NULL,
	[Aktivan] [bit] NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[GradId] [int] NULL,
 CONSTRAINT [PK_Poslovi] PRIMARY KEY CLUSTERED 
(
	[PosaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrivatniPodaci]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivatniPodaci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lozinka] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PrivatniPodaci] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vjestine]    Script Date: 8.12.2022. 19:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vjestine](
	[VjestinaId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Vjestine] PRIMARY KEY CLUSTERED 
(
	[VjestinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220510183329_TablicaKorisnici', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220510192249_OstaleTablice', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220520203818_DodaniParametri', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220522200108_maknutoPoljeLokacijaPoslodavac', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220529090602_NameChange', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220529095821_AnotherNameChange', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220530192804_PropertyAnnotations', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220530200930_lenghtFix', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605151853_AktivnostPosla', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605203546_NazivPosla', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220611174057_AddingSubOnKorisnik', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220618161632_PoslodavacKontakt', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220620210048_Grat', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220701191529_favoriti', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220701192202_tableNameChange', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220702094521_tablicaFavoriti', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703172314_brisanjeTabliceKomentari', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220916162550_tablePrivatniPodaci', N'6.0.5')
GO
SET IDENTITY_INSERT [dbo].[Favoriti] ON 

INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (143, 6, 1)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (144, 4, 1)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (145, 30, 2)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (147, 3, 2)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (150, 5, 1)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (155, 11, 2)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (157, 1, 1)
INSERT [dbo].[Favoriti] ([Id], [PosaoId], [KorisnikId]) VALUES (158, 1, 2)
SET IDENTITY_INSERT [dbo].[Favoriti] OFF
GO
SET IDENTITY_INSERT [dbo].[Gradovi] ON 

INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (1, N'Virovitica')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (2, N'Rijeka')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (3, N'Jasenice')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (4, N'Karlovac')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (5, N'Jastrebarsko')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (6, N'Osijek')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (7, N'Zagreb')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (8, N'Sveta Nedelja')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (9, N'Kastav')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (10, N'Više lokacija')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (11, N'Pula')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (12, N'Zadar')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (13, N'Split')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (14, N'Starigrad')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (15, N'Biograd na Moru')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (16, N'Bibinje')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (17, N'Vukovar')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (18, N'Varaždin')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (19, N'Koprivnica')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (20, N'Bjelovar')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (21, N'Novi Zagreb - istok')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (22, N'Samobor')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (23, N'Dubrovnik')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (24, N'Slavonski Brod')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (25, N'Sisak')
INSERT [dbo].[Gradovi] ([GradId], [Naziv]) VALUES (26, N'Šibenik')
SET IDENTITY_INSERT [dbo].[Gradovi] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategorije] ON 

INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (1, N'Prodavač')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (2, N'Administrativni poslovi')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (3, N'Programiranje, developer, podrška')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (5, N'Dostavljač')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (7, N'Pomoćni poslovi u kuhinji')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (8, N'Vozač')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (9, N'Grafički dizajner')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (10, N'Promotor')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (11, N'Ispitivanje/anketiranje')
INSERT [dbo].[Kategorije] ([KategorijaId], [Naziv]) VALUES (12, N'Skladištar')
SET IDENTITY_INSERT [dbo].[Kategorije] OFF
GO
SET IDENTITY_INSERT [dbo].[Korisnici] ON 

INSERT [dbo].[Korisnici] ([KorisnikId], [Ime], [Prezime], [Adresa], [Email], [Sub]) VALUES (1, N'Roko', N'Kovač', N'Zagreb', N'rokokovac@aai-test.hr', N'ae15ff93d7e01517da5f52ccda543208')
INSERT [dbo].[Korisnici] ([KorisnikId], [Ime], [Prezime], [Adresa], [Email], [Sub]) VALUES (2, N'Ivan', N'Horvat', N'Zagreb', N'ivanhorvat@aai-test.hr', N'7e9939dd1a7dfb47adc7e7ef8cf925c2')
SET IDENTITY_INSERT [dbo].[Korisnici] OFF
GO
SET IDENTITY_INSERT [dbo].[Pogodnosti] ON 

INSERT [dbo].[Pogodnosti] ([PogodnostId], [Naziv]) VALUES (1, N'Hrana')
INSERT [dbo].[Pogodnosti] ([PogodnostId], [Naziv]) VALUES (2, N'Smještaj')
INSERT [dbo].[Pogodnosti] ([PogodnostId], [Naziv]) VALUES (3, N'Edukacija')
INSERT [dbo].[Pogodnosti] ([PogodnostId], [Naziv]) VALUES (4, N'Bonus zarada')
INSERT [dbo].[Pogodnosti] ([PogodnostId], [Naziv]) VALUES (5, N'Prijevoz')
SET IDENTITY_INSERT [dbo].[Pogodnosti] OFF
GO
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 1)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 1)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 2)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 2)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 3)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 4)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 4)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 5)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 11)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 11)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 12)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 12)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 12)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 12)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 13)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 14)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 14)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 15)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 17)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 17)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 18)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 19)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 20)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (2, 20)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 20)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 21)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 22)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 24)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 25)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 25)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 26)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 27)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 28)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 28)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 30)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 31)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 31)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 32)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 34)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 34)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 35)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 35)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 36)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 36)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 37)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 37)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 38)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 39)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 40)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 40)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 40)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 41)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 42)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 42)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 43)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 44)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 44)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (2, 45)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 45)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (2, 46)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 46)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 47)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 48)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 48)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 49)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 49)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 50)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 50)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 51)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 51)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 51)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 52)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 52)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 53)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 53)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 54)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 54)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 55)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (5, 55)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (2, 56)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 56)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 56)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 57)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (4, 57)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (1, 58)
INSERT [dbo].[PogodnostPosao] ([PogodnostId], [PosloviPosaoId]) VALUES (3, 58)
GO
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (4, 1)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (18, 1)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (19, 1)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (20, 1)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (3, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (5, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (11, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (13, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (21, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (24, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (25, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (34, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (35, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (36, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (37, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (38, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (46, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (48, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (49, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (50, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (51, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (52, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (53, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (54, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (57, 2)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (2, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (14, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (15, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (16, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (17, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (22, 3)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (2, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (6, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (14, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (15, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (16, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (17, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (22, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (24, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (25, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (26, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (27, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (28, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (29, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (30, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (31, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (32, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (33, 4)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (12, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (14, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (15, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (16, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (17, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (22, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (25, 5)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (10, 6)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (13, 6)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (55, 6)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (6, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (12, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (14, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (15, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (16, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (17, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (21, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (31, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (32, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (33, 8)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (1, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (23, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (44, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (45, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (47, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (48, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (49, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (51, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (57, 9)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (55, 10)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (1, 11)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (9, 11)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (56, 11)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (57, 11)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (58, 11)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (2, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (34, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (35, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (36, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (37, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (38, 12)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (7, 13)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (9, 13)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (7, 14)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (8, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (23, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (44, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (45, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (46, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (47, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (50, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (51, 15)
GO
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (56, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (57, 15)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (39, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (40, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (41, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (42, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (43, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (53, 16)
INSERT [dbo].[PosaoVjestina] ([PosloviPosaoId], [VjestineVjestinaId]) VALUES (54, 16)
GO
SET IDENTITY_INSERT [dbo].[Poslodavci] ON 

INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (1, N'Financijska Agencija FAANG', N'Financijska agencija - Fina Ulica grada Vukovara 70 10000 Zagreb', N'85821130368 ', N'FAANG@gmail.com', N'0800 0080')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (2, N'Malka Zagreb', N'Koledovčina ul. 2, 10000, Zagreb', N'58353015102', N'malka@gmail.com', N'2481111')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (3, N'Rest restorani d.o.o.', N'Draganić, Mrzljaki-Stanica 120', N'26125432822', N'rest@gmail.com', N'051 659 460')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (4, N'GIPSOS d.o.o.', N'Šime Ljubića 37, Split', N'01710734686', N'gipsos@gmail.com', N'021 430 430')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (5, N'Trgovina Hrvatska k.d', N'Donje Svetice 14 10000 Zagreb', N'47432874968', N'trgovina@gmail.com', N'0800 223 223')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (6, N'Tl Hrvatska d.o.o.', N'Vrtni put 1 10000 Zagreb', N'29524210204', N'tlhrvatska@gmail.com', N'0800 091 091')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (7, N'Distrib CRO, d.o.o. Zagreb', N'Jankomir 31, 10090, Zagreb', N'38016445738', N'distribcro@gmail.com', N'042 632 632')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (8, N'Burger Restorani d.o.o.', N'Julija Knifera 3, 10020 Zagreb', N'37567261825', N'burger@gmail.com', N'01 2068 862')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (9, N'Benza d.o.o.', N'Zadarska ulica 80, Zagreb', N'77607495225', N'benza@gmail.com', N'091 464 1054')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (10, N'Drink distribution d.o.o.', N'Ulica grada Wirgesa 14, 10430 Samobor', N'24723122482', N'drinkdistribution@gmail.com', N'044 543 127')
INSERT [dbo].[Poslodavci] ([PoslodavacId], [Naziv], [Sjediste], [Oib], [Email], [Telefon]) VALUES (11, N'Admin Centar d.d', N'Sunčana 10, 31000 Osijek', N'39175745267', N'admincentar@gmail.com', N'053 195 182')
SET IDENTITY_INSERT [dbo].[Poslodavci] OFF
GO
SET IDENTITY_INSERT [dbo].[Poslovi] ON 

INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (1, N'Traži osoba za rad u razvojnom centru u Virovitici. Poželjno je da osoba prvo odradi praksu kod nas te se ujedno pri završetku iste i zaposli. Početak rada bi bio što prije pod dogovoru. Za ostale informacije naknadno se javite u centar.', CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'Trg kralja Tomislava 3, Virovitica', 1, CAST(30.00 AS Decimal(10, 2)), 3, 1, 1, N'Programer/Developer', 1)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (2, N'Unaprjeđivanje prodaje kroz direktan rad na prodajnim mjestima s ciljem poboljšanja prodajnih rezultata
Redovito posjećivanje svih prodajnih mjesta prema odobrenom ruting planu.
Postavljanje displaye i slaganje proizvoda u prodavaonicama kupca prema standardima programa te u skladu s ciljevima postavljenim za prodajni ciklus.
Distribucija POS materijala u skladu s ciljevima za prodajni ciklus.
Prijenos znanja o proizvodima na prodajno osoblje kupca s ciljem učinkovitije prodaje proizvoda.
Pridržavanje svih propisanih koraka prodajnog posjeta s ciljem postizanja što boljih rezultata.
Praćenje promjene u prodajnim mjestima na prodajnom području prema zaduženju i predlaganje ASM-u odgovarajućih mjera i/ili obavještavanje o nastalim promjenama.
Praćenje aktivnosti konkurencije i obavještavanje koordinatora o saznanjima.
Savjesno i odgovorno postupanje s vozilom, robom i službenom opremom prema zaduženju.
Predlaganje koordinatoru mjera za unapređenje prodaje u području prema zaduženju.', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'Rijeka', 4, CAST(50.00 AS Decimal(10, 2)), 1, 2, 1, N'Unapređivač prodaje za regiju Rijeka', 2)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (3, N'Priprema svih obroka prema standardima Rest. Briga o održavanju reda i čistoće u kuhinji. Briga o pravilnom i stalnom odvajanju otpada. Osiguravanje higijenskih i drugih ugostiteljskih standarda.', CAST(N'2022-11-12T00:00:00.0000000' AS DateTime2), N'Jasenice', 1, CAST(35.00 AS Decimal(10, 2)), 7, 3, 1, N'Pomoćni kuhar - Jasenice', 3)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (4, N'GIPSOS agencija za istraživanje tržišta i javnog mnijenja traži suradnike za honorarni posao TERENSKO ANKETIRANJE s područja Karlovačke županije.
Anketari dobiju zadanu adresu (ili više njih) ili zadani kvotni uzorak (dob i spol ispitanika) te obilaze kućanstva dok ne realiziraju potreban broj anketa.
Prijaviti se možete na link Ipsos Online Panel - JobApplication (ipsosadria.com), označite Anketiranje ispitanika licem u lice (u kućanstvima) i upišite ostale nužne podatke.', CAST(N'2023-06-04T00:00:00.0000000' AS DateTime2), N'Karlovac', 5, CAST(40.00 AS Decimal(10, 2)), 11, 4, 1, N'Terenski anketar', 4)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (5, N'Postani dio Trgovina tima, međunarodno uspješnog trgovačkog društva. Što nas čini tako posebnima? Učinkovitost, dinamičnost i pravednost. Predanost i upornost naših zaposlenika temelj su našeg uspjeha. Naše se poslovnice svakodnevno opskrbljuju, što našim kupcima garantira dostupnost raznolikih i svježih proizvoda iz širokog asortimana robe. Doprinesi svojim znanjem i predanošću u našem Logističko-distributivnom centru ili pokaži svoj talent u kontroliranju lanca protoka robe u sektoru Upravljanje lancem opskrbe.', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'Gospodarska ulica 2, Jastrebarsko', 1, CAST(35.00 AS Decimal(10, 2)), 12, 5, 1, N'Skladištar', 5)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (6, N'Kao dio međunarodno uspješnog trgovačkog društva, mi u Trgovina težimo jednom cilju: stvoriti najbolje moguće iskustvo kupovine za naše kupce. Što nas čini tako posebnima? Učinkovitost, dinamičnost i pravednost. Predanost i upornost naših zaposlenika temelj su našeg uspjeha. Pridruži se našem timu u poslovnici i doprinesi svojim talentom i predanošću našem glavnom poslovnom području Prodaja.', CAST(N'2022-06-10T00:00:00.0000000' AS DateTime2), N'Josipa Reihl-Kira 40, Osijek', 1, CAST(30.00 AS Decimal(10, 2)), 1, 5, NULL, N'Blagajnik', 6)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (7, N'Misliš da je teorija super, ali da u praksi leži pravo znanje? U pravu si! Kad već izgaraš od fakultetskog znanja, postani dio sljedeće pripravničke generacije Tl Start programa profesionalnog razvoja. Lansiraj vlastitu karijeru uz najmodernije platforme za učenje, iskusnog i predanog mentora te rad na stvarnim digitalnim projektima.', CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2), N'Vrtni put 1, Zagreb', 1, CAST(50.00 AS Decimal(10, 2)), 3, 6, 1, N'Tl Start program – Data Science & AI', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (8, N'Radit ćeš na Network Equipment Inventory Track & Trace projektu kojem je cilj optimizirati distribucijsku mrežu u tehnici te uvesti proces označavanja koji optimalno podržava operacije. Tvoji zadaci bit će analiza podataka kretanja trgovačkih i tehničkih materijala unutar Tl distributivne mreže, podrška projektnom timu u analizi podataka i pripremi podataka za potrebe projekta, koordinacija aktivnosti sudionika projekta te operativno provođenje logističkih procesa i podrška svim internim i eksternim korisnicima logističkih procesa.', CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2), N'Vrtni put 1, Zagreb', 2, CAST(50.00 AS Decimal(10, 2)), 2, 6, 1, N'Tl Start program - Business Analyst', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (9, N'Radit ćeš na developmentu za naše mobilne aplikacije, na OpenShift-u (PaaS). Postat ćeš stalni član agilnog tima koji koristi SCRUM metodologiju u razvojnom procesu. Tehnologije na kojima ćeš raditi su: Java, Kotin, NodeJS, Quarkus i Spring Boot.', CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2), N'Vrtni put 1, Zagreb', 2, CAST(55.00 AS Decimal(10, 2)), 3, 6, 1, N'Tl Start program - IT Development', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (10, N'Preuzimanje, komisioniranje i paletiziranje robe. Utovar i istovar robe. Osiguranje robe za siguran transport. Povrat robe i paleta dobavljaču. Provjera deklaracija, atesta, bar kodova i roka trajanja. Sudjelovanje u parcijalnim i godišnjim inventurama trgovačke robe na zalihi . Čišćenje i održavanje radnog prostora. Ostale poslove prema potrebi', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'Gospodarska 2, Sveta Nedelja', 5, CAST(30.00 AS Decimal(10, 2)), 12, 7, 1, N'Radnik na odjelu dostave', 8)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (11, N'Brine se o gostima da prime najbolju uslugu, da restoran bude čist, atmosfera u restoranu ugodna, hrana koju poslužujemo topla i svježa. Radnik će raditi na bazičnim poslovima što uključuje rad na blagajni, rad u kuhinji, rad na poslovima čišćenja kao i slaganje dostave.', CAST(N'2022-06-30T00:00:00.0000000' AS DateTime2), N'Ljubljanska avenija 2b, Zagreb', 3, CAST(35.00 AS Decimal(10, 2)), 7, 8, NULL, N'Radnik u restoranu', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (12, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta.
Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police.
Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja.
Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš.
Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
Svi ostali poslovi po nalogu nadređenog rukovoditelja.', CAST(N'2022-06-06T00:00:00.0000000' AS DateTime2), N'Žegoti 5/1, Kastav', 1, CAST(30.00 AS Decimal(10, 2)), 1, 9, NULL, N'Pomoćni skladišni radnik - student', 9)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (13, N'Utovar i istovar robe i ambalaže u skladištu.
Kontrola dokumentacije i utovarene/istovarene robe.', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2), N'Više lokacija', 50, CAST(30.00 AS Decimal(10, 2)), 5, 10, 1, N'Pomoćni radnik dostavljač- student', 10)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (14, N'Rad na blagajni. Dnevni obračun blagajne. Izlaganje artikala i punjenje polica
. Brigu o izgledu polica
. Propisno skladištenje robe
. Praćenje evidencije isteka rokova
. Održavanje čistoće i urednosti prodajnog mjesta', CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), N'Industrijska 2e, Pula', 5, CAST(35.00 AS Decimal(10, 2)), 1, 7, 1, N'Sezonski radnik u trgovini', 11)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (15, N'Rad na blagajni. Dnevni obračun blagajne. Izlaganje artikala i punjenje polica
. Brigu o izgledu polica
. Propisno skladištenje robe
. Praćenje evidencije isteka rokova
. Održavanje čistoće i urednosti prodajnog mjesta', CAST(N'2022-10-20T00:00:00.0000000' AS DateTime2), N'Bujanovo 10, 51219 Čavle, Rijeka', 5, CAST(35.00 AS Decimal(10, 2)), 1, 7, 1, N'Sezonski radnik u trgovini', 2)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (16, N'Rad na blagajni. Dnevni obračun blagajne. Izlaganje artikala i punjenje polica
. Brigu o izgledu polica
. Propisno skladištenje robe
. Praćenje evidencije isteka rokova
. Održavanje čistoće i urednosti prodajnog mjesta', CAST(N'2022-11-15T00:00:00.0000000' AS DateTime2), N'Murvica IK 2, Zadar', 4, CAST(35.00 AS Decimal(10, 2)), 1, 7, 1, N'Sezonski radnik u trgovini', 12)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (17, N'Rad na blagajni. Dnevni obračun blagajne. Izlaganje artikala i punjenje polica
. Brigu o izgledu polica
. Propisno skladištenje robe
. Praćenje evidencije isteka rokova
. Održavanje čistoće i urednosti prodajnog mjesta', CAST(N'2022-09-25T00:00:00.0000000' AS DateTime2), N'Cesta Pape Ivana Pavla II. 3, Kaštel Sućurac, Split', 6, CAST(35.00 AS Decimal(10, 2)), 1, 7, 1, N'Sezonski radnik u trgovini', 13)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (18, N'GIPSOS d.o.o. agencija za istraživanje tržišta i javnog mnijenja traži suradnike za honorarni posao TERENSKO ANKETIRANJE u Starigradu.
Anketari dobiju zadane ispitanike/adrese te obilaze kućanstva dok ne realiziraju potreban broj anketa. Anketiranje se vrši licem u lice, a ispitanici nisu unaprijed dogovoreni.
Prijaviti se možete na link Ipsos Online Panel - JobApplication (ipsosadria.com), označite Anketiranje ispitanika licem u lice (u kućanstvima) i upišite ostale nužne podatke.
Cijena ankete je 70 kn, a plaćanje se vrši prema broju realiziranih anketa.', CAST(N'2022-08-18T00:00:00.0000000' AS DateTime2), N'Starigrad', 1, CAST(70.00 AS Decimal(10, 2)), 11, 4, 1, N'Terenski anketar', 14)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (19, N'GIPSOS d.o.o. agencija za istraživanje tržišta i javnog mnijenja traži suradnike za honorarni posao TERENSKO ANKETIRANJE u Starigradu.
Anketari dobiju zadane ispitanike/adrese te obilaze kućanstva dok ne realiziraju potreban broj anketa. Anketiranje se vrši licem u lice, a ispitanici nisu unaprijed dogovoreni.
Prijaviti se možete na link Ipsos Online Panel - JobApplication (ipsosadria.com), označite Anketiranje ispitanika licem u lice (u kućanstvima) i upišite ostale nužne podatke.
Cijena ankete je 70 kn, a plaćanje se vrši prema broju realiziranih anketa.', CAST(N'2022-11-18T00:00:00.0000000' AS DateTime2), N'Biograd na Moru', 1, CAST(70.00 AS Decimal(10, 2)), 11, 4, 1, N'Terenski anketar', 15)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (20, N'GIPSOS d.o.o. agencija za istraživanje tržišta i javnog mnijenja traži suradnike za honorarni posao TERENSKO ANKETIRANJE u Starigradu.
Anketari dobiju zadane ispitanike/adrese te obilaze kućanstva dok ne realiziraju potreban broj anketa. Anketiranje se vrši licem u lice, a ispitanici nisu unaprijed dogovoreni.
Prijaviti se možete na link Ipsos Online Panel - JobApplication (ipsosadria.com), označite Anketiranje ispitanika licem u lice (u kućanstvima) i upišite ostale nužne podatke.
Cijena ankete je 70 kn, a plaćanje se vrši prema broju realiziranih anketa.', CAST(N'2022-12-18T00:00:00.0000000' AS DateTime2), N'Bibinje', 2, CAST(70.00 AS Decimal(10, 2)), 11, 4, 1, N'Terenski anketar', 16)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (21, N'Kao dio međunarodno uspješnog trgovačkog društva, mi u Trgovina težimo jednom cilju: stvoriti najbolje moguće iskustvo kupovine za naše kupce. Što nas čini tako posebnima? Učinkovitost, dinamičnost i pravednost. Predanost i upornost naših zaposlenika temelj su našeg uspjeha. Pridruži se našem timu u poslovnici i doprinesi svojim talentom i predanošću našem glavnom poslovnom području Prodaja.
Zaprimaj i pripremaj robu za prodaju
Osiguraj kontinuiranu dostupnost asortimana na odjelu
Radi na blagajni učinkovito i točno
Savjetuj naše kupce te im omogući ugodnu kupovinu
Brini o urednosti i čistoći prodajnog prostora te provedbi higijenskih pravila', CAST(N'2022-10-21T00:00:00.0000000' AS DateTime2), N'Priljevo 209, Vukovar', 1, CAST(30.00 AS Decimal(10, 2)), 1, 5, 1, N'Radnik u prodaji', 17)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (22, N'Postani dio Trgovina tima, međunarodno uspješnog trgovačkog društva. Što nas čini tako posebnima? Učinkovitost, dinamičnost i pravednost. Predanost i upornost naših zaposlenika temelj su našeg uspjeha. Naše se poslovnice svakodnevno opskrbljuju, što našim kupcima garantira dostupnost raznolikih i svježih proizvoda iz širokog asortimana robe. Doprinesi svojim znanjem i predanošću u našem Logističko-distributivnom centru ili pokaži svoj talent u kontroliranju lanca protoka robe u sektoru Upravljanje lancem opskrbe.', CAST(N'2022-09-14T00:00:00.0000000' AS DateTime2), N'Gospodarska ulica 2, Jastrebarsko, Jastrebarsko', 2, CAST(30.00 AS Decimal(10, 2)), 12, 5, 1, N'Student za sezonski rad u skladištu', 5)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (23, N'Misliš da je teorija super, ali da u praksi leži pravo znanje? U pravu si! Kad već izgaraš od fakultetskog znanja, postani dio sljedeće pripravničke generacije Tl Start programa profesionalnog razvoja. Lansiraj vlastitu karijeru uz najmodernije platforme za učenje, iskusnog i predanog mentora te rad na stvarnim digitalnim projektima.
U duši si mrežaš i tvoje studiranje išlo je u smjeru radio - komunikacija i mreža? Želiš raditi pedantno i dosljedno u osiguravanju kvalitete rada radio opreme baznih stanica, provoditi tehničku analizu uvođenja nove opreme, radio konfiguracija i tehnoloških noviteta te sudjelovati u izradi plana implementacije i koordinaciji uvođenja nove opreme u živu mrežu? Organizacija, planiranje, analitičnost i odgovornost tvoje su drugo ime?', CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), N'Vrtni put 1, Zagreb', 1, CAST(50.00 AS Decimal(10, 2)), 3, 6, 1, N'Tl Start program - Fiber & 5G', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (24, N'Izvorno HOME OF THE WHOPPER®, Burger Restorani® je u vlasništvu Restaurant Brands International Inc., jednoj od najvećih svjetskih tvrtki restorana brze prehrane.
Kroz sustav s više od 18.000 restorana u 100 zemalja svijeta gdje se poslužuje više
od 11 milijuna gostiju dnevno, dokazano potvrđujemo visoke standarde usluge kao i
kvalitetu naših proizvoda. Za potrebe novog restorana u Rijeci otvaramo nova radna mjesta, a svakom našem djelatniku osiguravamo mogućnost razvijanja unutar svjetski poznatog i renomiranog branda. U potrazi smo za predanim i uslužno orijentiranim djelatnicima koji dijele našu strast "za najbolji okus"!', CAST(N'2023-01-15T00:00:00.0000000' AS DateTime2), N'Rijeka', 1, CAST(100.00 AS Decimal(10, 2)), 2, 8, 1, N'Voditelj restorana', 2)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (25, N'Izvorno HOME OF THE WHOPPER®, Burger Restorani® je u vlasništvu Restaurant Brands International Inc., jednoj od najvećih svjetskih tvrtki restorana brze prehrane.
Kroz sustav s više od 18.000 restorana u 100 zemalja svijeta gdje se poslužuje više
od 11 milijuna gostiju dnevno, dokazano potvrđujemo visoke standarde usluge kao i
kvalitetu naših proizvoda. Za potrebe novog restorana u Rijeci otvaramo nova radna mjesta, a svakom našem djelatniku osiguravamo mogućnost razvijanja unutar svjetski poznatog i renomiranog branda. U potrazi smo za predanim i uslužno orijentiranim djelatnicima koji dijele našu strast "za najbolji okus"!', CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), N'Rijeka', 1, CAST(80.00 AS Decimal(10, 2)), 2, 8, 1, N'Voditelj smjene', 2)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (26, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta
Priprema, izlaganje u prodajnom prostoru, te prodaja i služenje hrane i napitaka iz ponude prodajnog mjesta sukladno određenim normativima i propisanom standardu
. Vođenje zakonskih evidencija vezanih uz HACCAP program te rukovanje s hranom i sastojcima u skladu sa zakonskim propisima
. Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police
. Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja
. Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš
. Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
. Svi ostali poslovi po nalogu nadređenog rukovoditelja', CAST(N'2022-10-05T00:00:00.0000000' AS DateTime2), N'Optujska 96, Varaždin', 2, CAST(35.00 AS Decimal(10, 2)), 1, 9, 1, N'Gastro prodavač', 18)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (27, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta
Priprema, izlaganje u prodajnom prostoru, te prodaja i služenje hrane i napitaka iz ponude prodajnog mjesta sukladno određenim normativima i propisanom standardu
. Vođenje zakonskih evidencija vezanih uz HACCAP program te rukovanje s hranom i sastojcima u skladu sa zakonskim propisima
. Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police
. Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja
. Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš
. Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
. Svi ostali poslovi po nalogu nadređenog rukovoditelja', CAST(N'2022-11-05T00:00:00.0000000' AS DateTime2), N'Križevačka cesta 31C, Koprivnica', 1, CAST(35.00 AS Decimal(10, 2)), 1, 9, 1, N'Gastro prodavač', 19)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (28, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta
Priprema, izlaganje u prodajnom prostoru, te prodaja i služenje hrane i napitaka iz ponude prodajnog mjesta sukladno određenim normativima i propisanom standardu
. Vođenje zakonskih evidencija vezanih uz HACCAP program te rukovanje s hranom i sastojcima u skladu sa zakonskim propisima
. Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police
. Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja
. Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš
. Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
. Svi ostali poslovi po nalogu nadređenog rukovoditelja', CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), N'Velike Sredice 155 a, Bjelovar', 3, CAST(35.00 AS Decimal(10, 2)), 1, 9, 1, N'Gastro prodavač', 20)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (29, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta
Priprema, izlaganje u prodajnom prostoru, te prodaja i služenje hrane i napitaka iz ponude prodajnog mjesta sukladno određenim normativima i propisanom standardu
. Vođenje zakonskih evidencija vezanih uz HACCAP program te rukovanje s hranom i sastojcima u skladu sa zakonskim propisima
. Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police
. Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja
. Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš
. Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
. Svi ostali poslovi po nalogu nadređenog rukovoditelja', CAST(N'2022-12-08T00:00:00.0000000' AS DateTime2), N'Baneki 18,Buzin, Novi Zagreb - istok', 1, CAST(35.00 AS Decimal(10, 2)), 1, 9, 1, N'Gastro prodavač', 21)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (30, N'Prodaja naftnih derivata i ostale robe iz asortimana prodajnog mjesta
Priprema, izlaganje u prodajnom prostoru, te prodaja i služenje hrane i napitaka iz ponude prodajnog mjesta sukladno određenim normativima i propisanom standardu
. Vođenje zakonskih evidencija vezanih uz HACCAP program te rukovanje s hranom i sastojcima u skladu sa zakonskim propisima
. Sudjelovanje kod preuzimanja robe, kontrola ispravnosti zaprimljene robe kako u pogledu količine, tako i u pogledu kvalitete, skladištenje robe odnosno slaganje iste na police
. Kontrola rokova trajanja proizvoda, te pravovremeno obavještavanje neposrednog rukovoditelja o artiklima kojima uskoro istječe rok trajanja
. Briga oko održavanja čistoće i higijenskih uvjeta na prodajnom mjestu, uključujući sanitarni čvor i okoliš
. Briga o zadovoljstvu kupaca i omogućavanje minimalnog broja pritužbi na rad PM.
. Svi ostali poslovi po nalogu nadređenog rukovoditelja', CAST(N'2022-12-20T00:00:00.0000000' AS DateTime2), N'Svetonedeljska 13A, Samobor', 1, CAST(35.00 AS Decimal(10, 2)), 1, 9, 1, N'Gastro prodavač', 22)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (31, N'Prodaja robe kupcima.
Rad na blagajni po potrebi.
Usluživanje i pomoć kupcima prilikom kupovine.
Slaganje polica.
Kontrola zaliha.
Čišćenje dućana.
Zaprimanje i slaganje ambalaže.', CAST(N'2023-01-09T00:00:00.0000000' AS DateTime2), N'Biševska 12, Osijek', 2, CAST(30.00 AS Decimal(10, 2)), 1, 10, 1, N'Studentski posao - prodavač', 6)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (32, N'Prodaja robe kupcima.
Rad na blagajni po potrebi.
Usluživanje i pomoć kupcima prilikom kupovine.
Slaganje polica.
Kontrola zaliha.
Čišćenje dućana.
Zaprimanje i slaganje ambalaže.', CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), N'Vukovarska 32, Zagreb', 1, CAST(30.00 AS Decimal(10, 2)), 1, 10, 1, N'Studentski posao - prodavač', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (33, N'Prodaja robe kupcima.
Rad na blagajni po potrebi.
Usluživanje i pomoć kupcima prilikom kupovine.
Slaganje polica.
Kontrola zaliha.
Čišćenje dućana.
Zaprimanje i slaganje ambalaže.', CAST(N'2023-02-05T00:00:00.0000000' AS DateTime2), N'Neretvanska 12, Dubrovnik', 1, CAST(40.00 AS Decimal(10, 2)), 1, 10, 1, N'Studentski posao - prodavač', 23)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (34, N'Rad u kompaniji renomiranih brendova, Svakodnevna komunikacija s velikim brojem kupaca, Upoznavati kupce s trenutnim akcijama i promocijama
davati kupcima savjete i predlagati im proizvode kako bi dobili potpunu sliku proizvoda po koji su došli, Voditi računa o pravilnoj izloženosti proizvoda u prodavaonici i skladištu, Voditi računa o pravovremenoj dopuni proizvoda u prodavaonici, Sudjelovati u prijemu, zaštiti i popisu robe
Raditi na blagajni, Uređivati prodajni prostor, Pratiti trendove', CAST(N'2023-02-10T00:00:00.0000000' AS DateTime2), N'Zagreb', 5, CAST(40.00 AS Decimal(10, 2)), 10, 4, 1, N'Promotor', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (35, N'Rad u kompaniji renomiranih brendova, Svakodnevna komunikacija s velikim brojem kupaca, Upoznavati kupce s trenutnim akcijama i promocijama
davati kupcima savjete i predlagati im proizvode kako bi dobili potpunu sliku proizvoda po koji su došli, Voditi računa o pravilnoj izloženosti proizvoda u prodavaonici i skladištu, Voditi računa o pravovremenoj dopuni proizvoda u prodavaonici, Sudjelovati u prijemu, zaštiti i popisu robe
Raditi na blagajni, Uređivati prodajni prostor, Pratiti trendove', CAST(N'2022-12-12T00:00:00.0000000' AS DateTime2), N'Pula', 2, CAST(40.00 AS Decimal(10, 2)), 10, 4, 1, N'Promotor', 11)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (36, N'Rad u kompaniji renomiranih brendova, Svakodnevna komunikacija s velikim brojem kupaca, Upoznavati kupce s trenutnim akcijama i promocijama
davati kupcima savjete i predlagati im proizvode kako bi dobili potpunu sliku proizvoda po koji su došli, Voditi računa o pravilnoj izloženosti proizvoda u prodavaonici i skladištu, Voditi računa o pravovremenoj dopuni proizvoda u prodavaonici, Sudjelovati u prijemu, zaštiti i popisu robe
Raditi na blagajni, Uređivati prodajni prostor, Pratiti trendove', CAST(N'2023-02-01T00:00:00.0000000' AS DateTime2), N'Split', 3, CAST(40.00 AS Decimal(10, 2)), 10, 4, 1, N'Promotor', 13)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (37, N'Rad u kompaniji renomiranih brendova, Svakodnevna komunikacija s velikim brojem kupaca, Upoznavati kupce s trenutnim akcijama i promocijama
davati kupcima savjete i predlagati im proizvode kako bi dobili potpunu sliku proizvoda po koji su došli, Voditi računa o pravilnoj izloženosti proizvoda u prodavaonici i skladištu, Voditi računa o pravovremenoj dopuni proizvoda u prodavaonici, Sudjelovati u prijemu, zaštiti i popisu robe
Raditi na blagajni, Uređivati prodajni prostor, Pratiti trendove', CAST(N'2022-12-23T00:00:00.0000000' AS DateTime2), N'Rijeka', 3, CAST(40.00 AS Decimal(10, 2)), 10, 4, 1, N'Promotor', 2)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (38, N'Rad u kompaniji renomiranih brendova, Svakodnevna komunikacija s velikim brojem kupaca, Upoznavati kupce s trenutnim akcijama i promocijama
davati kupcima savjete i predlagati im proizvode kako bi dobili potpunu sliku proizvoda po koji su došli, Voditi računa o pravilnoj izloženosti proizvoda u prodavaonici i skladištu, Voditi računa o pravovremenoj dopuni proizvoda u prodavaonici, Sudjelovati u prijemu, zaštiti i popisu robe
Raditi na blagajni, Uređivati prodajni prostor, Pratiti trendove', CAST(N'2023-04-10T00:00:00.0000000' AS DateTime2), N'Varaždin', 2, CAST(40.00 AS Decimal(10, 2)), 10, 4, 1, N'Promotor', 18)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (39, N'Utovar i istovar robe, Dostava robe do naših prodavaonica, Briga o preuzetoj robi i popratnoj dokumentaciji, Odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-06-06T00:00:00.0000000' AS DateTime2), N'Zagreb', 6, CAST(35.00 AS Decimal(10, 2)), 8, 10, 1, N'Vozač', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (40, N'Utovar i istovar robe, Dostava robe do naših prodavaonica, Briga o preuzetoj robi i popratnoj dokumentaciji, Odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-07-15T00:00:00.0000000' AS DateTime2), N'Osijek', 5, CAST(35.00 AS Decimal(10, 2)), 8, 10, 1, N'Vozač', 6)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (41, N'Utovar i istovar robe, Dostava robe do naših prodavaonica, Briga o preuzetoj robi i popratnoj dokumentaciji, Odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-05-03T00:00:00.0000000' AS DateTime2), N'Slavonski Brod', 3, CAST(35.00 AS Decimal(10, 2)), 8, 10, 1, N'Vozač', 24)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (42, N'Utovar i istovar robe, Dostava robe do naših prodavaonica, Briga o preuzetoj robi i popratnoj dokumentaciji, Odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-04-03T00:00:00.0000000' AS DateTime2), N'Sisak', 1, CAST(35.00 AS Decimal(10, 2)), 8, 10, 1, N'Vozač', 25)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (43, N'Utovar i istovar robe, Dostava robe do naših prodavaonica, Briga o preuzetoj robi i popratnoj dokumentaciji, Odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-01-05T00:00:00.0000000' AS DateTime2), N'Zadar', 10, CAST(35.00 AS Decimal(10, 2)), 8, 10, 1, N'Vozač', 12)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (44, N'Radi povećanog obujma posla tražimo grafičku dizajnericu/dizajnera s višegodišnjim iskustvom, VSS (Grafički fakultet, Studij dizajna), Izvrsno poznavanje Adobe grafičkih programa (Photoshop, Illustrator, Indesign…), Poznavanje rada na MAC računalima, Izražena kreativnost ,Izvrsno poznavanje pripreme za tisak, Odgovornost, brzina, pedantnost', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), N'Zagreb', 3, CAST(50.00 AS Decimal(10, 2)), 9, 1, 1, N'Grafički dizajner u FAANG-u', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (45, N'Radi povećanog obujma posla tražimo grafičku dizajnericu/dizajnera s višegodišnjim iskustvom, VSS (Grafički fakultet, Studij dizajna), Izvrsno poznavanje Adobe grafičkih programa (Photoshop, Illustrator, Indesign…), Poznavanje rada na MAC računalima, Izražena kreativnost ,Izvrsno poznavanje pripreme za tisak, Odgovornost, brzina, pedantnost', CAST(N'2022-12-20T00:00:00.0000000' AS DateTime2), N'Osijek', 1, CAST(50.00 AS Decimal(10, 2)), 9, 1, 1, N'Grafički dizajner u FAANG-u', 6)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (46, N'Radi povećanog obujma posla tražimo grafičku dizajnericu/dizajnera s višegodišnjim iskustvom, VSS (Grafički fakultet, Studij dizajna), Izvrsno poznavanje Adobe grafičkih programa (Photoshop, Illustrator, Indesign…), Poznavanje rada na MAC računalima, Izražena kreativnost ,Izvrsno poznavanje pripreme za tisak, Odgovornost, brzina, pedantnost', CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), N'Zagreb', 4, CAST(50.00 AS Decimal(10, 2)), 9, 6, 1, N'Grafički dizajner u Tl', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (47, N'Radi povećanog obujma posla tražimo grafičku dizajnericu/dizajnera s višegodišnjim iskustvom, VSS (Grafički fakultet, Studij dizajna), Izvrsno poznavanje Adobe grafičkih programa (Photoshop, Illustrator, Indesign…), Poznavanje rada na MAC računalima, Izražena kreativnost ,Izvrsno poznavanje pripreme za tisak, Odgovornost, brzina, pedantnost', CAST(N'2022-10-09T00:00:00.0000000' AS DateTime2), N'Virovitica', 1, CAST(50.00 AS Decimal(10, 2)), 9, 1, 1, N'Grafički dizajner u FAANG-u', 1)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (48, N'Radi povećanog obujma posla tražimo grafičku dizajnericu/dizajnera s višegodišnjim iskustvom, VSS (Grafički fakultet, Studij dizajna), Izvrsno poznavanje Adobe grafičkih programa (Photoshop, Illustrator, Indesign…), Poznavanje rada na MAC računalima, Izražena kreativnost ,Izvrsno poznavanje pripreme za tisak, Odgovornost, brzina, pedantnost', CAST(N'2023-10-12T00:00:00.0000000' AS DateTime2), N'Šibenik', 2, CAST(50.00 AS Decimal(10, 2)), 9, 6, 1, N'Grafički dizajner u Tl', 26)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (49, N'Rad u dinamičnom timu u Službi za podršku korisnicima gdje ćeš u ugodnoj i profesionalnoj atmosferi blisko surađivati s kolegama iz tima
Ugovor na određeno vrijeme preko agencije za privremeno zapošljavanje. Osobni mentor koji će te uvesti u posao u rekordnom roku i uz koje ćeš se osjećati kao da si oduvijek dio tima
dodatno veselje za posebne dane: božićnicu, uskrsnicu, regres, dar za dijete i još mnogo toga
plaćene edukacije i nagrade za dobre poslovne rezultate
benefiti koji olakšavaju svakodnevicu: plaćen prijevoz na posao i mogućnost rada od doma
društveno odgovorno okruženje u kojem kroz brojna sponzorstva pomažemo kulturnim, sportskim i humanitarnim akcijama, a za volontiranje dobivaš slobodan dan, drugačiju, poticajnu i afirmativnu korporativnu kulturu koja njeguje toleranciju i fleksibilnost i gleda prema naprijed
i još mnogo toga što ćemo vam rado ispričati na razgovoru za posao', CAST(N'2023-03-10T00:00:00.0000000' AS DateTime2), N'Meštarska 25', 2, CAST(40.00 AS Decimal(10, 2)), 2, 11, 1, N'Agent korisničke podrške', 7)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (50, N'Zbog povećanja obima poslovanja na području Republike Hrvatske tražimo:
Referent za rad u odjelu servisa ekonomske struke (m/ž) - 1 izvršitelj/ica.
Posao za traženo radno mjesto obuhvaća:
- obračun radnih naloga u odjelu servisa
- vođenje knjiga evidencija za servisere i montere
- uredska podrška serviserima na terenu kao i pomoć kolegama u odjelu servisa
- ostali srodni poslovi', CAST(N'2023-06-06T00:00:00.0000000' AS DateTime2), N'Kanalski put 13', 3, CAST(45.00 AS Decimal(10, 2)), 2, 11, 1, N'Referent u odjelu servisa', 6)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (51, N'Administrator za komercijalne poslove (m/ž) - 1 izvršitelj

Opis posla:
- zaprimanje upita telefonski i mailom
- izrada ponuda
- ostali administrativni poslovi', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2), N'Zadarska 40', 1, CAST(45.00 AS Decimal(10, 2)), 2, 11, 1, N'Administrator za komercijalne poslove', 19)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (52, N'Utovar i istovar robe
dostava robe do naših prodavaonica
briga o preuzetoj robi i popratnoj dokumentaciji
odgovornost za održavanje i urednost zaduženog vozila i radne opreme', CAST(N'2023-02-15T00:00:00.0000000' AS DateTime2), N'Istarska 2', 2, CAST(30.00 AS Decimal(10, 2)), 5, 7, 1, N'Vozač C kategorije', 25)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (53, N'Dostava plinskih boca fizičkim i pravnim osobama na području Zagreba, očekujemo:
- komunikativnost i pristojno ponašanje prema kupcima
- snalaženje u prostoru i vremenu na terenu
- odgovoran pristup prema vozilu
- organiziranost u provedbi radnih zadataka
- spremnost na timski rad', CAST(N'2023-11-11T00:00:00.0000000' AS DateTime2), N'Stari put 15', 4, CAST(35.00 AS Decimal(10, 2)), 5, 7, 1, N'Dostavljač plinskih boca', 22)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (54, N'Skupljanje otpadnog ulja od restorana na području Zagreba, očekujemo:
- komunikativnost i pristojno ponašanje prema kupcima
- snalaženje u prostoru i vremenu na terenu
- odgovoran pristup prema vozilu
- organiziranost u provedbi radnih zadataka
- spremnost na timski rad', CAST(N'2023-05-08T00:00:00.0000000' AS DateTime2), N'Gorjanska 110', 2, CAST(35.00 AS Decimal(10, 2)), 5, 10, 1, N'Dostavljač otpadnog ulja', 17)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (55, N'- utovar, istovar robe
- prijevoz robe do kupaca
- rad u skladištu
- obrada dokumenata
- briga o vozilu', CAST(N'2022-11-14T00:00:00.0000000' AS DateTime2), N'Miškinova 4', 1, CAST(35.00 AS Decimal(10, 2)), 5, 10, 1, N'Dostavljač', 13)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (56, N'- obrada metala koristeći CNC strojeve (tokarilice i glodalice) prema zadanim nacrtima
- posluživanje i programiranje, puštanje u rad te korekcija programa
- mijenjanje alata
- osnovno održavanje strojeva
- kontrola kvalitete
- pridržavanje smjernica zaštite na radu
- kontinuirani treninzi', CAST(N'2023-09-08T00:00:00.0000000' AS DateTime2), N'Trg Slobode 40', 3, CAST(50.00 AS Decimal(10, 2)), 3, 2, 1, N'CNC operater/programer', 4)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (57, N'Projektiranje, inženjering, programiranje (PC, PLC, procesna računala), ispitivanje i puštanje u rad sustava automatizacije i procesnog upravljanja.', CAST(N'2023-04-15T00:00:00.0000000' AS DateTime2), N'Ulica Tina Ujevića 50', 2, CAST(50.00 AS Decimal(10, 2)), 3, 1, 1, N'Programer sustava automatizacije i upravljanja', 11)
INSERT [dbo].[Poslovi] ([PosaoId], [Opis], [DatumAktivnosti], [Lokacija], [BrojRadnika], [Satnica], [KategorijaId], [PoslodavacId], [Aktivan], [Naziv], [GradId]) VALUES (58, N'Komunikacija i suradnja s nositeljima projekata, razvijanje i implementacija algoritma prema zadanim zahtjevima i potrebama
Rad u SQL bazama podataka, rukovanje izvornim kodom i praćenje nesukladnosti u cilju njihova rješavanja
Sudjelovanje u PropCalc obukama
Sagledavanje cjelokupne slike u cilju predviđanja budućih potreba i zahtjeva korisnika', CAST(N'2023-07-07T00:00:00.0000000' AS DateTime2), N'Vesela ulica 19', 4, CAST(55.00 AS Decimal(10, 2)), 3, 4, 1, N'Programer (m/ž)', 12)
SET IDENTITY_INSERT [dbo].[Poslovi] OFF
GO
SET IDENTITY_INSERT [dbo].[PrivatniPodaci] ON 

INSERT [dbo].[PrivatniPodaci] ([Id], [Lozinka]) VALUES (1, N'8ttTCFv5')
SET IDENTITY_INSERT [dbo].[PrivatniPodaci] OFF
GO
SET IDENTITY_INSERT [dbo].[Vjestine] ON 

INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (1, N'Ispitivanje/anketiranje')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (2, N'Profesionalnost i odgovornost')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (3, N'Punjenje polica')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (4, N'Prodaja')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (5, N'Fiskalna blagajna')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (6, N'Skladištar')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (7, N'Komisioner')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (8, N'Blagajnik')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (9, N'Razumijevanje procesa')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (10, N'Izražene organizacijske sposobnosti')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (11, N'Poznavanje programskih jezika')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (12, N'Komercijalist')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (13, N'Sql')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (14, N'Python')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (15, N'Analiza podataka')
INSERT [dbo].[Vjestine] ([VjestinaId], [Naziv]) VALUES (16, N'Vozačka dozvola (B)')
SET IDENTITY_INSERT [dbo].[Vjestine] OFF
GO
/****** Object:  Index [IX_Favoriti_KorisnikId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_Favoriti_KorisnikId] ON [dbo].[Favoriti]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Favoriti_PosaoId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_Favoriti_PosaoId] ON [dbo].[Favoriti]
(
	[PosaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PogodnostPosao_PosloviPosaoId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_PogodnostPosao_PosloviPosaoId] ON [dbo].[PogodnostPosao]
(
	[PosloviPosaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PosaoVjestina_VjestineVjestinaId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_PosaoVjestina_VjestineVjestinaId] ON [dbo].[PosaoVjestina]
(
	[VjestineVjestinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Poslovi_GradId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_Poslovi_GradId] ON [dbo].[Poslovi]
(
	[GradId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Poslovi_KategorijaId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_Poslovi_KategorijaId] ON [dbo].[Poslovi]
(
	[KategorijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Poslovi_PoslodavacId]    Script Date: 8.12.2022. 19:21:39 ******/
CREATE NONCLUSTERED INDEX [IX_Poslovi_PoslodavacId] ON [dbo].[Poslovi]
(
	[PoslodavacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favoriti] ADD  DEFAULT ((0)) FOR [KorisnikId]
GO
ALTER TABLE [dbo].[Korisnici] ADD  DEFAULT (N'') FOR [Sub]
GO
ALTER TABLE [dbo].[Poslodavci] ADD  DEFAULT (N'') FOR [Oib]
GO
ALTER TABLE [dbo].[Poslodavci] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Poslodavci] ADD  DEFAULT (N'') FOR [Telefon]
GO
ALTER TABLE [dbo].[Poslovi] ADD  DEFAULT (N'') FOR [Naziv]
GO
ALTER TABLE [dbo].[Poslovi] ADD  DEFAULT ((0)) FOR [GradId]
GO
ALTER TABLE [dbo].[Favoriti]  WITH CHECK ADD  CONSTRAINT [FK_Favoriti_Korisnici_KorisnikId] FOREIGN KEY([KorisnikId])
REFERENCES [dbo].[Korisnici] ([KorisnikId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoriti] CHECK CONSTRAINT [FK_Favoriti_Korisnici_KorisnikId]
GO
ALTER TABLE [dbo].[Favoriti]  WITH CHECK ADD  CONSTRAINT [FK_Favoriti_Poslovi_PosaoId] FOREIGN KEY([PosaoId])
REFERENCES [dbo].[Poslovi] ([PosaoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoriti] CHECK CONSTRAINT [FK_Favoriti_Poslovi_PosaoId]
GO
ALTER TABLE [dbo].[PogodnostPosao]  WITH CHECK ADD  CONSTRAINT [FK_PogodnostPosao_Pogodnosti_PogodnostId] FOREIGN KEY([PogodnostId])
REFERENCES [dbo].[Pogodnosti] ([PogodnostId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PogodnostPosao] CHECK CONSTRAINT [FK_PogodnostPosao_Pogodnosti_PogodnostId]
GO
ALTER TABLE [dbo].[PogodnostPosao]  WITH CHECK ADD  CONSTRAINT [FK_PogodnostPosao_Poslovi_PosloviPosaoId] FOREIGN KEY([PosloviPosaoId])
REFERENCES [dbo].[Poslovi] ([PosaoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PogodnostPosao] CHECK CONSTRAINT [FK_PogodnostPosao_Poslovi_PosloviPosaoId]
GO
ALTER TABLE [dbo].[PosaoVjestina]  WITH CHECK ADD  CONSTRAINT [FK_PosaoVjestina_Poslovi_PosloviPosaoId] FOREIGN KEY([PosloviPosaoId])
REFERENCES [dbo].[Poslovi] ([PosaoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PosaoVjestina] CHECK CONSTRAINT [FK_PosaoVjestina_Poslovi_PosloviPosaoId]
GO
ALTER TABLE [dbo].[PosaoVjestina]  WITH CHECK ADD  CONSTRAINT [FK_PosaoVjestina_Vjestine_VjestineVjestinaId] FOREIGN KEY([VjestineVjestinaId])
REFERENCES [dbo].[Vjestine] ([VjestinaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PosaoVjestina] CHECK CONSTRAINT [FK_PosaoVjestina_Vjestine_VjestineVjestinaId]
GO
ALTER TABLE [dbo].[Poslovi]  WITH CHECK ADD  CONSTRAINT [FK_Poslovi_Gradovi_GradId] FOREIGN KEY([GradId])
REFERENCES [dbo].[Gradovi] ([GradId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poslovi] CHECK CONSTRAINT [FK_Poslovi_Gradovi_GradId]
GO
ALTER TABLE [dbo].[Poslovi]  WITH CHECK ADD  CONSTRAINT [FK_Poslovi_Kategorije_KategorijaId] FOREIGN KEY([KategorijaId])
REFERENCES [dbo].[Kategorije] ([KategorijaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poslovi] CHECK CONSTRAINT [FK_Poslovi_Kategorije_KategorijaId]
GO
ALTER TABLE [dbo].[Poslovi]  WITH CHECK ADD  CONSTRAINT [FK_Poslovi_Poslodavci_PoslodavacId] FOREIGN KEY([PoslodavacId])
REFERENCES [dbo].[Poslodavci] ([PoslodavacId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poslovi] CHECK CONSTRAINT [FK_Poslovi_Poslodavci_PoslodavacId]
GO
USE [master]
GO
ALTER DATABASE [VUVZaposliSe] SET  READ_WRITE 
GO
