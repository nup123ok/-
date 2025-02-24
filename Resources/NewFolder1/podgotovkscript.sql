USE [master]
GO
/****** Object:  Database [КЭ_ПоповаД]    Script Date: 15.05.2024 11:39:08 ******/
CREATE DATABASE [КЭ_ПоповаД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'КЭ_ПоповаД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\КЭ_ПоповаД.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'КЭ_ПоповаД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\КЭ_ПоповаД_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [КЭ_ПоповаД] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [КЭ_ПоповаД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [КЭ_ПоповаД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET ARITHABORT OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [КЭ_ПоповаД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [КЭ_ПоповаД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET  DISABLE_BROKER 
GO
ALTER DATABASE [КЭ_ПоповаД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [КЭ_ПоповаД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [КЭ_ПоповаД] SET  MULTI_USER 
GO
ALTER DATABASE [КЭ_ПоповаД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [КЭ_ПоповаД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [КЭ_ПоповаД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [КЭ_ПоповаД] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [КЭ_ПоповаД] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'КЭ_ПоповаД', N'ON'
GO
ALTER DATABASE [КЭ_ПоповаД] SET QUERY_STORE = OFF
GO
USE [КЭ_ПоповаД]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.05.2024 11:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Гранулы белый ', 7, N'л', 76, 8, NULL, CAST(47680.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Нить серый 1x0', 1, N'м', 978, 42, NULL, CAST(27456.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Нить белый 1x3', 8, N'м', 406, 27, NULL, CAST(2191.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Нить цветной 1x1', 3, N'г', 424, 10, NULL, CAST(8619.00 AS Decimal(10, 2)), N'\materials\image_5.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Нить цветной 2x0', 2, N'м', 395, 26, NULL, CAST(16856.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Краска синий 2x2', 6, N'л', 334, 48, NULL, CAST(403.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Нить синий 0x2', 9, N'м', 654, 10, NULL, CAST(7490.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Гранулы серый 2x2', 7, N'л', 648, 17, NULL, CAST(15478.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Краска синий 1x2', 2, N'л', 640, 50, NULL, CAST(44490.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Нить зеленый 2x0', 5, N'м', 535, 45, NULL, CAST(28301.00 AS Decimal(10, 2)), N'\materials\693032.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Гранулы синий 1x2', 3, N'кг', 680, 6, NULL, CAST(9242.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Нить синий 3x2', 1, N'м', 529, 13, NULL, CAST(10878.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Краска белый 2x2', 1, N'л', 659, 35, NULL, CAST(29906.00 AS Decimal(10, 2)), N'\materials\693086.jpg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Краска зеленый 0x3', 2, N'л', 50, 48, NULL, CAST(24073.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Нить зеленый 2x3', 7, N'г', 649, 25, NULL, CAST(20057.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Краска белый 2x1', 2, N'л', 790, 8, NULL, CAST(3353.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Нить серый 2x3', 1, N'г', 431, 40, NULL, CAST(22452.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Гранулы серый 3x2', 5, N'л', 96, 9, NULL, CAST(29943.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Краска серый 3x2', 3, N'л', 806, 50, NULL, CAST(55064.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Гранулы белый 0x3', 3, N'кг', 538, 11, NULL, CAST(7183.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Краска цветной 1x1', 3, N'л', 784, 22, NULL, CAST(43466.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Гранулы белый 1x0', 3, N'кг', 980, 41, NULL, CAST(27718.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Краска серый 0x2', 3, N'кг', 679, 36, NULL, CAST(33227.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Гранулы серый 3x3', 5, N'л', 2, 38, NULL, CAST(15170.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Краска серый 3x0', 7, N'кг', 341, 38, NULL, CAST(19352.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Гранулы синий 2x1', 9, N'л', 273, 17, NULL, CAST(231.00 AS Decimal(10, 2)), N'\materials\image_2.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Гранулы синий 0x2', 9, N'л', 576, 36, NULL, CAST(41646.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Нить цветной 1x0', 5, N'г', 91, 38, NULL, CAST(24948.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Краска зеленый 2x2', 2, N'кг', 752, 36, NULL, CAST(19014.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Краска цветной 1x3', 9, N'кг', 730, 5, NULL, CAST(268.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Краска серый 2x0', 2, N'л', 131, 22, NULL, CAST(35256.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Нить зеленый 2x1', 6, N'м', 802, 16, NULL, CAST(34556.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Краска цветной 0x3', 10, N'л', 324, 9, NULL, CAST(3322.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Нить белый 2x3', 3, N'г', 283, 41, NULL, CAST(10823.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Гранулы синий 3x0', 1, N'кг', 411, 8, NULL, CAST(16665.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Гранулы синий 1x3', 8, N'л', 41, 30, NULL, CAST(5668.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Нить цветной 2x1', 3, N'м', 150, 22, NULL, CAST(7615.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Гранулы серый 3x0', 4, N'л', 0, 5, NULL, CAST(702.00 AS Decimal(10, 2)), N'\materials\image_7.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Краска синий 3x0', 7, N'л', 523, 42, NULL, CAST(38644.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Нить зеленый 0x0', 8, N'м', 288, 43, NULL, CAST(41827.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Гранулы белый 1x2', 4, N'л', 77, 46, NULL, CAST(8129.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Краска белый 3x0', 5, N'кг', 609, 48, NULL, CAST(51471.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Краска цветной 0x1', 6, N'л', 43, 8, NULL, CAST(54401.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Нить серый 1x1', 5, N'м', 372, 22, NULL, CAST(14474.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Краска синий 2x1', 9, N'л', 642, 29, NULL, CAST(46848.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Нить серый 3x0', 1, N'м', 409, 19, NULL, CAST(29503.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Краска зеленый 3x3', 6, N'л', 601, 32, NULL, CAST(27710.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Краска синий 2x0', 7, N'л', 135, 50, NULL, CAST(40074.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Гранулы синий 2x3', 2, N'л', 749, 45, NULL, CAST(53482.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Нить синий 0x3', 8, N'м', 615, 22, NULL, CAST(32087.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (51, N'Нить синий 3x3', 7, N'г', 140, 12, NULL, CAST(45774.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (52, N'Краска зеленый 2x3', 2, N'л', 485, 8, NULL, CAST(44978.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (53, N'Нить синий 3x0', 10, N'м', 67, 23, NULL, CAST(44407.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (54, N'Гранулы серый 2x1', 7, N'кг', 779, 44, NULL, CAST(50339.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (55, N'Краска зеленый 0x1', 2, N'л', 869, 7, NULL, CAST(30581.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (56, N'Краска синий 0x0', 8, N'кг', 796, 29, NULL, CAST(18656.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (57, N'Краска серый 2x1', 5, N'л', 706, 45, NULL, CAST(46579.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (58, N'Нить белый 0x1', 10, N'м', 101, 43, NULL, CAST(36883.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (59, N'Гранулы зеленый 1x2', 9, N'л', 575, 15, NULL, CAST(45083.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (60, N'Краска серый 0x1', 2, N'л', 768, 27, NULL, CAST(35063.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (61, N'Гранулы цветной 0x1', 3, N'л', 746, 50, NULL, CAST(24488.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (62, N'Гранулы белый 3x1', 8, N'л', 995, 27, NULL, CAST(43711.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (63, N'Нить зеленый 0x2', 2, N'м', 578, 20, NULL, CAST(17429.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (64, N'Гранулы зеленый 0x2', 4, N'л', 206, 34, NULL, CAST(38217.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (65, N'Краска цветной 1x2', 10, N'л', 299, 50, NULL, CAST(47701.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (66, N'Краска зеленый 1x0', 8, N'кг', 626, 17, NULL, CAST(52189.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (67, N'Гранулы серый 0x0', 5, N'л', 608, 12, NULL, CAST(16715.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (68, N'Гранулы синий 0x3', 5, N'кг', 953, 48, NULL, CAST(45134.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (69, N'Краска цветной 2x1', 1, N'л', 325, 45, NULL, CAST(1846.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (70, N'Нить синий 2x3', 5, N'м', 10, 21, NULL, CAST(43659.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (71, N'Нить синий 2x1', 9, N'г', 948, 13, NULL, CAST(12283.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (72, N'Гранулы белый 1x1', 4, N'л', 93, 11, NULL, CAST(6557.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (73, N'Краска синий 1x3', 6, N'кг', 265, 17, NULL, CAST(38230.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (74, N'Краска зеленый 3x0', 2, N'л', 261, 7, NULL, CAST(20226.00 AS Decimal(10, 2)), N'\materials\image_1.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (75, N'Нить зеленый 1x0', 9, N'г', 304, 43, NULL, CAST(8105.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (76, N'Краска цветной 0x2', 7, N'л', 595, 38, NULL, CAST(2600.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (77, N'Нить синий 3x1', 7, N'м', 579, 48, NULL, CAST(4920.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (78, N'Краска зеленый 0x2', 9, N'л', 139, 23, NULL, CAST(39809.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (79, N'Краска синий 3x3', 6, N'кг', 740, 24, NULL, CAST(46545.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (80, N'Краска зеленый 1x1', 2, N'кг', 103, 34, NULL, CAST(40583.00 AS Decimal(10, 2)), N'\materials\image_6.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (81, N'Краска цветной 2x3', 9, N'л', 443, 46, NULL, CAST(46502.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (82, N'Нить цветной 3x0', 1, N'м', 989, 14, NULL, CAST(53651.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (83, N'Гранулы серый 2x3', 6, N'л', 467, 28, NULL, CAST(47757.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (84, N'Краска белый 1x0', 6, N'л', 95, 6, NULL, CAST(3543.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (85, N'Гранулы серый 3x1', 10, N'кг', 762, 6, NULL, CAST(10899.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (86, N'Гранулы серый 2x0', 3, N'кг', 312, 21, NULL, CAST(8939.00 AS Decimal(10, 2)), N'\materials\image_8.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (87, N'Нить белый 0x2', 4, N'г', 43, 19, NULL, CAST(29271.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (88, N'Гранулы зеленый 1x1', 4, N'л', 10, 19, NULL, CAST(46455.00 AS Decimal(10, 2)), N'\materials\image_4.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (89, N'Нить серый 0x2', 3, N'м', 504, 10, NULL, CAST(45744.00 AS Decimal(10, 2)), N'\materials\image_9.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (90, N'Гранулы белый 0x2', 2, N'л', 581, 40, NULL, CAST(9330.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (91, N'Нить цветной 3x2', 3, N'м', 831, 46, NULL, CAST(2939.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (92, N'Гранулы белый 3x0', 6, N'л', 208, 7, NULL, CAST(50217.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (93, N'Нить серый 1x2', 1, N'м', 292, 30, NULL, CAST(30198.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (94, N'Краска белый 0x1', 7, N'л', 423, 47, NULL, CAST(19777.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (95, N'Гранулы цветной 0x3', 7, N'кг', 723, 44, NULL, CAST(1209.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (96, N'Нить серый 1x3', 1, N'г', 489, 25, NULL, CAST(32002.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (97, N'Гранулы белый 2x3', 4, N'л', 274, 8, NULL, CAST(32446.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (98, N'Краска зеленый 3x1', 10, N'л', 657, 19, NULL, CAST(32487.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (99, N'Гранулы цветной 3x2', 1, N'л', 32, 45, NULL, CAST(28596.00 AS Decimal(10, 2)), NULL, 1)
GO
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (100, N'Нить белый 2x0', 2, N'м', 623, 23, NULL, CAST(46684.00 AS Decimal(10, 2)), NULL, 2)
SET IDENTITY_INSERT [dbo].[Material] OFF
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 9)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 17)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (3, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (4, 18)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 34)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 13)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (6, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 24)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 34)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (13, 10)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (13, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (13, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (15, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (15, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (20, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (21, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (21, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (21, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (24, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (24, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (25, 36)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (26, 18)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 9)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (36, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (36, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (37, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (37, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (40, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (40, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (40, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (42, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (52, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (54, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (54, 15)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (57, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (58, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (58, 39)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (61, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 10)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 18)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (64, 44)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (65, 14)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (67, 3)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (67, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (67, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (69, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (69, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (69, 34)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (69, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (69, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 39)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 28)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 28)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (76, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (76, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (77, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (80, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (80, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (85, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (85, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (85, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (85, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (88, 10)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (88, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 44)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (93, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (96, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (96, 13)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (99, 41)
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Гранулы', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Краски', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Нитки', NULL)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (1, N'ГаражТелекомГор', N'1718185951', CAST(N'2011-12-20' AS Date), 36, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (2, N'Компания Омск', N'1878504395', CAST(N'2012-09-13' AS Date), 2, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (3, N'ГорМонтаж', N'1564667734', CAST(N'2016-12-23' AS Date), 79, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (4, N'Микро', N'2293562756', CAST(N'2019-05-27' AS Date), 64, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (5, N'Электро', N'1755853973', CAST(N'2015-06-16' AS Date), 14, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (6, N'Компания Мотор', N'1429908355', CAST(N'2010-12-27' AS Date), 50, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (7, N'Асбоцем', N'1944834477', CAST(N'2011-04-10' AS Date), 20, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (8, N'ВостокМети', N'1488487851', CAST(N'2012-03-13' AS Date), 58, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (9, N'МясКрепТеле', N'2152486844', CAST(N'2018-11-11' AS Date), 59, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (10, N'Софт', N'1036521658', CAST(N'2011-11-23' AS Date), 67, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (11, N'Компания СервисМикроО', N'1178826599', CAST(N'2012-07-07' AS Date), 5, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (12, N'ИнфоГазМотор', N'1954050214', CAST(N'2011-07-23' AS Date), 42, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (13, N'Монтаж', N'1163880101', CAST(N'2016-05-23' AS Date), 10, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (14, N'ЭлектроЦвет', N'1654184411', CAST(N'2015-06-25' AS Date), 3, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (15, N'Компания НефтьITИнф', N'1685247455', CAST(N'2017-03-09' AS Date), 85, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (16, N'ТомскНефть', N'1002996016', CAST(N'2015-05-07' AS Date), 95, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (17, N'ТомскТяжРеч', N'1102143492', CAST(N'2014-12-22' AS Date), 36, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (18, N'УралХме', N'2291253256', CAST(N'2015-05-22' AS Date), 82, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (19, N'ВодРыб', N'1113468466', CAST(N'2011-11-25' AS Date), 21, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (20, N'УралСервисМон', N'1892306757', CAST(N'2016-12-20' AS Date), 26, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (21, N'Казань', N'1965011544', CAST(N'2015-03-16' AS Date), 51, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (22, N'Cиб', N'1949139718', CAST(N'2011-11-28' AS Date), 95, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (23, N'ГаражГазМ', N'1740623312', CAST(N'2011-11-20' AS Date), 86, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (24, N'МобайлДизайнОмск', N'1014490629', CAST(N'2019-10-28' AS Date), 73, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (25, N'ЖелДорГаз', N'1255275062', CAST(N'2014-09-04' AS Date), 76, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (26, N'ТверьБухГаз', N'2167673760', CAST(N'2013-11-13' AS Date), 9, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (27, N'ТелекомТранс', N'2200735978', CAST(N'2015-01-11' AS Date), 8, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (28, N'ГаражГлав', N'1404774111', CAST(N'2013-06-28' AS Date), 89, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (29, N'Компания К', N'1468114280', CAST(N'2018-12-07' AS Date), 70, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (30, N'ТяжЛифтВостокС', N'1032089879', CAST(N'2012-08-13' AS Date), 66, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (31, N'Компания Во', N'2027005945', CAST(N'2016-06-22' AS Date), 11, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (32, N'МоторКаз', N'1076279398', CAST(N'2015-08-23' AS Date), 37, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (33, N'Сервис', N'2031832854', CAST(N'2011-11-25' AS Date), 25, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (34, N'ЮпитерТомс', N'1551173338', CAST(N'2011-07-28' AS Date), 60, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (35, N'Мор', N'1906157177', CAST(N'2011-03-06' AS Date), 82, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (36, N'СеверТехВостокЛизинг', N'1846812080', CAST(N'2011-02-26' AS Date), 30, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (37, N'ЦементОбл', N'2021607106', CAST(N'2015-10-03' AS Date), 42, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (38, N'Компания КазаньАвтоCиб', N'1371692583', CAST(N'2015-10-19' AS Date), 23, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (39, N'ГаражХозФлот', N'2164720385', CAST(N'2018-08-28' AS Date), 7, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (40, N'Компания МорМетал', N'1947163072', CAST(N'2013-11-18' AS Date), 33, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (41, N'ГлавРыб', N'1426268088', CAST(N'2018-11-09' AS Date), 46, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (42, N'CибCибОрио', N'1988313615', CAST(N'2018-01-13' AS Date), 95, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (43, N'ТелеРыбХм', N'2299034130', CAST(N'2012-02-10' AS Date), 3, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (44, N'ГлавАвтоГазТрест', N'2059691335', CAST(N'2014-08-04' AS Date), 18, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (45, N'ТяжКазаньБашкир', N'1794419510', CAST(N'2015-12-22' AS Date), 85, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (46, N'Асбоцемент', N'1650212184', CAST(N'2018-12-09' AS Date), 80, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (47, N'Мотор', N'1019917089', CAST(N'2017-04-24' AS Date), 19, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (48, N'МорФинансФинансМаш', N'1549496316', CAST(N'2013-06-18' AS Date), 68, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (49, N'РыбВектор', N'2275526397', CAST(N'2011-06-20' AS Date), 92, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (50, N'Теле', N'2170198203', CAST(N'2010-05-01' AS Date), 11, N' ПАО')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (1, N'Анна', N'q', N'1234')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (2, N'Мария', N'w', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (3, N'Мария', N's', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (4, N'Мария', N'd', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (5, N'Мария', N'p[', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (6, N'Мария', N'a', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (7, N'asd', N'sxcz', N'xz')
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [КЭ_ПоповаД] SET  READ_WRITE 
GO
