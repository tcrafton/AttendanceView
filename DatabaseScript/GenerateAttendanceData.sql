USE [master]
GO
/****** Object:  Database [AttendanceViewDB]    Script Date: 12/11/2015 2:21:23 PM ******/
CREATE DATABASE [AttendanceViewDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AttendanceViewDB', FILENAME = N'C:\Users\tommy.crafton\AttendanceViewDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AttendanceViewDB_log', FILENAME = N'C:\Users\tommy.crafton\AttendanceViewDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AttendanceViewDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AttendanceViewDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AttendanceViewDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AttendanceViewDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AttendanceViewDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AttendanceViewDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AttendanceViewDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AttendanceViewDB] SET  MULTI_USER 
GO
ALTER DATABASE [AttendanceViewDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AttendanceViewDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AttendanceViewDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AttendanceViewDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AttendanceViewDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AttendanceViewDB]
GO
/****** Object:  Table [AbsenceReasons]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AbsenceReasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](50) NULL,
 CONSTRAINT [PK_AbsenceReasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Absences]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Absences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[AbsenceDate] [nvarchar](50) NULL,
	[NumHours] [int] NULL,
	[DepartmentId] [int] NULL,
	[AbsenceReasonId] [int] NULL,
 CONSTRAINT [PK_Absences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Areas]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Employees]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClockNum] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[AreaId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[ClockNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [AbsenceReasons] ON 

INSERT [AbsenceReasons] ([id], [Reason]) VALUES (1, N'Vacation')
INSERT [AbsenceReasons] ([id], [Reason]) VALUES (2, N'Sick Day')
INSERT [AbsenceReasons] ([id], [Reason]) VALUES (3, N'Company Business')
SET IDENTITY_INSERT [AbsenceReasons] OFF
SET IDENTITY_INSERT [Absences] ON 

INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1075, 1, N'2015-11-05T00:00:00', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1076, 1, N'2015-11-10T00:00:00', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1077, 1, N'2015-11-14T00:00:00', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1078, 1, N'2015-11-14T00:00:00', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1079, 1, N'2015-12-11T00:00:00', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1080, 1, N'2015-04-08', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1082, 2, N'2015-01-19', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1083, 2, N'2015-02-16', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1084, 2, N'2015-03-16', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1085, 2, N'2015-04-06', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1086, 2, N'2015-05-22', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1087, 2, N'2015-06-19', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1088, 2, N'2015-07-06', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1089, 2, N'2015-11-25', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1090, 3, N'2015-11-11', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1091, 3, N'2015-11-12', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1092, 3, N'2015-11-13', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1093, 3, N'2015-11-16', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1094, 3, N'2015-11-17', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1095, 3, N'2015-11-23', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1096, 4, N'2015-11-20', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1097, 4, N'2015-12-04', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1098, 4, N'2015-12-18', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1099, 4, N'2015-12-23', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1100, 4, N'2015-12-28', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1101, 4, N'2015-12-29', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1102, 4, N'2015-12-30', 8, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1103, 6, N'2015-11-20', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1105, 6, N'2015-11-22', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1106, 7, N'2015-11-21', 12, 4, 1)
INSERT [Absences] ([id], [EmployeeId], [AbsenceDate], [NumHours], [DepartmentId], [AbsenceReasonId]) VALUES (1107, 7, N'2015-11-23', 12, 4, 1)
SET IDENTITY_INSERT [Absences] OFF
SET IDENTITY_INSERT [Areas] ON 

INSERT [Areas] ([id], [Name]) VALUES (1, N'HR')
INSERT [Areas] ([id], [Name]) VALUES (2, N'IS')
INSERT [Areas] ([id], [Name]) VALUES (3, N'Admin')
INSERT [Areas] ([id], [Name]) VALUES (4, N'Payroll')
INSERT [Areas] ([id], [Name]) VALUES (7, N'Accounting')
SET IDENTITY_INSERT [Areas] OFF
SET IDENTITY_INSERT [Employees] ON 

INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (1, 512, N'Pete', N'Rose', 4, 1)
INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (2, 638, N'John', N'Doe', 4, 2)
INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (3, 640, N'Bob', N'Barker', 4, 3)
INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (4, 639, N'Mike', N'Tyson', 4, 4)
INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (6, 559, N'Aaron ', N'Rodgers', 4, 7)
INSERT [Employees] ([id], [ClockNum], [FirstName], [LastName], [DepartmentId], [AreaId]) VALUES (7, 710, N'Kobe', N'Bryant', 4, 3)
SET IDENTITY_INSERT [Employees] OFF
/****** Object:  StoredProcedure [usp_GetAbsenceReasons]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==================================================
-- Author:		<Tommy Crafton>
-- Create date: <12/1/15>
-- Description:	<Get all absence reasons>
-- ==================================================
CREATE PROCEDURE [usp_GetAbsenceReasons] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		id,
		Reason
	FROM dbo.AbsenceReasons

		
		
END


GO
/****** Object:  StoredProcedure [usp_GetAbsencesByArea]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================
-- Author:		<Tommy Crafton>
-- Create date: <12/1/15>
-- Description:	<Get all absences for an area>
-- ==================================================
CREATE PROCEDURE [usp_GetAbsencesByArea] 
(
	@areaId		int,
	@year		int

)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Absences.id as AbsenceId,
		Reasons.id,
		Employees.FirstName,
		Employees.LastName,
		Employees.FirstName + ' ' + Employees.LastName as FullName,
		Employees.AreaId,
		Absences.AbsenceDate,
		Absences.AbsenceReasonId,
		Absences.NumHours,
		Employees.id as EmployeeId,
		Employees.ClockNum
	FROM dbo.Absences Absences
	INNER JOIN dbo.Employees Employees
		ON Absences.EmployeeId = Employees.id
	INNER JOIN dbo.AbsenceReasons Reasons
		ON Absences.AbsenceReasonId = Reasons.id
	WHERE Employees.AreaId = @areaId
		AND YEAR(Absences.AbsenceDate) = @year
	ORDER BY Employees.LastName, Absences.AbsenceDate
		
		
END


GO
/****** Object:  StoredProcedure [usp_GetAreas]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Tommy Crafton>
-- Create date: <11/30/15>
-- Description:	<Get all areas>
-- =============================================
CREATE PROCEDURE [usp_GetAreas] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		id,
		Name		
	FROM dbo.Areas
	ORDER BY Name
		
		
END


GO
/****** Object:  StoredProcedure [usp_GetEmployeesByArea]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Tommy Crafton>
-- Create date: <11/30/15>
-- Description:	<Get all employees by Area>
-- =============================================
CREATE PROCEDURE [usp_GetEmployeesByArea] 
(
	@areaId		int

)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		id,
		ClockNum,
		FirstName,
		LastName,
		FirstName + ' ' + LastName as FullName,
		AreaId		
	FROM dbo.Employees
	WHERE AreaId = @areaId
	ORDER BY LastName
		
		
END


GO
/****** Object:  StoredProcedure [usp_GetHoursAbsentByArea]    Script Date: 12/11/2015 2:21:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ========================================================
-- Author:		<Tommy Crafton>
-- Create date: <12/11/15>
-- Description:	<Get hours absent for an area by employee>
-- ========================================================
CREATE PROCEDURE [usp_GetHoursAbsentByArea] 
(
	@areaId		int,
	@year		int

)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Employees.FirstName + ' ' + Employees.LastName as FullName,		
		Employees.ClockNum,
		SUM(Absences.NumHours) as HoursAbsent,
		SUM(CASE WHEN Absences.AbsenceReasonId = 1 THEN Absences.NumHours ELSE 0 END) as HoursVacation,
		SUM(CASE WHEN Absences.AbsenceReasonId = 2 THEN Absences.NumHours ELSE 0 END) as HoursSick,
		YEAR(Absences.AbsenceDate)
	FROM dbo.Absences Absences
	INNER JOIN dbo.Employees Employees
		ON Absences.EmployeeId = Employees.id
	INNER JOIN dbo.AbsenceReasons Reasons
		ON Absences.AbsenceReasonId = Reasons.id
	WHERE Employees.AreaId = @areaId
		  AND YEAR(Absences.AbsenceDate) = @year
	GROUP BY Employees.ClockNum,
			 Employees.FirstName,
			 Employees.LastName,
			 YEAR(Absences.AbsenceDate)
	ORDER BY Employees.LastName
		
		
END


GO
USE [master]
GO
ALTER DATABASE [AttendanceViewDB] SET  READ_WRITE 
GO
