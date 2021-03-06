USE [master]
GO
/****** Object:  Database [izrest]    Script Date: 10.12.2017 22:44:28 ******/
CREATE DATABASE [izrest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'izrest', FILENAME = N'C:\Users\yenib\Desktop\MSSQL14.MSSQLSERVER\MSSQL\DATA\izrest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'izrest_log', FILENAME = N'C:\Users\yenib\Desktop\MSSQL14.MSSQLSERVER\MSSQL\DATA\izrest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [izrest] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [izrest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [izrest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [izrest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [izrest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [izrest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [izrest] SET ARITHABORT OFF 
GO
ALTER DATABASE [izrest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [izrest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [izrest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [izrest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [izrest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [izrest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [izrest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [izrest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [izrest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [izrest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [izrest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [izrest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [izrest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [izrest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [izrest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [izrest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [izrest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [izrest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [izrest] SET  MULTI_USER 
GO
ALTER DATABASE [izrest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [izrest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [izrest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [izrest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [izrest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'izrest', N'ON'
GO
ALTER DATABASE [izrest] SET QUERY_STORE = OFF
GO
USE [izrest]
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
USE [izrest]
GO
/****** Object:  Table [dbo].[adisyonlar]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adisyonlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVISTURNO] [int] NULL,
	[PERSONELID] [int] NULL,
	[MASAID] [int] NULL,
	[TARIH] [datetime] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_adisyonlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hesapOdemeleri]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hesapOdemeleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADISYONID] [int] NULL,
	[ODEMETURID] [int] NULL,
	[MUSTERIID] [int] NULL,
	[ARATOPLAM] [money] NULL,
	[KDVTUTARI] [money] NULL,
	[INDIRIM] [money] NULL,
	[VALE] [money] NULL,
	[TOPLAMTUTAR] [money] NULL,
	[TARIH] [datetime] NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_hesapOdemeleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategoriler]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORİADI] [nvarchar](100) NULL,
	[ACIKLAMA] [text] NULL,
 CONSTRAINT [PK_kategoriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[masalar]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[masalar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KAPASITE] [int] NULL,
	[SERVISTURU] [int] NULL,
	[DURUM] [bit] NULL,
	[MASADURUM] [int] NULL,
 CONSTRAINT [PK_masalar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriHareketleri]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriHareketleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[SIKKULLANILANLAR] [nvarchar](100) NULL,
	[MUSTERIMEMNUNİYET] [nvarchar](50) NULL,
	[MUSTERIDURUM] [nvarchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_musteriHareketleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriler]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](50) NULL,
	[SOYAD] [nvarchar](50) NULL,
	[ADRES] [text] NULL,
	[TELEFON] [nvarchar](50) NULL,
	[ILKSIPARIS] [date] NULL,
	[EMAIL] [nvarchar](50) NULL,
	[SIPARISSAYISI] [int] NULL,
	[DURUM] [bit] NULL,
	[VALE] [bit] NULL,
 CONSTRAINT [PK_musteriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriYolHizmeti]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriYolHizmeti](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[PERSONELID] [int] NULL,
	[ODEMETUR] [int] NULL,
	[ACIKLAMA] [text] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_musteriYolHizmeti] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[odemeTurleri]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odemeTurleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ODEMETURU] [nvarchar](50) NULL,
	[ACIKLAMA] [text] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_odemeTurleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personelGorevleri]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personelGorevleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GOREV] [nvarchar](100) NULL,
	[ACIKLAMA] [text] NULL,
	[Durum] [bit] NULL,
	[PERSONELHİZMETSAYISI] [int] NULL,
 CONSTRAINT [PK_personelGorevleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personelHareketleri]    Script Date: 10.12.2017 22:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personelHareketleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PERSONELID] [int] NULL,
	[ISLEM] [nvarchar](50) NULL,
	[TARIH] [datetime] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_personelHareketleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personeller]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personeller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GOREVID] [int] NULL,
	[AD] [nvarchar](50) NULL,
	[SOYAD] [nvarchar](50) NULL,
	[PAROLA] [nvarchar](50) NULL,
	[KULLANICIADI] [nvarchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_personeller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervasyonlar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyonlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[MASAID] [int] NULL,
	[ADISYINID] [int] NULL,
	[KISISAYISI] [int] NULL,
	[TARIH] [datetime] NULL,
	[ACIKLAMA] [text] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Rezervasyonlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satislar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satislar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADISYONID] [int] NULL,
	[URUNID] [int] NULL,
	[MASAID] [int] NULL,
	[ADET] [int] NULL,
	[Durum] [bit] NULL,
	[SATISADEDİ] [int] NULL,
 CONSTRAINT [PK_satislar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servisturu]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servisturu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVISTURU] [nvarchar](50) NULL,
	[ACIKLAMA] [text] NULL,
 CONSTRAINT [PK_servisturu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunler]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORIID] [int] NULL,
	[URUNAD] [nvarchar](100) NULL,
	[ACIKLAMA] [nchar](10) NULL,
	[URUNADEDİ] [int] NULL,
	[Durum] [bit] NULL,
	[FİYAT] [money] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vale]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MESAİ] [int] NULL,
 CONSTRAINT [PK_Vale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yonetici]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yonetici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MESAİ] [int] NULL,
 CONSTRAINT [PK_yonetici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adisyonlar] ADD  CONSTRAINT [DF_adisyonlar_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[hesapOdemeleri] ADD  CONSTRAINT [DF_hesapOdemeleri_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[masalar] ADD  CONSTRAINT [DF_masalar_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[musteriHareketleri] ADD  CONSTRAINT [DF_musteriHareketleri_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[musteriler] ADD  CONSTRAINT [DF_musteriler_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[musteriler] ADD  CONSTRAINT [DF_musteriler_VALE]  DEFAULT ((0)) FOR [VALE]
GO
ALTER TABLE [dbo].[musteriYolHizmeti] ADD  CONSTRAINT [DF_musteriYolHizmeti_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[odemeTurleri] ADD  CONSTRAINT [DF_odemeTurleri_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[personelGorevleri] ADD  CONSTRAINT [DF_personelGorevleri_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[personelHareketleri] ADD  CONSTRAINT [DF_personelHareketleri_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[personeller] ADD  CONSTRAINT [DF_personeller_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[Rezervasyonlar] ADD  CONSTRAINT [DF_Rezervasyonlar_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[satislar] ADD  CONSTRAINT [DF_satislar_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[urunler] ADD  CONSTRAINT [DF_Table_1_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[adisyonlar]  WITH CHECK ADD  CONSTRAINT [FK_adisyonlar_masalar] FOREIGN KEY([MASAID])
REFERENCES [dbo].[masalar] ([ID])
GO
ALTER TABLE [dbo].[adisyonlar] CHECK CONSTRAINT [FK_adisyonlar_masalar]
GO
ALTER TABLE [dbo].[adisyonlar]  WITH CHECK ADD  CONSTRAINT [FK_adisyonlar_personeller] FOREIGN KEY([PERSONELID])
REFERENCES [dbo].[personeller] ([ID])
GO
ALTER TABLE [dbo].[adisyonlar] CHECK CONSTRAINT [FK_adisyonlar_personeller]
GO
ALTER TABLE [dbo].[adisyonlar]  WITH CHECK ADD  CONSTRAINT [FK_adisyonlar_servisturu] FOREIGN KEY([SERVISTURNO])
REFERENCES [dbo].[servisturu] ([ID])
GO
ALTER TABLE [dbo].[adisyonlar] CHECK CONSTRAINT [FK_adisyonlar_servisturu]
GO
ALTER TABLE [dbo].[hesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_hesapOdemeleri_adisyonlar] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[adisyonlar] ([ID])
GO
ALTER TABLE [dbo].[hesapOdemeleri] CHECK CONSTRAINT [FK_hesapOdemeleri_adisyonlar]
GO
ALTER TABLE [dbo].[hesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_hesapOdemeleri_musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[musteriler] ([ID])
GO
ALTER TABLE [dbo].[hesapOdemeleri] CHECK CONSTRAINT [FK_hesapOdemeleri_musteriler]
GO
ALTER TABLE [dbo].[hesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_hesapOdemeleri_odemeTurleri] FOREIGN KEY([ODEMETURID])
REFERENCES [dbo].[odemeTurleri] ([ID])
GO
ALTER TABLE [dbo].[hesapOdemeleri] CHECK CONSTRAINT [FK_hesapOdemeleri_odemeTurleri]
GO
ALTER TABLE [dbo].[masalar]  WITH CHECK ADD  CONSTRAINT [FK_masalar_servisturu] FOREIGN KEY([SERVISTURU])
REFERENCES [dbo].[servisturu] ([ID])
GO
ALTER TABLE [dbo].[masalar] CHECK CONSTRAINT [FK_masalar_servisturu]
GO
ALTER TABLE [dbo].[musteriHareketleri]  WITH CHECK ADD  CONSTRAINT [FK_musteriHareketleri_musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[musteriler] ([ID])
GO
ALTER TABLE [dbo].[musteriHareketleri] CHECK CONSTRAINT [FK_musteriHareketleri_musteriler]
GO
ALTER TABLE [dbo].[musteriYolHizmeti]  WITH CHECK ADD  CONSTRAINT [FK_musteriYolHizmeti_musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[musteriler] ([ID])
GO
ALTER TABLE [dbo].[musteriYolHizmeti] CHECK CONSTRAINT [FK_musteriYolHizmeti_musteriler]
GO
ALTER TABLE [dbo].[musteriYolHizmeti]  WITH CHECK ADD  CONSTRAINT [FK_musteriYolHizmeti_personeller] FOREIGN KEY([PERSONELID])
REFERENCES [dbo].[personeller] ([ID])
GO
ALTER TABLE [dbo].[musteriYolHizmeti] CHECK CONSTRAINT [FK_musteriYolHizmeti_personeller]
GO
ALTER TABLE [dbo].[personelHareketleri]  WITH CHECK ADD  CONSTRAINT [FK_personelHareketleri_personeller] FOREIGN KEY([PERSONELID])
REFERENCES [dbo].[personeller] ([ID])
GO
ALTER TABLE [dbo].[personelHareketleri] CHECK CONSTRAINT [FK_personelHareketleri_personeller]
GO
ALTER TABLE [dbo].[personeller]  WITH CHECK ADD  CONSTRAINT [FK_personeller_personelGorevleri] FOREIGN KEY([GOREVID])
REFERENCES [dbo].[personelGorevleri] ([ID])
GO
ALTER TABLE [dbo].[personeller] CHECK CONSTRAINT [FK_personeller_personelGorevleri]
GO
ALTER TABLE [dbo].[Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyonlar_adisyonlar] FOREIGN KEY([ADISYINID])
REFERENCES [dbo].[adisyonlar] ([ID])
GO
ALTER TABLE [dbo].[Rezervasyonlar] CHECK CONSTRAINT [FK_Rezervasyonlar_adisyonlar]
GO
ALTER TABLE [dbo].[Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyonlar_masalar] FOREIGN KEY([MASAID])
REFERENCES [dbo].[masalar] ([ID])
GO
ALTER TABLE [dbo].[Rezervasyonlar] CHECK CONSTRAINT [FK_Rezervasyonlar_masalar]
GO
ALTER TABLE [dbo].[Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyonlar_musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[musteriler] ([ID])
GO
ALTER TABLE [dbo].[Rezervasyonlar] CHECK CONSTRAINT [FK_Rezervasyonlar_musteriler]
GO
ALTER TABLE [dbo].[satislar]  WITH CHECK ADD  CONSTRAINT [FK_satislar_adisyonlar] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[adisyonlar] ([ID])
GO
ALTER TABLE [dbo].[satislar] CHECK CONSTRAINT [FK_satislar_adisyonlar]
GO
ALTER TABLE [dbo].[satislar]  WITH CHECK ADD  CONSTRAINT [FK_satislar_masalar] FOREIGN KEY([MASAID])
REFERENCES [dbo].[masalar] ([ID])
GO
ALTER TABLE [dbo].[satislar] CHECK CONSTRAINT [FK_satislar_masalar]
GO
ALTER TABLE [dbo].[satislar]  WITH CHECK ADD  CONSTRAINT [FK_satislar_urunler] FOREIGN KEY([URUNID])
REFERENCES [dbo].[urunler] ([ID])
GO
ALTER TABLE [dbo].[satislar] CHECK CONSTRAINT [FK_satislar_urunler]
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD  CONSTRAINT [FK_urunler_kategoriler] FOREIGN KEY([KATEGORIID])
REFERENCES [dbo].[kategoriler] ([ID])
GO
ALTER TABLE [dbo].[urunler] CHECK CONSTRAINT [FK_urunler_kategoriler]
GO
ALTER TABLE [dbo].[Vale]  WITH CHECK ADD  CONSTRAINT [FK_Vale_personeller] FOREIGN KEY([ID])
REFERENCES [dbo].[personeller] ([ID])
GO
ALTER TABLE [dbo].[Vale] CHECK CONSTRAINT [FK_Vale_personeller]
GO
ALTER TABLE [dbo].[yonetici]  WITH CHECK ADD  CONSTRAINT [FK_yonetici_personeller] FOREIGN KEY([ID])
REFERENCES [dbo].[personeller] ([ID])
GO
ALTER TABLE [dbo].[yonetici] CHECK CONSTRAINT [FK_yonetici_personeller]
GO
/****** Object:  StoredProcedure [dbo].[PersonellerGiris]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[PersonellerGiris]
@ID int,


@PAROLA nvarchar(50)



As
Begin
Select * from personeller where ID=@ID and PAROLA=@PAROLA
End
GO
/****** Object:  StoredProcedure [dbo].[sp_adisyonlar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_adisyonlar]
(

@MasaId int


)

AS

BEGIN

Select top 1 ID From adisyonlar where MASAID=@MasaId order by ID desc

END
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriler]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kategoriler]
(

@KATEGORIID int


)

AS

BEGIN

Select URUNAD,FİYAT,urunler.ID FROM 
kategoriler INNER JOIN urunler on kategoriler.ID=urunler.KATEGORIID
WHERE urunler.KATEGORIID=@KATEGORIID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Masalar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Masalar]

(

@TableId int,
@state int

)

AS

BEGIN

Select DURUM From masalar where ID=@TableId and 
DURUM=@state

END
GO
/****** Object:  StoredProcedure [dbo].[sp_MasalarBirlestir]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MasalarBirlestir]

(

@durum Bit 

)

AS

BEGIN

Select TARIH,MASAID  From adisyonlar Right Join masalar on adisyonlar.MASAID=masalar.ID Where masalar.DURUM=@durum and
adisyonlar.Durum=0

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PersonelHareketleri]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PersonelHareketleri]
 (@personelId int ,
 @islem NVARCHAR(50),
  @tarih DateTime 
 
 )
AS
INSERT INTO personelHareketleri(PERSONELID,ISLEM,TARIH) VALUES(@personelId, @islem,@tarih)
GO
/****** Object:  StoredProcedure [dbo].[sp_satislar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_satislar]
(

@AdisyonId int


)

AS

BEGIN

Select URUNAD,FİYAT,satislar.ID,satislar.URUNID,satislar.ADET FROM 
satislar INNER JOIN urunler on satislar.URUNID=urunler.ID
WHERE ADISYONID=@AdisyonId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Masalar]    Script Date: 10.12.2017 22:44:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_Masalar]

(

@MasaDurum int,
@Masano int

)

AS

BEGIN

Update masalar Set MASADURUM=@MasaDurum
Where ID=@Masano
END
GO
USE [master]
GO
ALTER DATABASE [izrest] SET  READ_WRITE 
GO
