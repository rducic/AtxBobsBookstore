USE [master]
GO
/****** Object:  Database [BobsUsedBookStore]    Script Date: 8/25/2025 8:23:45 AM ******/
CREATE DATABASE [BobsUsedBookStore]
GO
-- Essential database configuration (non-default settings only)
ALTER DATABASE [BobsUsedBookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BobsUsedBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BobsUsedBookStore] SET ENABLE_BROKER 
GO
ALTER DATABASE [BobsUsedBookStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BobsUsedBookStore] SET RECOVERY FULL 
GO
USE [BobsUsedBookStore]
GO


-- Tables used by the Bookstore application
/****** Object:  Table [dbo].[Address]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](max) NOT NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Author]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[BusinessEntityID] [int] IDENTITY(1,1) NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[OrganizationNode] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Author_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Year] [int] NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[CoverImageUrl] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sub] [nvarchar](450) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Phone] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Offer]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[BookName] [nvarchar](max) NOT NULL,
	[FrontUrl] [nvarchar](max) NULL,
	[GenreId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[Summary] [nvarchar](max) NULL,
	[OfferStatus] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CustomerId] [int] NOT NULL,
	[BookPrice] [decimal](18, 2) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[DeliveryDate] [datetime2](7) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OrderItem]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[MakeFlag] [bit] NOT NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ReferenceData]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataType] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ReferenceData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CorrelationId] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 8/25/2025 8:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[WantToBuy] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ShoppingCartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO-- INSERT statements for tables with data

-- Author data (based on book authors)
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (1, N'100001001', N'bookstore\lijuan', NULL, N'Author', CAST(N'1975-03-15' AS Date), N'S', N'F', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (2, N'100001002', N'bookstore\nikkiwolf', NULL, N'Author', CAST(N'1982-07-22' AS Date), N'M', N'F', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (3, N'100001003', N'bookstore\richardroe', NULL, N'Author', CAST(N'1968-11-08' AS Date), N'M', N'M', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (4, N'100001004', N'bookstore\patcandella', NULL, N'Author', CAST(N'1971-04-12' AS Date), N'S', N'F', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (5, N'100001005', N'bookstore\carlossalazar', NULL, N'Author', CAST(N'1979-09-30' AS Date), N'M', N'M', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (6, N'100001006', N'bookstore\terriwhitlock', NULL, N'Author', CAST(N'1973-12-05' AS Date), N'S', N'F', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (7, N'100001007', N'bookstore\marymajor', NULL, N'Author', CAST(N'1965-06-18' AS Date), N'M', N'F', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Author] ([BusinessEntityID], [NationalIDNumber], [LoginID], [OrganizationNode], [JobTitle], [BirthDate], [MaritalStatus], [Gender], [HireDate], [VacationHours], [CurrentFlag], [ModifiedDate]) VALUES (8, N'100001008', N'bookstore\mateojackson', NULL, N'Author', CAST(N'1977-02-14' AS Date), N'S', N'M', CAST(N'2020-01-01' AS Date), 0, 1, CAST(N'2025-08-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Author] OFF
GO

-- Book data
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'2020: The Apocalypse', N'Li Juan', NULL, N'6556784356', 15, 1, 13, 5, N'/images/coverimages/apocalypse.png', NULL, CAST(10.95 AS Decimal(18, 2)), 25, N'System', CAST(N'2025-08-25T01:52:39.6610104' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610104' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, N'Children Of Iron', N'Nikki Wolf', NULL, N'7665438976', 16, 1, 11, 6, N'/images/coverimages/childrenofiron.png', NULL, CAST(13.95 AS Decimal(18, 2)), 3, N'System', CAST(N'2025-08-25T01:52:39.6610112' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610113' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, N'Gold In The Dark', N'Richard Roe', NULL, N'5442280765', 17, 1, 13, 5, N'/images/coverimages/goldinthedark.png', NULL, CAST(6.50 AS Decimal(18, 2)), 10, N'System', CAST(N'2025-08-25T01:52:39.6610116' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610117' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, N'Leagues Of Smoke', N'Pat Candella', NULL, N'4556789542', 18, 2, 11, 7, N'/images/coverimages/leaguesofsmoke.png', NULL, CAST(3.00 AS Decimal(18, 2)), 1, N'System', CAST(N'2025-08-25T01:52:39.6610121' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610121' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, N'Alone With The Stars', N'Carlos Salazar', NULL, N'4563358087', 19, 2, 12, 5, N'/images/coverimages/alonewiththestars.png', NULL, CAST(15.95 AS Decimal(18, 2)), 5, N'System', CAST(N'2025-08-25T01:52:39.6610124' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610124' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, N'The Girl In The Polaroid', N'Terri Whitlock', NULL, N'2354435678', 20, 1, 12, 6, N'/images/coverimages/girlinthepolaroid.png', NULL, CAST(8.25 AS Decimal(18, 2)), 2, N'System', CAST(N'2025-08-25T01:52:39.6610126' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610127' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, N'1001 Jokes', N'Mary Major', NULL, N'6554789632', 21, 2, 11, 5, N'/images/coverimages/1001jokes.png', NULL, CAST(13.95 AS Decimal(18, 2)), 7, N'System', CAST(N'2025-08-25T01:52:39.6610129' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610130' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Name], [Author], [Year], [ISBN], [PublisherId], [BookTypeId], [GenreId], [ConditionId], [CoverImageUrl], [Summary], [Price], [Quantity], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, N'My Search For Meaning', N'Mateo Jackson', NULL, N'4558786554', 22, 3, 8, 7, N'/images/coverimages/mysearchformeaning.png', NULL, CAST(5.00 AS Decimal(18, 2)), 15, N'System', CAST(N'2025-08-25T01:52:39.6610132' AS DateTime2), CAST(N'2025-08-25T01:52:39.6610132' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Book] OFF
GO

-- Customer data
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Sub], [Username], [FirstName], [LastName], [Email], [DateOfBirth], [Phone], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'FB6135C7-1464-4A72-B74E-4B63D343DD09', N'bookstoreuser', N'Bookstore', N'User', NULL, NULL, NULL, N'System', CAST(N'2025-08-25T01:53:33.9880892' AS DateTime2), CAST(N'2025-08-25T01:53:34.1264588' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

-- Product data (bookstore-related products)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (1, N'Leather Bookmark', N'BM-001', 0, 1, N'Brown', 50, 25, 2.50, 8.99, N'6"', N'IN', N'OZ', CAST(0.05 AS Decimal(8, 2)), 0, N'AC', N'S', N'C', 1, 1, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'11111111-1111-1111-1111-111111111111', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (2, N'Reading Light - LED', N'RL-002', 0, 1, N'Silver', 30, 15, 12.00, 24.99, N'S', N'EA', N'LB', CAST(0.75 AS Decimal(8, 2)), 0, N'AC', N'M', N'M', 2, 2, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'22222222-2222-2222-2222-222222222222', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (3, N'Book Stand - Wooden', N'BS-003', 0, 1, N'Natural', 20, 10, 15.00, 34.99, N'M', N'EA', N'LB', CAST(2.50 AS Decimal(8, 2)), 0, N'AC', N'L', N'T', 3, 3, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'33333333-3333-3333-3333-333333333333', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (4, N'Gift Card - $25', N'GC-025', 0, 1, N'Multi', 100, 50, 0.50, 25.00, N'STD', N'EA', N'OZ', CAST(0.01 AS Decimal(8, 2)), 0, N'GF', N'S', N'G', 4, 4, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'44444444-4444-4444-4444-444444444444', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (5, N'Book Cover - Protective', N'BC-005', 0, 1, N'Clear', 75, 40, 1.25, 4.99, N'L', N'EA', N'OZ', CAST(0.10 AS Decimal(8, 2)), 0, N'AC', N'S', N'P', 5, 5, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'55555555-5555-5555-5555-555555555555', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (6, N'Reading Glasses +2.0', N'RG-200', 0, 1, N'Black', 40, 20, 8.00, 19.99, N'OS', N'EA', N'OZ', CAST(0.25 AS Decimal(8, 2)), 0, N'AC', N'M', N'R', 6, 6, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'66666666-6666-6666-6666-666666666666', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (7, N'Tote Bag - Canvas', N'TB-007', 0, 1, N'Beige', 60, 30, 5.00, 14.99, N'L', N'EA', N'LB', CAST(0.50 AS Decimal(8, 2)), 0, N'BG', N'L', N'C', 7, 7, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'77777777-7777-7777-7777-777777777777', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductNumber], [MakeFlag], [FinishedGoodsFlag], [Color], [SafetyStockLevel], [ReorderPoint], [StandardCost], [ListPrice], [Size], [SizeUnitMeasureCode], [WeightUnitMeasureCode], [Weight], [DaysToManufacture], [ProductLine], [Class], [Style], [ProductSubcategoryID], [ProductModelID], [SellStartDate], [SellEndDate], [DiscontinuedDate], [rowguid], [ModifiedDate]) VALUES (8, N'Coffee Mug - "Book Lover"', N'MG-008', 0, 1, N'White', 35, 18, 4.50, 12.99, N'12oz', N'EA', N'LB', CAST(1.00 AS Decimal(8, 2)), 0, N'GF', N'M', N'N', 8, 8, CAST(N'2025-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'88888888-8888-8888-8888-888888888888', CAST(N'2025-08-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO

-- ReferenceData
SET IDENTITY_INSERT [dbo].[ReferenceData] ON 

INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 2, N'Hardcover', N'System', CAST(N'2025-08-25T01:52:39.6609875' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609881' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, 2, N'Trade Paperback', N'System', CAST(N'2025-08-25T01:52:39.6609885' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609886' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, 2, N'Mass Market Paperback', N'System', CAST(N'2025-08-25T01:52:39.6609887' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609888' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, 1, N'New', N'System', CAST(N'2025-08-25T01:52:39.6609890' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609890' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, 1, N'Like New', N'System', CAST(N'2025-08-25T01:52:39.6609892' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609893' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (6, 1, N'Good', N'System', CAST(N'2025-08-25T01:52:39.6609894' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609895' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (7, 1, N'Acceptable', N'System', CAST(N'2025-08-25T01:52:39.6609896' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609897' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (8, 3, N'Biographies', N'System', CAST(N'2025-08-25T01:52:39.6609898' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609914' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (9, 3, N'Children''s Books', N'System', CAST(N'2025-08-25T01:52:39.6609916' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609916' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (10, 3, N'History', N'System', CAST(N'2025-08-25T01:52:39.6609918' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609918' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (11, 3, N'Literature & Fiction', N'System', CAST(N'2025-08-25T01:52:39.6609920' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609920' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (12, 3, N'Mystery, Thriller & Suspense', N'System', CAST(N'2025-08-25T01:52:39.6609922' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609922' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (13, 3, N'Science Fiction & Fantasy', N'System', CAST(N'2025-08-25T01:52:39.6609924' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609924' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (14, 3, N'Travel', N'System', CAST(N'2025-08-25T01:52:39.6609926' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609926' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (15, 0, N'Arcadia Books', N'System', CAST(N'2025-08-25T01:52:39.6609928' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609928' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (16, 0, N'Astral Publishing', N'System', CAST(N'2025-08-25T01:52:39.6609930' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609930' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (17, 0, N'Moonlight Publishing', N'System', CAST(N'2025-08-25T01:52:39.6609932' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609932' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (18, 0, N'Dreamscape Press', N'System', CAST(N'2025-08-25T01:52:39.6609934' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609934' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (19, 0, N'Enchanted Library', N'System', CAST(N'2025-08-25T01:52:39.6609935' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609936' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (20, 0, N'Fantasia House', N'System', CAST(N'2025-08-25T01:52:39.6609937' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609938' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (21, 0, N'Horizon Books', N'System', CAST(N'2025-08-25T01:52:39.6609939' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609940' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (22, 0, N'Infinity Press', N'System', CAST(N'2025-08-25T01:52:39.6609941' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609942' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (23, 0, N'Paradigm Publishing', N'System', CAST(N'2025-08-25T01:52:39.6609943' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609944' AS DateTime2))
INSERT [dbo].[ReferenceData] ([Id], [DataType], [Text], [CreatedBy], [CreatedOn], [UpdatedOn]) VALUES (24, 0, N'Aurora Publishing', N'System', CAST(N'2025-08-25T01:52:39.6609945' AS DateTime2), CAST(N'2025-08-25T01:52:39.6609946' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ReferenceData] OFF
GO
-- Stored procedures for the Bookstore application
CREATE PROCEDURE [dbo].[uspGetProductData]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT
        CAST(ProductID AS INT) AS ProductID,
        Name,
        ProductNumber,
        CAST(MakeFlag AS BIT) AS MakeFlag,
        CAST(FinishedGoodsFlag AS BIT) AS FinishedGoodsFlag,
        Color,
        CAST(SafetyStockLevel AS INT) AS SafetyStockLevel,
        CAST(ReorderPoint AS INT) AS ReorderPoint,
        CAST(StandardCost AS DECIMAL(19,4)) AS StandardCost,
        CAST(ListPrice AS DECIMAL(19,4)) AS ListPrice,
        Size,
        SizeUnitMeasureCode,
        WeightUnitMeasureCode,
        CAST(Weight AS DECIMAL(8,2)) AS Weight,
        CAST(DaysToManufacture AS INT) AS DaysToManufacture,
        ProductLine,
        Class,
        Style,
        CAST(ProductSubcategoryID AS INT) AS ProductSubcategoryID,
        CAST(ProductModelID AS INT) AS ProductModelID,
        SellStartDate,
        SellEndDate,
        DiscontinuedDate,
        rowguid,
        ModifiedDate
    FROM [dbo].[Product]
    WHERE FinishedGoodsFlag = 1
    ORDER BY Name;
END;
GO