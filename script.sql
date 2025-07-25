USE [master]
GO
/****** Object:  Database [Tourism]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE DATABASE [Tourism]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tourism', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tourism.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tourism_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tourism_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tourism] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tourism].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tourism] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tourism] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tourism] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tourism] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tourism] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tourism] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tourism] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tourism] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tourism] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tourism] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tourism] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tourism] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tourism] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tourism] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tourism] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tourism] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tourism] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tourism] SET  MULTI_USER 
GO
ALTER DATABASE [Tourism] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tourism] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tourism] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tourism] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tourism] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tourism] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tourism] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tourism] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tourism]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[passport] [varchar](20) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[registration_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[visa_required] [bit] NOT NULL,
	[climate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[hire_date] [date] NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[tour_id] [int] NULL,
	[service_id] [int] NULL,
	[employee_id] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[final_price] [decimal](10, 2) NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[base_price] [decimal](10, 2) NOT NULL,
	[country_id] [int] NOT NULL,
	[service_type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tours]    Script Date: 7/22/2025 4:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tours](
	[tour_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[base_price] [decimal](10, 2) NOT NULL,
	[country_id] [int] NOT NULL,
	[duration_days] [smallint] NOT NULL,
	[start_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_clients_last_name]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_clients_last_name] ON [dbo].[clients]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_clients_passport]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_clients_passport] ON [dbo].[clients]
(
	[passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_countries_name]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_countries_name] ON [dbo].[countries]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_employees_last_name]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_employees_last_name] ON [dbo].[employees]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orders_client]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_orders_client] ON [dbo].[orders]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_orders_date]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_orders_date] ON [dbo].[orders]
(
	[order_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_orders_status]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_orders_status] ON [dbo].[orders]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_services_country]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_services_country] ON [dbo].[services]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_services_name]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_services_name] ON [dbo].[services]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_services_type]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_services_type] ON [dbo].[services]
(
	[service_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_tours_country]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_tours_country] ON [dbo].[tours]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_tours_name]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_tours_name] ON [dbo].[tours]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_tours_start_date]    Script Date: 7/22/2025 4:52:35 AM ******/
CREATE NONCLUSTERED INDEX [idx_tours_start_date] ON [dbo].[tours]
(
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clients] ADD  DEFAULT (CONVERT([date],getdate())) FOR [registration_date]
GO
ALTER TABLE [dbo].[countries] ADD  DEFAULT ((0)) FOR [visa_required]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (CONVERT([date],getdate())) FOR [hire_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('????????') FOR [status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([service_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[tours] ([tour_id])
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [chk_order_type] CHECK  (([tour_id] IS NOT NULL AND [service_id] IS NULL OR [tour_id] IS NULL AND [service_id] IS NOT NULL))
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [chk_order_type]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([final_price]>(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([status]='???????' OR [status]='????????' OR [status]='???????' OR [status]='????????'))
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD CHECK  (([base_price]>(0)))
GO
ALTER TABLE [dbo].[services]  WITH CHECK ADD CHECK  (([service_type]='?????????' OR [service_type]='????????' OR [service_type]='?????????' OR [service_type]='?????'))
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD CHECK  (([base_price]>(0)))
GO
ALTER TABLE [dbo].[tours]  WITH CHECK ADD CHECK  (([duration_days]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Tourism] SET  READ_WRITE 
GO
