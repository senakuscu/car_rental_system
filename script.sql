USE [master]
GO
/****** Object:  Database [CarRentalDB]    Script Date: 1/4/2022 5:57:25 PM ******/
CREATE DATABASE [CarRentalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarRentalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CarRentalDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarRentalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CarRentalDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarRentalDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRentalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRentalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRentalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRentalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRentalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRentalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRentalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRentalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRentalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRentalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRentalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRentalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRentalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRentalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRentalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRentalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRentalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarRentalDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarRentalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRentalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRentalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRentalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRentalDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarRentalDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarRentalDB] SET QUERY_STORE = OFF
GO
USE [CarRentalDB]
GO
/****** Object:  Table [dbo].[carreg]    Script Date: 1/4/2022 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carreg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carno] [varchar](50) NULL,
	[make] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[available] [varchar](50) NULL,
 CONSTRAINT [PK_carreg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/4/2022 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[custname] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[mobile] [int] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentail]    Script Date: 1/4/2022 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carid] [nvarchar](50) NULL,
	[custid] [int] NULL,
	[fee] [int] NULL,
	[sdate] [date] NULL,
	[edate] [date] NULL,
 CONSTRAINT [PK_rentail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[returncar]    Script Date: 1/4/2022 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returncar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carno] [varchar](50) NULL,
	[custid] [int] NULL,
	[date] [date] NULL,
	[elsp] [int] NULL,
	[fine] [int] NULL,
 CONSTRAINT [PK_returncar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/4/2022 5:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[carreg] ON 

INSERT [dbo].[carreg] ([id], [carno], [make], [model], [available]) VALUES (1, N'A002', N'honda', N'swift', N'no')
INSERT [dbo].[carreg] ([id], [carno], [make], [model], [available]) VALUES (3, N'A003', N'mercedes', N'airbag', N'no')
INSERT [dbo].[carreg] ([id], [carno], [make], [model], [available]) VALUES (4, N'A001', N'volkswagen', N'golf', N'yes')
INSERT [dbo].[carreg] ([id], [carno], [make], [model], [available]) VALUES (5, N'A004', N'honda', N'sedan', N'yes')
INSERT [dbo].[carreg] ([id], [carno], [make], [model], [available]) VALUES (6, N'A005', N'volswagen', N'polo', N'yes')
SET IDENTITY_INSERT [dbo].[carreg] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [custname], [address], [mobile]) VALUES (1, N'Sena', N'Izmir', 537000000)
INSERT [dbo].[customer] ([id], [custname], [address], [mobile]) VALUES (2, N'Ayse', N'Narlidere', 53300000)
INSERT [dbo].[customer] ([id], [custname], [address], [mobile]) VALUES (3, N'Elif', N'Ankara', 566777838)
INSERT [dbo].[customer] ([id], [custname], [address], [mobile]) VALUES (4, N'Esra', N'Karabaglar', 839489385)
INSERT [dbo].[customer] ([id], [custname], [address], [mobile]) VALUES (5, N'Ayla', N'Cesme', 293020493)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[rentail] ON 

INSERT [dbo].[rentail] ([id], [carid], [custid], [fee], [sdate], [edate]) VALUES (1, N'A002', 1, 120000, CAST(N'2021-12-29' AS Date), CAST(N'2021-12-31' AS Date))
INSERT [dbo].[rentail] ([id], [carid], [custid], [fee], [sdate], [edate]) VALUES (3, N'A003', 3, 160000, CAST(N'2022-01-06' AS Date), CAST(N'2022-01-08' AS Date))
SET IDENTITY_INSERT [dbo].[rentail] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password]) VALUES (1, N'Sena', N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [CarRentalDB] SET  READ_WRITE 
GO
