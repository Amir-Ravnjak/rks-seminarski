USE [master]
GO
/****** Object:  Database [SportskiCentarRKSAPI_db]    Script Date: 24/03/2019 19:20:38 ******/
CREATE DATABASE [SportskiCentarRKSAPI_db]
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportskiCentarRKSAPI_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET  MULTI_USER 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET ENCRYPTION ON
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [SportskiCentarRKSAPI_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [SportskiCentarRKSAPI_db]
GO
/****** Object:  Table [dbo].[AutorizacijskiToken]    Script Date: 24/03/2019 19:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorizacijskiToken](
	[AutorizacijskiTokenID] [int] IDENTITY(1,1) NOT NULL,
	[Vrijednost] [nvarchar](max) NULL,
	[VrijemeEvidentiranja] [datetime] NULL,
	[IpAdresa] [nvarchar](max) NULL,
	[DeviceInfo] [nvarchar](max) NULL,
	[KlijentID] [int] NULL,
 CONSTRAINT [PK_dbo.AutorizacijskiToken] PRIMARY KEY CLUSTERED 
(
	[AutorizacijskiTokenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klijent]    Script Date: 24/03/2019 19:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijent](
	[KlijentID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](max) NULL,
	[Prezime] [nvarchar](max) NULL,
	[Telefon] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[KorisnickoIme] [nvarchar](max) NULL,
	[LozinkaSalt] [nvarchar](max) NULL,
	[LozinkaHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Klijent] PRIMARY KEY CLUSTERED 
(
	[KlijentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prostorija]    Script Date: 24/03/2019 19:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prostorija](
	[ProstorijaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Dimenzija] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Prostorija] PRIMARY KEY CLUSTERED 
(
	[ProstorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 24/03/2019 19:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacija](
	[RezervacijaID] [int] IDENTITY(1,1) NOT NULL,
	[TerminID] [int] NOT NULL,
	[KlijentID] [int] NOT NULL,
	[Odobrena] [bit] NOT NULL,
	[Uplaceno] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Rezervacija] PRIMARY KEY CLUSTERED 
(
	[RezervacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Termin]    Script Date: 24/03/2019 19:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Termin](
	[TerminID] [int] IDENTITY(1,1) NOT NULL,
	[ProstorijaID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Pocetak] [nvarchar](max) NULL,
	[Kraj] [nvarchar](max) NULL,
	[Cijena] [real] NOT NULL,
	[Slobodan] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Termin] PRIMARY KEY CLUSTERED 
(
	[TerminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AutorizacijskiToken] ON 

INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (2, N'9d39073c-fefe-4b9c-88f4-dacb6063e1d3', CAST(N'2019-03-20T22:57:09.090' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (3, N'ff0a1fcc-d712-4e5b-8aa1-b433ca3ba846', CAST(N'2019-03-20T23:04:57.193' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (4, N'fa62969a-188a-48da-87e5-dd02f9108ded', CAST(N'2019-03-20T23:05:53.983' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (6, N'd5f2278a-d284-4a41-9792-98518ad10b30', CAST(N'2019-03-20T23:14:30.050' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (7, N'2fe4046b-e36e-45db-b87a-a1721a8501be', CAST(N'2019-03-20T23:40:47.627' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (8, N'1b890066-5053-427f-8089-cc6c8c3acd69', CAST(N'2019-03-23T10:48:07.023' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (9, N'6bab1d94-d2c9-4b24-8068-26f37865e873', CAST(N'2019-03-23T10:48:18.083' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (10, N'049f06ed-c4e2-4bc7-bab0-8ac2615391bf', CAST(N'2019-03-23T10:49:28.830' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (11, N'38248c03-9688-4213-b281-2ec3b0aa7598', CAST(N'2019-03-23T10:49:40.960' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (12, N'a312a041-6370-4746-843d-d210db157d52', CAST(N'2019-03-23T10:50:42.527' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (13, N'fec3e4d6-f429-4deb-869b-38c1f653fd1d', CAST(N'2019-03-23T11:01:12.937' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (14, N'32a2f4c6-2a49-4e9e-a271-9fd620553af4', CAST(N'2019-03-23T11:02:05.987' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (15, N'448ea71a-3c72-44d4-b69e-1a2dede28576', CAST(N'2019-03-23T11:02:17.213' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (16, N'5b26d01c-ee87-4b80-9fd8-4014a3acdc25', CAST(N'2019-03-23T11:04:57.083' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (17, N'47493934-c9fc-4dd0-8f9c-1e5cf066a64e', CAST(N'2019-03-23T11:10:25.827' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (18, N'a9d0ef5c-f5fe-4add-b438-586a41b4497c', CAST(N'2019-03-23T11:10:48.450' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (19, N'91d39fdc-95bf-4b74-9065-e46218a7e53c', CAST(N'2019-03-23T11:19:51.013' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (20, N'40b06185-0b1f-4a2f-9772-8865345e5e00', CAST(N'2019-03-23T11:19:59.033' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (21, N'9c1dab39-6332-4826-a0a0-009c6c27750d', CAST(N'2019-03-23T11:24:00.783' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (22, N'850b6727-aad1-4ad3-81b8-a47d16671f17', CAST(N'2019-03-23T11:27:57.627' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (24, N'0f1ae4ff-4658-47e9-8ca6-10c21460adbb', CAST(N'2019-03-23T11:32:37.107' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (25, N'20ebbaea-039a-4faf-8853-56887a1f6652', CAST(N'2019-03-23T11:32:46.797' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (26, N'9722af1e-24b1-45bd-aeb6-af1c7c657b5d', CAST(N'2019-03-23T11:35:43.117' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (27, N'b5aaa716-082c-4b7b-a691-4d8e9dea3077', CAST(N'2019-03-23T11:36:19.913' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (28, N'9f2f33d9-1ddf-443d-9e35-6e5ce3b00d80', CAST(N'2019-03-23T11:39:08.017' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (29, N'a766a829-1513-49e6-8aaa-d632a70700b0', CAST(N'2019-03-23T11:40:08.843' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (30, N'67401af4-7f6a-476c-98a7-936d2b516079', CAST(N'2019-03-23T11:42:04.787' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (31, N'41734e7b-f17c-4f8b-be4b-8de0fecdf98e', CAST(N'2019-03-23T11:42:21.070' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (32, N'f431f35e-6e6d-4937-9528-ba6498207890', CAST(N'2019-03-23T11:43:20.163' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (33, N'037a806d-547a-43f1-bacb-5b7ec8f645d6', CAST(N'2019-03-23T11:47:07.137' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (34, N'2dade004-d6e9-44d8-9626-075a1dcf5aa0', CAST(N'2019-03-23T11:48:18.710' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (35, N'093806b1-4e04-4223-9693-2561f31c52eb', CAST(N'2019-03-23T11:52:39.020' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (36, N'e05ab0bf-0387-4fb3-865b-8c714b23c238', CAST(N'2019-03-23T12:11:41.067' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (37, N'4a71221a-60e2-4997-92fa-a2f7b0210e2e', CAST(N'2019-03-23T12:18:31.387' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (38, N'2133c2e9-fd93-4637-b285-b4f10c255bfa', CAST(N'2019-03-23T12:22:56.533' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (39, N'992c0e3f-922a-43f6-a0b0-790571aa5ab3', CAST(N'2019-03-23T12:24:36.260' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (40, N'08e08fe9-aa32-470b-abd4-e96af4a07caa', CAST(N'2019-03-23T12:25:33.417' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (41, N'06f78c75-4537-4cc5-b675-2d638e773644', CAST(N'2019-03-23T12:27:20.317' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (42, N'91a43699-980c-490a-9a88-03bd59062c05', CAST(N'2019-03-23T12:27:36.480' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (43, N'2f075e4b-e313-44f2-8eef-504eca5d9c2d', CAST(N'2019-03-23T12:27:53.860' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (44, N'e0a7b920-9e2a-4522-a091-251b12532a3e', CAST(N'2019-03-23T12:29:21.363' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (45, N'05be78af-e004-4b50-8c6e-01c5675ef218', CAST(N'2019-03-23T12:35:46.757' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (46, N'41ccb837-8976-4ee7-845f-25776e3ac239', CAST(N'2019-03-23T12:36:57.697' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (47, N'2e5675bd-a1c8-48a5-b4a3-904cd634c669', CAST(N'2019-03-23T12:46:18.290' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (48, N'0bbf6b0c-4dd4-41e0-bc2c-713dd3873479', CAST(N'2019-03-23T12:47:05.240' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (49, N'f23c3b57-89d5-4c37-8a00-c531c4189869', CAST(N'2019-03-23T12:47:52.613' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (50, N'1bbd21a8-a610-478e-8271-765c9ebf5ef5', CAST(N'2019-03-23T12:52:12.460' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (51, N'ed08d3a1-869d-4ca7-9355-4f4146722f67', CAST(N'2019-03-23T12:52:49.383' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (52, N'4c3551ec-a7e3-47a6-8be1-6dc115dca25f', CAST(N'2019-03-23T12:57:44.470' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (53, N'f2d6fc66-5b5a-4eae-8f1c-a535fd262057', CAST(N'2019-03-23T12:57:54.907' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (54, N'957a6512-f615-4767-b188-98824af4604e', CAST(N'2019-03-23T12:59:27.363' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (55, N'da2da4e5-b1c1-4910-a55a-cbb12c1fa774', CAST(N'2019-03-23T13:01:22.047' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (56, N'5d522fa6-accc-4689-b7e8-5c2b88ed33f0', CAST(N'2019-03-23T13:02:33.857' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (57, N'83c7cea7-07ab-493d-8a23-226e373e8d6d', CAST(N'2019-03-23T13:03:25.323' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (58, N'5703c780-26f0-468a-8ffd-f73bf4c87e62', CAST(N'2019-03-23T13:09:25.733' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (59, N'c344f12b-6d10-4cca-9c08-dac8ca5503cc', CAST(N'2019-03-23T13:12:42.437' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (60, N'b0402a01-6f11-4449-b115-864922c13ef9', CAST(N'2019-03-23T17:17:22.417' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (61, N'ec8230e2-bd81-4f56-b903-6c82dcc28023', CAST(N'2019-03-23T17:21:30.587' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (62, N'6172e67f-da40-4c02-bd68-5e2e357a5e2a', CAST(N'2019-03-23T17:24:18.667' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (63, N'73fd1a20-ee0a-4236-a84e-f9dc3f2e24bc', CAST(N'2019-03-23T17:26:53.373' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (64, N'3ebf9ca7-a094-4f36-a568-7f8e4eedf545', CAST(N'2019-03-23T17:32:06.443' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (65, N'9f5650b8-6b79-4943-b3d5-cfb76f2e4852', CAST(N'2019-03-23T18:03:58.360' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (66, N'b2d03bba-9897-4651-bc1b-881f8722f454', CAST(N'2019-03-23T18:17:34.837' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (67, N'6fac1a79-227b-4e1e-b4f8-2e7a15ad853a', CAST(N'2019-03-23T18:24:45.763' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (68, N'8090f91b-b85b-47bb-ab11-67fd9a4e2d18', CAST(N'2019-03-23T18:31:06.483' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (69, N'479918bb-4c51-4223-b057-04a20d869612', CAST(N'2019-03-23T18:32:46.390' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (70, N'14d385df-d58c-4eea-b025-7eefd5982627', CAST(N'2019-03-23T18:41:11.397' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (71, N'00e819ed-a9ff-4697-94dc-94380a84599c', CAST(N'2019-03-23T18:42:22.577' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (72, N'c1d7dfd5-6710-41d8-82d9-ce04ec4ecc68', CAST(N'2019-03-23T19:07:44.940' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (76, N'bc2a5339-33a3-4850-b660-a000cc54709f', CAST(N'2019-03-23T19:38:20.150' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (79, N'6292ea9d-1fa8-4cc3-ad32-eb741c124802', CAST(N'2019-03-24T12:03:46.083' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (80, N'a13ccd23-1aba-4dfd-9e44-e8fc5adb1bfc', CAST(N'2019-03-24T12:05:59.173' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (81, N'da690854-81ee-4b83-a1ba-dc18d55209c8', CAST(N'2019-03-24T12:17:33.747' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (82, N'20a594bf-72bd-4a30-9b00-693010da7108', CAST(N'2019-03-24T12:19:27.280' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (83, N'695fa124-36a8-4de4-a59f-c21866d16105', CAST(N'2019-03-24T12:27:38.340' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (85, N'a2eb7a31-626f-4bfd-ac00-59ce58c3a0a5', CAST(N'2019-03-24T12:36:21.977' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (86, N'e7b57705-e354-4351-94db-11d622d2dd70', CAST(N'2019-03-24T12:36:52.767' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (87, N'bb36cd77-8c07-4963-b1f2-c0bd6861868c', CAST(N'2019-03-24T14:06:36.013' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (88, N'4fad41eb-58f4-4c48-9e4a-034f70a622bd', CAST(N'2019-03-24T14:08:37.673' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (89, N'787f18ac-a113-4472-af14-03970b283185', CAST(N'2019-03-24T14:26:09.223' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (90, N'4652493f-a8e7-4706-9cdf-2fab692383ad', CAST(N'2019-03-24T14:26:24.323' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (91, N'4aeccb3c-aa45-417d-a591-5cda6802acfa', CAST(N'2019-03-24T14:29:18.747' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (92, N'ca0077ba-55e0-4731-a5f0-14465f286f05', CAST(N'2019-03-24T14:30:49.107' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (93, N'b5d123ef-397d-4388-9796-9dac2bf937ef', CAST(N'2019-03-24T14:31:24.427' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (94, N'f62133f8-ae43-4823-ab21-74ee7884b0d3', CAST(N'2019-03-24T14:31:38.723' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (95, N'32190a62-c0a0-42db-87aa-1d9a283d7d71', CAST(N'2019-03-24T14:31:49.630' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (96, N'941a68b4-e3e1-4c3c-8728-0daf5a6ed9e9', CAST(N'2019-03-24T14:35:33.640' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (97, N'02d41171-9696-4a0f-b3dd-2baae0228920', CAST(N'2019-03-24T14:37:34.143' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (98, N'c571e2a8-2490-48f0-890f-b757bf92691a', CAST(N'2019-03-24T15:54:25.433' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (99, N'9e8218c6-442e-4f41-9c82-92a8ba75935d', CAST(N'2019-03-24T16:03:10.663' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (100, N'6bbfc223-e2ef-4a84-ad34-7e5ba956d4ce', CAST(N'2019-03-24T16:04:28.220' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (101, N'2e0ed42c-71b1-46d9-ab7c-15a6ce374e23', CAST(N'2019-03-24T16:05:23.417' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (102, N'6bc2658d-6510-47f4-92e4-a1eb96f301d5', CAST(N'2019-03-24T16:08:51.110' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (103, N'71c8dca9-84d2-4948-adc5-5903e2cc8c34', CAST(N'2019-03-24T16:25:23.743' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (105, N'5d027994-9cc9-488a-9ce6-b3fd5938a793', CAST(N'2019-03-24T16:28:12.383' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (107, N'6373b124-a4d3-4bae-8299-8dab3b748ead', CAST(N'2019-03-24T16:33:32.293' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (108, N'2ea6630a-2880-47dc-a7b9-7b0e0e0a4c3b', CAST(N'2019-03-24T16:35:03.107' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (109, N'8bf74f54-e53f-44e8-b808-7098bc797aaf', CAST(N'2019-03-24T16:35:07.353' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (110, N'beae485e-40f5-44dc-963a-d3736d9e5df1', CAST(N'2019-03-24T16:42:53.133' AS DateTime), N'...', NULL, 1)
GO
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (111, N'138c5f53-f6f8-48a1-b0ef-1f4e70856e36', CAST(N'2019-03-24T16:43:51.673' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (112, N'fa36c2ae-2e35-460e-bda9-6449cc7137ba', CAST(N'2019-03-24T16:49:25.597' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (113, N'1be934d5-b743-4dea-9b0c-356a19c4b7b8', CAST(N'2019-03-24T16:50:19.313' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (114, N'9bac2298-0465-4f95-bfd3-f81684bf5c83', CAST(N'2019-03-24T16:50:50.967' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (115, N'51f5bcef-607a-4f1d-a327-e692ed0693d3', CAST(N'2019-03-24T16:54:11.703' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (116, N'f9efaf55-c2cc-4b19-8cb7-0535b23d91e0', CAST(N'2019-03-24T17:07:15.553' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (117, N'502a29b1-cfa2-4638-b45c-9ce45dbdfc66', CAST(N'2019-03-24T17:07:37.727' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (118, N'0ac5518f-fc57-47da-8af2-34998a97f07b', CAST(N'2019-03-24T17:15:25.947' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (119, N'6326f183-7cb5-4101-960d-816dca853cbf', CAST(N'2019-03-24T17:16:15.630' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (120, N'55191677-d2e5-453b-b2ce-a7fa09e57de9', CAST(N'2019-03-24T17:17:00.640' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (121, N'ae570918-e6db-4ca3-8fde-440ec8ef66ac', CAST(N'2019-03-24T17:30:41.887' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (122, N'2420367d-1e9d-4391-aea6-5951936a08ee', CAST(N'2019-03-24T17:34:20.350' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (123, N'40ee668b-1d42-4ebb-b187-86b85e759b09', CAST(N'2019-03-24T17:38:15.930' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (124, N'2615eb14-c402-43a4-85b4-a2776aa57cbf', CAST(N'2019-03-24T17:43:37.543' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (125, N'a8c88973-3789-4d34-942f-70f1ed259598', CAST(N'2019-03-24T17:46:23.530' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (126, N'8cce1204-b4c2-4a6a-bbae-ebd91247171e', CAST(N'2019-03-24T17:49:13.000' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (127, N'7067b086-1687-4547-bd56-d9728704dda4', CAST(N'2019-03-24T18:06:23.943' AS DateTime), N'...', NULL, 1)
INSERT [dbo].[AutorizacijskiToken] ([AutorizacijskiTokenID], [Vrijednost], [VrijemeEvidentiranja], [IpAdresa], [DeviceInfo], [KlijentID]) VALUES (128, N'3e15f89f-e9bc-4493-adbe-467081804959', CAST(N'2019-03-24T18:16:45.630' AS DateTime), N'...', NULL, 1)
SET IDENTITY_INSERT [dbo].[AutorizacijskiToken] OFF
SET IDENTITY_INSERT [dbo].[Klijent] ON 

INSERT [dbo].[Klijent] ([KlijentID], [Ime], [Prezime], [Telefon], [Email], [KorisnickoIme], [LozinkaSalt], [LozinkaHash]) VALUES (1, N'Amir', N'Ravnjak', N'000111222', N'amir@ravnjak.com', N'Amir', N'Amir1234', NULL)
SET IDENTITY_INSERT [dbo].[Klijent] OFF
SET IDENTITY_INSERT [dbo].[Prostorija] ON 

INSERT [dbo].[Prostorija] ([ProstorijaID], [Naziv], [Dimenzija]) VALUES (1, N'Velika sala 1', N'60x30')
INSERT [dbo].[Prostorija] ([ProstorijaID], [Naziv], [Dimenzija]) VALUES (2, N'Velika sala 2', N'60x30')
INSERT [dbo].[Prostorija] ([ProstorijaID], [Naziv], [Dimenzija]) VALUES (3, N'Teretana 1', N'8x8')
INSERT [dbo].[Prostorija] ([ProstorijaID], [Naziv], [Dimenzija]) VALUES (4, N'Teretana 2', N'7x5')
INSERT [dbo].[Prostorija] ([ProstorijaID], [Naziv], [Dimenzija]) VALUES (5, N'Bazen za plivanje', N'50x20')
SET IDENTITY_INSERT [dbo].[Prostorija] OFF
SET IDENTITY_INSERT [dbo].[Rezervacija] ON 

INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (1, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (2, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (3, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (4, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (5, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (6, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (7, 6, 1, 0, 0)
INSERT [dbo].[Rezervacija] ([RezervacijaID], [TerminID], [KlijentID], [Odobrena], [Uplaceno]) VALUES (8, 6, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Rezervacija] OFF
SET IDENTITY_INSERT [dbo].[Termin] ON 

INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (1, 1, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'16:00', N'17:30', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (2, 1, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'17:30', N'18:00', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (3, 1, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'18:00', N'19:30', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (4, 1, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'19:30', N'21:30', 50, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (5, 2, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'17:30', N'18:00', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (6, 2, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'16:00', N'17:30', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (7, 2, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'19:00', N'20:30', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (8, 2, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'20:30', N'22:00', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (9, 1, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'17:30', N'18:00', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (10, 1, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'18:00', N'19:30', 30, 0)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (11, 1, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'19:30', N'21:00', 30, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (12, 3, CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'15:00', N'16:00', 20, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (13, 3, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'15:00', N'16:00', 20, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (14, 4, CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'16:00', N'17:00', 20, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (15, 5, CAST(N'2019-04-10T00:00:00.000' AS DateTime), N'16:00', N'17:00', 30, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (16, 5, CAST(N'2019-04-10T00:00:00.000' AS DateTime), N'17:00', N'17:00', 30, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (17, 1, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'16:00', N'17:30', 50, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (18, 1, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'17:30', N'19:00', 50, 1)
INSERT [dbo].[Termin] ([TerminID], [ProstorijaID], [Datum], [Pocetak], [Kraj], [Cijena], [Slobodan]) VALUES (19, 1, CAST(N'2019-04-07T00:00:00.000' AS DateTime), N'19:00', N'20:30', 60, 1)
SET IDENTITY_INSERT [dbo].[Termin] OFF
ALTER TABLE [dbo].[AutorizacijskiToken]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AutorizacijskiToken_dbo.Klijent_KlijentID] FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([KlijentID])
GO
ALTER TABLE [dbo].[AutorizacijskiToken] CHECK CONSTRAINT [FK_dbo.AutorizacijskiToken_dbo.Klijent_KlijentID]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rezervacija_dbo.Klijent_KlijentID] FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijent] ([KlijentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_dbo.Rezervacija_dbo.Klijent_KlijentID]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rezervacija_dbo.Termin_TerminID] FOREIGN KEY([TerminID])
REFERENCES [dbo].[Termin] ([TerminID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_dbo.Rezervacija_dbo.Termin_TerminID]
GO
ALTER TABLE [dbo].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Termin_dbo.Prostorija_ProstorijaID] FOREIGN KEY([ProstorijaID])
REFERENCES [dbo].[Prostorija] ([ProstorijaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Termin] CHECK CONSTRAINT [FK_dbo.Termin_dbo.Prostorija_ProstorijaID]
GO
USE [master]
GO
ALTER DATABASE [SportskiCentarRKSAPI_db] SET  READ_WRITE 
GO
