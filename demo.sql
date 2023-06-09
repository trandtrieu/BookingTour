USE [master]
GO
/****** Object:  Database [bookingProject]    Script Date: 5/28/2023 4:51:29 PM ******/
CREATE DATABASE [bookingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookingProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [trandtrieu123]    Script Date: 5/28/2023 4:51:30 PM ******/
CREATE USER [trandtrieu123] FOR LOGIN [trandtrieu123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [trandtrieu]    Script Date: 5/28/2023 4:51:30 PM ******/
CREATE USER [trandtrieu] FOR LOGIN [trandtrieu] WITH DEFAULT_SCHEMA=[trandtrieu]
GO
/****** Object:  Schema [trandtrieu]    Script Date: 5/28/2023 4:51:30 PM ******/
CREATE SCHEMA [trandtrieu]
GO
/****** Object:  Table [dbo].[account]    Script Date: 5/28/2023 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NULL,
	[password] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[phone] [int] NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[hotel]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[place]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[region]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[schedule]    Script Date: 5/28/2023 4:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[scheduleId] [int] IDENTITY(1,1) NOT NULL,
	[day1] [nvarchar](max) NULL,
	[day2] [nvarchar](max) NULL,
	[day3] [nvarchar](max) NULL,
	[day4] [nvarchar](max) NULL,
	[day5] [nvarchar](max) NULL,
	[day6] [nvarchar](max) NULL,
	[day7] [nvarchar](max) NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[tourGuider]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 5/28/2023 4:51:30 PM ******/
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
/****** Object:  Table [dbo].[vehicle]    Script Date: 5/28/2023 4:51:30 PM ******/
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

INSERT [dbo].[account] ([id], [username], [password], [email], [phone], [isAdmin]) VALUES (1, N'abc', N'123', N'abc@gmail.com', 123456789, 1)
INSERT [dbo].[account] ([id], [username], [password], [email], [phone], [isAdmin]) VALUES (3, N'admin', N'123', N'trieutdde160252@fpt.edu.vn', 867167237, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[hotel] ON 

INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (1, N'Muong Thanh Hotel', 5, N'qrwweu qwewe ', N'trieu.jpg')
INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (2, N'Lotte Hotel', 3, N'qwewqewq e', N'pink.jpg')
INSERT [dbo].[hotel] ([hotelId], [hotelName], [hotelStar], [hotelDetail], [hotelImage]) VALUES (3, N'Vinpearl', 5, N'uqwnasd âsd', N'vinpearl.jpg')
SET IDENTITY_INSERT [dbo].[hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[place] ON 

INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (1, N'Đà Nẵng', N'Du lịch Đà Nẵng – nơi được mệnh danh là “thành phố đáng đến nhất Việt Nam” – nơi đây đang dần trở thành điểm sáng của cả nước trong lĩnh vực du lịch, thu hút hàng triệu lượt du khách mỗi năm bởi vẻ trẻ trung, văn minh, và hiện đại.', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (2, N'Quảng Nam', N'Nhắc đến các địa điểm du lịch Quảng Nam, chắc hẳn ai ai cũng đều quá quen thuộc  phố cổ Hội An và thánh địa Mỹ Sơn, kinh đô cổ Trà Kiệu, các tháp chàm Khương Mỹ, Chiên Đàn, Bàng An, Phật viện Đồng Dương…ghi lại dấu ấn rực rỡ của nền văn hóa Sa Huỳnh, Champa, Đại Việt. Quảng Nam đã thu hút đông đảo khách du lịch trong và ngoài nước tới đây, bởi Quảng Nam là một mảnh đất tuy nghèo vật chất nhưng tự nhiên phú cho vùng đất này nhiều bãi tắm đẹp hấp dẫn cùng nhiều danh thắng được công nhận là di sản thế giới. ', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (3, N'Quảng Trị', N'Du lịch Quảng Trị hiện đang thu hút cả các bạn trẻ và nhiều du khách nước ngoài khi không chỉ sở hữu những trang lịch sử kháng chiến chống giặc đầy hào hùng mà còn có những thắng cảnh thiên nhiên thu hút.', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (4, N'Hà Nội', N'Hà Nội là điểm đến hấp dẫn nếu bạn muốn khám phá du lịch miền Bắc. Chuyến hành trình du lịch Hà Nội “gây thương nhớ” với du khách bởi một màu sắc rất riêng, “rất Hà Nội”. Đó là những phố cổ xưa cũ, các di tích lịch sử nhuộm màu thời gian và vô số địa điểm giải trí vui hết nấc khác.', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (5, N'Ninh Binh', N'Nhắc đến Ninh Bình có lẽ bạn sẽ nghĩ ngay đến vùng đất cố đô Hoa Lư trong những trang sử hào hùng. Nhưng bạn biết không, ngoài bề dày lịch sử, vùng đất này còn là nơi hội tụ vô vàn thắng cảnh thiên nhiên đẹp tựa tranh thơ như Tuyệt Tình Cốc, chùa Bái Đính hay Tràng An,...', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (6, N'Hồ Chí Minh', N'Sở hữu không gian đô thị đặc trưng, năng động và hiện đại, thành phố Hồ Chí Minh mang trong mình những giá trị văn hóa vật thể và phi vật thể đa dạng, dung hòa giữa đương đại và truyền thống, tạo nên sức hấp dẫn riêng biệt.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (7, N'Lâm Đồng', N'Du lịch Lâm Đồng một vùng đất được biết đến là một trong những trung tâm du lịch nghỉ dưỡng quan trong của cả nước. Lâm Đồng là một trong năm tỉnh thuộc vùng Tây Nguyên, có vị trí nằm trên cao nguyên Lâm Viên với độ cao khoảng 1.500m. Với địa hình chủ yếu là núi và cao nguyên đã khiến cho Lâm Đồng và du lịch Đà Lạt trở thành một địa điểm có nhiều cảnh quan đẹp với bầu không khí trong lành, mát mẻ được nhiều du khách trong và ngoài nước yêu thích.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (13, N'Đà Lạt', N'Đà Lạt được mệnh danh là thiên đường du lịch. Một xứ sở của các loài hoa thi nhau đua sắc thắm.  Ở Đà Lạt tập trung rất nhiều các loài hoa quý từ các nước khác nhập về. Tạo thêm cho Đà Lạt một vẽ đẹp huyền bí và mơ mộng tới tột cùng. Màng không có một thành phố nào tại nước Việt Nam ta sánh kịp với Đà Lạt.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (18, N'sapa', N'đajlw', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (19, N'Huế', N'Huế ơi là huế', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (20, N'An giang', N'Hello', N'trieu.jpg', 3)
SET IDENTITY_INSERT [dbo].[place] OFF
GO
SET IDENTITY_INSERT [dbo].[region] ON 

INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (1, N'Miền Bắc', N'bac.jpg', N'Du lịch Miền Bắc Việt Nam  được xem là cái nôi của nền văn hóa, lịch sử lâu đời của Việt Nam. Không những vậy, miền Bắc còn là nơi cất chứa vô cùng nhiều những vẻ đẹp của mẹ thiên nhiên. Đi du lịch miền Bắc Việt NAM, bạn sẽ được chiêm ngưỡng những công trình kiến trúc hoành tráng cùng cảnh quan thiên nhiên tuyệt đẹp')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (2, N'Miền Trung', N'trung.jpg', N'Hội tụ đủ cái đẹp của nắng gió, biển xanh, mây trắng và cảnh quan hùng vĩ, du lịch miền Trung hấp dẫn đông đảo du khách bởi chính sự giao thoa tổng hòa này.')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (3, N'Miền Nam', N'nam.jpg', N'Du lịch miền Nam khám phá trọn vẹn vẻ đẹp về thiên nhiên, con người và nét văn hóa của vùng đất nơi đây luôn là điều thu hút tín đồ yêu thích xê dịch. Những kinh nghiệm du lịch chi tiết cùng trải nghiệm thực tế về những địa điểm du lịch ở miền Nam giúp bạn có thêm thông tin cho chuyến du lịch miền Nam trọn vẹn nhất. ')
SET IDENTITY_INSERT [dbo].[region] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (1, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (2, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (3, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (4, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (5, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (6, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (7, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (8, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (9, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (10, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (11, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (12, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
SET IDENTITY_INSERT [dbo].[schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (1, N'Tour Đà Nẵng- Hội An', 3000000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Du lịch Đà Nẵng Hội An sẽ là chuyến đi đầy trải nghiệm nếu bạn lên lịch trình chi tiết để khám phá trọn vẹn những vùng đất này. Tại đây, du khách có thể thỏa sức tham quan nhiều danh lam thắng cảnh tuyệt đẹp, nhiều điểm check in nổi tiếng, kèm theo đó là nền văn hóa ẩm thực phong phú, những lễ hội đặc sắc sẽ khiến bạn không nỡ bỏ qua. ', N'danang-hoian.jpg', 0, 1, 1, 2, NULL, 1, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (2, N'Tour Châu Đốc- lễ Bà CHúa', 800000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Tour Chùa Bà Châu Đốc – Du lịch Hành hương đầu xuân 2023. Đến với mảnh đất An Giang, Quý du khách sẽ được nghe và tìm hiểu về Miếu Bà Chúa Xứ, Núi Cấm, Chùa Kim Tiên lộng lẫy, Chùa Lầu độc đáo với cầu treo thốt nốt,… Ngoài việc được thả tâm hồn với vẻ đẹp của phong cảnh miền tây An giang, Quý khách còn thấy được sự trìu mến hiếu khách của con người miền tây sông nước. Bên cạnh đó là có dịp để cầu an, cầu phước cho gia đình và người thân có được nhiều sức khỏe và  bình an đầu xuân năm mới.', N'chaudoc-bachua.jpg', 0, 20, 2, 12, NULL, 2, 3)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (3, N'Tour Bà Nà Hills', 2500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Cầu Vàng, chùa Linh Ứng, khu vui chơi giải trí Fantasy Park, khu làng Pháp, cáp treo Bà Nà, vườn hoa Le Jardin D’Amour, hầm rượu Debay, đỉnh núi Chúa', N'bana.jpg', 0, 1, 2, 2, NULL, 3, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (4, N'Tour Cù Lao Chàm', 2000000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Khu bảo tồn biển, khu dân cư Bãi Làng, chùa Hải Tạng, chợ Tân Hiệp, bãi Hương/ bãi Chồng', N'culaocham.jpg', 0, 2, 2, 8, NULL, 4, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (5, N'Tour Linh Ứng Sơn Trà - Ngũ Hành Sơn - Hội An', 1500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Bán đảo Sơn Trà, Linh Ứng Tự, bãi biển Mỹ Khê, Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, phố cổ Hội An', N'linhung.jpg', 0, 1, 2, 2, NULL, 5, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (6, N'Tour Rừng dừa Bảy Mẫu - Phố cổ Hội An', 1450000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Rừng dừa Bảy Mẫu Cẩm Thanh, Phố cổ Hội An (chùa Cầu Nhật Bản, Bảo tàng văn hóa Sa Huỳnh, nhà Cổ, chợ đêm Nguyễn Hoàng...)', N'rungdua7mau.jpg', 0, 2, 2, 5, NULL, 6, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (7, N'Tour Cố đô Huế ', 1950000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Vịnh Lăng Cô, lăng vua Khải Định, chùa Thiên Mụ, Đại Nội - Kinh Thành (Ngọ Môn, Điện Thái Hoà, Tử Cấm Thành, Hồ Tĩnh Tâm, Thế Miếu, Hiển Lâm Các, Cửu Đỉnh....)', N'codohue.jpg', 0, 1, 2, 9, NULL, 7, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (8, N'City tour Đà Nẵng', 1500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, bãi biển Mỹ Khê, bán đảo Sơn Trà, chùa Linh Ứng, Bảo tàng điêu khắc Chăm, chợ Hàn', N'citytour.jpg', 0, 1, 2, 6, NULL, 8, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (9, N'Tour Tắm Khoáng nóng Núi Thần Tài', 2800000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Bọng Rồng, động Long Tiên, Hồ khoáng nóng tự nhiên, khu vườn hoa quả nhiệt đới', N'nuithantai.jpg', 0, 1, 2, 6, NULL, 9, 2)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (10, N'Tour Chợ Nổi Cái Răng Và Đồng Bằng Sông Cửu Long', 4000000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Thoát khỏi sự nhộn nhịp của Thành phố Hồ Chí Minh để đến với Đồng bằng sông Cửu Long thanh bình trong chuyến tham quan 2 ngày mang đến sự giới thiệu tuyệt vời cho những du khách lần đầu. Hướng dẫn viên sẽ lo việc lên kế hoạch cho các hoạt động, chỗ ở và di chuyển để bạn không cần phải làm vậy, đồng thời cung cấp góc nhìn của người trong cuộc về văn hóa miền Nam Việt Nam.

Read more about Cai Rang Floating Market and Mekong Delta Luxury 2-Day Tour - https://www.viator.com/tours/Ho-Chi-Minh-City/MEKONG-DELTA-FLOATING-MARKET-2-DAYS-1-NIGHT/d352-18631P13?mcid=56757', N'chonoi.jpg', 0, 6, 2, 6, NULL, 10, 3)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [hotelId], [guideId], [vehicleId], [scheduleId], [regionId]) VALUES (11, N'Hà Nội City Tour - Tràng An - Bái Đính - Du thuyền 5 sao Hạ Long cao cấp', 5000000, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-18' AS Date), N'Điểm nổi bật:
Tham quan Thủ đô Hà Nội vừa cổ kính vừa sôi động
Ghé thăm khu di tích Hồ Chí Minh: Nhà sàn - Lăng Bác - Bảo tàng
Ngắm nhìn quần thể danh thắng Tràng An - Ninh Bình tuyệt đẹp
Trải nghiệm 2N1Đ du ngoạn Vịnh Hạ Long bằng du thuyền 5 sao cao cấp', N'halongbay.jpg', 0, 4, 2, 6, NULL, 11, 1)
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
