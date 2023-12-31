USE [master]
GO
/****** Object:  Database [Alten]    Script Date: 11/06/2023 16:16:27 ******/
CREATE DATABASE [Alten]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alten', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alten.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alten_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alten_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Alten] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alten].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alten] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alten] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alten] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alten] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alten] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alten] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alten] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alten] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alten] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alten] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alten] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alten] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alten] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alten] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alten] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alten] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alten] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alten] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alten] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alten] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alten] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alten] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alten] SET RECOVERY FULL 
GO
ALTER DATABASE [Alten] SET  MULTI_USER 
GO
ALTER DATABASE [Alten] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alten] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alten] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alten] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alten] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Alten] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Alten', N'ON'
GO
ALTER DATABASE [Alten] SET QUERY_STORE = OFF
GO
USE [Alten]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/06/2023 16:16:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[price] [int] NULL,
	[category] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[inventoryStatus] [nvarchar](50) NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Alten] SET  READ_WRITE 
GO
