USE [master]
GO
/****** Object:  Database [ChildCareSystem]    Script Date: 5/24/2021 7:51:59 PM ******/
CREATE DATABASE [ChildCareSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChildCareSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChildCareSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChildCareSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChildCareSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ChildCareSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChildCareSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChildCareSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChildCareSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChildCareSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChildCareSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChildCareSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChildCareSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChildCareSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChildCareSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChildCareSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ChildCareSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ChildCareSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChildCareSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChildCareSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChildCareSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChildCareSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChildCareSystem', N'ON'
GO
ALTER DATABASE [ChildCareSystem] SET QUERY_STORE = OFF
GO
USE [ChildCareSystem]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[ManagerID] [int] IDENTITY(400000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Thumbnail] [varchar](max) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[AuthorID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlogCategory]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlogCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tblBlogC__19093A2B947EEFE7] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerID] [int] IDENTITY(500000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIdentity]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIdentity](
	[IdentityID] [int] IDENTITY(10000,1) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManager]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManager](
	[ManagerID] [int] IDENTITY(300000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalExamination]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalExamination](
	[ExaminationID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[ServiceID] [int] NOT NULL,
	[Prescription] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExaminationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatient]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Birthday] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReservation]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StaffAssignedID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CustomerName] [nvarchar](10) NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[PatientName] [nvarchar](100) NOT NULL,
	[CustomerGender] [bit] NOT NULL,
	[PatientGender] [bit] NOT NULL,
	[CheckInTime] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__tblReser__B7EE5F04B35B530A] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblService](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[Thumbnail] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServicePayment]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServicePayment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSpecialty]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpecialty](
	[SpecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialtyName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaff]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[StaffID] [int] IDENTITY(200000,1) NOT NULL,
	[IdentityID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Birthday] [datetime] NULL,
	[CitizenID] [varchar](12) NULL,
	[SpecialtyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 5/24/2021 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tblStatu__C8EE2043023BEBB6] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBlogCategory] ON 

INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Giới thiệu')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Hướng dẫn')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (3, N'Sức khỏe')
SET IDENTITY_INSERT [dbo].[tblBlogCategory] OFF
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (1, N'Khách hàng')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (2, N'Nhân viên')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (3, N'Quản lí')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (4, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[tblSpecialty] ON 

INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (1, N'Tai-Mũi-Họng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (2, N'Mắt')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (3, N'Ngoại')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (4, N'Nội thần kinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (5, N'Ngoại thần kinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (6, N'Dinh dưỡng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (7, N'Hô hấp')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (8, N'Huyết học')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (9, N'Tiêu hóa')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (10, N'Tim mạch')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (11, N'Thận-Nội tiết')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (12, N'Da liễu')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (13, N'Dị ứng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (14, N'Sơ sinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (15, N'Răng-Hàm mặt')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (16, N'Tiêm chủng')
SET IDENTITY_INSERT [dbo].[tblSpecialty] OFF
GO
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (0, N'Đang chờ')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (1, N'Chấp thuận')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (2, N'Từ chối')
GO
ALTER TABLE [dbo].[tblAdmin] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBlog] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblIdentity] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblManager] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblMedicalExamination] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPatient] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblServicePayment] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblStaff] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[tblStaff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK__tblBlog__Categor__02FC7413] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblBlogCategory] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK__tblBlog__Categor__02FC7413]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK__tblBlog__StatusI__04E4BC85] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK__tblBlog__StatusI__04E4BC85]
GO
ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblIdentity]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblManager]  WITH CHECK ADD FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK__tblMedica__Reser__151B244E] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[tblReservation] ([ReservationID])
GO
ALTER TABLE [dbo].[tblMedicalExamination] CHECK CONSTRAINT [FK__tblMedica__Reser__151B244E]
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
GO
ALTER TABLE [dbo].[tblPatient]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Servi__10566F31] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Servi__10566F31]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Staff__114A936A] FOREIGN KEY([StaffAssignedID])
REFERENCES [dbo].[tblStaff] ([StaffID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Staff__114A936A]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Statu__123EB7A3] FOREIGN KEY([StatusID])
REFERENCES [dbo].[tblStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Statu__123EB7A3]
GO
ALTER TABLE [dbo].[tblService]  WITH CHECK ADD FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblServicePayment]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblServicePayment]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [ChildCareSystem] SET  READ_WRITE 
GO
