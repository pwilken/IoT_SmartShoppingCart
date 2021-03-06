/* Create SmartCart Database*/
USE [master]
GO
/****** Object:  Database [SmartCart]    Script Date: 1/21/2018 3:21:07 PM ******/
CREATE DATABASE [SmartCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartCart', FILENAME = N'/var/opt/mssql/data/SmartCart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartCart_log', FILENAME = N'/var/opt/mssql/data/SmartCart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SmartCart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartCart] SET RECOVERY FULL 
GO
ALTER DATABASE [SmartCart] SET  MULTI_USER 
GO
ALTER DATABASE [SmartCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartCart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartCart] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartCart', N'ON'
GO
ALTER DATABASE [SmartCart] SET QUERY_STORE = OFF
GO
USE [SmartCart]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE [SmartCart] SET  READ_WRITE 
GO

/* Create Tables in SmartCart Database*/
USE [SmartCart]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/21/2018 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] NOT NULL,
	[BrandName] [nvarchar](max) NOT NULL,
	[LocationId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 1/21/2018 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 1/21/2018 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 1/21/2018 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] NOT NULL,
	[CountryCode] [nvarchar](2) NOT NULL,
	[AddressLine] [nvarchar](max) NOT NULL,
	[HouseNumber] [nvarchar](8) NOT NULL,
	[PostCode] [int] NOT NULL,
	[Region] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/21/2018 3:09:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Weight] [float] NOT NULL,
	[ContentWeight] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO 
INSERT [dbo].[Brand] ([Id], [BrandName], [LocationId], [CompanyId]) VALUES (1, N'Dornseifer', 1, 1)
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (1, N'Rewe')
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (1, 1, 1, 100, 1.25)
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (2, 1, 2, 23, 12.99)
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (3, 1, 3, 4, 1.8)
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (4, 1, 4, 2, 1.09)
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (5, 1, 5, 2500, 7.39)
INSERT [dbo].[Inventory] ([Id], [BrandId], [ProductId], [Count], [Price]) VALUES (6, 1, 6, 30, 1)
INSERT [dbo].[Location] ([Id], [CountryCode], [AddressLine], [HouseNumber], [PostCode], [Region]) VALUES (1, N'DE', N'Steinmüllerallee', N'5', 51643, N'NRW')
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (1, N'Becks Gold', 550, 500)
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (2, N'Captain Morgan Rum', 800, 700)
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (3, N'Hummus Pikant', 275, 250)
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (4, N'Fladenbrot', 525, 500)
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (5, N'Erdnüsse Bio Natur', 1100, 1000)
INSERT [dbo].[Products] ([Id], [ProductName], [Weight], [ContentWeight]) VALUES (6, N'Apollinaris Wasser Naturell', 600, 500)
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Company]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Location]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Brand]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Products]
GO
