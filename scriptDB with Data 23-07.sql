USE [master]
GO
/****** Object:  Database [ChildCareSystem]    Script Date: 7/23/2021 10:54:54 PM ******/
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
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminID] [int] IDENTITY(400000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
 CONSTRAINT [PK__tblAdmin__3BA2AA8148129CBB] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 7/23/2021 10:54:54 PM ******/
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
	[OnSlider] [bit] NOT NULL,
 CONSTRAINT [PK__tblBlog__54379E50B2E9DFD1] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlogCategory]    Script Date: 7/23/2021 10:54:54 PM ******/
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
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 7/23/2021 10:54:54 PM ******/
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
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK__tblCusto__A4AE64B8F0051E26] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 7/23/2021 10:54:54 PM ******/
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
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK__tblFeedb__6A4BEDF6177139FD] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIdentity]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIdentity](
	[IdentityID] [int] IDENTITY(10000,1) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[RoleID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK__tblIdent__30667A25CED708AD] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManager]    Script Date: 7/23/2021 10:54:54 PM ******/
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
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
 CONSTRAINT [PK__tblManag__3BA2AA81B260DF43] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalExamination]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalExamination](
	[ExaminationID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Prescription] [nvarchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK__tblMedic__C4A924C0BD77E847] PRIMARY KEY CLUSTERED 
(
	[ExaminationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOpenTime]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOpenTime](
	[OpenTimeID] [int] IDENTITY(1,1) NOT NULL,
	[OpenTime] [time](7) NOT NULL,
 CONSTRAINT [PK_tblOpenTime] PRIMARY KEY CLUSTERED 
(
	[OpenTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatient]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[Birthday] [date] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK__tblPatie__970EC346C545E187] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReservation]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StaffAssignedID] [int] NOT NULL,
	[IntervalTimeID] [int] NOT NULL,
	[CheckInTime] [datetime] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [datetime] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK__tblReser__B7EE5F04B35B530A] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/23/2021 10:54:54 PM ******/
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
/****** Object:  Table [dbo].[tblService]    Script Date: 7/23/2021 10:54:54 PM ******/
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
	[Price] [float] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedPersonID] [int] NOT NULL,
 CONSTRAINT [PK__tblServi__C51BB0EA74F7B74F] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSpecialty]    Script Date: 7/23/2021 10:54:54 PM ******/
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
/****** Object:  Table [dbo].[tblStaff]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[StaffID] [int] IDENTITY(200000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK__tblStaff__96D4AAF71D06CEB4] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSystemSetting]    Script Date: 7/23/2021 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSystemSetting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [varchar](100) NOT NULL,
	[SettingValue] [varchar](100) NOT NULL,
	[AdminID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblSystemSetting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([AdminID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (400000, 10017, CAST(N'2021-06-30' AS Date), NULL, N'Nguyen Vo Bao Nguyen', N'0899156326', N'50/30/14 Duong Quang Ham', CAST(N'2001-06-26' AS Date), N'079201030075')
INSERT [dbo].[tblAdmin] ([AdminID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (400001, 10019, CAST(N'2021-07-02' AS Date), NULL, N'Lê Khôi', N'0931155341', N'410 Điện Biên Phủ', CAST(N'2001-03-20' AS Date), N'012345678935')
INSERT [dbo].[tblAdmin] ([AdminID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (400002, 10023, CAST(N'2021-07-23' AS Date), NULL, N'Lê Tài', N'0901122399', N'Le Van Viet Q9', CAST(N'1999-02-05' AS Date), N'012345678912')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (40, N'blog1.png', N'Cứu sống nhiều trường hợp sốc sốt xuất huyết ở trẻ dư cân', 10018, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Tuần qua Bệnh viện Nhi Đồng Th&agrave;nh Phố tiếp nhận 5 trường hợp trẻ sốc sốt xuất huyết ở trẻ dư c&acirc;n, b&eacute;o ph&igrave;, gồm c&aacute;c trẻ L. T.Kh. nam 10 tuổi, 51kg (b&igrave;nh thường ở tuổi n&agrave;y 28-30 kg), Ng. Th. Nh. 9 tuổi, nam, 55 kg, (b&igrave;nh thường ở tuổi n&agrave;y 26-28 kg), L. Tr. K. 11 tuổi, nam, c&acirc;n nặng 56kg (b&igrave;nh thường ở tuổi n&agrave;y 30-32 kg),đều ngụ ở B&igrave;nh T&acirc;n, Th&agrave;nh phố Hồ Ch&iacute; Minh, Ng. G. H. 6 tuổi, nam, c&acirc;n nặng 32kg (b&igrave;nh thường ở tuổi n&agrave;y 20-22 kg),ngụ tại T&acirc;n Bi&ecirc;n, T&acirc;y Ninh, D. P. 11 tuổi, nam, cận nặng 56 kg ((b&igrave;nh thường ở tuổi n&agrave;y 34-36 kg), ngụ An B&igrave;nh, Ki&ecirc;n Giang.</span></p>
<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Khai th&aacute;c bệnh sử ghi nhận c&aacute;c trẻ sốt cao li&ecirc;n tục 4 ng&agrave;y k&egrave;m nhức đầu, đau m&igrave;nh mẩy, &oacute;i mửa, Ng&agrave;y 5 c&aacute;c trẻ biểu hiện đau bụng, tay ch&acirc;n lạnh, mệt n&ecirc;n nhập viện địa phương được chẩn đo&aacute;n sốc sốt xuất huyết điều trị truyền dịch chống sốc, chuyển Bệnh viện Nhi Đồng Th&agrave;nh Phố.</span></p>', 4, CAST(N'2021-07-23T21:49:31.220' AS DateTime), CAST(N'2021-07-23T21:49:31.213' AS DateTime), 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (41, N'blog2.jpg', N'Nấu ăn giúp phát triển tình cảm của trẻ', 10018, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Nh&agrave; bếp l&agrave; nơi tuyệt vời để trẻ em thử những điều mới v&agrave; kh&aacute;m ph&aacute;. Cha mẹ c&oacute; thể sử dụng việc nấu ăn như một cơ hội để gi&uacute;p trẻ ph&aacute;t triển c&aacute;c kỹ năng x&atilde; hội v&agrave; t&igrave;nh cảm.&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Cha mẹ khuyến kh&iacute;ch trẻ tham gia c&aacute;c hoạt động ở nh&agrave; bếp, tạo cơ hội d&agrave;nh thời gian chất lượng cho nhau. Trước khi cha mẹ xem x&eacute;t c&aacute;c bước trong qu&aacute; tr&igrave;nh nấu ăn, th&ocirc;ng qua đ&oacute; hỗ trợ cảm x&uacute;c cho trẻ. Dưới đ&acirc;y l&agrave; một số mẹo thiết thực để gi&uacute;p cha mẹ l&agrave;m cho hoạt động trở n&ecirc;n th&uacute; vị v&agrave; an to&agrave;n:&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Đảm bảo thực phẩm được xử l&yacute; hợp vệ sinh. Dạy trẻ rửa tay v&agrave; những việc cần l&agrave;m khi xử l&yacute; c&aacute;c nguy&ecirc;n liệu như thịt sống.</span></p>', 3, CAST(N'2021-07-23T21:52:04.713' AS DateTime), CAST(N'2021-07-23T21:52:04.710' AS DateTime), 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (42, N'blog3.png', N'Những điều cần biết khi tiêm Vắc xin AstraZeneca', 10020, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Đến ng&agrave;y 04/05/2021, 341 nh&acirc;n vi&ecirc;n đ&atilde; ho&agrave;n tất ti&ecirc;m vắc-xin ngừa COVID-19 2 liều v&agrave; 735 nh&acirc;n vi&ecirc;n ho&agrave;n tất ti&ecirc;m 1 liều. Trong cuộc chiến d&agrave;i hạn với đại dịch COVID-19, hy vọng &ldquo;h&agrave;ng r&agrave;o bảo vệ sinh học&rdquo; sẽ tiếp th&ecirc;m sức mạnh v&agrave; &yacute; ch&iacute; cho đội ngũ tuyến đầu trong c&ocirc;ng t&aacute;c ph&ograve;ng chống dịch. Bệnh viện Nhi Đồng Th&agrave;nh phố đảm bảo m&ocirc;i trường an to&agrave;n cho qu&yacute; th&acirc;n nh&acirc;n bệnh nh&acirc;n đến thăm kh&aacute;m cũng như g&oacute;p phần bảo vệ, chăm s&oacute;c v&agrave; n&acirc;ng cao sức khỏe người d&acirc;n trong giai đoạn hiện nay.</span></p>', 3, CAST(N'2021-07-23T22:07:08.467' AS DateTime), CAST(N'2021-07-23T22:07:08.467' AS DateTime), 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (43, N'blog4.png', N'Ngày môi trường thế giới', 10020, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Ng&agrave;y 5 th&aacute;ng 6 từ năm 1972 Ng&agrave;y M&ocirc;i trường Thế giới được Đại Hội đồng Li&ecirc;n Hiệp Quốc đ&atilde; quyết định chọn v&agrave; giao cho Chương tr&igrave;nh M&ocirc;i trường (UNEP) của Li&ecirc;n Hiệp Quốc c&oacute; trụ sở tại Nairobi, Ng&agrave;y M&ocirc;i trường Thế giới (tiếng Anh: World Environment Day &ndash; viết tắt: WED).&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Ng&agrave;y 5 th&aacute;ng 6 năm 1972, nh&acirc;n ng&agrave;y khai mạc Hội nghị M&ocirc;i trường Thế giới đầu ti&ecirc;n tổ chức tại Stockholm, Thụy Điển, Ng&agrave;y M&ocirc;i trường thế giới đ&atilde; ch&iacute;nh thức được c&ocirc;ng bố bởi Chương tr&igrave;nh M&ocirc;i trường Li&ecirc;n Hiệp Quốc (United Nations Environment Programme). Trong phi&ecirc;n họp ng&agrave;y 15 th&aacute;ng 12 năm 1972, Đại hội đồng Li&ecirc;n Hiệp Quốc đ&atilde; ra quyết nghị ch&iacute;nh thức. Kể từ đ&oacute;, hơn 150 quốc gia tr&ecirc;n thế giới đ&atilde; hưởng ứng tham gia v&agrave;o ng&agrave;y kỷ niệm n&agrave;y. C&aacute;ch hoạt động hưởng ứng thường được tổ chức trong tuần lễ quanh ng&agrave;y 5 th&aacute;ng 6 h&agrave;ng năm.</span></p>', 1, CAST(N'2021-07-23T22:08:45.047' AS DateTime), CAST(N'2021-07-23T22:08:45.047' AS DateTime), 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (44, N'blog5.jpg', N'Quyết không để bị động trước sự “tấn công” của SARS-CoV-2', 10022, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">G&aacute;c lại những lo lắng về số lượt kh&aacute;m chữa bệnh ngoại tr&uacute; v&agrave; nội tr&uacute; tiếp tục giảm đ&aacute;ng kể, hầu hết giảm tr&ecirc;n 60%-70% (so với những năm c&ugrave;ng kỳ khi chưa c&oacute; dịch) g&acirc;y t&aacute;c động lớn đến nguồn thu v&agrave; khả năng tự chủ t&agrave;i ch&iacute;nh của mỗi bệnh viện, tập thể l&atilde;nh đạo v&agrave; nh&acirc;n vi&ecirc;n y tế c&aacute;c bệnh viện tr&ecirc;n địa b&agrave;n th&agrave;nh phố đang nỗ lực hết m&igrave;nh, quyết kh&ocirc;ng để bị động trước sự &ldquo;tấn c&ocirc;ng&rdquo; của vi-r&uacute;t SARS-CoV-2 v&agrave; phải l&agrave; chốt chặn an to&agrave;n cho cả hệ thống y tế trong c&ocirc;ng t&aacute;c ph&ograve;ng chống dịch COVID-19.</span></p>', 4, CAST(N'2021-07-23T22:10:45.853' AS DateTime), CAST(N'2021-07-23T22:10:45.853' AS DateTime), 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (45, N'blog6.png', N'Bệnh viện Nhi Đồng Thành Phố đủ điều kiện xét nghiệm RT-PCR SARS-COV-2', 10022, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">X&eacute;t nghiệm sinh học ph&acirc;n tử Realtime &ndash; PCR l&agrave; một phương ph&aacute;p x&eacute;t nghiệm x&aacute;c định sự hiện diện của virut th&ocirc;ng qua ph&aacute;t hiện vật liệu di truyền của virut SARS-CoV-2, đ&acirc;y l&agrave; phương ph&aacute;p c&oacute; độ ch&iacute;nh x&aacute;c cao. Tuy nhi&ecirc;n phương ph&aacute;p n&agrave;y đ&ograve;i hỏi c&aacute;c hệ thống m&aacute;y chuy&ecirc;n dụng v&agrave; thực hiện tại ph&ograve;ng th&iacute; nghiệm.&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Đầu năm 2020, trong khi cả nước đang chuẩn bị đ&oacute;n Tết Canh T&yacute;, ng&agrave;y 23/1/2020 (tức 29 Tết) ng&agrave;nh y tế th&ocirc;ng b&aacute;o ph&aacute;t hiện 2 ca mắc COVID-19 đầu ti&ecirc;n tại Việt Nam tại TP.HCM. Ngay sau khi ph&aacute;t hiện ca mắc đầu ti&ecirc;n, Bộ Y tế đ&atilde; khẩn trương tổ chức triển khai c&aacute;c biện ph&aacute;p ph&ograve;ng chống, b&aacute;o c&aacute;o, tham mưu v&agrave; đề xuất với Ch&iacute;nh phủ v&agrave; Thủ tướng Ch&iacute;nh phủ c&aacute;c giải ph&aacute;p ph&ograve;ng, chống dịch bệnh, một trong những biện ph&aacute;p n&agrave;y l&agrave; thực hiện x&eacute;t nghiệm rộng r&atilde;i cho c&aacute;c đối tượng nghi ngờ, đối tượng c&oacute; nguy cơ cao.</span></p>', 4, CAST(N'2021-07-23T22:12:07.467' AS DateTime), CAST(N'2021-07-23T22:12:07.463' AS DateTime), 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (46, N'blog7.jpg', N'5 điều COVID tác động đến sức khỏe tinh thần của trẻ', 10022, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Những ảnh hưởng của đại dịch đối với những người trẻ tuổi như: sự gia tăng c&aacute;c triệu chứng b&ecirc;n trong (chẳng hạn như lo lắng v&agrave; trầm cảm), c&aacute;c triệu chứng b&ecirc;n ngo&agrave;i (chẳng hạn như h&agrave;nh vi g&acirc;y rối v&agrave; chống đối) v&agrave; c&aacute;c triệu chứng cơ thể (như đau đầu v&agrave; đau bụng) ở trẻ em v&agrave; thanh thiếu ni&ecirc;n kể từ khi COVID -19 b&ugrave;ng ph&aacute;t. C&oacute; một số l&yacute; do khiến sức khỏe t&acirc;m thần của trẻ em bị ảnh hưởng trong thời gian n&agrave;y.&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Đại dịch đ&atilde; khiến cho trẻ thay đổi c&aacute;c th&oacute;i quen h&agrave;ng ng&agrave;y. Về cơ bản, tất cả trẻ em đi học phải thay đổi c&aacute;c th&oacute;i quen ở trường khi c&aacute;c trường học thực hiện c&aacute;c biện ph&aacute;p như học tập từ xa, r&uacute;t ngắn ng&agrave;y học, thực hiện gi&atilde;n c&aacute;ch v&agrave; đeo khẩu trang khi đến trường. C&aacute;c hoạt động sau giờ học v&agrave; c&aacute;c c&acirc;u lạc bộ thể dục thể thao, nhạc họa đột nhi&ecirc;n bị ngưng lại.</span></p>', 3, CAST(N'2021-07-23T22:14:39.687' AS DateTime), CAST(N'2021-07-23T22:14:39.683' AS DateTime), 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (47, N'blog8.jpg', N'Đảm bảo chất lượng nước sử dụng tại Bệnh viện', 10022, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Nhằm đ&aacute;p ứng nhu cầu sử dụng nước phục vụ hoạt động kh&aacute;m chữa bệnh, Bệnh viện ban h&agrave;nh Kế hoạch số 320/KH-BVNĐTP ng&agrave;y 12/3/2021 về việc gi&aacute;m s&aacute;t chất lượng m&ocirc;i trường năm 2021. Ng&agrave;y 07/4/2021, đội ngũ chuy&ecirc;n vi&ecirc;n đến từ Viện Y tế C&ocirc;ng cộng Th&agrave;nh phố Hồ Ch&iacute; Minh tiến h&agrave;nh lấy mẫu 10 mẫu tại hiện trường, vận chuyển v&agrave; kiểm nghiệm chất lượng tại ph&ograve;ng th&iacute; nghiệm, đ&aacute;p ứng c&aacute;c ti&ecirc;u ch&iacute; về kỹ thuật theo đ&uacute;ng quy tr&igrave;nh của Bộ Y tế.&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Hệ thống lọc nước tổng l&agrave; hệ thống lọc nước ngay tại đầu nguồn nhằm mang đến nguồn nước sạch d&ugrave;ng trong sinh hoạt v&agrave; sản xuất h&agrave;ng ng&agrave;y; gi&uacute;p loại bỏ c&aacute;c kim loại nặng, th&agrave;nh phần h&oacute;a học c&oacute; trong nước, loại bỏ cặn lắng, l&agrave;m mềm nước v&agrave; đặt biệt hạn chế sự x&acirc;m nhập của h&oacute;a chất độc hại khi hoạt động.</span></p>', 3, CAST(N'2021-07-23T22:16:49.007' AS DateTime), CAST(N'2021-07-23T22:16:49.003' AS DateTime), 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (48, N'blogstaff1.jpg', N'Quốc tế Thiếu nhi – Chia sẻ yêu thương giữa dịch bệnh COVID-19 ', 10024, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Dịp Quốc tế Thiếu nhi 1/6 năm nay, thật đ&aacute;ng tiếc khi kh&ocirc;ng thể tổ chức c&aacute;c hoạt động tập trung đ&ocirc;ng người do ảnh hưởng bởi t&igrave;nh h&igrave;nh dịch bệnh COVID-19, c&aacute;c Nh&agrave; hảo t&acirc;m đ&atilde; kh&ocirc;ng thể trực tiếp chia sẻ, đồng h&agrave;nh c&ugrave;ng hoạt động cho c&aacute;c Bệnh nhi tại Bệnh viện Nhi Đồng Th&agrave;nh Phố.&nbsp;</span><span style="background-color: #ffffff; color: #444444; font-family: Nunito, sans-serif; font-size: 16px;">Với tinh thần tr&aacute;ch nhiệm v&agrave; tấm l&ograve;ng nh&acirc;n &aacute;i, Ph&ograve;ng C&ocirc;ng t&aacute;c X&atilde; hội Bệnh viện Nhi đồng Th&agrave;nh phố vẫn lu&ocirc;n l&agrave; cầu nối y&ecirc;u thương, sẵn s&agrave;ng hỗ trợ Nh&agrave; hảo t&acirc;m tiếp nhận v&agrave; trao tặng những m&oacute;n qu&agrave; v&agrave; t&igrave;nh người ấm &aacute;p đến với c&aacute;c b&eacute; tại bệnh viện, đảm bảo tu&acirc;n thủ Quy tắc 5K &ndash; Chung sống an to&agrave;n với dịch bệnh COVID-19.</span></p>', 4, CAST(N'2021-07-23T22:43:34.950' AS DateTime), CAST(N'2021-07-23T22:43:34.950' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlogCategory] ON 

INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Giới thiệu')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Hướng dẫn')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (3, N'Sức khỏe')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (4, N'Tin tức')
SET IDENTITY_INSERT [dbo].[tblBlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [PhoneNumber]) VALUES (500002, 10004, CAST(N'2021-06-08T07:56:00.000' AS DateTime), NULL, N'Lê Hoàng Khôi', N'467/10 Điện Biên Phủ', CAST(N'2021-06-08' AS Date), N'012345678912', N'0931155350')
INSERT [dbo].[tblCustomer] ([CustomerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [PhoneNumber]) VALUES (500004, 10013, CAST(N'2021-06-23T23:37:00.000' AS DateTime), NULL, N'Nguyễn Võ Bảo Nguyên', N'50/30/14 Dương Quảng Hàm, Phường 5, Quận Gò Vấp', CAST(N'2000-06-25' AS Date), N'079201030078', N'0899156326')
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIdentity] ON 

INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10004, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-06-08' AS Date), NULL, 1, N'nguyenhoang01012001@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10013, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-23' AS Date), NULL, 1, N'nguyenseraph2625@outlook.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10017, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-30' AS Date), NULL, 4, N'nguyennvbse150944@fpt.edu.vn', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10018, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-07-02' AS Date), NULL, 3, N'khoilhse150854@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10019, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-07-02' AS Date), NULL, 4, N'khoile@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10020, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 3, N'nguyen@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10021, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 3, N'tran@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10022, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 3, N'tai@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10023, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 4, N'taiadmin@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10024, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyena@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10025, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyenb@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10026, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyenc@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10027, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyend@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10028, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyene@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10029, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyenf@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10030, N'15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', CAST(N'2021-07-23' AS Date), NULL, 2, N'nguyenh@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[tblIdentity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblManager] ON 

INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300001, 10018, CAST(N'2021-07-02T21:30:31.177' AS DateTime), NULL, N'Lê Hoàng Khôi', N'09311553987', N'467 Điện Biên Phủ', CAST(N'2001-05-24' AS Date), N'012345678912')
INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300002, 10020, CAST(N'2021-07-23T21:56:33.780' AS DateTime), NULL, N'Nguyễn Võ Bảo Nguyên', N'0901122333', N'Le Van Viet Q9', CAST(N'1999-05-20' AS Date), N'012345678909')
INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300003, 10021, CAST(N'2021-07-23T21:58:59.110' AS DateTime), NULL, N'Nguyễn Thị Bảo Trân', N'0909988999', N'Le Van Viet Q9', CAST(N'2000-02-19' AS Date), N'012345678934')
INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300004, 10022, CAST(N'2021-07-23T22:03:05.040' AS DateTime), NULL, N'Lê Anh Tài', N'0901122444', N'Le Van Viet Q9', CAST(N'1998-02-06' AS Date), N'012345678955')
SET IDENTITY_INSERT [dbo].[tblManager] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOpenTime] ON 

INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (1, CAST(N'08:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (2, CAST(N'09:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (3, CAST(N'10:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (4, CAST(N'11:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (5, CAST(N'14:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (6, CAST(N'15:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (7, CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[tblOpenTime] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatient] ON 

INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (30, N'Tài Lê', 0, 500002, CAST(N'2021-07-23' AS Date), NULL, CAST(N'2017-09-13' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (31, N'Trân Nguyễn', 1, 500002, CAST(N'2021-07-23' AS Date), NULL, CAST(N'2019-09-08' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (32, N'Bảo Nguyên', 0, 500002, CAST(N'2021-07-23' AS Date), NULL, CAST(N'2018-10-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblPatient] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReservation] ON 

INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (27, 500002, 31, 14, 200009, 2, CAST(N'2021-07-24T09:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:47:07.450' AS DateTime), 60)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (28, 500002, 32, 15, 200011, 3, CAST(N'2021-07-24T10:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:47:07.450' AS DateTime), 80)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (29, 500002, 30, 14, 200009, 6, CAST(N'2021-07-25T15:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:47:23.267' AS DateTime), 60)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (30, 500002, 32, 14, 200009, 4, CAST(N'2021-07-24T11:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:50:16.713' AS DateTime), 60)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (31, 500002, 32, 16, 200013, 7, CAST(N'2021-07-25T16:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:50:51.173' AS DateTime), 100)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (32, 500002, 31, 15, 200011, 7, CAST(N'2021-07-26T16:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:50:51.177' AS DateTime), 80)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (33, 500002, 31, 17, 200015, 1, CAST(N'2021-07-27T08:00:00.000' AS DateTime), CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23T22:51:28.780' AS DateTime), 95)
SET IDENTITY_INSERT [dbo].[tblReservation] OFF
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (1, N'Khách hàng')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (2, N'Nhân viên')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (3, N'Quản lí')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (4, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[tblService] ON 

INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (14, N'Khám mắt tổng quát', 2, N'service1.jpg', N'<p>Đ&ocirc;i mắt s&aacute;ng khỏe l&agrave; tiền đề để một đứa trẻ học tập tốt, h&ograve;a nhập tốt với cộng đồng. Thế nhưng, nhiều người vẫn chưa ch&uacute; &yacute; đến việc kh&aacute;m mắt cho trẻ.&nbsp;<span style="background-color: #ffffff; color: #333333; font-family: Asap, sans-serif; font-size: 16px; text-align: justify;">Tầm so&aacute;t mắt cho trẻ l&agrave; vấn đề cần được quan t&acirc;m hơn, gi&uacute;p ph&aacute;t hiện sớm v&agrave; kịp thời c&aacute;c bệnh về mắt ở trẻ để trẻ c&oacute; đ&ocirc;i mắt khỏe mạnh.</span></p>', 60, 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23' AS Date), 10021)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (15, N'Khám Tai mũi họng', 1, N'service2.jpg', N'<p><span style="background-color: #ffffff; color: #1e293b; font-family: -apple-system, BlinkMacSystemFont, ''segoe ui'', Roboto, ''helvetica neue'', Arial, ''noto sans'', sans-serif, ''apple color emoji'', ''segoe ui emoji'', ''segoe ui symbol'', ''noto color emoji''; font-size: 16px;">C&aacute;c bệnh về Tai &ndash; Mũi &ndash; Họng ở trẻ nếu kh&ocirc;ng được chữa trị đ&uacute;ng c&aacute;ch v&agrave; kịp thời sẽ dẫn đến nhiều biến chứng ảnh hưởng xấu đến sức khoẻ của trẻ nhỏ. </span><span style="color: #1e293b; font-family: -apple-system, BlinkMacSystemFont, ''segoe ui'', Roboto, ''helvetica neue'', Arial, ''noto sans'', sans-serif, ''apple color emoji'', ''segoe ui emoji'', ''segoe ui symbol'', ''noto color emoji''; font-size: 16px; background-color: #ffffff;">Một số trường hợp bệnh Tai Mũi Họng c&oacute; thể kh&ocirc;ng g&acirc;y nguy hiểm cho con nhưng phần lớn vẫn cần cha mẹ ch&uacute; &yacute; quan s&aacute;t biểu hiện bất thường để kịp thời đưa con đến gặp B&aacute;c sĩ.&nbsp;</span></p>', 80, 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23' AS Date), 10021)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (16, N'Khám đường hô hấp', 7, N'service3.jpg', N'<p>Bệnh h&ocirc; hấp rất phổ biến ở trẻ em, kể cả trẻ sơ sinh v&agrave; trẻ nhỏ. Những bệnh l&yacute; nầy cần được thăm kh&aacute;m v&agrave; điều trị dứt điểm theo hướng dẫn của b&aacute;c sĩ chuy&ecirc;n khoa H&ocirc; hấp, nếu kh&ocirc;ng bệnh sẽ t&aacute;i đi t&aacute;i lại nhiều lần, trở th&agrave;nh bệnh mạn t&iacute;nh kh&oacute; chữa khỏi.&nbsp;</p>', 100, 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23' AS Date), 10021)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (17, N'Khám tiêu hóa trẻ em', 9, N'service4.jpg', N'<p>Trẻ em vốn c&oacute; hệ ti&ecirc;u h&oacute;a yếu hơn so với người lớn. Do vậy m&agrave; trẻ cũng thường gặp c&aacute;c bệnh ti&ecirc;u h&oacute;a như ti&ecirc;u chảy, t&aacute;o b&oacute;n, tr&agrave;o ngược dạ d&agrave;y thực quản, rối loạn ti&ecirc;u h&oacute;a&hellip; Ba mẹ cần đặc biệt ch&uacute; &yacute; đến c&aacute;c triệu chứng bệnh v&agrave; đưa trẻ đi kh&aacute;m ngay để ph&ograve;ng ngừa những biến chứng nguy hiểm.&nbsp;</p>', 95, 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23' AS Date), 10021)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (18, N'Khám tim mạch trẻ em', 10, N'servicestaff1.jpg', N'<p>Trẻ em mắc bệnh tim mạch nếu kh&ocirc;ng được kh&aacute;m v&agrave; điều trị sớm, bệnh c&oacute; thể dẫn đến những ảnh hưởng nghi&ecirc;m trọng cho sức khỏe về sau n&agrave;y, thậm ch&iacute; c&oacute; nguy cơ g&acirc;y tử vong. Trẻ em mắc bệnh tim bẩm sinh thường c&oacute; những biểu hiện kh&aacute; r&otilde; rệt. Do đ&oacute;, cha mẹ của b&eacute; c&oacute; thể dễ d&agrave;ng nhận thấy dấu hiệu bất thường v&agrave; đến c&aacute;c cơ sở y tế để kh&aacute;m tim mạch cho trẻ em.&nbsp;</p>', 120, 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-07-23' AS Date), 10024)
SET IDENTITY_INSERT [dbo].[tblService] OFF
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
SET IDENTITY_INSERT [dbo].[tblStaff] ON 

INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200009, 10024, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn A', N'Le Van Viet Q9', CAST(N'1997-12-05' AS Date), N'012345678911', 2, N'0901122111')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200010, 10025, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn B', N'Le Van Viet Q9', CAST(N'1996-12-04' AS Date), N'012345678999', 2, N'0901122222')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200011, 10026, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn C', N'Le Van Viet Q9', CAST(N'1992-02-12' AS Date), N'012345678913', 1, N'0901122333')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200012, 10027, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn D', N'Le Van Viet Q9', CAST(N'2000-09-19' AS Date), N'012345678916', 1, N'0901122444')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200013, 10028, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn E', N'Le Van Viet Q9', CAST(N'1999-06-22' AS Date), N'012345678919', 7, N'0901122555')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200014, 10029, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn F', N'152/11 Nguyen Thi Tan', CAST(N'1997-08-23' AS Date), N'012345678922', 7, N'0901122777')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200015, 10030, CAST(N'2021-07-23' AS Date), NULL, N'Nguyễn Văn H', N'152/11 Nguyen Thi Tan', CAST(N'1999-06-13' AS Date), N'012345678929', 9, N'0901122666')
SET IDENTITY_INSERT [dbo].[tblStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSystemSetting] ON 

INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (3, N'Max Blog Post On Homepage', N'3', 400000, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (4, N'Max Service Post On Homepage', N'3', 400000, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (6, N'Max Patient Profile', N'4', 400000, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (9, N'Max Reservation', N'3', 400000, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-06-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblSystemSetting] OFF
GO
ALTER TABLE [dbo].[tblAdmin] ADD  CONSTRAINT [DF__tblAdmin__Create__49C3F6B7]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBlog] ADD  CONSTRAINT [DF__tblBlog__Created__571DF1D5]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBlog] ADD  CONSTRAINT [DF_tblBlog_OnSlider]  DEFAULT ((0)) FOR [OnSlider]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF__tblCustom__Creat__5441852A]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblIdentity] ADD  CONSTRAINT [DF__tblIdenti__Creat__398D8EEE]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblIdentity] ADD  CONSTRAINT [DF_tblIdentity_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[tblManager] ADD  CONSTRAINT [DF__tblManage__Creat__45F365D3]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblMedicalExamination] ADD  CONSTRAINT [DF__tblMedica__Creat__17036CC0]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPatient] ADD  CONSTRAINT [DF__tblPatien__Creat__73BA3083]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPatient] ADD  CONSTRAINT [DF_tblPatient_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[tblReservation] ADD  CONSTRAINT [DF_tblReservation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblReservation] ADD  CONSTRAINT [DF_tblReservation_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblService] ADD  CONSTRAINT [DF_tblService_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblStaff] ADD  CONSTRAINT [DF__tblStaff__Create__7E37BEF6]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD  CONSTRAINT [FK__tblAdmin__Identi__48CFD27E] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAdmin] CHECK CONSTRAINT [FK__tblAdmin__Identi__48CFD27E]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK__tblBlog__Categor__02FC7413] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblBlogCategory] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK__tblBlog__Categor__02FC7413]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblIdentity] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblIdentity]
GO
ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [FK__tblCustom__Ident__534D60F1] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCustomer] CHECK CONSTRAINT [FK__tblCustom__Ident__534D60F1]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Custo__0B91BA14] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Custo__0B91BA14]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Reser__16CE6296] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[tblReservation] ([ReservationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Reser__16CE6296]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Servi__0A9D95DB] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Servi__0A9D95DB]
GO
ALTER TABLE [dbo].[tblIdentity]  WITH CHECK ADD  CONSTRAINT [FK__tblIdenti__RoleI__3A81B327] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblIdentity] CHECK CONSTRAINT [FK__tblIdenti__RoleI__3A81B327]
GO
ALTER TABLE [dbo].[tblManager]  WITH CHECK ADD  CONSTRAINT [FK__tblManage__Ident__44FF419A] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblManager] CHECK CONSTRAINT [FK__tblManage__Ident__44FF419A]
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK__tblMedica__Reser__151B244E] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[tblReservation] ([ReservationID])
GO
ALTER TABLE [dbo].[tblMedicalExamination] CHECK CONSTRAINT [FK__tblMedica__Reser__151B244E]
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK__tblMedica__Servi__160F4887] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
GO
ALTER TABLE [dbo].[tblMedicalExamination] CHECK CONSTRAINT [FK__tblMedica__Servi__160F4887]
GO
ALTER TABLE [dbo].[tblPatient]  WITH CHECK ADD  CONSTRAINT [FK__tblPatien__Custo__72C60C4A] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPatient] CHECK CONSTRAINT [FK__tblPatien__Custo__72C60C4A]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Inter__41B8C09B] FOREIGN KEY([IntervalTimeID])
REFERENCES [dbo].[tblOpenTime] ([OpenTimeID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Inter__41B8C09B]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Staff__114A936A] FOREIGN KEY([StaffAssignedID])
REFERENCES [dbo].[tblStaff] ([StaffID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Staff__114A936A]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK_tblReservation_tblCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK_tblReservation_tblCustomer]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK_tblReservation_tblPatient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tblPatient] ([PatientID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK_tblReservation_tblPatient]
GO
ALTER TABLE [dbo].[tblService]  WITH CHECK ADD  CONSTRAINT [FK__tblServic__Speci__07C12930] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblService] CHECK CONSTRAINT [FK__tblServic__Speci__07C12930]
GO
ALTER TABLE [dbo].[tblService]  WITH CHECK ADD  CONSTRAINT [FK_tblService_tblIdentity] FOREIGN KEY([CreatedPersonID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
GO
ALTER TABLE [dbo].[tblService] CHECK CONSTRAINT [FK_tblService_tblIdentity]
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD  CONSTRAINT [FK__tblStaff__Identi__7D439ABD] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStaff] CHECK CONSTRAINT [FK__tblStaff__Identi__7D439ABD]
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD  CONSTRAINT [FK__tblStaff__Specia__7F2BE32F] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStaff] CHECK CONSTRAINT [FK__tblStaff__Specia__7F2BE32F]
GO
ALTER TABLE [dbo].[tblSystemSetting]  WITH CHECK ADD  CONSTRAINT [FK__tblSystem__Admin__628FA481] FOREIGN KEY([AdminID])
REFERENCES [dbo].[tblAdmin] ([AdminID])
GO
ALTER TABLE [dbo].[tblSystemSetting] CHECK CONSTRAINT [FK__tblSystem__Admin__628FA481]
GO
USE [master]
GO
ALTER DATABASE [ChildCareSystem] SET  READ_WRITE 
GO
