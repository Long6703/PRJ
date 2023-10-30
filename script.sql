USE [master]
GO
/****** Object:  Database [PRJDB]    Script Date: 10/30/2023 1:26:00 PM ******/
CREATE DATABASE [PRJDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LONGNK_DATABASE\MSSQL\DATA\PRJDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LONGNK_DATABASE\MSSQL\DATA\PRJDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRJDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJDB] SET  MULTI_USER 
GO
ALTER DATABASE [PRJDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJDB]
GO
/****** Object:  Table [dbo].[ClassCourses]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassCourses](
	[class_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_ClassCourses] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](100) NULL,
 CONSTRAINT [PK__Classes__FDF479861C6D975D] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](100) NULL,
	[teacher_id] [int] NULL,
 CONSTRAINT [PK__Courses__8F1EF7AE20B78628] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[exam_date] [date] NULL,
	[exam_time] [nvarchar](50) NULL,
	[exam_location] [nvarchar](100) NULL,
	[exam_form] [nvarchar](255) NULL,
	[exam_type] [nvarchar](255) NULL,
	[dateOfPublic] [date] NULL,
	[teacherID] [int] NULL,
 CONSTRAINT [PK__Exams__9C8C7BE94E3EF969] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[url] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Permissi__E5331AFA98B2DD3E] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NULL,
	[student_id] [int] NULL,
	[registration_date] [date] NULL,
 CONSTRAINT [PK__Registra__22A298F6FF231149] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_name] [nvarchar](100) NULL,
	[student_email] [nvarchar](100) NULL,
	[student_phone] [nvarchar](20) NULL,
	[class_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK__Students__2A33069A6AE3F67D] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_name] [nvarchar](100) NULL,
	[teacher_email] [nvarchar](100) NULL,
	[teacher_phone] [nvarchar](20) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK__Teachers__03AE777EAD0213A5] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2023 1:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Users__B9BE370F5C63DA7F] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (1, 1)
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (1, 2)
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (1, 3)
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (1, 4)
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (2, 1)
INSERT [dbo].[ClassCourses] ([class_id], [course_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([class_id], [class_name]) VALUES (1, N'SE1764')
INSERT [dbo].[Classes] ([class_id], [class_name]) VALUES (2, N'SE6703')
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([course_id], [course_name], [teacher_id]) VALUES (1, N'Statistics and Probability(MAS291)', 1)
INSERT [dbo].[Courses] ([course_id], [course_name], [teacher_id]) VALUES (2, N'Elementary Japanese 1-A1.2(JPD123)', 1)
INSERT [dbo].[Courses] ([course_id], [course_name], [teacher_id]) VALUES (3, N'Java Web Application Development(PRJ301)', 2)
INSERT [dbo].[Courses] ([course_id], [course_name], [teacher_id]) VALUES (4, N'Internet of Things (IOT102)', 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Exams] ON 

INSERT [dbo].[Exams] ([exam_id], [course_id], [exam_date], [exam_time], [exam_location], [exam_form], [exam_type], [dateOfPublic], [teacherID]) VALUES (1, 2, CAST(N'2023-10-25' AS Date), N'07:30', N'Hanoi', N'Multiple choices on EOS', N'FE', CAST(N'2023-11-22' AS Date), 1)
INSERT [dbo].[Exams] ([exam_id], [course_id], [exam_date], [exam_time], [exam_location], [exam_form], [exam_type], [dateOfPublic], [teacherID]) VALUES (3, 2, CAST(N'2023-10-31' AS Date), N'23:24', N'Hanoi', N'Practical exam (PEA client)', N'PE', CAST(N'2023-11-11' AS Date), 1)
INSERT [dbo].[Exams] ([exam_id], [course_id], [exam_date], [exam_time], [exam_location], [exam_form], [exam_type], [dateOfPublic], [teacherID]) VALUES (10, 4, CAST(N'2023-10-25' AS Date), N'12:30', N'London', N'Multiple choices on EOS', N'FE', CAST(N'2023-11-09' AS Date), 2)
INSERT [dbo].[Exams] ([exam_id], [course_id], [exam_date], [exam_time], [exam_location], [exam_form], [exam_type], [dateOfPublic], [teacherID]) VALUES (11, 3, CAST(N'2023-10-26' AS Date), N'12:34', N'Hola', N'Practical exam (PEA client)', N'PE', CAST(N'2023-12-08' AS Date), 2)
INSERT [dbo].[Exams] ([exam_id], [course_id], [exam_date], [exam_time], [exam_location], [exam_form], [exam_type], [dateOfPublic], [teacherID]) VALUES (12, 1, CAST(N'2023-10-26' AS Date), N'12:56', N'London', N'Practical exam (PEA client)', N'PE', CAST(N'2023-11-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Exams] OFF
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 

INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (14, 12, 7, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (15, 1, 7, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (16, 11, 7, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (17, 10, 7, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (18, 10, 8, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (19, 10, 6, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (20, 12, 14, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (21, 1, 14, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (22, 1, 10, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (23, 12, 5, CAST(N'2023-10-28' AS Date))
INSERT [dbo].[Registrations] ([registration_id], [exam_id], [student_id], [registration_date]) VALUES (24, 12, 6, CAST(N'2023-10-29' AS Date))
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (1, N'Nguyen Hoang123', N'hoang123@gmail.com', N'123456789000', 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (5, N'Nguyen Long123', N'long123@gmail.com', N'1234567890', 1, 5)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (6, N'Nguyen Van A', N'long111@gmail.com', N'99999999991', 1, 6)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (7, N'Long222', N'long222@gmail.com', N'11111111111', 1, 7)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (8, N'Long333', N'long333@gmail.com', N'22222222222', 1, 8)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (9, N'Long444', N'long444@gmail.com', N'333333333333', 1, 9)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (10, N'Long555', N'long555@gmail.com', N'4444444444', 2, 10)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (11, N'Long666', N'long666@gmail.com', N'5555555555', 2, 11)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (12, N'Long777', N'long777@gmail.com', N'6666666666', 2, 12)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (13, N'Long888', N'long888@gmail.com', N'7777777777', 2, 13)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [student_phone], [class_id], [user_id]) VALUES (14, N'Long999', N'long999@gmail.com', N'8888888888', 2, 14)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([teacher_id], [teacher_name], [teacher_email], [teacher_phone], [user_id]) VALUES (1, N'Nguyen Khac Long', N'longbeo@gmail.com', N'09876543123', 1)
INSERT [dbo].[Teachers] ([teacher_id], [teacher_name], [teacher_email], [teacher_phone], [user_id]) VALUES (2, N'Nguyen Van A', N'nguyenvana@gmail.com', N'123456789', 2)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (1, N'longbeo', N'longbeo', N'teacher')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (2, N'long6703', N'long6703', N'teacher')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (3, N'hoang123', N'hoang123', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (5, N'long123', N'long123', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (6, N'long111', N'long111', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (7, N'long222', N'long222', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (8, N'long333', N'long333', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (9, N'long444', N'long444', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (10, N'long555', N'long555', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (11, N'long666', N'long666', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (12, N'long777', N'long777', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (13, N'long888', N'long888', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (14, N'long999', N'long999', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [role]) VALUES (15, N'mai111', N'mai111', N'student')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ClassCourses]  WITH CHECK ADD  CONSTRAINT [FK_ClassID] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
GO
ALTER TABLE [dbo].[ClassCourses] CHECK CONSTRAINT [FK_ClassID]
GO
ALTER TABLE [dbo].[ClassCourses]  WITH CHECK ADD  CONSTRAINT [FK_CourseID] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[ClassCourses] CHECK CONSTRAINT [FK_CourseID]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teachers] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teachers]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Courses]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Teachers] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Teachers]
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__exam___5AEE82B9] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exams] ([exam_id])
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK__Registrat__exam___5AEE82B9]
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__stude__5BE2A6F2] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK__Registrat__stude__5BE2A6F2]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK__Students__class___5441852A] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK__Students__class___5441852A]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK__Students__user_i__5535A963] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK__Students__user_i__5535A963]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK__Teachers__user_i__4BAC3F29] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK__Teachers__user_i__4BAC3F29]
GO
USE [master]
GO
ALTER DATABASE [PRJDB] SET  READ_WRITE 
GO
