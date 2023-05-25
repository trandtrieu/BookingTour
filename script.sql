USE [master]
GO
/****** Object:  Database [bookingProject]    Script Date: 5/24/2023 8:42:22 PM ******/
CREATE DATABASE [bookingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookingProject', FILENAME = N'C:\SQL_DBI_PROJECTS\bookingProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookingProject_log', FILENAME = N'C:\SQL_DBI_PROJECTS\bookingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookingProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookingProject] SET RECOVERY FULL 
GO
ALTER DATABASE [bookingProject] SET  MULTI_USER 
GO
ALTER DATABASE [bookingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookingProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookingProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookingProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookingProject', N'ON'
GO
ALTER DATABASE [bookingProject] SET QUERY_STORE = OFF
GO
USE [bookingProject]
GO
/****** Object:  User [trandtrieu123]    Script Date: 5/24/2023 8:42:22 PM ******/
CREATE USER [trandtrieu123] FOR LOGIN [trandtrieu123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [trandtrieu]    Script Date: 5/24/2023 8:42:22 PM ******/
CREATE USER [trandtrieu] FOR LOGIN [trandtrieu] WITH DEFAULT_SCHEMA=[trandtrieu]
GO
/****** Object:  Schema [trandtrieu]    Script Date: 5/24/2023 8:42:22 PM ******/
CREATE SCHEMA [trandtrieu]
GO
/****** Object:  Table [dbo].[account]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [nvarchar](50) NOT NULL,
	[passwork] [nvarchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[isType] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bannerLink] [nvarchar](150) NOT NULL,
	[introduce] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[idFeedback] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[review] [nvarchar](max) NOT NULL,
	[rating] [nchar](10) NOT NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[idFeedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[hotelId] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [nvarchar](50) NOT NULL,
	[hotelStar] [int] NOT NULL,
	[hotelDetail] [nvarchar](max) NOT NULL,
	[hotelImage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[hotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[placeId] [int] IDENTITY(1,1) NOT NULL,
	[placeName] [nvarchar](50) NOT NULL,
	[placeContent] [nvarchar](max) NOT NULL,
	[placeImage] [nvarchar](50) NOT NULL,
	[regionId] [int] NOT NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[placeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[regionId] [int] IDENTITY(1,1) NOT NULL,
	[regionName] [nvarchar](max) NULL,
	[regionImage] [nvarchar](max) NULL,
	[regionDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[tourId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[detail] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[placeId] [int] NOT NULL,
	[hotelId] [int] NULL,
	[guideId] [int] NULL,
	[vehicleId] [int] NULL,
	[scheduleId] [int] NULL,
	[regionId] [int] NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[tourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourGuider]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tourGuider](
	[guideId] [int] IDENTITY(1,1) NOT NULL,
	[guideName] [nvarchar](50) NOT NULL,
	[guideAge] [int] NOT NULL,
	[guideImage] [nvarchar](50) NOT NULL,
	[guideEmail] [nvarchar](50) NOT NULL,
	[guidePhone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_tourGuider] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[idUser] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[sex] [bit] NOT NULL,
	[address] [nvarchar](250) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[isType] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 5/24/2023 8:42:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[vehicleId] [int] IDENTITY(1,1) NOT NULL,
	[vehicleName] [nvarchar](50) NULL,
	[vehicleType] [nvarchar](50) NULL,
	[vehicleSeat] [int] NULL,
	[vehicleImage] [nvarchar](max) NULL,
	[vehicleDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_vehicle] PRIMARY KEY CLUSTERED 
(
	[vehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([username], [passwork], [id], [idUser], [isType]) VALUES (N'trandtrieu', N'trandtrieu', 4, 1, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (1, N'Muong Thanh Hotel', 5, N'qrwweu qwewe ', N'trieu.jpg')
INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (2, N'Lotte Hotel', 3, N'qwewqewq e', N'pink.jpg')
INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (3, N'Vinpearl', 5, N'uqwnasd âsd', N'vinpearl.jpg')
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[place] ON 

INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (1, N'Da Nang', N'sdf sdafsdfẻtgewuhjewrih', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (2, N'Quang Nam', N'asdasdasdasd a ádasw', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (3, N'Quang Tri', N'asdasdasdasd a ádasw', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (4, N'Ha Noi', N'asdasdasdasd a ádasw', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (5, N'Ninh Binh', N'asdasdasdasd a ádasw', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (6, N'Ho Chi Minh', N'asdasdasdasd a ádasw', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (7, N'Lam Dong', N'asdasdasdasd a ádasw', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (8, N'Quang Nam', N'asdasdasdasd a ádasw', N'trieu.jpg', 2)
SET IDENTITY_INSERT [dbo].[place] OFF
GO
SET IDENTITY_INSERT [dbo].[region] ON 

INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (1, N'Miền Bắc', N'bac.jpg', N'mien bac ơ phia bac')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (2, N'Miền Trung', N'trung.jpg', N'mien trungo phia nam')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (3, N'Miền Nam', N'nam.jpg', N'mien nam o phianam')
SET IDENTITY_INSERT [dbo].[region] OFF
GO
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (1, N'Tour Đà Nẵng- Hội An', 1000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 1, 1, 2, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (2, N'Tour Châu Đốc- lễ Bà CHúa', 2000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'Bãi biển Mỹ Khê Đà Nẵng được đánh giá là một trong những bãi biển quyến rũ nhất hành tinh, là địa điểm du lịch ai cũng nên đến ít nhất 1 lần trong đời. Cùng tham khảo kinh nghiệm đi bãi biển Mỹ Khê Đà Nẵng chi tiết, đầy đủ nhất trong bài viết.

Bãi biển Mỹ Khê Đà Nẵng với những bãi cát mịn, trắng trải dài, nước biển trong xanh, sóng êm đềm và nước ấm quanh năm là địa chỉ “xê dịch” bạn tuyệt đối không nên bỏ qua. Biển Mỹ Khê nằm ngay thành phố Đà Nẵng, thành phố du lịch hiện đại, phát triển nên việc du lịch vô cùng thuận tiện, dễ dàng.', N'about-1.jpg', 0, 1, 2, 12, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (3, N'du lich Hoi An', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'asdasdasdasd', N'about-1.jpg', 0, 2, 2, 2, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (4, N'TOUR NHA TRANG - ĐẢO YẾN - HÒN NỘI - ĐẢO ĐIỆP SƠN', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 8, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (5, N'Tour Nha Trang', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 2, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (6, N'du lich Hoi An', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 5, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (7, N'du lich Phú Quốc', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 9, NULL, NULL, 3)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (8, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (9, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (10, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (11, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (12, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (13, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (14, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (15, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (16, N'du lich Quang Bình', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 3)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (17, N'du lich Quang ', 5000, CAST(N'2023-05-05' AS Date), CAST(N'2023-07-05' AS Date), N'ádasdasd', N'about-1.jpg', 0, 2, 2, 6, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[tour] OFF
GO
SET IDENTITY_INSERT [dbo].[tourGuider] ON 

INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (2, N'Trần Đình Triều', 20, N'trieu1.jpg', N'trieutdde160152@fpt.edu.vn', N'0789458707')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (5, N'Nguyễn Văn Nhật Linh', 21, N'team-1.jpg', N'linh@gmail.com', N'0679327323')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (6, N'Phan Đình Đàn', 20, N'team-1.jpg', N'dan@gmail.com', N'0234324234')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (8, N'Nguyễn Văn Bình', 21, N'team-2.jpg', N'binh@gmail.com', N'0283423422')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (9, N'Hải Nam', 22, N'team-3.jpg', N'nam@gmail.com', N'0998343333')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone]) VALUES (12, N'Trần Thư', 22, N'team-4.jpg', N'thu@gmail.com', N'0923743222')
SET IDENTITY_INSERT [dbo].[tourGuider] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([idUser], [name], [age], [sex], [address], [phone], [email], [isType]) VALUES (1, N'trieu', 20, 0, N'quang nam', N'0789458707', N'trandtriru@gmail.acom', 1)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_user] FOREIGN KEY([idUser])
REFERENCES [dbo].[user] ([idUser])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_user]
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD  CONSTRAINT [FK_feedback_user] FOREIGN KEY([idUser])
REFERENCES [dbo].[user] ([idUser])
GO
ALTER TABLE [dbo].[feedback] CHECK CONSTRAINT [FK_feedback_user]
GO
ALTER TABLE [dbo].[place]  WITH CHECK ADD  CONSTRAINT [FK_place_region] FOREIGN KEY([regionId])
REFERENCES [dbo].[region] ([regionId])
GO
ALTER TABLE [dbo].[place] CHECK CONSTRAINT [FK_place_region]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_hotel] FOREIGN KEY([hotelId])
REFERENCES [dbo].[hotel] ([hotelId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_hotel]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_place] FOREIGN KEY([placeId])
REFERENCES [dbo].[place] ([placeId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_place]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_region] FOREIGN KEY([regionId])
REFERENCES [dbo].[region] ([regionId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_region]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_tourGuider] FOREIGN KEY([guideId])
REFERENCES [dbo].[tourGuider] ([guideId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_tourGuider]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_vehicle] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[vehicle] ([vehicleId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_vehicle]
GO
USE [master]
GO
ALTER DATABASE [bookingProject] SET  READ_WRITE 
GO
