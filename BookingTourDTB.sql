USE [bookingProject]
GO
/****** Object:  Table [dbo].[account]    Script Date: 5/22/2023 12:02:47 AM ******/
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
/****** Object:  Table [dbo].[content]    Script Date: 5/22/2023 12:02:48 AM ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 5/22/2023 12:02:48 AM ******/
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
/****** Object:  Table [dbo].[hotel]    Script Date: 5/22/2023 12:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[nameHotel] [nvarchar](50) NOT NULL,
	[starHotel] [int] NOT NULL,
	[detailHotel] [nvarchar](max) NOT NULL,
	[imageHotel] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 5/22/2023 12:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[placeId] [int] IDENTITY(1,1) NOT NULL,
	[placeName] [nvarchar](50) NOT NULL,
	[placeContent] [nvarchar](max) NOT NULL,
	[placeImage] [nvarchar](50) NOT NULL,
	[region] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[placeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 5/22/2023 12:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[tourId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[detail] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[placeId] [int] NOT NULL,
	[idHotel] [int] NULL,
	[guideId] [int] NULL,
	[vehicleId] [int] NULL,
	[scheduleId] [int] NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[tourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourGuider]    Script Date: 5/22/2023 12:02:48 AM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 5/22/2023 12:02:48 AM ******/
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
/****** Object:  Table [dbo].[vehicle]    Script Date: 5/22/2023 12:02:48 AM ******/
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
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[hotel] ([idHotel])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_hotel]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_place] FOREIGN KEY([placeId])
REFERENCES [dbo].[place] ([placeId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_place]
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
