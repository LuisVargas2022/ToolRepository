USE [master]
GO
/****** Object:  Database [CajaSurquillo2]    Script Date: 9/06/2022 01:23:30 ******/
CREATE DATABASE [CajaSurquillo2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CajaSurquillo2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CajaSurquillo2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CajaSurquillo2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CajaSurquillo2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CajaSurquillo2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CajaSurquillo2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CajaSurquillo2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CajaSurquillo2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CajaSurquillo2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CajaSurquillo2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CajaSurquillo2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET RECOVERY FULL 
GO
ALTER DATABASE [CajaSurquillo2] SET  MULTI_USER 
GO
ALTER DATABASE [CajaSurquillo2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CajaSurquillo2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CajaSurquillo2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CajaSurquillo2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CajaSurquillo2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CajaSurquillo2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CajaSurquillo2', N'ON'
GO
ALTER DATABASE [CajaSurquillo2] SET QUERY_STORE = OFF
GO
USE [CajaSurquillo2]
GO
/****** Object:  Table [dbo].[MasterTable]    Script Date: 9/06/2022 01:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTable](
	[idMasterTable] [char](5) NOT NULL,
	[idMasterTableParent] [char](5) NULL,
	[Name] [varchar](200) NOT NULL,
	[Value] [varchar](200) NULL,
	[Order] [int] NULL,
	[AdditionalOne] [varchar](200) NULL,
	[AdditionalTwo] [varchar](200) NULL,
	[AdditionalThree] [varchar](200) NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_MasterTable] PRIMARY KEY CLUSTERED 
(
	[idMasterTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewtblCardRequest]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewtblCardRequest](
	[idCardRequest] [int] IDENTITY(1,1) NOT NULL,
	[idMasterModeOfDelivery] [char](5) NOT NULL,
	[DeliveryAddress] [varchar](50) NULL,
	[idMasterAgencyOfDelivery] [char](5) NULL,
	[DeliveryDate] [date] NULL,
	[idMasterCardType] [char](5) NOT NULL,
	[idMasterSecurityType] [char](5) NOT NULL,
	[DesgravamentValue] [decimal](18, 4) NOT NULL,
	[idMasterCreditRisk] [char](5) NOT NULL,
	[idProduct] [int] NOT NULL,
	[CashDisposition] [bit] NOT NULL,
	[PurchaseAbroad] [bit] NOT NULL,
	[PurchaseOnline] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
	[IdMasterFlowStatus] [char](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgency]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgency](
	[IdAgency] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[AngencyName] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblAgency] PRIMARY KEY CLUSTERED 
(
	[IdAgency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAnalyst]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnalyst](
	[IdAnalyst] [int] NOT NULL,
	[AnalystCod] [varchar](50) NOT NULL,
	[IdUser] [int] NULL,
	[AnalystName] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblAnalyst] PRIMARY KEY CLUSTERED 
(
	[IdAnalyst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCampaign]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampaign](
	[IdCampaign] [int] NOT NULL,
	[CampaignCod] [varchar](50) NOT NULL,
	[CampaignName] [varchar](50) NOT NULL,
	[CampaignDate] [datetime] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblCampaign] PRIMARY KEY CLUSTERED 
(
	[IdCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCardRequest]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCardRequest](
	[idCardRequest] [int] IDENTITY(1,1) NOT NULL,
	[idMasterModeOfDelivery] [char](5) NOT NULL,
	[DeliveryAddress] [varchar](50) NULL,
	[idMasterAgencyOfDelivery] [char](5) NULL,
	[DeliveryDate] [date] NULL,
	[idMasterCardType] [char](5) NOT NULL,
	[idMasterSecurityType] [char](5) NOT NULL,
	[DesgravamentValue] [decimal](18, 4) NOT NULL,
	[idMasterCreditRisk] [char](5) NOT NULL,
	[idProduct] [int] NOT NULL,
	[CashDisposition] [bit] NOT NULL,
	[PurchaseAbroad] [bit] NOT NULL,
	[PurchaseOnline] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
	[IdMasterFlowStatus] [char](5) NULL,
 CONSTRAINT [PK_tblCardRequest] PRIMARY KEY CLUSTERED 
(
	[idCardRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[IdCity] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[CodPostal] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_TbkCity] PRIMARY KEY CLUSTERED 
(
	[IdCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompany]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompany](
	[IdCompany] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[IdMasterDocumentType] [char](5) NOT NULL,
	[CompanyAddress] [varchar](50) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[IdMasterEconomicActivity] [char](5) NOT NULL,
	[IdMasterUbigeo] [char](5) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
	[IdMasterCurrency] [char](5) NOT NULL,
 CONSTRAINT [PK_tblCompany] PRIMARY KEY CLUSTERED 
(
	[IdCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[IdCustomer] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[PaterName] [varchar](50) NOT NULL,
	[MaterName] [varchar](50) NOT NULL,
	[IdMasterDocumentType] [char](5) NOT NULL,
	[DocNumber] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IdMasterMaritalStatus] [char](5) NOT NULL,
	[Mobile] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[IdMaterGender] [char](5) NOT NULL,
	[DateBirth] [date] NOT NULL,
	[DependentsNumber] [varchar](50) NULL,
	[MonthlyIncome] [decimal](18, 4) NOT NULL,
	[IdMasterEconomicActivity] [char](5) NOT NULL,
	[IdMasterOccupation] [char](5) NOT NULL,
	[IdCompany] [int] NOT NULL,
	[IdMasterUbigeo] [char](5) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[IdCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[IdProduct] [int] NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdCampaign] [int] NOT NULL,
	[IdMasterCurrency] [char](5) NOT NULL,
	[IdAnalyst] [int] NOT NULL,
	[IdAgency] [int] NOT NULL,
	[AnnualCreditRate] [varchar](50) NOT NULL,
	[AnnualMoraRate] [varchar](50) NOT NULL,
	[MonthlyCreditRate] [varchar](50) NOT NULL,
	[DailyMoraRate] [varchar](50) NOT NULL,
	[CreditLine] [decimal](18, 4) NOT NULL,
	[IdMasterFlowStatus] [char](5) NOT NULL,
	[RecordStatus] [char](1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_tblProductos] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaskParameters]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskParameters](
	[idTask] [int] IDENTITY(1,1) NOT NULL,
	[StartTask] [date] NOT NULL,
	[EndTask] [date] NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[DayOfWeek] [varchar](50) NOT NULL,
	[Hour] [int] NOT NULL,
	[Minute] [int] NOT NULL,
	[Frequency] [int] NOT NULL,
	[FlagFrequency] [char](1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTask] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTramaPosition]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTramaPosition](
	[TramaName] [varchar](50) NOT NULL,
	[fullSpacePosition] [int] NOT NULL,
	[TypeValue] [char](1) NOT NULL,
	[Value] [char](1) NULL,
	[Created] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[IdUser] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Modified] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
	[RecordStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00100', NULL, N'CardType', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00101', N'00100', N'Platinum', NULL, 1, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00102', N'00100', N'Visa', NULL, 2, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00200', NULL, N'Gender', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00201', N'00200', N'Masculino', NULL, 1, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00202', N'00200', N'Femenino', NULL, 2, NULL, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00300', NULL, N'AgencyOfDelivery', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T15:39:48.617' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00301', N'00300', N'Lima', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T15:45:05.427' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00302', N'00300', N'Cusco', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T15:46:31.347' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00400', NULL, N'CreditRisk', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T15:52:58.500' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00401', N'00400', N'Normal', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T15:53:50.717' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00402', N'00400', N'WithRisk', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T15:54:34.187' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00403', N'00400', N'Doubtful', NULL, 3, NULL, NULL, NULL, CAST(N'2022-05-03T15:54:53.673' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00500', NULL, N'Currency', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T15:56:33.947' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00501', N'00500', N'Soles', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T15:57:52.913' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00502', N'00500', N'Dolares', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T15:58:37.650' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00600', NULL, N'DocumentType', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:05:26.920' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00601', N'00600', N'DNI', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:06:43.847' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00602', N'00600', N'RUC', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T16:06:59.460' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00700', NULL, N'MaritalStatus', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:12:03.517' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00701', N'00700', N'Soltero', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:12:41.733' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00702', N'00700', N'Casado', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T16:12:52.197' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00800', NULL, N'ModeOfDelivery', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:30:53.277' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00801', N'00800', N'Phisical', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:16:14.433' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00802', N'00800', N'Agency', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T16:16:29.697' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00900', NULL, N'FlowStatus', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:18:00.080' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00901', N'00900', N'Normal', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:19:10.723' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00902', N'00900', N'onProccess', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T16:19:34.133' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00903', N'00900', N'Accept', NULL, 3, NULL, NULL, NULL, CAST(N'2022-05-03T16:19:45.720' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'00904', N'00900', N'Rejected', NULL, 4, NULL, NULL, NULL, CAST(N'2022-05-06T10:56:09.930' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01000', NULL, N'Ubigeo', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:21:20.897' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01001', N'01000', N'35', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:22:14.813' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01100', NULL, N'EconomicActivity', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:35:10.080' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01101', N'01100', N'Exportacion', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:35:58.487' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01200', NULL, N'Occupation', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:38:06.850' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01201', N'01200', N'Exportador', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:38:40.197' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01300', NULL, N'SecurityType', NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-03T16:40:19.670' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01301', N'01300', N'AgainstTheft', NULL, 1, NULL, NULL, NULL, CAST(N'2022-05-03T16:40:43.170' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01302', N'01300', N'LifeCover', NULL, 2, NULL, NULL, NULL, CAST(N'2022-05-03T16:40:59.050' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[MasterTable] ([idMasterTable], [idMasterTableParent], [Name], [Value], [Order], [AdditionalOne], [AdditionalTwo], [AdditionalThree], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'01303', N'01300', N'Otros', NULL, 3, NULL, NULL, NULL, CAST(N'2022-05-03T16:41:31.263' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblAgency] ([IdAgency], [IdCity], [AngencyName], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, 1, N'Lima', CAST(N'2022-02-05T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblAnalyst] ([IdAnalyst], [AnalystCod], [IdUser], [AnalystName], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, N'1', 1, N'Luciano Vargas', CAST(N'2022-02-05T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblCampaign] ([IdCampaign], [CampaignCod], [CampaignName], [CampaignDate], [BeginDate], [EndDate], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, N'0001', N'NAVIDAD', CAST(N'2022-06-05T00:00:00.000' AS DateTime), CAST(N'2022-04-05T00:00:00.000' AS DateTime), CAST(N'2022-12-12' AS Date), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
SET IDENTITY_INSERT [dbo].[tblCardRequest] ON 

INSERT [dbo].[tblCardRequest] ([idCardRequest], [idMasterModeOfDelivery], [DeliveryAddress], [idMasterAgencyOfDelivery], [DeliveryDate], [idMasterCardType], [idMasterSecurityType], [DesgravamentValue], [idMasterCreditRisk], [idProduct], [CashDisposition], [PurchaseAbroad], [PurchaseOnline], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus], [IdMasterFlowStatus]) VALUES (1, N'00801', N'Jr la Convecion 261', N'00301', CAST(N'2022-12-01' AS Date), N'00101', N'01300', CAST(5.0000 AS Decimal(18, 4)), N'00401', 1, 1, 0, 1, CAST(N'2022-05-03T12:57:01.613' AS DateTime), 1, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 1, N'A', N'00902')
INSERT [dbo].[tblCardRequest] ([idCardRequest], [idMasterModeOfDelivery], [DeliveryAddress], [idMasterAgencyOfDelivery], [DeliveryDate], [idMasterCardType], [idMasterSecurityType], [DesgravamentValue], [idMasterCreditRisk], [idProduct], [CashDisposition], [PurchaseAbroad], [PurchaseOnline], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus], [IdMasterFlowStatus]) VALUES (2, N'00801', N'Jr Talara', N'00301', CAST(N'2022-12-03' AS Date), N'00102', N'01301', CAST(5.0000 AS Decimal(18, 4)), N'00401', 1, 1, 1, 1, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A', N'00902')
SET IDENTITY_INSERT [dbo].[tblCardRequest] OFF
GO
INSERT [dbo].[tblCity] ([IdCity], [CityName], [CodPostal], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, N'Lima', N'35', CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblCompany] ([IdCompany], [CompanyName], [IdMasterDocumentType], [CompanyAddress], [Telephone], [IdMasterEconomicActivity], [IdMasterUbigeo], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus], [IdMasterCurrency]) VALUES (1, N'ALICORD', N'00601', N'JR LA MAR', N'555-5555', N'01101', N'01001', CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A', N'00501')
GO
INSERT [dbo].[tblCustomer] ([IdCustomer], [CustomerName], [PaterName], [MaterName], [IdMasterDocumentType], [DocNumber], [Email], [IdMasterMaritalStatus], [Mobile], [Address], [IdMaterGender], [DateBirth], [DependentsNumber], [MonthlyIncome], [IdMasterEconomicActivity], [IdMasterOccupation], [IdCompany], [IdMasterUbigeo], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, N'SARA ', N'CENTURION', N'CUZCANO', N'00601', N'70155044', N'SARACEN@TEST.COM', N'00701', N'954137650', N'JR LA CONVECION 261', N'00201', CAST(N'1991-05-01' AS Date), N'1', CAST(2000.0000 AS Decimal(18, 4)), N'01101', N'01201', 1, N'01001', CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblProducts] ([IdProduct], [IdCustomer], [IdCampaign], [IdMasterCurrency], [IdAnalyst], [IdAgency], [AnnualCreditRate], [AnnualMoraRate], [MonthlyCreditRate], [DailyMoraRate], [CreditLine], [IdMasterFlowStatus], [RecordStatus], [Created], [CreatedBy], [Modified], [LastModifiedBy]) VALUES (1, 1, 1, N'00501', 1, 1, N'0.03', N'0.04', N'0.02', N'0.01', CAST(30000.0000 AS Decimal(18, 4)), N'00902', N'A', CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblTaskParameters] ON 

INSERT [dbo].[tblTaskParameters] ([idTask], [StartTask], [EndTask], [Url], [DayOfWeek], [Hour], [Minute], [Frequency], [FlagFrequency], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (11, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-23' AS Date), N'https://localhost:44313/api/v1/CardRequest', N'Friday', 23, 7, 0, N'0', CAST(N'2022-05-16T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
SET IDENTITY_INSERT [dbo].[tblTaskParameters] OFF
GO
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdCardRequest', 20, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterModeOfDelivery', 50, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'DeliveryAddress', 40, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterAgencyOfDelivery', 50, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'DeliveryDate', 40, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterCardType', 50, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterSecurityType', 40, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'DesgravamentValue', 50, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterCreditRisk', 40, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdProduct', 50, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'CardDisposition', 40, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'PurchaseAbroad', 50, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'PuchaseOnline', 40, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'Create', 50, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'CreateBy', 40, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'Modified', 50, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'LastModififiedBy', 40, N'N', N'0', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'RecordStatus', 50, N'C', N' ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
INSERT [dbo].[tblTramaPosition] ([TramaName], [fullSpacePosition], [TypeValue], [Value], [Created], [CreateBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (N'IdMasterFlowStatus', 40, N'C', N' ', CAST(N'2022-08-18T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
INSERT [dbo].[tblUser] ([IdUser], [UserName], [Email], [PassWord], [Created], [CreatedBy], [Modified], [LastModifiedBy], [RecordStatus]) VALUES (1, N'LVARGAS', N'lvargas@test.com', N'123456', CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, NULL, NULL, N'A')
GO
ALTER TABLE [dbo].[tblCardRequest]  WITH CHECK ADD  CONSTRAINT [CheckValuesRecordStatus] CHECK  (([RecordStatus]='D' OR [RecordStatus]='I' OR [RecordStatus]='A'))
GO
ALTER TABLE [dbo].[tblCardRequest] CHECK CONSTRAINT [CheckValuesRecordStatus]
GO
/****** Object:  StoredProcedure [dbo].[CboFlowStatus]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CboFlowStatus]
as
begin
	select 
			m.idMasterTable,
			m.Name  
	from (select idMasterTable,Name  from MasterTable where idMasterTableParent='00900' ) as m
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCardRequest]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertCardRequest]
	@idMasterModeOfDelivery char(5),--cambiado
	@DeliveryAddress varchar(50),
	@idMasterAgencyOfDelivery char(5), -- cambiado
	@DeliveryDate datetime,
	@IdMasterCardType char(5), -- cambiado
	@idMasterSecurityType char(5), -- cambiado
	@Desgravament decimal,
	@idMasterCreditRisk char(5), -- cambiado
	@idProduct int,
	@CashDisposition bit,
	@PurchaseAbroad bit,
	@PurchaseOnline bit,
	@idUser int,
	@IdFlowMaterStatus char(5)
as
begin

	DECLARE @RecordStatusActive CHAR(1) = 'A'
	DECLARE @CurrentDate  DATETIME = GETDATE()

		insert into tblCardRequest 
		(
		[idMasterModeOfDelivery],
		[DeliveryAddress],
		[idMasterAgencyOfDelivery],
		[DeliveryDate],
		[idMasterCardType],
		[idMasterSecurityType],
		[DesgravamentValue],
		[idMasterCreditRisk], 
		[idProduct],
		[CashDisposition],
		[PurchaseAbroad],
		[PurchaseOnline],
		[Created],
		[CreatedBy],
		[RecordStatus],
		[IdFlowMaterStatus])
	values
		(@idMasterModeOfDelivery,
		@DeliveryAddress,
		@idMasterAgencyOfDelivery,
		@DeliveryDate,
		@IdMasterCardType,
		@idMasterSecurityType,
        @Desgravament,
		@idMasterCreditRisk,
		@idProduct,
		@CashDisposition,
		@PurchaseAbroad,
		@PurchaseOnline,
		@CurrentDate,
		@idUser,
		@RecordStatusActive,
		@IdFlowMaterStatus
	)
end
GO
/****** Object:  StoredProcedure [dbo].[ListAllProducts]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[ListAllProducts]
@IdUser int,
@IdMasterProductStatus char(5),
@CampaignName varchar (50),
@CustomerName varchar (50),
@CompanynName varchar (50)

as
begin

	Select 
		   p.IdProduct,
		   c.CampaignName,
		   c.CampaignDate,
		   cus.CustomerName,
		   com.CompanyName,
		   p.AnnualCreditRate,
		   p.AnnualMoraRate,
		   p.DailyMoraRate,
		   p.MonthlyCreditRate,
		   p.CreditLine,
		   p.IdMasterProductStatus
	 From 
			tblProducts p 
			inner join tblCampaign c on c.IdCampaign = p.IdCampaign
			inner join tblCustomer cus on cus.IdCustomer = p.IdCustomer
			inner join tblCompany com on com.IdCompany = cus.IdCompany
			inner join tblAnalyst a on a.IdAnalyst = p.IdAnalyst
			inner join tblUser u on u.IdUser = a.IdUser
	 Where  u.IdUser = @IdUser and (p.IdMasterProductStatus = (case when isnull(@IdMasterProductStatus,'')<>'' then @IdMasterProductStatus
			else p.IdMasterproductStatus end) and p.RecordStatus='A')
			and (c.CampaignName = (Case when  isnull(@CampaignName,'') <> '' Then @CampaignName else c.CampaignName end )
			or  cus.CustomerName = (Case when  isnull(@CustomerName,'') <> '' Then @CustomerName else cus.CustomerName end)
			or  com.CompanyName = (Case when  isnull(@CompanynName,'') <> '' Then @CompanynName else com.CompanyName end ))
				  
end
GO
/****** Object:  StoredProcedure [dbo].[OnProcessCardRequestList]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[OnProcessCardRequestList]
as
begin
select * from tblCardRequest where idMasterFlowStatus = '00902'
end
GO
/****** Object:  StoredProcedure [dbo].[SpLisTaskParameters]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[SpLisTaskParameters]
 @Date date,
 @Hour int,
 @Minute int
 as
 begin

  select idTask,
		 StartTask,
		 EndTask,
		 [Url],
		 [DayOfWeek],
		 [Hour],
		 [Minute]
		 
	from  
		 tblTaskParameters
	where		
		 [Hour] =@Hour and
		 [Minute]=@Minute and
		 FlagFrequency = 0 and
		 @Date between StartTask and EndTask 
end
GO
/****** Object:  StoredProcedure [dbo].[SpListTramaPosition]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpListTramaPosition]
as
begin

	select TramaName,
		   fullSpacePosition,
		   TypeValue,
		   [Value]

	from   tblTramaPosition

	Where RecordStatus ='A'
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCartRequestStatus]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateCartRequestStatus]
@IdMasterFlowStatus char(5),
@IdUser int,
@IdCardRequest int
as
begin
declare @CurrencyDate date = GETDATE()

update 
 tblCardRequest 
set
 IdMasterFlowStatus = @IdMasterFlowStatus,
 Modified = @CurrencyDate,
 LastModifiedBy = @IdUser			
Where  
 idCardRequest = @IdCardRequest
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductStatus]    Script Date: 9/06/2022 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateProductStatus]
@IdMasterFlowStatus char(5),
@IdUser int,
@IdProduct int
as
begin
declare @CurrencyDate date = GETDATE()

update 
 tblProducts 
set
 IdMasterFlowStatus = @IdMasterFlowStatus,
 Modified = @CurrencyDate,
 LastModifiedBy = @IdUser
			
Where  
 IdProduct =@IdProduct
end
GO
USE [master]
GO
ALTER DATABASE [CajaSurquillo2] SET  READ_WRITE 
GO
