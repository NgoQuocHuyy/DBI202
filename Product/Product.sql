
GO
USE [Product]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/20/2013 08:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[maker] [nchar](10) NULL,
	[model] [int] NULL,
	[type] [nvarchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 1001, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 1002, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 1003, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 2004, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 2005, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'A         ', 2006, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'B         ', 1004, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'B         ', 1005, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'B         ', 1006, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'B         ', 2007, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'C         ', 1007, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'D         ', 1008, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'D         ', 1009, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'D         ', 1010, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'D         ', 3004, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'D         ', 3005, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 1011, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 1012, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 1013, N'pc')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 2001, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 2002, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 2003, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 3001, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 3002, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'E         ', 3003, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'F         ', 2008, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'F         ', 2009, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'G         ', 2010, N'laptop')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'H         ', 3006, N'printer')
INSERT [dbo].[Product] ([maker], [model], [type]) VALUES (N'H         ', 3007, N'printer')
/****** Object:  Table [dbo].[Printer]    Script Date: 08/20/2013 08:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Printer](
	[model] [int] NOT NULL,
	[color] [bit] NULL,
	[type] [varchar](8) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[model] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3001, 1, N'ink-jet', 99)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3002, 0, N'laser', 239)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3003, 0, N'laser', 899)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3004, 0, N'ink-jet', 899)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3005, 0, N'laser', 120)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3006, 1, N'ink-jet', 100)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3007, 1, N'laser', 200)
INSERT [dbo].[Printer] ([model], [color], [type], [price]) VALUES (3008, 1, N'abc', 50)
/****** Object:  Table [dbo].[PC]    Script Date: 08/20/2013 08:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC](
	[model] [int] NULL,
	[speed] [decimal](5, 2) NULL,
	[ram] [int] NULL,
	[hd] [int] NULL,
	[price] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1001, CAST(2.66 AS Decimal(5, 2)), 1024, 250, 2114)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1002, CAST(2.10 AS Decimal(5, 2)), 512, 250, 995)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1003, CAST(1.42 AS Decimal(5, 2)), 512, 80, 478)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1004, CAST(2.80 AS Decimal(5, 2)), 1024, 250, 649)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1005, CAST(3.20 AS Decimal(5, 2)), 512, 250, 630)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1006, CAST(3.20 AS Decimal(5, 2)), 1024, 320, 1049)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1007, CAST(2.20 AS Decimal(5, 2)), 1024, 200, 510)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1008, CAST(2.20 AS Decimal(5, 2)), 2048, 250, 770)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1009, CAST(2.00 AS Decimal(5, 2)), 1024, 250, 650)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1010, CAST(2.80 AS Decimal(5, 2)), 2048, 300, 770)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1011, CAST(1.86 AS Decimal(5, 2)), 2048, 160, 959)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1012, CAST(2.80 AS Decimal(5, 2)), 1024, 160, 649)
INSERT [dbo].[PC] ([model], [speed], [ram], [hd], [price]) VALUES (1013, CAST(3.06 AS Decimal(5, 2)), 512, 80, 529)
/****** Object:  Table [dbo].[Laptop]    Script Date: 08/20/2013 08:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[model] [int] NULL,
	[speed] [decimal](5, 2) NULL,
	[ram] [int] NULL,
	[hd] [int] NULL,
	[screen] [numeric](5, 1) NULL,
	[price] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2001, CAST(2.00 AS Decimal(5, 2)), 2048, 240, CAST(20.1 AS Numeric(5, 1)), 3673)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2002, CAST(1.73 AS Decimal(5, 2)), 1024, 80, CAST(17.0 AS Numeric(5, 1)), 949)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2003, CAST(1.80 AS Decimal(5, 2)), 512, 60, CAST(15.4 AS Numeric(5, 1)), 549)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2004, CAST(2.00 AS Decimal(5, 2)), 512, 60, CAST(13.3 AS Numeric(5, 1)), 1150)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2005, CAST(2.16 AS Decimal(5, 2)), 1024, 120, CAST(17.0 AS Numeric(5, 1)), 2500)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2006, CAST(2.00 AS Decimal(5, 2)), 2048, 80, CAST(15.4 AS Numeric(5, 1)), 1700)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2007, CAST(1.83 AS Decimal(5, 2)), 1024, 120, CAST(13.3 AS Numeric(5, 1)), 1429)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2008, CAST(1.60 AS Decimal(5, 2)), 1024, 100, CAST(15.4 AS Numeric(5, 1)), 900)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2009, CAST(1.60 AS Decimal(5, 2)), 512, 80, CAST(14.1 AS Numeric(5, 1)), 680)
INSERT [dbo].[Laptop] ([model], [speed], [ram], [hd], [screen], [price]) VALUES (2010, CAST(2.00 AS Decimal(5, 2)), 2048, 160, CAST(15.4 AS Numeric(5, 1)), 2300)


--drop database Product
select * from Product; 

select distinct maker, type from Product;

select * from PC;

select model, price as "price in $", price*25 as "Nghin VND" from PC; 