--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for SQL Server, Версия 5.8.127.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/sql/studio
-- Дата скрипта: 26.05.2021 14:43:54
-- Версия сервера: 14.00.1000
--


SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

USE testBDD
GO

IF DB_NAME() <> N'testBDD' SET NOEXEC ON
GO

--
-- Создать таблицу [dbo].[View_Provision]
--
PRINT (N'Создать таблицу [dbo].[View_Provision]')
GO
CREATE TABLE dbo.View_Provision (
  ID_View_Provision int IDENTITY,
  Name_View_Provision varchar(45) NOT NULL,
  CONSTRAINT PK_ID_View_Provision PRIMARY KEY CLUSTERED (ID_View_Provision),
  UNIQUE (Name_View_Provision),
  CONSTRAINT CH_Name_View_Provision CHECK ([Name_View_Provision] like '%[А-Я]%' OR [Name_View_Provision] like '%[0-9]%' OR [Name_View_Provision] like '%[№/()*”]%')
)
ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--
-- Создать процедуру [dbo].[View_Provision_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[View_Provision_Update]')
GO

Create OR ALTER procedure dbo.View_Provision_Update
@ID_View_Provision [int], @Name_View_Provision [varchar] (45)
as 
	update [dbo].[View_Provision] set
	[Name_View_Provision] = @Name_View_Provision
where
	[ID_View_Provision] = @ID_View_Provision
GO

--
-- Создать процедуру [dbo].[View_Provision_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[View_Provision_Insert]')
GO
Create OR ALTER procedure dbo.View_Provision_Insert
@Name_View_Provision [varchar] (45)
as insert into [dbo].[View_Provision]
([Name_View_Provision])
values
(@Name_View_Provision)
GO

--
-- Создать процедуру [dbo].[View_Provision_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[View_Provision_Delete]')
GO

Create OR ALTER procedure dbo.View_Provision_Delete
@ID_View_Provision [int]
as
delete from [dbo].[View_Provision]
where [ID_View_Provision] = @ID_View_Provision
GO

--
-- Создать таблицу [dbo].[View_Cabinet]
--
PRINT (N'Создать таблицу [dbo].[View_Cabinet]')
GO
CREATE TABLE dbo.View_Cabinet (
  ID_View int IDENTITY,
  Name_View_Cabinet varchar(35) NOT NULL,
  CONSTRAINT PK_ID_View PRIMARY KEY CLUSTERED (ID_View),
  UNIQUE (Name_View_Cabinet),
  CONSTRAINT CH_Name_View_Cabinet CHECK ([Name_View_Cabinet] like '%[а-я]%' OR [Name_View_Cabinet] like '%[А-Я]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[View_Cabinet_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[View_Cabinet_Insert]')
GO


Create OR ALTER procedure dbo.View_Cabinet_Insert
@Name_View_Cabinet [varchar] (35)
as
	insert into [dbo].[View_Cabinet] ([Name_View_Cabinet])
	values (@Name_View_Cabinet)
GO

--
-- Создать таблицу [dbo].[Type_Of_Educational_Unit]
--
PRINT (N'Создать таблицу [dbo].[Type_Of_Educational_Unit]')
GO
CREATE TABLE dbo.Type_Of_Educational_Unit (
  ID_Type_Of_Educational_Unit int IDENTITY,
  Number_Of_Type varchar(100) NULL,
  CONSTRAINT PK_Type_Of_Educational_Unit PRIMARY KEY CLUSTERED (ID_Type_Of_Educational_Unit)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Type_Of_Educational_Unit_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Type_Of_Educational_Unit_updated]')
GO

create OR ALTER procedure dbo.Type_Of_Educational_Unit_updated
	@ID_Type_Of_Educational_Unit [int], @Number_Of_Type[varchar] (30)
as
update [dbo].[Type_Of_Educational_Unit] set
	[Number_Of_Type] = @Number_Of_Type
where
	[ID_Type_Of_Educational_Unit] = @ID_Type_Of_Educational_Unit

GO

--
-- Создать процедуру [dbo].[Type_Of_Educational_Unit_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Type_Of_Educational_Unit_insert]')
GO


create OR ALTER procedure dbo.Type_Of_Educational_Unit_insert
	@Number_Of_Type[varchar] (30)
as
insert into [dbo].[Type_Of_Educational_Unit] ([Number_Of_Type])
values (@Number_Of_Type)
GO

--
-- Создать процедуру [dbo].[Type_Of_Educational_Unit_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Type_Of_Educational_Unit_delete]')
GO


create OR ALTER procedure dbo.Type_Of_Educational_Unit_delete
	@ID_Type_Of_Educational_Unit [int]
as
delete from [dbo].[Type_Of_Educational_Unit]
where
	[ID_Type_Of_Educational_Unit] = @ID_Type_Of_Educational_Unit
GO

--
-- Создать таблицу [dbo].[Type_Comments]
--
PRINT (N'Создать таблицу [dbo].[Type_Comments]')
GO
CREATE TABLE dbo.Type_Comments (
  Id_Type_Comment int IDENTITY,
  Name_comment nvarchar(30) NOT NULL,
  CONSTRAINT PK_Type_Comments PRIMARY KEY CLUSTERED (Id_Type_Comment)
)
ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Traning_Area]
--
PRINT (N'Создать таблицу [dbo].[Traning_Area]')
GO
CREATE TABLE dbo.Traning_Area (
  ID_Training_Area int IDENTITY,
  Full_Name varchar(85) NOT NULL,
  Abbreviated_Name varchar(42) NOT NULL,
  CONSTRAINT PK_ID_Training_Area PRIMARY KEY CLUSTERED (ID_Training_Area),
  UNIQUE (Abbreviated_Name),
  UNIQUE (Full_Name),
  CONSTRAINT CH_Abbreviated_Name CHECK ([Abbreviated_Name] like '%[а-я]%' OR [Abbreviated_Name] like '%[А-Я]%' OR [Abbreviated_Name] like '%[0-9]%' OR [Abbreviated_Name] like '%[№/()*”]%'),
  CONSTRAINT CH_Full_Name CHECK ([Full_Name] like '%[а-я]%' OR [Full_Name] like '%[А-Я]%' OR [Full_Name] like '%[0-9]%' OR [Full_Name] like '%[№/()*”]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Traning_Area_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Traning_Area_Update]')
GO

Create OR ALTER procedure dbo.Traning_Area_Update
@ID_Traning_Area [int], @Full_Name [varchar] (85), @Abbreviated_Name [varchar] (42)
as
	update [dbo].[Traning_Area] set
	[Full_Name] = @Full_Name,
	[Abbreviated_Name] = @Abbreviated_Name
where
	[ID_Training_Area] = @ID_Traning_Area
GO

--
-- Создать процедуру [dbo].[Traning_Area_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Traning_Area_Insert]')
GO

Create OR ALTER procedure dbo.Traning_Area_Insert
@Full_Name [varchar] (85), @Abbreviated_Name [varchar] (42)
as
	insert into [dbo].[Traning_Area] 
	([Full_Name],[Abbreviated_Name])
	values 
	(@Full_Name, @Abbreviated_Name)
GO

--
-- Создать таблицу [dbo].[Territory_Аudiences]
--
PRINT (N'Создать таблицу [dbo].[Territory_Аudiences]')
GO
CREATE TABLE dbo.Territory_Аudiences (
  ID_Territory_Аudiences int IDENTITY,
  Number_Cabinet varchar(4) NULL,
  Position_X varchar(4) NULL,
  Position_Y varchar(4) NULL,
  Width varchar(3) NULL,
  Height varchar(3) NULL,
  Color_ID int NOT NULL,
  Traning_Area_ID int NOT NULL,
  View_ID int NOT NULL,
  CONSTRAINT PK_ID_Territory_Аudiences PRIMARY KEY CLUSTERED (ID_Territory_Аudiences),
  CONSTRAINT CH_Height CHECK ([Height] like '%[0-9][0-9][0-9]%'),
  CONSTRAINT CH_Number_Cabinet CHECK ([Number_Cabinet] like '%[0-9][0-9][0-9]%'),
  CONSTRAINT CH_Position_X CHECK ([Position_X] like '%[0-9][0-9][0-9][0-9]%'),
  CONSTRAINT CH_Position_Y CHECK ([Position_Y] like '%[0-9][0-9][0-9][0-9]%'),
  CONSTRAINT CH_Width CHECK ([Width] like '%[0-9][0-9][0-9]%')
)
ON [PRIMARY]
GO

--
-- Создать функцию [dbo].[Tabel]
--
GO
PRINT (N'Создать функцию [dbo].[Tabel]')
GO
CREATE OR ALTER FUNCTION dbo.Tabel 
  (@date VARCHAR (MAX))
  RETURNS VARCHAR (MAX)
  WITH EXECUTE AS CALLER
  AS
  BEGIN
  	RETURN( SELECT STUFF((SELECT ';' + [dbo].[Territory_Аudiences].Number_Cabinet +
     ' ' + CONVERT(VARCHAR (MAX), Territory_Аudiences.ID_Territory_Аudiences) + 'кол-во: ' +
      CONVERT(VARCHAR(MAX), Traning_Area.Full_Name) FROM Territory_Аudiences INNER JOIN Traning_Area ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area
      FOR XML PATH('')),1,1,''))
  END
GO

--
-- Создать процедуру [dbo].[Territory_Аudiences_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Territory_Аudiences_Update]')
GO

Create OR ALTER procedure dbo.Territory_Аudiences_Update
	@ID_Territory_Аudiences [int],
	 @Number_Cabinet [varchar] (4),
	@Position_X [varchar] (4),
	@Position_Y [varchar] (4),
	@Width [varchar] (3),
	@Height [varchar] (3) ,
	@Color_ID [int] ,
	@Traning_Area_ID [int],
	@View_ID [int]
as
	update [dbo].[Territory_Аudiences] set
	[Number_Cabinet] =  @Number_Cabinet,
	[Position_X] = @Position_X ,
	[Position_Y] = @Position_Y ,
	[Width] = @Width ,
	[Height] = @Height  ,
	[Color_ID] = @Color_ID ,
	[Traning_Area_ID] = @Traning_Area_ID,
	[View_ID] = @View_ID 
where
	[ID_Territory_Аudiences] = @ID_Territory_Аudiences
GO

--
-- Создать процедуру [dbo].[Territory_Аudiences_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Territory_Аudiences_Insert]')
GO
Create OR ALTER procedure dbo.Territory_Аudiences_Insert
    @Number_Cabinet [Varchar] (4),
	@Position_X [varchar] (4),
	@Position_Y [varchar] (4),
	@Width [varchar] (3),
	@Height [varchar] (3) ,
	@Color_ID [int] ,
	@Traning_Area_ID [int],
	@View_ID [int]
as insert into [dbo].[Territory_Аudiences] 
	       ([Number_Cabinet],
		    [Position_X],
		    [Position_Y],
			[Width],
			[Height],
			[Color_ID],
			[Traning_Area_ID],
			[View_ID])
	values (@Number_Cabinet,
	        @Position_X,
	        @Position_Y,
			@Width,
			@Height,
			@Color_ID,
			@Traning_Area_ID,
			@View_ID)
GO

--
-- Создать процедуру [dbo].[Territory_Аudiences_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Territory_Аudiences_Delete]')
GO

Create OR ALTER procedure dbo.Territory_Аudiences_Delete
@ID_Territory_Аudiences [int]
as
	delete from [dbo].[Territory_Аudiences]
	where
	[ID_Territory_Аudiences] = @ID_Territory_Аudiences
GO

--
-- Создать таблицу [dbo].[Tasks]
--
PRINT (N'Создать таблицу [dbo].[Tasks]')
GO
CREATE TABLE dbo.Tasks (
  Id_Task int IDENTITY,
  Task_Name nvarchar(30) NOT NULL,
  Task_Detail nvarchar(30) NOT NULL,
  Date_Open nvarchar(11) NOT NULL,
  Date_Close nvarchar(11) NOT NULL,
  TasksId_Task int NULL,
  StatusId_Status int NULL,
  CONSTRAINT PK_Tasks PRIMARY KEY CLUSTERED (Id_Task)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_Tasks_StatusId_Status] для объекта типа таблица [dbo].[Tasks]
--
PRINT (N'Создать индекс [IX_Tasks_StatusId_Status] для объекта типа таблица [dbo].[Tasks]')
GO
CREATE INDEX IX_Tasks_StatusId_Status
  ON dbo.Tasks (StatusId_Status)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Tasks_TasksId_Task] для объекта типа таблица [dbo].[Tasks]
--
PRINT (N'Создать индекс [IX_Tasks_TasksId_Task] для объекта типа таблица [dbo].[Tasks]')
GO
CREATE INDEX IX_Tasks_TasksId_Task
  ON dbo.Tasks (TasksId_Task)
  ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Task_Distributions]
--
PRINT (N'Создать таблицу [dbo].[Task_Distributions]')
GO
CREATE TABLE dbo.Task_Distributions (
  Id_Task_Distribution int IDENTITY,
  Time_Distribution nvarchar(11) NOT NULL,
  Date_Distribution nvarchar(11) NOT NULL,
  Period_Distribution nvarchar(10) NOT NULL,
  PluralityId_Plurality int NULL,
  TaskId_Task int NULL,
  StatusId_Status int NULL,
  CONSTRAINT PK_Task_Distributions PRIMARY KEY CLUSTERED (Id_Task_Distribution)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_Task_Distributions_PluralityId_Plurality] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать индекс [IX_Task_Distributions_PluralityId_Plurality] для объекта типа таблица [dbo].[Task_Distributions]')
GO
CREATE INDEX IX_Task_Distributions_PluralityId_Plurality
  ON dbo.Task_Distributions (PluralityId_Plurality)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Task_Distributions_StatusId_Status] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать индекс [IX_Task_Distributions_StatusId_Status] для объекта типа таблица [dbo].[Task_Distributions]')
GO
CREATE INDEX IX_Task_Distributions_StatusId_Status
  ON dbo.Task_Distributions (StatusId_Status)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Task_Distributions_TaskId_Task] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать индекс [IX_Task_Distributions_TaskId_Task] для объекта типа таблица [dbo].[Task_Distributions]')
GO
CREATE INDEX IX_Task_Distributions_TaskId_Task
  ON dbo.Task_Distributions (TaskId_Task)
  ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Task_Comments]
--
PRINT (N'Создать таблицу [dbo].[Task_Comments]')
GO
CREATE TABLE dbo.Task_Comments (
  Id_Task_Comment int IDENTITY,
  Text_comment nvarchar(100) NOT NULL,
  Type_CommentsId_Type_Comment int NULL,
  Task_DistributionsId_Task_Distribution int NULL,
  CONSTRAINT PK_Task_Comments PRIMARY KEY CLUSTERED (Id_Task_Comment)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_Task_Comments_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[Task_Comments]
--
PRINT (N'Создать индекс [IX_Task_Comments_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[Task_Comments]')
GO
CREATE INDEX IX_Task_Comments_Task_DistributionsId_Task_Distribution
  ON dbo.Task_Comments (Task_DistributionsId_Task_Distribution)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Task_Comments_Type_CommentsId_Type_Comment] для объекта типа таблица [dbo].[Task_Comments]
--
PRINT (N'Создать индекс [IX_Task_Comments_Type_CommentsId_Type_Comment] для объекта типа таблица [dbo].[Task_Comments]')
GO
CREATE INDEX IX_Task_Comments_Type_CommentsId_Type_Comment
  ON dbo.Task_Comments (Type_CommentsId_Type_Comment)
  ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[sysdiagrams]
--
PRINT (N'Создать таблицу [dbo].[sysdiagrams]')
GO
CREATE TABLE dbo.sysdiagrams (
  name sysname NOT NULL,
  principal_id int NOT NULL,
  diagram_id int IDENTITY,
  version int NULL,
  definition varbinary(max) NULL,
  PRIMARY KEY CLUSTERED (diagram_id),
  CONSTRAINT UK_principal_name UNIQUE (principal_id, name)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Statuss]
--
PRINT (N'Создать таблицу [dbo].[Statuss]')
GO
CREATE TABLE dbo.Statuss (
  Id_Status int IDENTITY,
  Status_name nvarchar(30) NOT NULL,
  CONSTRAINT PK_Statuss PRIMARY KEY CLUSTERED (Id_Status)
)
ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Specialty]
--
PRINT (N'Создать таблицу [dbo].[Specialty]')
GO
CREATE TABLE dbo.Specialty (
  ID_Specialty int IDENTITY,
  Number_Specialty varchar(20) NOT NULL,
  Name_Specialty varchar(100) NOT NULL,
  CONSTRAINT PK_Specialty PRIMARY KEY CLUSTERED (ID_Specialty)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Specialty_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Specialty_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ "Специальность" (Прогнано)
create OR ALTER procedure dbo.Specialty_update
@ID_Specialty [int], @Number_Specialty [varchar] (10), @Name_Specialty [varchar] (50)
as
	update [dbo].[Specialty] set
	[Number_Specialty] = @Number_Specialty,
	[Name_Specialty] = @Name_Specialty
	where [ID_Specialty] = @ID_Specialty
GO

--
-- Создать процедуру [dbo].[Specialty_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Specialty_insert]')
GO
-- ПРОЦЕДУРА ДОБАВЛЕНИЯ "Специальность" (Прогнано)
create OR ALTER procedure dbo.Specialty_insert 
@Number_Specialty [varchar] (10), @Name_Specialty [varchar] (50)
as
	insert into [dbo].[Specialty] ([Number_Specialty], [Name_Specialty]) 
	values 
	(@Number_Specialty, @Name_Specialty)
GO

--
-- Создать процедуру [dbo].[Specialty_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Specialty_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ "Специальность" (Прогнано)
create OR ALTER procedure dbo.Specialty_delete
@ID_Specialty [int]
as
	delete [dbo].[Specialty] 
			where [ID_Specialty] = @ID_Specialty
GO

--
-- Создать таблицу [dbo].[Schedule_NLP]
--
PRINT (N'Создать таблицу [dbo].[Schedule_NLP]')
GO
CREATE TABLE dbo.Schedule_NLP (
  ID_Schedule_NLP int IDENTITY,
  Order_Week bit NOT NULL,
  Day_Week nvarchar(max) NULL,
  Number_Classes int NOT NULL,
  NLPp_ID int NULL,
  CONSTRAINT [PK_dbo.Schedule_NLP] PRIMARY KEY CLUSTERED (ID_Schedule_NLP)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Schedule_NLP_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Schedule_NLP_update]')
GO

CREATE OR ALTER procedure dbo.Schedule_NLP_update
@ID_Schedule_NLP [int],@Order_Week [bit] ,@Day_Week VARCHAR(12),@number_Classes INT, @NLPp_ID INT
as
	update [dbo].[Schedule_NLP] set
	 [Order_Week] = @Order_Week,
	 [Day_Week] = @Day_Week,
   [number_Classes] = @number_Classes,
	 [nlpp_id] = @nlpp_id
	where 
	[ID_Schedule_NLP] = @ID_Schedule_NLP
GO

--
-- Создать процедуру [dbo].[Schedule_NLP_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Schedule_NLP_insert]')
GO
CREATE OR ALTER procedure dbo.Schedule_NLP_insert
@Order_Week [bit] ,@Day_Week VARCHAR(12),@number_Classes INT, @NLPp_ID INT
as
	insert into [dbo].[Schedule_NLP] ([Order_Week],[Day_Week],[Number_Classes],[NLPp_ID])
	values (@Order_Week,@Day_Week,@number_Classes,@NLPp_ID)
GO

--
-- Создать процедуру [dbo].[Schedule_NLP_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Schedule_NLP_delete]')
GO

create OR ALTER procedure dbo.Schedule_NLP_delete
@ID_Schedule_NLP [int]
as
	delete from [dbo].[Schedule_NLP]
	where
		[ID_Schedule_NLP] = @ID_Schedule_NLP
GO

--
-- Создать таблицу [dbo].[RUP]
--
PRINT (N'Создать таблицу [dbo].[RUP]')
GO
CREATE TABLE dbo.RUP (
  ID_RUP int IDENTITY,
  Year_Of_Flow varchar(10) NOT NULL,
  Period_Of_Study varchar(20) NOT NULL,
  Specialty_RUP_ID int NOT NULL,
  CONSTRAINT PK_RUP PRIMARY KEY CLUSTERED (ID_RUP)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[RUP_update]
--
GO
PRINT (N'Создать процедуру [dbo].[RUP_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ "РУП" (Прогнано)
create OR ALTER procedure dbo.RUP_update
@ID_RUP [int], @Year_Of_Flow [varchar] (4), @Period_Of_Study [varchar] (10), @Specialty_RUP_ID [int]
as
	update [dbo].[RUP] set
	[Year_Of_Flow] = @Year_Of_Flow,
	[Period_Of_Study] = @Period_Of_Study,
	[Specialty_RUP_ID] = @Specialty_RUP_ID
	where [ID_RUP] = @ID_RUP
GO

--
-- Создать процедуру [dbo].[RUP_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[RUP_insert]')
GO
-- ПРОЦЕДУРА ДОБАВЛЕНИЯ "РУП" (Прогнано)
create OR ALTER procedure dbo.RUP_insert 
@Year_Of_Flow [varchar] (4), @Period_Of_Study [varchar] (10), @Specialty_RUP_ID [int]
as
	insert into [dbo].[RUP] ([Year_Of_Flow], [Period_Of_Study], [Specialty_RUP_ID]) 
	values 
	(@Year_Of_Flow, @Period_Of_Study, @Specialty_RUP_ID)
GO

--
-- Создать процедуру [dbo].[RUP_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[RUP_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ "РУП" (Прогнано)
create OR ALTER procedure dbo.RUP_delete
@ID_RUP [int]
as
	delete [dbo].[RUP] 
			where [ID_RUP] = @ID_RUP
GO

--
-- Создать таблицу [dbo].[Roles]
--
PRINT (N'Создать таблицу [dbo].[Roles]')
GO
CREATE TABLE dbo.Roles (
  Id_Role int IDENTITY,
  Name_Role nvarchar(30) NOT NULL,
  CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (Id_Role)
)
ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Role_In_CMK]
--
PRINT (N'Создать таблицу [dbo].[Role_In_CMK]')
GO
CREATE TABLE dbo.Role_In_CMK (
  ID_Role_In_CMK int IDENTITY,
  Name_Role varchar(50) NOT NULL,
  CONSTRAINT PK_Role_In_CMK PRIMARY KEY CLUSTERED (ID_Role_In_CMK),
  CONSTRAINT UQ_Name_Role UNIQUE (Name_Role),
  CONSTRAINT CH_Name_Role CHECK ([Name_Role] like '%[А-Я]%' OR [Name_Role] like '%[а-я]%' OR [Name_Role] like '%[-]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Role_In_CMK_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Role_In_CMK_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ ДЛЯ ТАБЛИЦЫ "Роль в ЦМК" (Прогнано)
create OR ALTER procedure dbo.Role_In_CMK_update
@ID_Role_In_CMK [int], @Name_Role [varchar] (30)
as
	update [dbo].[Role_In_CMK] set
	[Name_Role] = @Name_Role
	where [ID_Role_In_CMK] = @ID_Role_In_CMK
GO

--
-- Создать процедуру [dbo].[Role_In_CMK_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Role_In_CMK_insert]')
GO
-- ПРОЦЕДУРА ДОБАВЛЕНИЯ ДЛЯ ТАБЛИЦЫ "Роль в ЦМК" (Прогнано)
create OR ALTER procedure dbo.Role_In_CMK_insert 
@Name_Role [varchar] (50)
as
	insert into [dbo].[Role_In_CMK] ([Name_Role]) values 
	(@Name_Role)
GO

--
-- Создать процедуру [dbo].[Role_In_CMK_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Role_In_CMK_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "Роль в ЦМК" (Прогнано)
create OR ALTER procedure dbo.Role_In_CMK_delete
@ID_Role_In_CMK [int]
as
	delete [dbo].[Role_In_CMK] 
			where [ID_Role_In_CMK] = @ID_Role_In_CMK
GO

--
-- Создать таблицу [dbo].[Request]
--
PRINT (N'Создать таблицу [dbo].[Request]')
GO
CREATE TABLE dbo.Request (
  ID_Request int IDENTITY,
  Status bit NOT NULL,
  Text_Request varchar(500) NOT NULL,
  NLP_Request_ID int NOT NULL,
  CONSTRAINT PK_Request PRIMARY KEY CLUSTERED (ID_Request)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Request_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Request_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ ДЛЯ ТАБЛИЦЫ "Запрос"
create OR ALTER procedure dbo.Request_update
@ID_Request [int], @Status [bit], @Text_Request [varchar] (500), @NLP_Request_ID [int]
as
	update [dbo].[Request] set
	[Status] = @Status,
	[Text_Request] = @Text_Request,
	[NLP_Request_ID] = @NLP_Request_ID
	where [ID_Request] = @ID_Request
GO

--
-- Создать процедуру [dbo].[Request_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Request_insert]')
GO
create OR ALTER procedure dbo.Request_insert 
@Status [bit], @Text_Request [varchar] (500), @NLP_Request_ID [int]
as
	insert into [dbo].[Request] ([Status], [Text_Request], [NLP_Request_ID]) values 
	(@Status, @Text_Request, @NLP_Request_ID)
GO

--
-- Создать процедуру [dbo].[Request_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Request_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "Запрос"
create OR ALTER procedure dbo.Request_delete
@ID_Request [int]
as
	delete [dbo].[Request] 
			where [ID_Request] = @ID_Request
GO

--
-- Создать таблицу [dbo].[Quality_control]
--
PRINT (N'Создать таблицу [dbo].[Quality_control]')
GO
CREATE TABLE dbo.Quality_control (
  ID_quality_control int IDENTITY,
  Date_Of_Hosting varchar(10) NOT NULL,
  criteria_ID int NOT NULL,
  MTOK_ID int NOT NULL,
  ocenka int NOT NULL DEFAULT (0),
  CONSTRAINT [PK_Quality control] PRIMARY KEY CLUSTERED (ID_quality_control),
  CONSTRAINT CH_Date_Of_Hosting CHECK ([Date_Of_Hosting] like '[0-9][0-9][.][0-9][0-9][.][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CH_Date_Of_Hosting1 CHECK (format(CONVERT([datetime],[Date_Of_Hosting]),'dd.MM.yyyy')<=format(getdate(),'dd.MM.yyyy'))
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Quality_control_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Quality_control_updated]')
GO

CREATE OR ALTER procedure dbo.Quality_control_updated
	@ID_quality_control [int], @Date_Of_Hosting[varchar] (30), @criteria_ID [int], @MTOK_ID [int], @ocenka INT
as
	update [dbo].[Quality_control] set
	[Date_Of_Hosting] = @Date_Of_Hosting,
	[criteria_ID] = @criteria_ID,
	[MTOK_ID] = @MTOK_ID,
  [ocenka] = @ocenka
where
	[ID_quality_control] = @ID_quality_control

GO

--
-- Создать процедуру [dbo].[Quality_control_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Quality_control_insert]')
GO
 
CREATE OR ALTER procedure dbo.Quality_control_insert
	@Date_Of_Hosting [varchar] (10), @criteria_ID [int], @MTOK_ID [int], @ocenka INT
as
	insert into [dbo].[Quality_control] ([Date_Of_Hosting],[criteria_ID],[MTOK_ID], ocenka)
	values (@Date_Of_Hosting,@criteria_ID,@MTOK_ID, @ocenka)
GO

--
-- Создать процедуру [dbo].[Quality_control_For_Tabel]
--
GO
PRINT (N'Создать процедуру [dbo].[Quality_control_For_Tabel]')
GO


CREATE OR ALTER PROCEDURE dbo.Quality_control_For_Tabel
  @Date_Of_Hosting VARCHAR(30),
  @ID_quality_control int,
  @ocenka int AS
BEGIN
    UPDATE dbo.Quality_control SET
      Date_Of_Hosting = @Date_Of_Hosting,
      criteria_ID = (SELECT qc.criteria_ID FROM Quality_control qc WHERE qc.ID_quality_control = @ID_quality_control),
      MTOK_ID = (SELECT qc.MTOK_ID FROM Quality_control qc WHERE qc.ID_quality_control = @ID_quality_control),
      ocenka = @ocenka
    WHERE ID_quality_control = @ID_quality_control
END
GO

--
-- Создать процедуру [dbo].[Quality_control_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Quality_control_delete]')
GO

create OR ALTER procedure dbo.Quality_control_delete
	@ID_quality_control [int]
as
	delete from [dbo].[Quality_control]
where
	[ID_quality_control] = @ID_quality_control
GO

--
-- Создать таблицу [dbo].[Positions]
--
PRINT (N'Создать таблицу [dbo].[Positions]')
GO
CREATE TABLE dbo.Positions (
  Id_Position int IDENTITY,
  Position_name nvarchar(max) NULL,
  CONSTRAINT PK_Positions PRIMARY KEY CLUSTERED (Id_Position)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[NLP]
--
PRINT (N'Создать таблицу [dbo].[NLP]')
GO
CREATE TABLE dbo.NLP (
  ID_NLP int IDENTITY,
  Date_Forming varchar(10) NOT NULL,
  Number_Of_Weeks varchar(3) NOT NULL,
  Hours_Per_Week varchar(3) NOT NULL,
  Group_ID int NOT NULL,
  Distribution_ID int NOT NULL,
  Form_Of_Control_EU_ID int NULL,
  CONSTRAINT PK_NLP PRIMARY KEY CLUSTERED (ID_NLP),
  CONSTRAINT CH_Date_Forming CHECK (format(CONVERT([datetime],[Date_Forming]),'dd.MM.yyyy')<=format(getdate(),'dd.MM.yyyy')),
  CONSTRAINT CH_Date_Forming_Mask CHECK ([Date_Forming] like '[0-9][0-9][.][0-9][0-9][.][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CH_Hours_Per_Week CHECK ([Hours_Per_Week] like '%[0-9]%'),
  CONSTRAINT CH_Number_Of_Weeks CHECK ([Number_Of_Weeks] like '%[0-9]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[NLP_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[NLP_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "НЛП"
create OR ALTER procedure dbo.NLP_delete
@ID_NLP [int]
as
	delete [dbo].[NLP] 
			where [ID_NLP] = @ID_NLP
GO

--
-- Создать таблицу [dbo].[MTOK]
--
PRINT (N'Создать таблицу [dbo].[MTOK]')
GO
CREATE TABLE dbo.MTOK (
  ID_MTOK int IDENTITY,
  Position_X varchar(4) NOT NULL,
  Position_Y varchar(4) NOT NULL,
  Width varchar(3) NOT NULL,
  Height varchar(3) NOT NULL,
  Territory_Аudiences_ID int NOT NULL,
  Characteristic_MO_ID int NOT NULL,
  MTOK_ID int NULL,
  Inventory_Number varchar(20) NOT NULL,
  CONSTRAINT PK_ID_MTOK PRIMARY KEY CLUSTERED (ID_MTOK),
  UNIQUE (Inventory_Number),
  CONSTRAINT UQ_MTOK UNIQUE (Characteristic_MO_ID),
  CONSTRAINT CH_Height1 CHECK ([Height] like '%[0-9][0-9][0-9]%'),
  CONSTRAINT CH_Inventory_Number1 CHECK ([Inventory_Number] like '%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'),
  CONSTRAINT CH_Position_X1 CHECK ([Position_X] like '%[0-9][0-9][0-9][0-9]%'),
  CONSTRAINT CH_Position_Y1 CHECK ([Position_Y] like '%[0-9][0-9][0-9][0-9]%'),
  CONSTRAINT CH_Width1 CHECK ([Width] like '%[0-9][0-9][0-9]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[MTOK_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[MTOK_Update]')
GO

Create OR ALTER procedure dbo.MTOK_Update
	@ID_MTOK [int],
	@Position_X [varchar] (4),
	@Position_Y [varchar] (4),
	@Width [varchar] (3),
	@Height [varchar] (3) ,
	@Territory_Аudiences_ID [int] ,
	@MTOK_ID [int],
	@Inventory_Number [varchar] (12)
as
	update [dbo].[MTOK] set
	[Position_X] = @Position_X ,
	[Position_Y] = @Position_Y ,
	[Width] = @Width ,
	[Height] = @Height  ,
	[Territory_Аudiences_ID] = @Territory_Аudiences_ID ,
	[MTOK_ID] = @MTOK_ID,
	[Inventory_Number] = @Inventory_Number 
where
	[ID_MTOK] = @ID_MTOK
GO

--
-- Создать процедуру [dbo].[MTOK_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[MTOK_Insert]')
GO
Create OR ALTER procedure dbo.MTOK_Insert
	@Position_X [varchar] (4),
	@Position_Y [varchar] (4),
	@Width [varchar] (3),
	@Height [varchar] (3) ,
    @Inventory_Number [varchar] (12),
	@Territory_Аudiences_ID [int] ,
	@MTOK_ID [int]
as insert into [dbo].[MTOK] 
	       ([Position_X],
		    [Position_Y],
			[Width],
			[Height],
			[Territory_Аudiences_ID],
			[MTOK_ID])
	values (@Position_X,
	        @Position_Y,
			@Width,
			@Height,
			@Territory_Аudiences_ID,
			@MTOK_ID)
GO

--
-- Создать таблицу [dbo].[Material_Provision]
--
PRINT (N'Создать таблицу [dbo].[Material_Provision]')
GO
CREATE TABLE dbo.Material_Provision (
  ID_Material_Provision int IDENTITY,
  Name_Material_Provision varchar(55) NOT NULL,
  CONSTRAINT PK_ID_Material_Provision PRIMARY KEY CLUSTERED (ID_Material_Provision),
  UNIQUE (Name_Material_Provision),
  CONSTRAINT CH_ID_Material_Provision CHECK ([Name_Material_Provision] like '%[А-Я]%' OR [Name_Material_Provision] like '%[0-9]%' OR [Name_Material_Provision] like '%[№/()*”]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Material_Provision_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Material_Provision_Update]')
GO

Create OR ALTER procedure dbo.Material_Provision_Update
@ID_View_Provision [int], @Name_View_Provision [varchar] (45)
as 
	update [dbo].[Material_Provision] set
	[Name_Material_Provision] = @Name_View_Provision
where
	[ID_Material_Provision] = @ID_View_Provision
GO

--
-- Создать процедуру [dbo].[Material_Provision_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Material_Provision_Insert]')
GO
Create OR ALTER procedure dbo.Material_Provision_Insert
@Name_Material_Provision [varchar] (45)
as insert into [dbo].[Material_Provision]
([Name_Material_Provision])
values
(@Name_Material_Provision)
GO

--
-- Создать процедуру [dbo].[Material_Provision_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Material_Provision_Delete]')
GO

Create OR ALTER procedure dbo.Material_Provision_Delete
@ID_Material_Provision [int]
as
delete from [dbo].[Material_Provision]
where [ID_Material_Provision] = @ID_Material_Provision
GO

--
-- Создать таблицу [dbo].[Kind_criteria]
--
PRINT (N'Создать таблицу [dbo].[Kind_criteria]')
GO
CREATE TABLE dbo.Kind_criteria (
  ID_Kind_criteria int IDENTITY,
  Name_of_kind_criteria varchar(100) NULL,
  CONSTRAINT PK_Kind_criteria PRIMARY KEY CLUSTERED (ID_Kind_criteria),
  CONSTRAINT UK_Name_of_kind_criteria UNIQUE (Name_of_kind_criteria)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Kind_criteria_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Kind_criteria_updated]')
GO
create OR ALTER procedure dbo.Kind_criteria_updated
	@ID_Kind_criteria [int], @Name_of_kind_criteria [varchar] (100)
as
	update [dbo].[Kind_criteria] set
		[Name_of_kind_criteria] = @Name_of_kind_criteria
where
		[ID_Kind_criteria] = @ID_Kind_criteria

GO

--
-- Создать процедуру [dbo].[Kind_criteria_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Kind_criteria_insert]')
GO
create OR ALTER procedure dbo.Kind_criteria_insert
	@Name_of_kind_criteria [varchar] (100)
as
	insert into [dbo].[Kind_criteria] (Name_of_kind_criteria)
	values (@Name_of_kind_criteria)
GO

--
-- Создать процедуру [dbo].[Kind_criteria_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Kind_criteria_delete]')
GO

create OR ALTER procedure dbo.Kind_criteria_delete
	@ID_Kind_criteria [int]
as
	delete from [dbo].[Kind_criteria]
where
	[ID_Kind_criteria] = @ID_Kind_criteria
GO

--
-- Создать таблицу [dbo].[GGroup]
--
PRINT (N'Создать таблицу [dbo].[GGroup]')
GO
CREATE TABLE dbo.GGroup (
  ID_Group int IDENTITY,
  Name_Group varchar(15) NOT NULL,
  Specialty_ID int NOT NULL,
  CONSTRAINT PK_Group PRIMARY KEY CLUSTERED (ID_Group),
  CONSTRAINT UQ_Name_Group UNIQUE (Name_Group),
  CONSTRAINT CH_Name_Group CHECK ([Name_Group] like '%[А-Я]%' OR [Name_Group] like '%[а-я]%' OR [Name_Group] like '%[0-9]%' OR [Name_Group] like '%[-]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[GGroup_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[GGroup_delete]')
GO

CREATE OR ALTER PROCEDURE dbo.GGroup_delete
  @ID_Group INT
 as
  	DELETE FROM dbo.GGroup
    WHERE
      ID_Group = @ID_Group
GO

--
-- Создать таблицу [dbo].[Functions]
--
PRINT (N'Создать таблицу [dbo].[Functions]')
GO
CREATE TABLE dbo.Functions (
  Id_Function int IDENTITY,
  Name_function nvarchar(30) NOT NULL,
  CONSTRAINT PK_Functions PRIMARY KEY CLUSTERED (Id_Function)
)
ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Form_Of_Control_EU]
--
PRINT (N'Создать таблицу [dbo].[Form_Of_Control_EU]')
GO
CREATE TABLE dbo.Form_Of_Control_EU (
  ID_Form_Of_Control_EU int IDENTITY,
  Number_Of_Semester varchar(10) NOT NULL,
  Form_Of_Control_ID int NOT NULL,
  Theoretical_Hours varchar(3) NULL DEFAULT (0),
  Lab_Prac_Hours varchar(3) NULL DEFAULT (0),
  Individual_Work varchar(5) NULL DEFAULT (0),
  Consultations varchar(5) NULL DEFAULT (0),
  Coursework_Project varchar(5) NULL DEFAULT (0),
  Interim_Certification varchar(5) NULL DEFAULT (0),
  Number_Of_Weeks varchar(3) NULL,
  EU_CMK_RUP_Form_ID int NULL,
  CONSTRAINT PK_Form_Of_Control_EU PRIMARY KEY CLUSTERED (ID_Form_Of_Control_EU)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Form_Of_Control_EU_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_EU_updated]')
GO

create OR ALTER procedure dbo.Form_Of_Control_EU_updated
	@ID_Form_Of_Control_EU [int], @Number_Of_Semester[varchar] (1), @Form_Of_Control_ID [int]
as
update [dbo].[Form_Of_Control_EU] set
	[Number_Of_Semester] = @Number_Of_Semester,
	[Form_Of_Control_ID] = @Form_Of_Control_ID
where
	[ID_Form_Of_Control_EU] = @ID_Form_Of_Control_EU

GO

--
-- Создать процедуру [dbo].[Form_Of_Control_EU_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_EU_insert]')
GO


create OR ALTER procedure dbo.Form_Of_Control_EU_insert
	@Number_Of_Semester[varchar] (30), @Form_Of_Control_ID [int]
as
insert into [dbo].[Form_Of_Control_EU] ([Number_Of_Semester], [Form_Of_Control_ID])
values (@Number_Of_Semester, @Form_Of_Control_ID)
GO

--
-- Создать процедуру [dbo].[Form_Of_Control_EU_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_EU_delete]')
GO

create OR ALTER procedure dbo.Form_Of_Control_EU_delete
	@ID_Form_Of_Control_EU [int]
as
delete from [dbo].[Form_Of_Control_EU]
where
	[ID_Form_Of_Control_EU] = @ID_Form_Of_Control_EU
GO

--
-- Создать таблицу [dbo].[Form_Of_Control]
--
PRINT (N'Создать таблицу [dbo].[Form_Of_Control]')
GO
CREATE TABLE dbo.Form_Of_Control (
  ID_Form_Of_Control int IDENTITY,
  Name_Of_The_Form varchar(100) NOT NULL,
  CONSTRAINT PK_Form_Of_Control PRIMARY KEY CLUSTERED (ID_Form_Of_Control)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Form_Of_Control_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_updated]')
GO

create OR ALTER procedure dbo.Form_Of_Control_updated
	@ID_Form_Of_Control [int], @Name_Of_The_Form[varchar] (30)
as
update [dbo].[Form_Of_Control] set
	[Name_Of_The_Form] = @Name_Of_The_Form
where
	[ID_Form_Of_Control] = @ID_Form_Of_Control

GO

--
-- Создать процедуру [dbo].[Form_Of_Control_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_insert]')
GO


create OR ALTER procedure dbo.Form_Of_Control_insert
	@Name_Of_The_Form[varchar] (30)
as
insert into [dbo].[Form_Of_Control] ([Name_Of_The_Form])
values (@Name_Of_The_Form)
GO

--
-- Создать процедуру [dbo].[Form_Of_Control_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Of_Control_delete]')
GO

create OR ALTER procedure dbo.Form_Of_Control_delete
	@ID_Form_Of_Control [int]
as
delete from [dbo].[Form_Of_Control]
where
	[ID_Form_Of_Control] = @ID_Form_Of_Control
GO

--
-- Создать таблицу [dbo].[Form]
--
PRINT (N'Создать таблицу [dbo].[Form]')
GO
CREATE TABLE dbo.Form (
  ID_Form int IDENTITY,
  Name_Form varchar(30) NOT NULL,
  Color_ID int NOT NULL,
  CONSTRAINT PK_ID_Form PRIMARY KEY CLUSTERED (ID_Form),
  UNIQUE (Name_Form),
  CONSTRAINT CH_Name_Form CHECK ([Name_Form] like '%[А-Я]%' OR [Name_Form] like '%[0-9]%' OR [Name_Form] like '%[№/()*”]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Form_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Update]')
GO

Create OR ALTER procedure dbo.Form_Update
@Form_ID [int], @Name_Form [varchar] (30), @Color_ID [int]
as
	update [dbo].[Form] set
	[Name_Form] = @Name_Form,
	[Color_ID] = @Color_ID
where 
	[ID_Form] = @Form_ID
GO

--
-- Создать процедуру [dbo].[Form_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Insert]')
GO
Create OR ALTER procedure dbo.Form_Insert
@Name_Form [varchar] (30), @Color_ID [int]
as
	insert into  [dbo].[Form]
	([Name_Form],[Color_ID])
	values
	(@Name_Form, @Color_ID)
GO

--
-- Создать процедуру [dbo].[Form_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Form_Delete]')
GO

Create OR ALTER procedure dbo.Form_Delete
@Form_ID [int]
as
	delete from [dbo].[Form]
	where
	[ID_Form] = @Form_ID
GO

--
-- Создать таблицу [dbo].[File_Tasks]
--
PRINT (N'Создать таблицу [dbo].[File_Tasks]')
GO
CREATE TABLE dbo.File_Tasks (
  Id_File_Task int IDENTITY,
  Path_File nvarchar(50) NOT NULL,
  File_Detail nvarchar(50) NOT NULL,
  Task_DistributionsId_Task_Distribution int NULL,
  CONSTRAINT PK_File_Tasks PRIMARY KEY CLUSTERED (Id_File_Task)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_File_Tasks_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[File_Tasks]
--
PRINT (N'Создать индекс [IX_File_Tasks_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[File_Tasks]')
GO
CREATE INDEX IX_File_Tasks_Task_DistributionsId_Task_Distribution
  ON dbo.File_Tasks (Task_DistributionsId_Task_Distribution)
  ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[EU_CMK_RUP]
--
PRINT (N'Создать таблицу [dbo].[EU_CMK_RUP]')
GO
CREATE TABLE dbo.EU_CMK_RUP (
  ID_EU_CMK_RUP int IDENTITY,
  Prefix varchar(20) NULL,
  Total_Number_Of_Hours varchar(10) NOT NULL,
  Theoretical_Hours varchar(10) NULL DEFAULT (0),
  Lab_Prac_Hours varchar(10) NULL DEFAULT (0),
  Individual_Work varchar(10) NULL DEFAULT (0),
  Consultations varchar(10) NULL DEFAULT (0),
  Coursework_Project varchar(10) NULL DEFAULT (0),
  Interim_Certification varchar(10) NULL DEFAULT (0),
  Educational_Unit_ID int NOT NULL,
  Type_Of_Educational_Unit_ID int NOT NULL,
  CMK_RUP_ID int NOT NULL,
  EU_CMK_RUP_ID int NULL,
  CONSTRAINT PK_EU_CMK_RUP PRIMARY KEY CLUSTERED (ID_EU_CMK_RUP)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[EU_CMK_RUP_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[EU_CMK_RUP_delete]')
GO

create OR ALTER procedure dbo.EU_CMK_RUP_delete
	@ID_EU_CMK_RUP [int]
as
delete from [dbo].[EU_CMK_RUP]
where
	[ID_EU_CMK_RUP] = @ID_EU_CMK_RUP
GO

--
-- Создать таблицу [dbo].[Employees]
--
PRINT (N'Создать таблицу [dbo].[Employees]')
GO
CREATE TABLE dbo.Employees (
  Id_Employee int IDENTITY,
  Surname nvarchar(30) NOT NULL,
  Name nvarchar(30) NOT NULL,
  Second_Name nvarchar(30) NOT NULL,
  Employee_Number int NOT NULL,
  CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (Id_Employee)
)
ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Educational_Unit]
--
PRINT (N'Создать таблицу [dbo].[Educational_Unit]')
GO
CREATE TABLE dbo.Educational_Unit (
  ID_Educational_Unit int IDENTITY,
  Name_Of_The_EU varchar(200) NOT NULL,
  CONSTRAINT PK_Educational_Unit PRIMARY KEY CLUSTERED (ID_Educational_Unit)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Educational_Unit_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Educational_Unit_updated]')
GO

create OR ALTER procedure dbo.Educational_Unit_updated
	@ID_Educational_Unit [int], @Name_Of_The_EU[varchar] (30)
as
update [dbo].[Educational_Unit] set
	[Name_Of_The_EU] = @Name_Of_The_EU
where
	[ID_Educational_Unit] = @ID_Educational_Unit

GO

--
-- Создать процедуру [dbo].[Educational_Unit_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Educational_Unit_insert]')
GO


create OR ALTER procedure dbo.Educational_Unit_insert
	@Name_Of_The_EU[varchar] (30)
as
insert into [dbo].[Educational_Unit] ([Name_Of_The_EU])
values (@Name_Of_The_EU)
GO

--
-- Создать процедуру [dbo].[Educational_Unit_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Educational_Unit_delete]')
GO

create OR ALTER procedure dbo.Educational_Unit_delete
	@ID_Educational_Unit [int]
as
delete from [dbo].[Educational_Unit]
where
	[ID_Educational_Unit] = @ID_Educational_Unit
GO

--
-- Создать таблицу [dbo].[Documents_EU]
--
PRINT (N'Создать таблицу [dbo].[Documents_EU]')
GO
CREATE TABLE dbo.Documents_EU (
  ID_Documents_EU int IDENTITY,
  Document_Title varchar(30) NULL,
  Link_To_The_Document varchar(max) NULL,
  Document_Template_ID int NOT NULL,
  EU_CMK_RUP_ID int NOT NULL,
  CONSTRAINT PK_Documents_EU PRIMARY KEY CLUSTERED (ID_Documents_EU)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Documents_EU_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[Documents_EU_updated]')
GO

create OR ALTER procedure dbo.Documents_EU_updated
	@ID_Documents_EU [int], @Document_Title[varchar] (30), @Link_To_The_Document [varchar] (max), @Document_Template_ID [int], @EU_CMK_RUP_ID [int]
as
update [dbo].[Documents_EU] set
	[Document_Title] = @Document_Title,
	[Link_To_The_Document] = @Link_To_The_Document,
	[Document_Template_ID] = @Document_Template_ID,
	[EU_CMK_RUP_ID] = @EU_CMK_RUP_ID
where
	[ID_Documents_EU] = @ID_Documents_EU

GO

--
-- Создать процедуру [dbo].[Documents_EU_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Documents_EU_insert]')
GO


create OR ALTER procedure dbo.Documents_EU_insert
	@Document_Title[varchar] (30), @Link_To_The_Document [varchar] (max), @Document_Template_ID [int], @EU_CMK_RUP_ID [int]
as
insert into [dbo].[Documents_EU] ([Document_Title],[Link_To_The_Document],[Document_Template_ID], [EU_CMK_RUP_ID])
values (@Document_Title,@Link_To_The_Document, @Document_Template_ID,@EU_CMK_RUP_ID)
GO

--
-- Создать процедуру [dbo].[Documents_EU_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Documents_EU_delete]')
GO

create OR ALTER procedure dbo.Documents_EU_delete
	@ID_Documents_EU [int]
as
delete from [dbo].[Documents_EU]
where
	[ID_Documents_EU] = @ID_Documents_EU
GO

--
-- Создать таблицу [dbo].[Document_Template]
--
PRINT (N'Создать таблицу [dbo].[Document_Template]')
GO
CREATE TABLE dbo.Document_Template (
  ID_Document_Template int IDENTITY,
  Path_To_File varchar(max) NOT NULL,
  Document_Name varchar(30) NOT NULL,
  CONSTRAINT PK_Document_Template PRIMARY KEY CLUSTERED (ID_Document_Template),
  CONSTRAINT CH_Path_To_File CHECK ([Path_To_File] like '%[A-Z]%' OR [Path_To_File] like '%[a-z]%' OR [Path_To_File] like '%[-\:@#№]%')
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Document_Template_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Document_Template_update]')
GO
create OR ALTER procedure dbo.Document_Template_update 
@ID_Document_Template [int], @Path_To_File [varchar] (max), @Document_Name[varchar] (30) 
as 
update [dbo].[Document_Template] set 
[Path_To_File] = @Path_To_File,
[Document_Name] = @Document_Name
where 
[ID_Document_Template] = @ID_Document_Template 

GO

--
-- Создать процедуру [dbo].[Document_Template_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Document_Template_insert]')
GO
create OR ALTER procedure dbo.Document_Template_insert 
 @Path_To_File [varchar] (max), @Document_Name[varchar] (30)
as 
insert into [dbo].[Document_Template] ([Path_To_File],[Document_Name]) 
values (@Path_To_File, @Document_Name) 
GO

--
-- Создать процедуру [dbo].[Document_Template_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Document_Template_delete]')
GO

create OR ALTER procedure dbo.Document_Template_delete
	@ID_Document_Template [int]
as
delete from [dbo].[Document_Template]
where
	[ID_Document_Template] = @ID_Document_Template
GO

--
-- Создать таблицу [dbo].[Distribution]
--
PRINT (N'Создать таблицу [dbo].[Distribution]')
GO
CREATE TABLE dbo.Distribution (
  ID_Distribution int IDENTITY,
  Priority int NOT NULL,
  Territory_Аudiences_ID int NOT NULL,
  NLP_ID int NOT NULL,
  CONSTRAINT PK_Distribution PRIMARY KEY CLUSTERED (ID_Distribution),
  CONSTRAINT UQ_Priority_Territory_Аudiences_ID UNIQUE (Priority, Territory_Аudiences_ID),
  CONSTRAINT UQ_Priority_Territory_Аudiences_ID_NLP_ID UNIQUE (Priority, Territory_Аudiences_ID, NLP_ID),
  CONSTRAINT UQ_Territory_Аudiences_ID_NLP_ID UNIQUE (Territory_Аudiences_ID, NLP_ID),
  CONSTRAINT CH_Priority CHECK ([Priority] like '[0-9]')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[distribution_update]
--
GO
PRINT (N'Создать процедуру [dbo].[distribution_update]')
GO

create OR ALTER procedure dbo.distribution_update
@id_distribution [int],@priority [int] ,@territory_аudiences_id [int],
@nlp_id [int]
as
	update [dbo].[distribution] set
	 [priority] = @priority,
	 [territory_аudiences_id] = @territory_аudiences_id,
	 [nlp_id] = @nlp_id
	where 
	[id_distribution] = @id_distribution
GO

--
-- Создать процедуру [dbo].[distribution_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[distribution_insert]')
GO
create OR ALTER procedure dbo.distribution_insert
@priority [int] ,@territory_аudiences_id [int],
@nlp_id [int]
as
	insert into [dbo].[distribution] ([priority],[territory_аudiences_id],[nlp_id])
	values (@priority,@territory_аudiences_id,@nlp_id)
GO

--
-- Создать процедуру [dbo].[distribution_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[distribution_delete]')
GO

create OR ALTER procedure dbo.distribution_delete
@id_distribution [int]
as
	delete from [dbo].[distribution]
	where
		[id_distribution] = @id_distribution
GO

--
-- Создать таблицу [dbo].[Criteria]
--
PRINT (N'Создать таблицу [dbo].[Criteria]')
GO
CREATE TABLE dbo.Criteria (
  ID_criteria int IDENTITY,
  Name_criteria varchar(100) NOT NULL,
  kind_criteria_ID int NOT NULL,
  ranging int NOT NULL,
  CONSTRAINT PK_criteria PRIMARY KEY CLUSTERED (ID_criteria)
)
ON [PRIMARY]
GO

--
-- Создать функцию [dbo].[Kamil_CriteriaFill]
--
GO
PRINT (N'Создать функцию [dbo].[Kamil_CriteriaFill]')
GO
create OR ALTER function dbo.Kamil_CriteriaFill (@ID_Kind_criteria INT)
returns @CriteriaFill TABLE (ID_Criteria int, Name_criteria varchar(max), kind_criteria_ID int, ranging int, Name_of_kind_criteria varchar(MAX))
as begin
        IF @ID_Kind_criteria != 0 BEGIN
            insert into @CriteriaFill
    	SELECT [ID_Criteria],[Name_criteria], [kind_criteria_ID], [ranging],
                         [Name_of_kind_criteria] as "Название вида критерия" from [dbo].[Criteria]
                         inner join [dbo].[Kind_criteria] on [dbo].[Kind_criteria].[ID_Kind_criteria] = [dbo].[Criteria].[kind_criteria_ID]
    	WHERE [dbo].[Kind_criteria].[ID_Kind_criteria] = @ID_Kind_criteria
      RETURN
    END
        insert into @CriteriaFill
        SELECT [ID_Criteria],[Name_criteria], [kind_criteria_ID], [ranging],
                         [Name_of_kind_criteria] as "Название вида критерия" from [dbo].[Criteria]
                         inner join [dbo].[Kind_criteria] on [dbo].[Kind_criteria].[ID_Kind_criteria] = [dbo].[Criteria].[kind_criteria_ID]
      RETURN
     END
GO

--
-- Создать процедуру [dbo].[criteria_updated]
--
GO
PRINT (N'Создать процедуру [dbo].[criteria_updated]')
GO
create OR ALTER procedure dbo.criteria_updated
@ID_criteria [int], @Name_criteria[varchar] (30), @kind_criteria_ID [int], @ranging [int]
as
update [dbo].[criteria] set
[Name_criteria] = @Name_criteria,
[kind_criteria_ID] = @kind_criteria_ID,
[ranging] = @ranging
where
[ID_criteria] = @ID_criteria

GO

--
-- Создать процедуру [dbo].[criteria_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[criteria_insert]')
GO


create OR ALTER procedure dbo.criteria_insert
	@Name_criteria [varchar] (100), @kind_criteria_ID [int], @ranging [int]
as
	insert into [dbo].[criteria] ([Name_criteria],[kind_criteria_ID],[ranging])
	values (@Name_criteria,@kind_criteria_ID,@ranging)
GO

--
-- Создать процедуру [dbo].[criteria_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[criteria_delete]')
GO

create OR ALTER procedure dbo.criteria_delete
	@ID_criteria [int]
as
	delete from [dbo].[criteria]
where
	[ID_criteria] = @ID_criteria
GO

--
-- Создать таблицу [dbo].[Color]
--
PRINT (N'Создать таблицу [dbo].[Color]')
GO
CREATE TABLE dbo.Color (
  ID_Color int IDENTITY,
  Value_Color varchar(25) NOT NULL,
  CONSTRAINT PK_ID_Color PRIMARY KEY CLUSTERED (ID_Color),
  CONSTRAINT CH_Value_Color CHECK ([Value_Color] like '%[а-я]%' OR [Value_Color] like '%[А-Я]%' OR [Value_Color] like '%[0-9]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Color_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Color_Update]')
GO

Create OR ALTER procedure dbo.Color_Update
@ID_Color [int], @Value_Color [varchar] (25)
as
	update [dbo].[Color] set
	[Value_Color] = @Value_Color
	where
	[ID_Color] = @ID_Color
GO

--
-- Создать процедуру [dbo].[Color_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Color_Insert]')
GO
Create OR ALTER procedure dbo.Color_Insert
@Value_Color [varchar] (25)
as
	insert into [dbo].[Color]
	([Value_Color])
	values
	(@Value_Color)
GO

--
-- Создать процедуру [dbo].[Color_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Color_Delete]')
GO

Create OR ALTER procedure dbo.Color_Delete
@ID_Color [int]
as
	delete from [dbo].[Color]
	where
	[ID_Color] = @ID_Color
GO

--
-- Создать таблицу [dbo].[CMK]
--
PRINT (N'Создать таблицу [dbo].[CMK]')
GO
CREATE TABLE dbo.CMK (
  ID_CMK int IDENTITY,
  Name_CMK varchar(100) NOT NULL,
  CONSTRAINT PK_CMK PRIMARY KEY CLUSTERED (ID_CMK)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[CMK_update]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ ДЛЯ ТАБЛИЦЫ "ЦМК" (Прогнано)
create OR ALTER procedure dbo.CMK_update
@ID_CMK [int], @Name_CMK [varchar] (30)
as
	update [dbo].[CMK] set
	[Name_CMK] = @Name_CMK
	where [ID_CMK] = @ID_CMK
GO

--
-- Создать процедуру [dbo].[CMK_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_insert]')
GO
-- ПРОЦЕДУРА ДОБАВЛЕНИЯ ДЛЯ ТАБЛИЦЫ "ЦМК" (Прогнано)
create OR ALTER procedure dbo.CMK_insert 
@Name_CMK [varchar] (50)
as
	insert into [dbo].[CMK] ([Name_CMK]) values 
	(@Name_CMK)
GO

--
-- Создать процедуру [dbo].[CMK_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "ЦМК" (Прогнано)
create OR ALTER procedure dbo.CMK_delete
@ID_CMK [int]
as
	delete [dbo].[CMK] 
			where [ID_CMK] = @ID_CMK
GO

--
-- Создать таблицу [dbo].[Characteristic_MO]
--
PRINT (N'Создать таблицу [dbo].[Characteristic_MO]')
GO
CREATE TABLE dbo.Characteristic_MO (
  ID_Characteristic_MO int IDENTITY,
  Indicator varchar(15) NOT NULL,
  Form_ID int NOT NULL,
  Characteristic_ID int NOT NULL,
  Material_Provisions_ID int NOT NULL,
  Inventory_Number varchar(15) NOT NULL,
  CONSTRAINT PK_ID_Characteristic_MO PRIMARY KEY CLUSTERED (ID_Characteristic_MO),
  UNIQUE (Inventory_Number),
  CONSTRAINT UQ_Characteristic_MO UNIQUE (Material_Provisions_ID),
  CONSTRAINT CH_Indicator CHECK ([Indicator] like '%[А-Я]%' OR [Indicator] like '%[0-9]%' OR [Indicator] like '%[№/()*”]%'),
  CONSTRAINT CH_Inventory_Number CHECK ([Inventory_Number] like '%[0-9]%' OR [Inventory_Number] like '%[0-9]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Characteristic_MO_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_MO_Update]')
GO

Create OR ALTER procedure dbo.Characteristic_MO_Update
	@ID_Characteristic_MO [int],
	@Indicator [varchar] (15),
	@Form_ID [int],
	@Characteristic_ID [int],
	@Material_Provisions_ID [int],
	@Inventory_Number [varchar] (15)
as
	Update [dbo].[Characteristic_MO] set
	[Indicator] = @Indicator,
	[Form_ID] = @Form_ID,
	[Characteristic_ID] = @Characteristic_ID,
	[Material_Provisions_ID] = @Material_Provisions_ID,
	[Inventory_Number] = @Inventory_Number
where
	[ID_Characteristic_MO] = @ID_Characteristic_MO
GO

--
-- Создать процедуру [dbo].[Characteristic_MO_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_MO_Insert]')
GO
Create OR ALTER procedure dbo.Characteristic_MO_Insert
	@Indicator [varchar] (15),
	@Form_ID [int],
	@Characteristic_ID [int],
	@Material_Provisions_ID [int],
	@Inventory_Number [varchar] (15)
as
	Insert into [dbo].[Characteristic_MO]
	([Indicator],
	 [Form_ID],
	 [Characteristic_ID],
	 [Material_Provisions_ID],
	 [Inventory_Number])
values
	 (@Indicator,
	  @Form_ID,
	  @Characteristic_ID,
	  @Material_Provisions_ID,
	  @Inventory_Number)
GO

--
-- Создать процедуру [dbo].[Characteristic_MO_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_MO_Delete]')
GO

Create OR ALTER procedure dbo.Characteristic_MO_Delete
@ID_Characteristic_MO [int]
as
	Delete from [dbo].[Characteristic_MO]
where
	[ID_Characteristic_MO] = @ID_Characteristic_MO
GO

--
-- Создать представление [dbo].[Kamil_Statistic_Minus_Audiences]
--
GO
PRINT (N'Создать представление [dbo].[Kamil_Statistic_Minus_Audiences]')
GO
create OR ALTER view dbo.Kamil_Statistic_Minus_Audiences
as SELECT Quality_control.ID_quality_control,
       Quality_control.MTOK_ID, Quality_control.criteria_ID, Traning_Area.Full_Name
       ,Territory_Аudiences.Number_Cabinet
     ,Material_Provision.Name_Material_Provision
     ,MTOK.Inventory_Number
     ,Kind_criteria.Name_of_kind_criteria
      ,Criteria.Name_criteria
      ,Criteria.ranging
     ,Quality_control.ocenka
FROM dbo.Quality_control
    INNER JOIN dbo.MTOK
        ON Quality_control.MTOK_ID = MTOK.ID_MTOK
    INNER JOIN dbo.Territory_Аudiences
        ON MTOK.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences
    INNER JOIN dbo.Traning_Area
        ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area
    INNER JOIN dbo.Characteristic_MO
        ON MTOK.Characteristic_MO_ID = Characteristic_MO.ID_Characteristic_MO
    INNER JOIN dbo.Material_Provision
        ON Characteristic_MO.Material_Provisions_ID = Material_Provision.ID_Material_Provision
    INNER JOIN dbo.Criteria  ON Quality_control.criteria_ID = Criteria.ID_criteria INNER JOIN dbo.Kind_criteria  ON Criteria.kind_criteria_ID = Kind_criteria.ID_Kind_criteria
where ocenka < ranging
GO

--
-- Создать таблицу [dbo].[Characteristic]
--
PRINT (N'Создать таблицу [dbo].[Characteristic]')
GO
CREATE TABLE dbo.Characteristic (
  ID_Characteristic int IDENTITY,
  Name_Characteristic varchar(55) NOT NULL,
  View_Provisions_ID int NOT NULL,
  CONSTRAINT PK_ID_Characteristic PRIMARY KEY CLUSTERED (ID_Characteristic),
  UNIQUE (Name_Characteristic),
  CONSTRAINT CH_Name_Characteristic CHECK ([Name_Characteristic] like '%[А-Я]%' OR [Name_Characteristic] like '%[0-9]%' OR [Name_Characteristic] like '%[№/()*”]%')
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Characteristic_Update]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_Update]')
GO

Create OR ALTER procedure dbo.Characteristic_Update
@ID_Characteristic [int], @Name_Characteristic [varchar] (55), @View_Provision_ID [int]
as
	update [dbo].[Characteristic] set
    [Name_Characteristic] = @Name_Characteristic,
	[View_Provisions_ID] = @View_Provision_ID
where
	[ID_Characteristic] = @ID_Characteristic
GO

--
-- Создать процедуру [dbo].[Characteristic_Insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_Insert]')
GO
Create OR ALTER procedure dbo.Characteristic_Insert
@Name_Characteristic [varchar] (55), @View_Provision_ID [int]
as
	insert into [dbo].[Characteristic]
    ([Name_Characteristic],
	 [View_Provisions_ID])
values
	 (@Name_Characteristic,
	  @View_Provision_ID)
GO

--
-- Создать процедуру [dbo].[Characteristic_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Characteristic_Delete]')
GO

Create OR ALTER procedure dbo.Characteristic_Delete
@ID_Characteristic [int]
as
	delete from [dbo].[Characteristic]
where
	[ID_Characteristic] = @ID_Characteristic
GO

--
-- Создать таблицу [dbo].[Accounts]
--
PRINT (N'Создать таблицу [dbo].[Accounts]')
GO
CREATE TABLE dbo.Accounts (
  Id_Account int IDENTITY,
  Login nvarchar(30) NOT NULL,
  Password nvarchar(30) NOT NULL,
  Date_Create nvarchar(max) NULL,
  Phone_Number nvarchar(16) NOT NULL,
  Email nvarchar(30) NOT NULL,
  RightsId_Rights int NULL,
  PluralityId_Plurality int NULL,
  CONSTRAINT PK_Accounts PRIMARY KEY CLUSTERED (Id_Account)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать индекс [IX_Accounts_PluralityId_Plurality] для объекта типа таблица [dbo].[Accounts]
--
PRINT (N'Создать индекс [IX_Accounts_PluralityId_Plurality] для объекта типа таблица [dbo].[Accounts]')
GO
CREATE INDEX IX_Accounts_PluralityId_Plurality
  ON dbo.Accounts (PluralityId_Plurality)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Accounts_RightsId_Rights] для объекта типа таблица [dbo].[Accounts]
--
PRINT (N'Создать индекс [IX_Accounts_RightsId_Rights] для объекта типа таблица [dbo].[Accounts]')
GO
CREATE INDEX IX_Accounts_RightsId_Rights
  ON dbo.Accounts (RightsId_Rights)
  ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[UpdatePassword]
--
GO
PRINT (N'Создать процедуру [dbo].[UpdatePassword]')
GO
CREATE OR ALTER PROCEDURE dbo.UpdatePassword
@Id_Account [int],@Password [varchar] (30)
as
	update [dbo].[Accounts] set
    [Password] = @Password
	where 
	[Id_Account] = @Id_Account
GO

--
-- Создать таблицу [dbo].[__MigrationHistory]
--
PRINT (N'Создать таблицу [dbo].[__MigrationHistory]')
GO
CREATE TABLE dbo.__MigrationHistory (
  MigrationId nvarchar(150) NOT NULL,
  ContextKey nvarchar(300) NOT NULL,
  Model varbinary(max) NOT NULL,
  ProductVersion nvarchar(32) NOT NULL,
  CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED (MigrationId, ContextKey)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[SqlQueryNotificationStoredProcedure-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]
--
GO
PRINT (N'Создать процедуру [dbo].[SqlQueryNotificationStoredProcedure-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]')
GO
CREATE OR ALTER PROCEDURE dbo.[SqlQueryNotificationStoredProcedure-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb') > 0)   DROP SERVICE [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]; if (OBJECT_ID('SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]; END COMMIT TRANSACTION; END
GO

--
-- Создать очередь [dbo].[SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]
--
PRINT (N'Создать очередь [dbo].[SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]')
GO
CREATE QUEUE dbo.[SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb] WITH STATUS = ON,
RETENTION = OFF,
ACTIVATION (
  STATUS = ON,
  PROCEDURE_NAME = dbo.[SqlQueryNotificationStoredProcedure-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb],
  MAX_QUEUE_READERS = 1,
  EXECUTE AS OWNER )
ON [PRIMARY]
GO

--
-- Создать службу [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]
--
PRINT (N'Создать службу [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]')
GO
CREATE SERVICE [SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb]
ON QUEUE dbo.[SqlQueryNotificationService-cfe0cb28-0fc1-4c1a-b02a-04652d24f4bb] (
  [http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification]
)
GO

--
-- Создать таблицу [dbo].[Rightss]
--
PRINT (N'Создать таблицу [dbo].[Rightss]')
GO
CREATE TABLE dbo.Rightss (
  Id_Rights int IDENTITY,
  Give_out tinyint NOT NULL,
  RoleId_Role int NULL,
  FunctionId_Function int NULL,
  CONSTRAINT PK_Rightss PRIMARY KEY CLUSTERED (Id_Rights)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_Rightss_FunctionId_Function] для объекта типа таблица [dbo].[Rightss]
--
PRINT (N'Создать индекс [IX_Rightss_FunctionId_Function] для объекта типа таблица [dbo].[Rightss]')
GO
CREATE INDEX IX_Rightss_FunctionId_Function
  ON dbo.Rightss (FunctionId_Function)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Rightss_RoleId_Role] для объекта типа таблица [dbo].[Rightss]
--
PRINT (N'Создать индекс [IX_Rightss_RoleId_Role] для объекта типа таблица [dbo].[Rightss]')
GO
CREATE INDEX IX_Rightss_RoleId_Role
  ON dbo.Rightss (RoleId_Role)
  ON [PRIMARY]
GO

--
-- Создать представление [dbo].[view1]
--
GO
PRINT (N'Создать представление [dbo].[view1]')
GO
CREATE OR ALTER VIEW dbo.view1 
AS SELECT
  Roles.Name_Role
 ,Accounts.Id_Account
FROM dbo.Accounts
INNER JOIN dbo.Rightss
  ON Accounts.RightsId_Rights = Rightss.Id_Rights
INNER JOIN dbo.Roles
  ON Rightss.RoleId_Role = Roles.Id_Role
GO

--
-- Создать таблицу [dbo].[Plurality]
--
PRINT (N'Создать таблицу [dbo].[Plurality]')
GO
CREATE TABLE dbo.Plurality (
  Id_Plurality int IDENTITY,
  EmployeeId_Employee int NULL,
  PositionId_Position int NULL,
  CONSTRAINT PK_Plurality PRIMARY KEY CLUSTERED (Id_Plurality)
)
ON [PRIMARY]
GO

--
-- Создать индекс [IX_Plurality_EmployeeId_Employee] для объекта типа таблица [dbo].[Plurality]
--
PRINT (N'Создать индекс [IX_Plurality_EmployeeId_Employee] для объекта типа таблица [dbo].[Plurality]')
GO
CREATE INDEX IX_Plurality_EmployeeId_Employee
  ON dbo.Plurality (EmployeeId_Employee)
  ON [PRIMARY]
GO

--
-- Создать индекс [IX_Plurality_PositionId_Position] для объекта типа таблица [dbo].[Plurality]
--
PRINT (N'Создать индекс [IX_Plurality_PositionId_Position] для объекта типа таблица [dbo].[Plurality]')
GO
CREATE INDEX IX_Plurality_PositionId_Position
  ON dbo.Plurality (PositionId_Position)
  ON [PRIMARY]
GO

--
-- Создать таблицу [dbo].[Distribution_CMK]
--
PRINT (N'Создать таблицу [dbo].[Distribution_CMK]')
GO
CREATE TABLE dbo.Distribution_CMK (
  ID_Distribution int IDENTITY,
  Role_In_CMK_ID int NOT NULL,
  CMK_Distribution_ID int NOT NULL,
  Plurality_Distribution_ID int NOT NULL,
  CONSTRAINT PK_Distribution_CMK PRIMARY KEY CLUSTERED (ID_Distribution)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[Distribution_CMK_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Distribution_CMK_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ ДЛЯ ТАБЛИЦЫ "Распределение ЦМК"
create OR ALTER procedure dbo.Distribution_CMK_update
@ID_Distribution [int], @Role_In_CMK_ID [int], @CMK_Distribution_ID [int], @Plurality_Distribution_ID [int]
as
	update [dbo].[Distribution_CMK] set
	[Role_In_CMK_ID] = @Role_In_CMK_ID,
	[CMK_Distribution_ID] = @CMK_Distribution_ID,
	[Plurality_Distribution_ID] = @Plurality_Distribution_ID
	where [ID_Distribution] = @ID_Distribution
GO

--
-- Создать процедуру [dbo].[Distribution_CMK_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Distribution_CMK_insert]')
GO
create OR ALTER procedure dbo.Distribution_CMK_insert 
@Role_In_CMK_ID [int], @CMK_Distribution_ID [int], @Plurality_Distribution_ID [int]
as
	insert into [dbo].[Distribution_CMK] ([Role_In_CMK_ID], [CMK_Distribution_ID], [Plurality_Distribution_ID]) values 
	(@Role_In_CMK_ID, @CMK_Distribution_ID, @Plurality_Distribution_ID)
GO

--
-- Создать процедуру [dbo].[Distribution_CMK_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Distribution_CMK_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "Распределение ЦМК"
create OR ALTER procedure dbo.Distribution_CMK_delete
@ID_Distribution [int]
as
	delete [dbo].[Distribution_CMK] 
			where [ID_Distribution] = @ID_Distribution
GO

--
-- Создать представление [dbo].[view4]
--
GO
PRINT (N'Создать представление [dbo].[view4]')
GO
CREATE OR ALTER VIEW dbo.view4 
AS SELECT
  Distribution.Priority
 ,Employees.Surname + ' ' + Employees.Name + ' ' + Employees.Second_Name AS FIO
 ,Employees.Surname
 ,Employees.Name
 ,Employees.Second_Name
 ,Territory_Аudiences.Number_Cabinet
 ,View_Cabinet.Name_View_Cabinet
FROM dbo.Plurality
INNER JOIN dbo.Employees
  ON Plurality.EmployeeId_Employee = Employees.Id_Employee
INNER JOIN dbo.Distribution_CMK
  ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality
INNER JOIN dbo.NLP
  ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution
INNER JOIN dbo.Distribution
  ON Distribution.NLP_ID = NLP.ID_NLP
INNER JOIN dbo.Territory_Аudiences
  ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences
INNER JOIN dbo.View_Cabinet
  ON Territory_Аudiences.View_ID = View_Cabinet.ID_View
GO

--
-- Создать представление [dbo].[view3]
--
GO
PRINT (N'Создать представление [dbo].[view3]')
GO
CREATE OR ALTER VIEW dbo.view3 
AS SELECT
  Employees.Surname
 ,Employees.Name
 ,Employees.Second_Name
 ,Distribution.Priority
 ,Territory_Аudiences.Number_Cabinet
 ,Traning_Area.Full_Name
FROM dbo.Plurality
INNER JOIN dbo.Employees
  ON Plurality.EmployeeId_Employee = Employees.Id_Employee
INNER JOIN dbo.Distribution_CMK
  ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality
INNER JOIN dbo.NLP
  ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution
INNER JOIN dbo.Distribution
  ON Distribution.NLP_ID = NLP.ID_NLP
INNER JOIN dbo.Territory_Аudiences
  ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences
INNER JOIN dbo.Traning_Area
  ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area
GO

--
-- Создать представление [dbo].[view2]
--
GO
PRINT (N'Создать представление [dbo].[view2]')
GO
CREATE OR ALTER VIEW dbo.view2 
AS SELECT NLP.ID_NLP, Employees.Surname ,Employees.Second_Name ,Employees.Name FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution
GO

--
-- Создать представление [dbo].[Raspredelenie_View]
--
GO
PRINT (N'Создать представление [dbo].[Raspredelenie_View]')
GO
  create OR ALTER view dbo.Raspredelenie_View
("ID_Employe","Имя","Фамилия","Отчество","ID_Distribution","Приоритет","Territory_ID","Номер кабинета","ID_Territory_Аudiences","Территория","ID_Training_Area")
as
SELECT
  Employees.Id_Employee
 ,Employees.Name
 ,Employees.Surname
 ,Employees.Second_Name
 ,Distribution.ID_Distribution
 ,Distribution.Priority
 ,Distribution.Territory_Аudiences_ID
 ,Territory_Аudiences.Number_Cabinet
 ,Territory_Аudiences.ID_Territory_Аudiences
 ,Traning_Area.Full_Name
 ,Traning_Area.ID_Training_Area
FROM dbo.Distribution
INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences
INNER JOIN dbo.Traning_Area ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area
INNER JOIN dbo.NLP ON Distribution.NLP_ID = NLP.ID_NLP
INNER JOIN dbo.Distribution_CMK ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution
INNER JOIN dbo.Plurality ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality
INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee
GO

--
-- Создать таблицу [dbo].[CMK_RUP]
--
PRINT (N'Создать таблицу [dbo].[CMK_RUP]')
GO
CREATE TABLE dbo.CMK_RUP (
  ID_CMK_RUP int IDENTITY,
  RUP_ID int NOT NULL,
  CMK_ID int NOT NULL,
  CONSTRAINT PK_CMK_RUP PRIMARY KEY CLUSTERED (ID_CMK_RUP)
)
ON [PRIMARY]
GO

--
-- Создать процедуру [dbo].[CMK_RUP_update]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_RUP_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ ДЛЯ ТАБЛИЦЫ "ЦМК РУП"
create OR ALTER procedure dbo.CMK_RUP_update
@ID_CMK_RUP [int], @RUP_ID [int], @CMK_ID [int]
as
	update [dbo].[CMK_RUP] set
	[RUP_ID] = @RUP_ID,
	[CMK_ID] = @CMK_ID
	where [ID_CMK_RUP] = @ID_CMK_RUP
GO

--
-- Создать процедуру [dbo].[CMK_RUP_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_RUP_insert]')
GO
create OR ALTER procedure dbo.CMK_RUP_insert 
@RUP_ID [int], @CMK_ID [int]
as
	insert into [dbo].[CMK_RUP] ([RUP_ID], [CMK_ID]) values 
	(@RUP_ID, @CMK_ID)
GO

--
-- Создать процедуру [dbo].[CMK_RUP_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[CMK_RUP_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ ДЛЯ ТАБЛИЦЫ "ЦМК РУП"
create OR ALTER procedure dbo.CMK_RUP_delete
@ID_CMK_RUP [int]
as
	delete [dbo].[CMK_RUP] 
			where [ID_CMK_RUP] = @ID_CMK_RUP
GO

--
-- Создать процедуру [dbo].[Training_Area_Delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Training_Area_Delete]')
GO

Create OR ALTER procedure dbo.Training_Area_Delete
@ID_Training_Area [int]
as
	delete from [dbo].[Training_Area]
	where
	[ID_Training_Area] = @ID_Training_Area
GO

--
-- Создать процедуру [dbo].[Group_update]
--
GO
PRINT (N'Создать процедуру [dbo].[Group_update]')
GO

-- ПРОЦЕДУРА ИЗМЕНЕНИЯ "Группа" (Прогнано)
create OR ALTER procedure dbo.Group_update
@ID_Group [int], @Name_Group [varchar] (15), @Specialty_ID [int]
as
	update [dbo].[Group] set
	[Name_Group] = @Name_Group,
	[Specialty_ID] = @Specialty_ID
	where [ID_Group] = @ID_Group
GO

--
-- Создать процедуру [dbo].[Group_insert]
--
GO
PRINT (N'Создать процедуру [dbo].[Group_insert]')
GO
-- ПРОЦЕДУРА ДОБАВЛЕНИЯ "Группа" (Прогнано)
create OR ALTER procedure dbo.Group_insert 
@Name_Group [varchar] (15), @Specialty_ID [int]
as
	insert into [dbo].[Group] ([Name_Group], [Specialty_ID]) 
	values 
	(@Name_Group, @Specialty_ID)
GO

--
-- Создать процедуру [dbo].[Group_delete]
--
GO
PRINT (N'Создать процедуру [dbo].[Group_delete]')
GO

-- ПРОЦЕДУРА УДАЛЕНИЯ "Группа" (Прогнано)
create OR ALTER procedure dbo.Group_delete
@ID_Group [int]
as
	delete [dbo].[Group] 
			where [ID_Group] = @ID_Group
GO

--
-- Создать функцию [dbo].[fn_diagramobjects]
--
GO
PRINT (N'Создать функцию [dbo].[fn_diagramobjects]')
GO

	CREATE OR ALTER FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
-- 
-- Вывод данных для таблицы __MigrationHistory
--
PRINT (N'Вывод данных для таблицы __MigrationHistory')
INSERT dbo.__MigrationHistory VALUES (N'202010260308169_InitialCreate', N'DiplomReplace1.Models.MobileContext', 0x1F8B0800000000000400ED5ADB6EE336107D2FD07F10F4D402592B979736B07791B59336681C0751B27D346869EC104B91AA4805F65FF47FFAD05FE89FF4173ABA8BBAD94A9C4B8B222F11C939339C190E8707FEFB8F3F879FD61E331E219054F091793438340DE08E70295F8DCC502D3FFC607EFAF8ED37C373D75B1B5FB27527D13A94E472643E28E59F5A96741EC02372E0512710522CD5C0119E455C611D1F1EFE681D1D598010266219C6F036E48A7A107FE0E75870077C151236152E30998EE38C1DA31AD7C403E9130746E684FA4C78B7E033FC3C1A2402A671C62841636C604BD3209C0B45149A7A7A2FC15681E02BDBC701C2EE363EE0BA256112D22D9C16CB77DDCDE171B41BAB10CCA09C502AE1F5043C3A49DD6355C59FE46433771F3AF01C1DAD36D1AE6327A2FF8822A65155743A6641B4A8C5BF8348EAC0D0E70EF27CC0B489FE0E8C71C85418C08843A802C20E8C9B70C1A8F30B6CEEC457E0231E3256360F0DC4396D00876E02E143A036B7B04C8DBE744DC3D2E5ACAA602E569249B674C9D5C9B1695CA372B2609047BFB47D5B89007E020E0151E0DE10A520E01106C4FEAB69AFE842F7C07CB69CFF2CA4C2939329C6CC8BBFA6647D057CA51E4626FE6B1A17740D6E36921A73CF291E3B14524108BABEA15544B13BB654A2C64598A44EEF1897A4DF32D693B9BE8FDE81AF02BC5616DC045404F1BA6E8DDD28771020880836F3BF7E0F5D8AD518E4FC72F23CD0EBAB9B9E183B27DDCD83E0D03FDB62B1FF4B4A7B1A50C560CF85A4AE652C3C9FF0CD8BEBC1A3E1C08BA45FD421B8218339A678FF2C2C4BBF6DCDD3F7F1849AA703BC569ACE021782F9AF005F339D9F85604078EF1235211B0DE7C572F13AF41668F398112941BEAFBA8A9DB022148391E24FC58232884661AD1AD21BDBDB34C365BA79DDDC04D506A5757F850549C73C4886AD2DB2A54B55368174DDDA55B0B8FC37A1A4D7C916F172B237A1B49FA6CCFFB9A78BC78695BC36B25789D5F22C194E89EF636A969E29E98861276F94F107BB7FE7EE251896231B1AF8DCDA5C131E5BB282CA6C54D05DB8A0815451481724CABEB1EBD596E979D5E2EB4C572975AAA5AC707CB638FA3FCB97B6974415A6F0E0056ECAC3CA13EF0F724B9AB5C782B64318091A2EEAB160A1C7DB2EFB2EE95A375F86AA4DD6718756653755AF5935B755CA7D3504BB05483B9F7B8854F93C3F21629DE2AD91AB36EF5A18BB9F065DB8456F5E062C4677476AEDCFCBC0AD8B76D7935D2D65D86CECDDE45C5AC69F9F6C49D9EF9F652D722F5318D29E5C0B7432B43B46DE719751F2C15E09ED402D9B9D465BDE2839F44BFAF939A25DEAFD53A55BBCA320E9CD44A52075F5ED5DB8E5C6B90C591EEF73656D1AB08AD11E65A7D21D6BE5A732F7AF2C66B506B0BA24D79E378295866F98365FDBC9EA5A37962C310D74CF2375A34ECCDE48055EDC160DECDFD898E165A18A0553C2E912A44ADE97E6F1E1D17185EC7E3FC4B325A5CB76609F5F9DADA19147B73E747BBF571B395FFE4802E78104DF7964FD7D19745FBCEE3BA2545FC4AF55163556B25F0EF52990FA4B7F3B424FFEF4BF712634D2B2C749D84A4C3E0B4B231FF718B9F686E26D59BF17096D9DE85BD0FEA7A84AF23D2BAECD44DEDB1FEE2A8957E7649E41D2251DC4C8741702ED4D2CEC4DDF6D65EF1AB5E8FCDF2E045F3BBFD7A420E3047B707F5BA9BF263D7B2107EB3DE0D02AFFAC61380149570544F423070E4EE4BC02345B73C997224B49DC68D9A26C492563A7A0888B613F0B145D1247E134DE71326E44BE1016E292733C1DEE259F85CA0FD5191E116FC1B427E6D0EAD61F33A0BACDC3991F877F1F5B4033296E0166FC7348999BDB7DD170DE5A20A29395D638B4CA5651AD5B6D72A4EB1A95DC0694BA6F023EF0A842DE81876F4F0572C66DF2084FB1ED5EC215AC88B3C95AF97690ED81D0DD3E9C50B20A8827538C421E3F31875D6FFDF11FC13B60F4DD230000, N'6.4.4')
GO
-- 
-- Вывод данных для таблицы Accounts
--
PRINT (N'Вывод данных для таблицы Accounts')
SET IDENTITY_INSERT dbo.Accounts ON
GO
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (1, N'Geffest', N'c2f5i4f53', N'18.01.2001', N'88005553535', N'nub.n.2015@mail.ru', 1, 1)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (3, N'IDAPEN', N'32QWEQW', N'26.10.2020', N'88015553535', N'i_d.a.dmitrov@mpt.ru', 2, 3)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (4, N'Dmitrov', N'qwrqwr', N'26.10.2020', N'88025553535', N'eeee@gmail.com', 3, 7)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (6, N'Dmitrovas', N'Dimomas95', NULL, N'891663563323', N'number@mail.ru', 1, 8)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (7, N'test', N'test565', NULL, N'89595959599', N'tets@mail.ru', 4, 7)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (8, N'dimomas', N'qwerty', NULL, N'89162953595', N'nub.n.2015@mail.ru', 1, 7)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (9, N'Drimas!', N'Dadadas_-2', N'24.05.2021 5:28:47', N'89162953595!', N'nub.n.2015@mail.ru', NULL, NULL)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (10, N'Ivan_', N'Ivan_-.1', N'24.05.2021 12:30:53', N'89999999999', N'i.m.shchanikov@mpt.ru', NULL, NULL)
INSERT dbo.Accounts(Id_Account, Login, Password, Date_Create, Phone_Number, Email, RightsId_Rights, PluralityId_Plurality) VALUES (11, N'Ivan1299', N'Ivan12_-.', N'24.05.2021 12:35:28', N'89999999999', N'i.m.shchanikov@mpt.ru', NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Accounts OFF
GO
-- 
-- Вывод данных для таблицы Characteristic
--
PRINT (N'Вывод данных для таблицы Characteristic')
SET IDENTITY_INSERT dbo.Characteristic ON
GO
INSERT dbo.Characteristic(ID_Characteristic, Name_Characteristic, View_Provisions_ID) VALUES (1, 'Тест4', 1)
INSERT dbo.Characteristic(ID_Characteristic, Name_Characteristic, View_Provisions_ID) VALUES (2, 'Тест5', 2)
INSERT dbo.Characteristic(ID_Characteristic, Name_Characteristic, View_Provisions_ID) VALUES (3, 'Тест6', 3)
INSERT dbo.Characteristic(ID_Characteristic, Name_Characteristic, View_Provisions_ID) VALUES (7, 'Тесть 7', 1)
GO
SET IDENTITY_INSERT dbo.Characteristic OFF
GO
-- 
-- Вывод данных для таблицы Characteristic_MO
--
PRINT (N'Вывод данных для таблицы Characteristic_MO')
SET IDENTITY_INSERT dbo.Characteristic_MO ON
GO
INSERT dbo.Characteristic_MO(ID_Characteristic_MO, Indicator, Form_ID, Characteristic_ID, Material_Provisions_ID, Inventory_Number) VALUES (1, 'Эксплуатируется', 1, 1, 1, '31233213213')
INSERT dbo.Characteristic_MO(ID_Characteristic_MO, Indicator, Form_ID, Characteristic_ID, Material_Provisions_ID, Inventory_Number) VALUES (2, 'Эксплуатируется', 2, 2, 2, '74585221452')
INSERT dbo.Characteristic_MO(ID_Characteristic_MO, Indicator, Form_ID, Characteristic_ID, Material_Provisions_ID, Inventory_Number) VALUES (3, 'Эксплуатируется', 3, 3, 3, '32132348141')
INSERT dbo.Characteristic_MO(ID_Characteristic_MO, Indicator, Form_ID, Characteristic_ID, Material_Provisions_ID, Inventory_Number) VALUES (19, 'Эксплуатируется', 4, 7, 14, '12323121312')
GO
SET IDENTITY_INSERT dbo.Characteristic_MO OFF
GO
-- 
-- Вывод данных для таблицы CMK
--
PRINT (N'Вывод данных для таблицы CMK')
SET IDENTITY_INSERT dbo.CMK ON
GO
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (1, 'Цикловая методическая комиссия по ПМ 02.01')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (2, 'Цикловая методическая комиссия по ПМ 03.01')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (128, 'Название ЦМК 1')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (129, 'Название ЦМК 2')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (130, 'Название ЦМК 3')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (132, '1.1. ЦМК «Гуманитарная»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (137, '1.2. ЦМК «Иностранных языков»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (141, '1.3. ЦМК «Математическая»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (146, 'Название ЦМК 1')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (156, 'Название ЦМК 3')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (157, 'Название ЦМК 4')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (158, '1.1. ЦМК «Гуманитарная»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (159, '1.2. ЦМК «Иностранных языков»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (160, '1.3. ЦМК «Математическая»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (161, '1.4. ЦМК «Экономическая»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (162, '1.5. ЦМК «Физической культуры»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (163, '1.6. ЦМК «Общепрофессиональных дисциплин (аппаратное обеспечение)»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (164, '1.7. ЦМК «Общепрофессиональных дисциплин (программное обеспечение)»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (165, '1.8. ЦМК «Профессиональных модулей 09.02.01»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (166, '1.9. ЦМК «Профессиональных модулей 09.02.04»')
INSERT dbo.CMK(ID_CMK, Name_CMK) VALUES (167, '1.10. ЦМК «Профессиональных модулей 09.02.03»')
GO
SET IDENTITY_INSERT dbo.CMK OFF
GO
-- 
-- Вывод данных для таблицы CMK_RUP
--
PRINT (N'Вывод данных для таблицы CMK_RUP')
SET IDENTITY_INSERT dbo.CMK_RUP ON
GO
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (1, 1, 1)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (2, 1, 2)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (3, 2, 1)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (4, 2, 2)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (5, 5, 128)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (6, 5, 129)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (7, 5, 130)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (8, 5, 128)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (9, 5, 129)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (10, 5, 130)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (11, 5, 128)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (12, 5, 129)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (13, 5, 130)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (14, 5, 128)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (15, 5, 129)
INSERT dbo.CMK_RUP(ID_CMK_RUP, RUP_ID, CMK_ID) VALUES (16, 5, 130)
GO
SET IDENTITY_INSERT dbo.CMK_RUP OFF
GO
-- 
-- Вывод данных для таблицы Color
--
PRINT (N'Вывод данных для таблицы Color')
SET IDENTITY_INSERT dbo.Color ON
GO
INSERT dbo.Color(ID_Color, Value_Color) VALUES (1, 'Красный')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (2, 'Желтый')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (3, 'Синий')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (4, 'Фиолетовый')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (5, 'Оранжевый')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (7, 'Красный')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (8, 'Желтый')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (9, 'Синий')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (10, 'Зеленый')
INSERT dbo.Color(ID_Color, Value_Color) VALUES (11, 'Оранжевый')
GO
SET IDENTITY_INSERT dbo.Color OFF
GO
-- 
-- Вывод данных для таблицы Criteria
--
PRINT (N'Вывод данных для таблицы Criteria')
SET IDENTITY_INSERT dbo.Criteria ON
GO
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (20, 'Камиль', 2, 3)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (40, 'тест', 2, 5)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (43, 'Ровная поверхность', 1, 5)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (44, 'Чистые окныыыы', 1, 15)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (45, 'Средние частоты', 14, 5)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (46, 'Ровность', 2, 7)
INSERT dbo.Criteria(ID_criteria, Name_criteria, kind_criteria_ID, ranging) VALUES (49, 'ЫВывыв', 2, 3)
GO
SET IDENTITY_INSERT dbo.Criteria OFF
GO
-- 
-- Вывод данных для таблицы Distribution
--
PRINT (N'Вывод данных для таблицы Distribution')
SET IDENTITY_INSERT dbo.Distribution ON
GO
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (65, 1, 6, 18)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (120, 1, 23, 25)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (67, 2, 7, 18)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (113, 2, 19, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (93, 2, 20, 28)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (117, 2, 21, 34)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (68, 3, 8, 20)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (70, 3, 10, 20)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (116, 3, 19, 34)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (85, 4, 7, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (73, 5, 6, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (75, 5, 7, 24)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (78, 6, 8, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (77, 6, 10, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (90, 6, 19, 27)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (97, 7, 21, 30)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (102, 7, 22, 31)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (81, 8, 12, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (88, 8, 14, 26)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (108, 8, 20, 33)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (95, 8, 21, 29)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (96, 8, 22, 29)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (110, 8, 25, 34)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (80, 9, 11, 23)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (125, 9, 14, 25)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (89, 9, 18, 26)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (92, 9, 19, 28)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (91, 9, 20, 27)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (100, 9, 21, 31)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (98, 9, 22, 30)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (103, 9, 23, 32)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (104, 9, 24, 32)
INSERT dbo.Distribution(ID_Distribution, Priority, Territory_Аudiences_ID, NLP_ID) VALUES (109, 9, 25, 24)
GO
SET IDENTITY_INSERT dbo.Distribution OFF
GO
-- 
-- Вывод данных для таблицы Distribution_CMK
--
PRINT (N'Вывод данных для таблицы Distribution_CMK')
SET IDENTITY_INSERT dbo.Distribution_CMK ON
GO
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (1, 1, 1, 1)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (2, 1, 2, 3)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (3, 2, 1, 7)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (4, 1, 2, 8)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (5, 1, 146, 9)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (6, 2, 129, 10)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (7, 2, 1, 11)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (8, 2, 1, 12)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (9, 1, 1, 13)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (10, 2, 1, 14)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (11, 2, 1, 15)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (12, 2, 1, 16)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (13, 2, 1, 17)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (14, 2, 1, 18)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (15, 2, 1, 19)
INSERT dbo.Distribution_CMK(ID_Distribution, Role_In_CMK_ID, CMK_Distribution_ID, Plurality_Distribution_ID) VALUES (16, 2, 1, 20)
GO
SET IDENTITY_INSERT dbo.Distribution_CMK OFF
GO
-- 
-- Вывод данных для таблицы Document_Template
--
PRINT (N'Вывод данных для таблицы Document_Template')
SET IDENTITY_INSERT dbo.Document_Template ON
GO
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (7, 'С:\Документы\Документ №1', 'Документ №1')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (11, 'С:\Документы\Документ №2', 'Документ №2')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (13, 'С:\Документы\Документ №3', 'Документ №3')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (16, 'С:\Документы\Документ №4', 'Документ №4')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (17, 'С:\Документы\Документ №24', 'Документ №24')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (18, 'С:\Документы\Документ №8', 'Документ №8')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (21, 'C:\Users\User\Desktop\Импорт.xlsx', 'Импорт.xlsx')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (23, 'С:\Документы\Документ №2', 'Документ №2')
INSERT dbo.Document_Template(ID_Document_Template, Path_To_File, Document_Name) VALUES (24, 'С:\Документы\Документ №000', 'Документ №000')
GO
SET IDENTITY_INSERT dbo.Document_Template OFF
GO
-- 
-- Вывод данных для таблицы Documents_EU
--
PRINT (N'Вывод данных для таблицы Documents_EU')
SET IDENTITY_INSERT dbo.Documents_EU ON
GO
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (14, 'Арсл', 'https://docs.google.com/document/d/1pM7Nu-r5CItsUP9bIiCWFJAVtT48wtKqRQrh8eklDGI/edit', 7, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (21, 'Тестируем', 'https://docs.google.com/document/d/1', 13, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (36, 'Тестируем 152', 'https:/docs.google.com/', 13, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (43, 'Лист Microsoft Office Excel.xl', 'C:\Users\User\Desktop\Лист Microsoft Office Excel.xlsx', 13, 16)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (53, 'Файл отсутствует', 'Файл отсутствует', 7, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (54, 'Файл отсутствует', 'Файл отсутствует', 7, 16)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (55, 'Файл отсутствует', 'Файл отсутствует', 18, 14)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (59, 'Файл отсутствует', 'Файл отсутствует', 17, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (69, 'Файл отсутствует', 'Файл отсутствует', 7, 14)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (70, 'Тестируем 153', 'https:/docs.google.com/', 7, 14)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (71, 'Тестируем 157', 'https:/docs.google.com/', 17, 14)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (72, 'Тестируем 158', 'https:/docs.google.com/', 21, 12)
INSERT dbo.Documents_EU(ID_Documents_EU, Document_Title, Link_To_The_Document, Document_Template_ID, EU_CMK_RUP_ID) VALUES (73, 'Тестируем 10', 'тестирую424', 21, 179)
GO
SET IDENTITY_INSERT dbo.Documents_EU OFF
GO
-- 
-- Вывод данных для таблицы Educational_Unit
--
PRINT (N'Вывод данных для таблицы Educational_Unit')
SET IDENTITY_INSERT dbo.Educational_Unit ON
GO
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (1, 'Дискретная математика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (2, 'Математика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (3, 'Элементы математической логики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (69, 'Русский язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (70, 'Литература')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (71, 'Иностранный язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (72, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (73, 'Основы безопасности жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (74, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (75, 'Астрономия')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (76, 'Обществознание (включая экономику и право)')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (77, 'Математика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (78, 'Информатика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (79, 'Физика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (80, 'Основы проектной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (81, 'Основы философии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (82, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (83, 'Психология общения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (84, 'Иностранный язык в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (85, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (86, 'Элементы высшей математики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (87, 'Дискретная математика с элементами математической логики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (88, 'Теория вероятностей и математическая статистика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (89, 'Операционные системы и среды')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (90, 'Архитектура аппаратных средств')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (91, 'Информационные технологии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (92, 'Основы алгоритмизации и программирования')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (93, 'Правовое обеспечение профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (94, 'Безопасность жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (95, 'Экономика отрасли')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (96, 'Основы проектирования баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (97, 'Стандартизация, сертификация и техническое документоведение')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (98, 'Численные методы')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (99, 'Компьютерные сети')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (100, 'Менеджмент в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (101, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (102, 'Разработка программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (103, 'Поддержка и тестирование программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (104, 'Разработка мобильных приложений')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (105, 'Системное программирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (106, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (107, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (108, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (109, 'Осуществление интеграции программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (110, 'Технология разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (111, 'Инструментальные средства разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (112, 'Математическое моделирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (113, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (114, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (115, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (116, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (117, 'Внедрение и поддержка компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (118, 'Обеспечение качества функционирования компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (119, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (120, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (121, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (122, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (123, 'Управление и автоматизация баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (124, 'Сертификация информационных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (125, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (126, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (127, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (128, 'Разработка, администрирование и защита баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (129, 'Технология разработки и защиты баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (130, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (131, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (132, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (133, 'Русский язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (134, 'Литература')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (135, 'Иностранный язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (136, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (137, 'Основы безопасности жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (138, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (139, 'Астрономия')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (140, 'Обществознание (включая экономику и право)')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (141, 'Математика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (142, 'Информатика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (143, 'Физика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (144, 'Основы проектной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (145, 'Основы философии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (146, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (147, 'Психология общения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (148, 'Иностранный язык в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (149, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (150, 'Элементы высшей математики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (151, 'Дискретная математика с элементами математической логики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (152, 'Теория вероятностей и математическая статистика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (153, 'Операционные системы и среды')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (154, 'Архитектура аппаратных средств')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (155, 'Информационные технологии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (156, 'Основы алгоритмизации и программирования')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (157, 'Правовое обеспечение профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (158, 'Безопасность жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (159, 'Экономика отрасли')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (160, 'Основы проектирования баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (161, 'Стандартизация, сертификация и техническое документоведение')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (162, 'Численные методы')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (163, 'Компьютерные сети')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (164, 'Менеджмент в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (165, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (166, 'Разработка программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (167, 'Поддержка и тестирование программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (168, 'Разработка мобильных приложений')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (169, 'Системное программирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (170, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (171, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (172, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (173, 'Осуществление интеграции программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (174, 'Технология разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (175, 'Инструментальные средства разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (176, 'Математическое моделирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (177, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (178, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (179, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (180, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (181, 'Внедрение и поддержка компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (182, 'Обеспечение качества функционирования компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (183, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (184, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (185, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (186, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (187, 'Управление и автоматизация баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (188, 'Сертификация информационных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (189, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (190, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (191, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (192, 'Разработка, администрирование и защита баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (193, 'Технология разработки и защиты баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (194, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (195, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (196, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (197, 'Русский язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (198, 'Литература')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (199, 'Иностранный язык')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (200, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (201, 'Основы безопасности жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (202, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (203, 'Астрономия')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (204, 'Обществознание (включая экономику и право)')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (205, 'Математика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (206, 'Информатика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (207, 'Физика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (208, 'Основы проектной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (209, 'Основы философии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (210, 'История')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (211, 'Психология общения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (212, 'Иностранный язык в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (213, 'Физическая культура')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (214, 'Элементы высшей математики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (215, 'Дискретная математика с элементами математической логики')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (216, 'Теория вероятностей и математическая статистика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (217, 'Операционные системы и среды')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (218, 'Архитектура аппаратных средств')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (219, 'Информационные технологии')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (220, 'Основы алгоритмизации и программирования')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (221, 'Правовое обеспечение профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (222, 'Безопасность жизнедеятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (223, 'Экономика отрасли')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (224, 'Основы проектирования баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (225, 'Стандартизация, сертификация и техническое документоведение')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (226, 'Численные методы')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (227, 'Компьютерные сети')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (228, 'Менеджмент в профессиональной деятельности')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (229, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (230, 'Разработка программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (231, 'Поддержка и тестирование программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (232, 'Разработка мобильных приложений')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (233, 'Системное программирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (234, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (235, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (236, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (237, 'Осуществление интеграции программных модулей')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (238, 'Технология разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (239, 'Инструментальные средства разработки программного обеспечения')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (240, 'Математическое моделирование')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (241, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (242, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (243, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (244, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (245, 'Внедрение и поддержка компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (246, 'Обеспечение качества функционирования компьютерных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (247, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (248, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (249, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (250, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (251, 'Управление и автоматизация баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (252, 'Сертификация информационных систем')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (253, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (254, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (255, 'Экзамен по профессиональному модулю')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (256, 'Разработка, администрирование и защита баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (257, 'Технология разработки и защиты баз данных')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (258, 'Учебная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (259, 'Производственная практика')
INSERT dbo.Educational_Unit(ID_Educational_Unit, Name_Of_The_EU) VALUES (260, 'Экзамен по профессиональному модулю')
GO
SET IDENTITY_INSERT dbo.Educational_Unit OFF
GO
-- 
-- Вывод данных для таблицы Employees
--
PRINT (N'Вывод данных для таблицы Employees')
SET IDENTITY_INSERT dbo.Employees ON
GO
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (1, N'Беков', N'Александр', N'Михайлович', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (3, N'Дмитров', N'Дмитрий', N'Анатольевич', 2)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (4, N'Алексеенко', N'Артем', N'Алексеевич', 3)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (5, N'Администратор', N'Админ', N'Админович', 4)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (392, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (393, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (394, N'Волкова', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (395, N'Волкова', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (396, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (397, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (398, N'Гаврилина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (399, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (400, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (401, N'Гаврилина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (402, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (403, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (404, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (405, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (406, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (407, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (408, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (409, N'Зимогорова', N'В.', N'М.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (410, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (411, N'Зимогорова', N'В.', N'М.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (412, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (413, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (414, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (415, N'Зимогорова', N'В.', N'М.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (416, N'Зимогорова', N'В.', N'М.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (417, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (418, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (419, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (420, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (421, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (422, N'Волкова', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (423, N'Волкова', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (424, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (425, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (426, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (427, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (428, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (429, N'Бибикова', N'В.', N'Н.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (430, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (431, N'Мотыльков', N'В.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (432, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (433, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (434, N'Попова', N'Ю.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (435, N'Калашникова', N'А.', N'Ю.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (436, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (437, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (438, N'Ермачкова', N'Ю.', N'И.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (439, N'Батенко', N'Е.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (440, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (441, N'Ермачкова', N'Ю.', N'И.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (442, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (443, N'Калашникова', N'А.', N'Ю.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (444, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (445, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (446, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (447, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (448, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (449, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (450, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (451, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (452, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (453, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (454, N'Калашникова', N'А.', N'Ю.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (455, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (456, N'Калашникова', N'А.', N'Ю.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (457, N'Батенко', N'Е.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (458, N'Батенко', N'Е.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (459, N'Ермачкова', N'Ю.', N'И.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (460, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (461, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (462, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (463, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (464, N'Ермачкова', N'Ю.', N'И.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (465, N'Добрынина', N'В.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (466, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (467, N'Дробышева', N'В.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (468, N'Ермашенко', N'А.', N'Е.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (469, N'Батенко', N'Е.', N'К.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (470, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (471, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (472, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (473, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (474, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (475, N'Попова', N'Ю.', N'Л.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (476, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (477, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (478, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (479, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (480, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (481, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (482, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (483, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (484, N'Руденко', N'В.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (485, N'Руденко', N'В.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (486, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (487, N'Руденко', N'В.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (488, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (489, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (490, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (491, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (492, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (493, N'Руденко', N'В.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (494, N'Попова', N'А.', N'Т.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (495, N'Полосина', N'М.', N'А.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (496, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (497, N'Евдокименко', N'А.', N'О.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (498, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (499, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (500, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (501, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (502, N'Познахирко', N'В.', N'В.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (503, N'Готовец', N'М.', N'Д.', 1)
INSERT dbo.Employees(Id_Employee, Surname, Name, Second_Name, Employee_Number) VALUES (504, N'Попова', N'Ю.', N'Л.', 1)
GO
SET IDENTITY_INSERT dbo.Employees OFF
GO
-- 
-- Вывод данных для таблицы EU_CMK_RUP
--
PRINT (N'Вывод данных для таблицы EU_CMK_RUP')
SET IDENTITY_INSERT dbo.EU_CMK_RUP ON
GO
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (12, 'МДК 11.01', '123', '12', '13', '15', 'Уль1', '17', '18', 1, 2, 4, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (14, 'ПП 01.01', '321', '11', '22', '23', 'Арс1', '23', '65', 1, 2, 4, 12)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (16, 'МДК 04.02', '42', '20', '0', '0', 'Б1', '10', '5', 1, 2, 4, 12)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (18, 'МДК 02.02', '0', '0', '0', '0', '0', '0', '0', 1, 2, 4, 12)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (179, 'БД.01', '78', '78', '0', '0', '0', '0', '14', 69, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (180, 'БД.01', '78', '78', '0', '0', '0', '0', '14', 69, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (181, 'БД.02', '117', '117', '0', '0', '0', '0', '2', 70, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (182, 'БД.02', '117', '117', '0', '0', '0', '0', '2', 70, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (183, 'БД.03', '156', '0', '156', '0', '0', '0', '14', 71, 20, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (184, 'БД.03', '156', '0', '156', '0', '0', '0', '14', 71, 20, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (185, 'БД.04', '117', '117', '0', '0', '0', '0', '2', 72, 20, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (186, 'БД.04', '117', '117', '0', '0', '0', '0', '2', 72, 20, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (187, 'БД.05', '70', '70', '0', '0', '0', '0', '2', 73, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (188, 'БД.05', '70', '70', '0', '0', '0', '0', '2', 73, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (189, 'БД.06', '117', '7', '110', '0', '0', '0', '2', 74, 20, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (190, 'БД.07', '36', '30', '6', '0', '0', '0', '2', 75, 20, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (191, 'БД.08', '117', '90', '27', '0', '0', '0', '2', 76, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (192, 'БД.08', '117', '90', '27', '0', '0', '0', '2', 76, 20, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (193, 'ПД.01', '234', '132', '102', '0', '0', '0', '14', 2, 21, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (194, 'ПД.01', '234', '132', '102', '0', '0', '0', '14', 2, 21, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (195, 'ПД.02', '150', '100', '50', '0', '0', '0', '14', 78, 21, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (196, 'ПД.02', '150', '100', '50', '0', '0', '0', '14', 78, 21, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (197, 'ПД.03', '134', '106', '28', '0', '0', '0', '2', 79, 21, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (198, 'ПД.03', '134', '106', '28', '0', '0', '0', '2', 79, 21, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (199, 'ПОО.01', '78', '78', '0', '0', '0', '0', '2', 80, 22, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (200, 'ПОО.01', '78', '78', '0', '0', '0', '0', '2', 80, 22, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (201, 'ОГСЭ.01', '48', '36', '12', '0', '0', '0', '0', 81, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (202, 'ОГСЭ.01', '48', '36', '12', '0', '0', '0', '0', 81, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (203, 'ОГСЭ.02', '64', '50', '14', '0', '0', '0', '0', 72, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (204, 'ОГСЭ.02', '64', '50', '14', '0', '0', '0', '0', 72, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (205, 'ОГСЭ.03', '64', '50', '14', '0', '0', '0', '0', 83, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (206, 'ОГСЭ.03', '64', '50', '14', '0', '0', '0', '0', 83, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (207, 'ОГСЭ.04', '170', '0', '170', '0', '0', '0', '0', 84, 24, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (208, 'ОГСЭ.05', '170', '0', '170', '0', '0', '0', '0', 74, 24, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (209, 'ЕН.01', '76', '60', '16', '0', '6', '0', '16', 86, 25, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (210, 'ЕН.02', '44', '30', '14', '0', '0', '0', '0', 87, 25, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (211, 'ЕН.02', '44', '30', '14', '0', '0', '0', '0', 87, 25, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (212, 'ЕН.03', '52', '36', '16', '0', '0', '0', '0', 88, 25, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (213, 'ЕН.03', '52', '36', '16', '0', '0', '0', '0', 88, 25, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (214, 'ОП.01', '64', '32', '32', '0', '12', '0', '16', 89, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (215, 'ОП.02', '64', '32', '32', '0', '0', '0', '0', 90, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (216, 'ОП.02', '64', '32', '32', '0', '0', '0', '0', 90, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (217, 'ОП.03', '64', '32', '32', '0', '0', '0', '0', 91, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (218, 'ОП.03', '64', '32', '32', '0', '0', '0', '0', 91, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (219, 'ОП.04', '156', '80', '76', '0', '12', '0', '16', 92, 26, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (220, 'ОП.04', '156', '80', '76', '0', '12', '0', '16', 92, 26, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (221, 'ОП.05', '48', '32', '16', '0', '0', '0', '0', 93, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (222, 'ОП.06', '68', '42', '26', '0', '0', '0', '0', 94, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (223, 'ОП.06', '68', '42', '26', '0', '0', '0', '0', 94, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (224, 'ОП.07', '68', '42', '26', '0', '0', '0', '0', 95, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (225, 'ОП.07', '68', '42', '26', '0', '0', '0', '0', 95, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (226, 'ОП.08', '76', '32', '44', '0', '0', '0', '8', 96, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (227, 'ОП.08', '76', '32', '44', '0', '0', '0', '8', 96, 26, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (228, 'ОП.09', '52', '26', '26', '0', '0', '0', '0', 97, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (229, 'ОП.09', '52', '26', '26', '0', '0', '0', '0', 97, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (230, 'ОП.10', '54', '36', '18', '0', '0', '0', '8', 98, 26, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (231, 'ОП.11', '76', '32', '44', '0', '0', '0', '0', 99, 26, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (232, 'ОП.11', '76', '32', '44', '0', '0', '0', '0', 99, 26, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (233, 'ОП.12', '50', '26', '24', '0', '0', '0', '0', 100, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (234, 'ОП.12', '50', '26', '24', '0', '0', '0', '0', 100, 26, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (235, 'ПМ.01', '530', '176', '228', '0', '0', '0', '16', 101, 28, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (236, 'ПМ.01', '530', '176', '228', '0', '0', '0', '16', 101, 28, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (237, 'ПМ.01', '530', '176', '228', '0', '0', '0', '16', 101, 28, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (238, 'МДК.01.01', '88', '36', '52', '0', '0', '0', '8', 102, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (239, 'МДК.01.01', '88', '36', '52', '0', '0', '0', '8', 102, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (240, 'МДК.01.02', '72', '36', '36', '0', '0', '0', '0', 103, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (241, 'МДК.01.02', '72', '36', '36', '0', '0', '0', '0', 103, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (242, 'МДК.01.03', '122', '52', '70', '0', '0', '0', '0', 104, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (243, 'МДК.01.03', '122', '52', '70', '0', '0', '0', '0', 104, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (244, 'МДК.01.04', '122', '52', '70', '0', '0', '0', '0', 105, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (245, 'МДК.01.04', '122', '52', '70', '0', '0', '0', '0', 105, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (246, 'УП.01.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (247, 'УП.01.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (248, 'УП.01.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (249, 'ПП.01.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (250, 'ПП.01.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (251, 'ПП.01.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (252, 'ПM.01.Э', '', '0', '0', '0', '0', '0', '8', 108, 28, 5, 235)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (253, 'ПМ.02', '554', '142', '160', '0', '12', '0', '20', 109, 29, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (254, 'ПМ.02', '554', '142', '160', '0', '12', '0', '20', 109, 29, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (255, 'ПМ.02', '554', '142', '160', '0', '12', '0', '20', 109, 29, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (256, 'МДК.02.01', '120', '60', '60', '0', '6', '0', '8', 110, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (257, 'МДК.02.01', '120', '60', '60', '0', '6', '0', '8', 110, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (258, 'МДК.02.02', '86', '34', '52', '0', '6', '0', '8', 111, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (259, 'МДК.02.02', '86', '34', '52', '0', '6', '0', '8', 111, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (260, 'МДК.02.03', '96', '48', '48', '0', '0', '0', '0', 112, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (261, 'МДК.02.03', '96', '48', '48', '0', '0', '0', '0', 112, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (262, 'УП.02.01', '144', 'нед', '0', '0', '0', '0', '0', 106, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (263, 'УП.02.01', '144', 'нед', '0', '0', '0', '0', '0', 106, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (264, 'УП.02.01', '144', 'нед', '0', '0', '0', '0', '0', 106, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (265, 'ПП.02.01', '108', 'нед', '0', '0', '0', '0', '0', 107, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (266, 'ПП.02.01', '108', 'нед', '0', '0', '0', '0', '0', 107, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (267, 'ПП.02.01', '108', 'нед', '0', '0', '0', '0', '0', 107, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (268, 'ПM.02.Э', '', '0', '0', '0', '0', '0', '4', 108, 29, 6, 253)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (269, 'ПМ.04', '360', '98', '100', '0', '6', '0', '12', 116, 30, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (270, 'ПМ.04', '360', '98', '100', '0', '6', '0', '12', 116, 30, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (271, 'ПМ.04', '360', '98', '100', '0', '6', '0', '12', 116, 30, 7, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (272, 'МДК.04.01', '108', '54', '54', '0', '6', '0', '8', 117, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (273, 'МДК.04.01', '108', '54', '54', '0', '6', '0', '8', 117, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (274, 'МДК.04.02', '90', '44', '46', '0', '0', '0', '0', 118, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (275, 'МДК.04.02', '90', '44', '46', '0', '0', '0', '0', 118, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (276, 'УП.04.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (277, 'УП.04.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (278, 'УП.04.01', '72', 'нед', '0', '0', '0', '0', '0', 106, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (279, 'ПП.04.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (280, 'ПП.04.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (281, 'ПП.04.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (282, 'ПM.04.Э', '', '0', '0', '0', '0', '0', '4', 108, 30, 7, 269)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (283, 'ПМ.07', '505', '122', '185', '0', '6', '0', '4', 122, 31, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (284, 'ПМ.07', '505', '122', '185', '0', '6', '0', '4', 122, 31, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (285, 'ПМ.07', '505', '122', '185', '0', '6', '0', '4', 122, 31, 5, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (286, 'МДК.07.01', '197', '80', '117', '0', '6', '0', '0', 123, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (287, 'МДК.07.01', '197', '80', '117', '0', '6', '0', '0', 123, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (288, 'МДК.07.02', '110', '42', '68', '0', '0', '0', '0', 124, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (289, 'МДК.07.02', '110', '42', '68', '0', '0', '0', '0', 124, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (290, 'УП.07.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (291, 'УП.07.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (292, 'УП.07.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (293, 'ПП.07.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (294, 'ПП.07.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (295, 'ПП.07.01', '90', 'нед', '0', '0', '0', '0', '0', 107, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (296, 'ПM.07.Э', '', '0', '0', '0', '0', '0', '4', 108, 31, 5, 283)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (297, 'ПМ.11', '483', '135', '186', '0', '6', '0', '4', 128, 32, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (298, 'ПМ.11', '483', '135', '186', '0', '6', '0', '4', 128, 32, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (299, 'ПМ.11', '483', '135', '186', '0', '6', '0', '4', 128, 32, 6, NULL)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (300, 'МДК.11.01', '321', '135', '186', '0', '6', '0', '0', 129, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (301, 'МДК.11.01', '321', '135', '186', '0', '6', '0', '0', 129, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (302, 'УП.11.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (303, 'УП.11.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (304, 'УП.11.01', '108', 'нед', '0', '0', '0', '0', '0', 106, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (305, 'ПП.11.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (306, 'ПП.11.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (307, 'ПП.11.01', '54', 'нед', '0', '0', '0', '0', '0', 107, 32, 6, 297)
INSERT dbo.EU_CMK_RUP(ID_EU_CMK_RUP, Prefix, Total_Number_Of_Hours, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Educational_Unit_ID, Type_Of_Educational_Unit_ID, CMK_RUP_ID, EU_CMK_RUP_ID) VALUES (308, 'ПM.11.Э', '', '0', '0', '0', '0', '0', '4', 108, 32, 6, 297)
GO
SET IDENTITY_INSERT dbo.EU_CMK_RUP OFF
GO
-- 
-- Вывод данных для таблицы File_Tasks
--
PRINT (N'Вывод данных для таблицы File_Tasks')
SET IDENTITY_INSERT dbo.File_Tasks ON
GO
INSERT dbo.File_Tasks(Id_File_Task, Path_File, File_Detail, Task_DistributionsId_Task_Distribution) VALUES (1, N'C:/', N'Файл с задачей', 1)
INSERT dbo.File_Tasks(Id_File_Task, Path_File, File_Detail, Task_DistributionsId_Task_Distribution) VALUES (4, N'D:/', N'Файл с отчетом', 4)
INSERT dbo.File_Tasks(Id_File_Task, Path_File, File_Detail, Task_DistributionsId_Task_Distribution) VALUES (5, N'E:/', N'Файл с задачей', 8)
GO
SET IDENTITY_INSERT dbo.File_Tasks OFF
GO
-- 
-- Вывод данных для таблицы Form
--
PRINT (N'Вывод данных для таблицы Form')
SET IDENTITY_INSERT dbo.Form ON
GO
INSERT dbo.Form(ID_Form, Name_Form, Color_ID) VALUES (1, 'Квадрат (1)', 1)
INSERT dbo.Form(ID_Form, Name_Form, Color_ID) VALUES (2, 'Квадрат (2)', 2)
INSERT dbo.Form(ID_Form, Name_Form, Color_ID) VALUES (3, 'Квадрат (3)', 3)
INSERT dbo.Form(ID_Form, Name_Form, Color_ID) VALUES (4, 'Квадрат (4)', 4)
INSERT dbo.Form(ID_Form, Name_Form, Color_ID) VALUES (5, 'Квадрат (5)', 5)
GO
SET IDENTITY_INSERT dbo.Form OFF
GO
-- 
-- Вывод данных для таблицы Form_Of_Control
--
PRINT (N'Вывод данных для таблицы Form_Of_Control')
SET IDENTITY_INSERT dbo.Form_Of_Control ON
GO
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (1, 'Форма контроля №1')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (2, 'Форма контроля №5')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (3, 'Форма контроля №7')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (13, 'Экзамены')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (14, 'Зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (15, 'Диффер. зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (16, 'Курсовые проекты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (17, 'Курсовые работы')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (18, 'Другие')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (19, 'Экзамены')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (20, 'Зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (21, 'Диффер. зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (22, 'Курсовые проекты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (23, 'Курсовые работы')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (24, 'Другие')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (25, 'Экзамены')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (26, 'Зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (27, 'Диффер. зачеты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (28, 'Курсовые проекты')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (29, 'Курсовые работы')
INSERT dbo.Form_Of_Control(ID_Form_Of_Control, Name_Of_The_Form) VALUES (30, 'Другие')
GO
SET IDENTITY_INSERT dbo.Form_Of_Control OFF
GO
-- 
-- Вывод данных для таблицы Form_Of_Control_EU
--
PRINT (N'Вывод данных для таблицы Form_Of_Control_EU')
SET IDENTITY_INSERT dbo.Form_Of_Control_EU ON
GO
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (3, '6', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (164, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (165, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (166, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (167, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (168, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (169, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (170, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (171, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (172, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (173, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (174, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (175, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (176, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (177, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (178, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (179, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (180, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (181, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (182, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (183, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (184, '2', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (185, '1', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (186, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (187, '7', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (188, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (189, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (190, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (191, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (192, '3-8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (193, '3-8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (194, '34', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (195, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (196, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (197, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (198, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (199, '34', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (200, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (201, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (202, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (203, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (204, '35', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (205, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (206, '5', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (207, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (208, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (209, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (210, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (211, '4', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (212, '3', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (213, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (214, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (215, '6', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (216, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (217, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (218, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (219, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (220, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (221, '5', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (222, '8', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (223, '5', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (224, '4', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (225, '5', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (226, '4', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (227, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (228, '5-7', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (229, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (230, '5-7', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (231, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (232, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (233, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (234, '7', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (235, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (236, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (237, '8', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (238, '3', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (239, '3', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (240, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (241, '5', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (242, '34', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (243, '6', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (244, '5', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (245, '5', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (246, '34', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (247, '3', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (248, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (249, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (250, '7', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (251, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (252, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (253, '8', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (254, '2', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (255, '3', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (256, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (257, '6', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (258, '45', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (259, '7', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (260, '6', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (261, '4', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (262, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (263, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (264, '7', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (265, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (266, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (267, '8', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (268, '1', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (269, '5', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (270, '3', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (271, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (272, '67', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (273, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (274, '7', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (275, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (276, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (277, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (278, '78', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (279, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (280, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (281, '8', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (282, '1', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (283, '3', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (284, '2', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (285, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (286, '67', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (287, '6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (288, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (289, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (290, '8', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (291, 'РП', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (292, 'час', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Form_Of_Control_EU(ID_Form_Of_Control_EU, Number_Of_Semester, Form_Of_Control_ID, Theoretical_Hours, Lab_Prac_Hours, Individual_Work, Consultations, Coursework_Project, Interim_Certification, Number_Of_Weeks, EU_CMK_RUP_Form_ID) VALUES (293, '8', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Form_Of_Control_EU OFF
GO
-- 
-- Вывод данных для таблицы Functions
--
PRINT (N'Вывод данных для таблицы Functions')
SET IDENTITY_INSERT dbo.Functions ON
GO
INSERT dbo.Functions(Id_Function, Name_function) VALUES (1, N'Распределение задач')
INSERT dbo.Functions(Id_Function, Name_function) VALUES (2, N'Доступ к сотрудникам')
INSERT dbo.Functions(Id_Function, Name_function) VALUES (3, N'Комментарий')
GO
SET IDENTITY_INSERT dbo.Functions OFF
GO
-- 
-- Вывод данных для таблицы GGroup
--
PRINT (N'Вывод данных для таблицы GGroup')
SET IDENTITY_INSERT dbo.GGroup ON
GO
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (4, 'И-1-17', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (5, 'ИС-2-17', 5)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (876, 'Э-1-19', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (877, 'Э-2-19', 7)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1044, 'Э-1-18', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1045, 'Э-2-18', 7)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1046, ' Э-11-19', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1047, 'Э-1-17', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1048, 'Э-2-17', 4)
INSERT dbo.GGroup(ID_Group, Name_Group, Specialty_ID) VALUES (1049, ' Э-11-18', 4)
GO
SET IDENTITY_INSERT dbo.GGroup OFF
GO
-- 
-- Вывод данных для таблицы Kind_criteria
--
PRINT (N'Вывод данных для таблицы Kind_criteria')
SET IDENTITY_INSERT dbo.Kind_criteria ON
GO
INSERT dbo.Kind_criteria(ID_Kind_criteria, Name_of_kind_criteria) VALUES (2, 'Внешний')
INSERT dbo.Kind_criteria(ID_Kind_criteria, Name_of_kind_criteria) VALUES (1, 'Внутренний')
INSERT dbo.Kind_criteria(ID_Kind_criteria, Name_of_kind_criteria) VALUES (14, 'Средний')
INSERT dbo.Kind_criteria(ID_Kind_criteria, Name_of_kind_criteria) VALUES (15, 'Ывывыв')
GO
SET IDENTITY_INSERT dbo.Kind_criteria OFF
GO
-- 
-- Вывод данных для таблицы Material_Provision
--
PRINT (N'Вывод данных для таблицы Material_Provision')
SET IDENTITY_INSERT dbo.Material_Provision ON
GO
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (1, 'Компьютер KraftCredo (1)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (12, 'Компьютер KraftCredo (10)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (13, 'Компьютер KraftCredo (11)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (14, 'Компьютер KraftCredo (12)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (15, 'Компьютер KraftCredo (13)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (16, 'Компьютер KraftCredo (14)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (17, 'Компьютер KraftCredo (15)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (18, 'Компьютер KraftCredo (16)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (19, 'Компьютер KraftCredo (17)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (20, 'Компьютер KraftCredo (18)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (21, 'Компьютер KraftCredo (19)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (2, 'Компьютер KraftCredo (2)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (22, 'Компьютер KraftCredo (20)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (3, 'Компьютер KraftCredo (3)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (6, 'Компьютер KraftCredo (4)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (7, 'Компьютер KraftCredo (5)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (8, 'Компьютер KraftCredo (6)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (9, 'Компьютер KraftCredo (7)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (10, 'Компьютер KraftCredo (8)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (11, 'Компьютер KraftCredo (9)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (23, 'Монитор BenQ GW2475H 24" (1)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (32, 'Монитор BenQ GW2475H 24" (10)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (33, 'Монитор BenQ GW2475H 24" (11)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (34, 'Монитор BenQ GW2475H 24" (12)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (35, 'Монитор BenQ GW2475H 24" (13)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (36, 'Монитор BenQ GW2475H 24" (14)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (37, 'Монитор BenQ GW2475H 24" (15)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (38, 'Монитор BenQ GW2475H 24" (16)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (39, 'Монитор BenQ GW2475H 24" (17)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (40, 'Монитор BenQ GW2475H 24" (18)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (41, 'Монитор BenQ GW2475H 24" (19)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (24, 'Монитор BenQ GW2475H 24" (2)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (42, 'Монитор BenQ GW2475H 24" (20)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (25, 'Монитор BenQ GW2475H 24" (3)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (26, 'Монитор BenQ GW2475H 24" (4)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (27, 'Монитор BenQ GW2475H 24" (5)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (28, 'Монитор BenQ GW2475H 24" (6)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (29, 'Монитор BenQ GW2475H 24" (7)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (30, 'Монитор BenQ GW2475H 24" (8)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (31, 'Монитор BenQ GW2475H 24" (9)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (43, 'Мышь Logitech M90 (1)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (52, 'Мышь Logitech M90 (10)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (53, 'Мышь Logitech M90 (11)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (54, 'Мышь Logitech M90 (12)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (55, 'Мышь Logitech M90 (13)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (56, 'Мышь Logitech M90 (14)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (57, 'Мышь Logitech M90 (15)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (58, 'Мышь Logitech M90 (16)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (59, 'Мышь Logitech M90 (17)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (60, 'Мышь Logitech M90 (18)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (61, 'Мышь Logitech M90 (19)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (44, 'Мышь Logitech M90 (2)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (45, 'Мышь Logitech M90 (3)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (46, 'Мышь Logitech M90 (4)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (47, 'Мышь Logitech M90 (5)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (48, 'Мышь Logitech M90 (6)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (49, 'Мышь Logitech M90 (7)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (50, 'Мышь Logitech M90 (8)')
INSERT dbo.Material_Provision(ID_Material_Provision, Name_Material_Provision) VALUES (51, 'Мышь Logitech M90 (9)')
GO
SET IDENTITY_INSERT dbo.Material_Provision OFF
GO
-- 
-- Вывод данных для таблицы MTOK
--
PRINT (N'Вывод данных для таблицы MTOK')
SET IDENTITY_INSERT dbo.MTOK ON
GO
INSERT dbo.MTOK(ID_MTOK, Position_X, Position_Y, Width, Height, Territory_Аudiences_ID, Characteristic_MO_ID, MTOK_ID, Inventory_Number) VALUES (13, '1234', '1111', '123', '321', 6, 1, NULL, '123456789012345')
INSERT dbo.MTOK(ID_MTOK, Position_X, Position_Y, Width, Height, Territory_Аudiences_ID, Characteristic_MO_ID, MTOK_ID, Inventory_Number) VALUES (14, '4212', '2222', '123', '213', 7, 2, NULL, '324153645621321')
INSERT dbo.MTOK(ID_MTOK, Position_X, Position_Y, Width, Height, Territory_Аudiences_ID, Characteristic_MO_ID, MTOK_ID, Inventory_Number) VALUES (15, '3123', '3333', '123', '312', 8, 3, NULL, '321312343532512')
GO
SET IDENTITY_INSERT dbo.MTOK OFF
GO
-- 
-- Вывод данных для таблицы NLP
--
PRINT (N'Вывод данных для таблицы NLP')
SET IDENTITY_INSERT dbo.NLP ON
GO
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (18, '08.05.2021', '1', '1', 4, 1, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (20, '08.05.2021', '1', '1', 876, 1, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (23, '08.05.2021', '1', '1', 1045, 5, 194)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (24, '08.05.2021', '1', '1', 876, 6, 164)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (25, '08.05.2021', '1', '1', 876, 7, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (26, '08.05.2021', '1', '1', 876, 8, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (27, '08.05.2021', '1', '1', 876, 9, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (28, '08.05.2021', '1', '1', 876, 10, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (29, '08.05.2021', '1', '1', 876, 11, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (30, '08.05.2021', '1', '1', 876, 12, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (31, '08.05.2021', '1', '1', 876, 13, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (32, '08.05.2021', '1', '1', 876, 14, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (33, '08.05.2021', '1', '1', 876, 15, 3)
INSERT dbo.NLP(ID_NLP, Date_Forming, Number_Of_Weeks, Hours_Per_Week, Group_ID, Distribution_ID, Form_Of_Control_EU_ID) VALUES (34, '08.05.2021', '1', '1', 876, 16, 3)
GO
SET IDENTITY_INSERT dbo.NLP OFF
GO
-- 
-- Вывод данных для таблицы Plurality
--
PRINT (N'Вывод данных для таблицы Plurality')
SET IDENTITY_INSERT dbo.Plurality ON
GO
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (1, 1, 1)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (3, 3, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (7, 4, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (8, 5, 2)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (9, 392, 2)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (10, 393, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (11, 394, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (12, 398, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (13, 399, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (14, 403, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (15, 405, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (16, 411, 2)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (17, 412, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (18, 410, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (19, 432, 3)
INSERT dbo.Plurality(Id_Plurality, EmployeeId_Employee, PositionId_Position) VALUES (20, 435, 3)
GO
SET IDENTITY_INSERT dbo.Plurality OFF
GO
-- 
-- Вывод данных для таблицы Positions
--
PRINT (N'Вывод данных для таблицы Positions')
SET IDENTITY_INSERT dbo.Positions ON
GO
INSERT dbo.Positions(Id_Position, Position_name) VALUES (1, N'Лаборант')
INSERT dbo.Positions(Id_Position, Position_name) VALUES (2, N'Администратор')
INSERT dbo.Positions(Id_Position, Position_name) VALUES (3, N'Заведующий лабораториями')
GO
SET IDENTITY_INSERT dbo.Positions OFF
GO
-- 
-- Вывод данных для таблицы Quality_control
--
PRINT (N'Вывод данных для таблицы Quality_control')
SET IDENTITY_INSERT dbo.Quality_control ON
GO
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (203, '02.02.2021', 20, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (204, '02.02.2021', 40, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (205, '02.02.2021', 43, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (206, '02.02.2021', 44, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (207, '02.02.2021', 45, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (208, '02.02.2021', 46, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (209, '02.02.2021', 49, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (210, '02.02.2021', 20, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (211, '02.02.2021', 40, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (212, '02.02.2021', 43, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (213, '02.02.2021', 44, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (214, '02.02.2021', 45, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (215, '02.02.2021', 46, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (216, '02.02.2021', 49, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (217, '02.02.2021', 20, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (218, '02.02.2021', 40, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (219, '02.02.2021', 43, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (220, '02.02.2021', 44, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (221, '02.02.2021', 45, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (222, '02.02.2021', 46, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (223, '02.02.2021', 49, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (224, '03.02.2021', 20, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (225, '03.02.2021', 40, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (226, '03.02.2021', 43, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (227, '03.02.2021', 44, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (228, '03.02.2021', 45, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (229, '03.02.2021', 46, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (230, '03.02.2021', 49, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (231, '03.02.2021', 20, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (232, '03.02.2021', 40, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (233, '03.02.2021', 43, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (234, '03.02.2021', 44, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (235, '03.02.2021', 45, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (236, '03.02.2021', 46, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (237, '03.02.2021', 49, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (238, '03.02.2021', 20, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (239, '03.02.2021', 40, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (240, '03.02.2021', 43, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (241, '03.02.2021', 44, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (242, '03.02.2021', 45, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (243, '03.02.2021', 46, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (244, '03.02.2021', 49, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (245, '09.02.2021', 20, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (246, '09.02.2021', 40, 13, 5)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (247, '09.02.2021', 43, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (248, '09.02.2021', 44, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (249, '09.02.2021', 45, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (250, '09.02.2021', 46, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (251, '09.02.2021', 49, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (252, '09.02.2021', 20, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (253, '09.02.2021', 40, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (254, '09.02.2021', 43, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (255, '09.02.2021', 44, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (256, '09.02.2021', 45, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (257, '09.02.2021', 46, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (258, '09.02.2021', 49, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (259, '09.02.2021', 20, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (260, '09.02.2021', 40, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (261, '09.02.2021', 43, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (262, '09.02.2021', 44, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (263, '09.02.2021', 45, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (264, '09.02.2021', 46, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (265, '09.02.2021', 49, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (266, '09.02.2021', 45, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (288, '04.03.2021', 20, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (289, '04.03.2021', 40, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (290, '04.03.2021', 43, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (291, '04.03.2021', 44, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (292, '04.03.2021', 45, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (293, '04.03.2021', 46, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (294, '04.03.2021', 49, 13, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (295, '04.03.2021', 20, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (296, '04.03.2021', 40, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (297, '04.03.2021', 43, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (298, '04.03.2021', 44, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (299, '04.03.2021', 45, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (300, '04.03.2021', 46, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (301, '04.03.2021', 49, 14, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (302, '04.03.2021', 20, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (303, '04.03.2021', 40, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (304, '04.03.2021', 43, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (305, '04.03.2021', 44, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (306, '04.03.2021', 45, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (307, '04.03.2021', 46, 15, 0)
INSERT dbo.Quality_control(ID_quality_control, Date_Of_Hosting, criteria_ID, MTOK_ID, ocenka) VALUES (308, '04.03.2021', 49, 15, 0)
GO
SET IDENTITY_INSERT dbo.Quality_control OFF
GO
-- 
-- Вывод данных для таблицы Request
--
PRINT (N'Вывод данных для таблицы Request')
SET IDENTITY_INSERT dbo.Request ON
GO
INSERT dbo.Request(ID_Request, Status, Text_Request, NLP_Request_ID) VALUES (2, CONVERT(bit, 'False'), 'Привет', 6)
INSERT dbo.Request(ID_Request, Status, Text_Request, NLP_Request_ID) VALUES (3, CONVERT(bit, 'True'), 'Как дела?', 7)
GO
SET IDENTITY_INSERT dbo.Request OFF
GO
-- 
-- Вывод данных для таблицы Rightss
--
PRINT (N'Вывод данных для таблицы Rightss')
SET IDENTITY_INSERT dbo.Rightss ON
GO
INSERT dbo.Rightss(Id_Rights, Give_out, RoleId_Role, FunctionId_Function) VALUES (1, 1, 1, 1)
INSERT dbo.Rightss(Id_Rights, Give_out, RoleId_Role, FunctionId_Function) VALUES (2, 0, 2, 2)
INSERT dbo.Rightss(Id_Rights, Give_out, RoleId_Role, FunctionId_Function) VALUES (3, 1, 3, 3)
INSERT dbo.Rightss(Id_Rights, Give_out, RoleId_Role, FunctionId_Function) VALUES (4, 1, 4, 2)
GO
SET IDENTITY_INSERT dbo.Rightss OFF
GO
-- 
-- Вывод данных для таблицы Role_In_CMK
--
PRINT (N'Вывод данных для таблицы Role_In_CMK')
SET IDENTITY_INSERT dbo.Role_In_CMK ON
GO
INSERT dbo.Role_In_CMK(ID_Role_In_CMK, Name_Role) VALUES (8, 'Зам')
INSERT dbo.Role_In_CMK(ID_Role_In_CMK, Name_Role) VALUES (3, 'Зам председателя')
INSERT dbo.Role_In_CMK(ID_Role_In_CMK, Name_Role) VALUES (1, 'Председатель')
INSERT dbo.Role_In_CMK(ID_Role_In_CMK, Name_Role) VALUES (2, 'Сотрудник')
GO
SET IDENTITY_INSERT dbo.Role_In_CMK OFF
GO
-- 
-- Вывод данных для таблицы Roles
--
PRINT (N'Вывод данных для таблицы Roles')
SET IDENTITY_INSERT dbo.Roles ON
GO
INSERT dbo.Roles(Id_Role, Name_Role) VALUES (1, N'Администратор')
INSERT dbo.Roles(Id_Role, Name_Role) VALUES (2, N'Заведующий лабораториями')
INSERT dbo.Roles(Id_Role, Name_Role) VALUES (3, N'Лаборант')
INSERT dbo.Roles(Id_Role, Name_Role) VALUES (4, N'tesdt')
GO
SET IDENTITY_INSERT dbo.Roles OFF
GO
-- 
-- Вывод данных для таблицы RUP
--
PRINT (N'Вывод данных для таблицы RUP')
SET IDENTITY_INSERT dbo.RUP ON
GO
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (1, '2017', '2г 10мес', 4)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (2, '2016', '3г 10мес', 5)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (3, '2017', '2г 10мес', 4)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (4, '2016', '3г 10мес', 5)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (5, '2019', '3г 10м', 7)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (6, '2019', '3г 10м', 7)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (7, '2019', '3г 10м', 7)
INSERT dbo.RUP(ID_RUP, Year_Of_Flow, Period_Of_Study, Specialty_RUP_ID) VALUES (8, '2019', '3г 10м', 7)
GO
SET IDENTITY_INSERT dbo.RUP OFF
GO
-- 
-- Вывод данных для таблицы Schedule_NLP
--
PRINT (N'Вывод данных для таблицы Schedule_NLP')
SET IDENTITY_INSERT dbo.Schedule_NLP ON
GO
INSERT dbo.Schedule_NLP(ID_Schedule_NLP, Order_Week, Day_Week, Number_Classes, NLPp_ID) VALUES (1, CONVERT(bit, 'False'), N'Понедельник', 1, 6)
INSERT dbo.Schedule_NLP(ID_Schedule_NLP, Order_Week, Day_Week, Number_Classes, NLPp_ID) VALUES (5, CONVERT(bit, 'True'), N'Понедельник', 3, 6)
INSERT dbo.Schedule_NLP(ID_Schedule_NLP, Order_Week, Day_Week, Number_Classes, NLPp_ID) VALUES (7, CONVERT(bit, 'False'), N'Вторник', 4, 7)
INSERT dbo.Schedule_NLP(ID_Schedule_NLP, Order_Week, Day_Week, Number_Classes, NLPp_ID) VALUES (26, CONVERT(bit, 'False'), N'Среда', 1, 7)
INSERT dbo.Schedule_NLP(ID_Schedule_NLP, Order_Week, Day_Week, Number_Classes, NLPp_ID) VALUES (28, CONVERT(bit, 'True'), N'Вторник', 3, 6)
GO
SET IDENTITY_INSERT dbo.Schedule_NLP OFF
GO
-- 
-- Вывод данных для таблицы Specialty
--
PRINT (N'Вывод данных для таблицы Specialty')
SET IDENTITY_INSERT dbo.Specialty ON
GO
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (4, '09.02.05', 'Прикладная информатика (по отраслям)')
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (5, '09.02.03', 'Web-программирование')
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (7, '09.02.2007', 'Информационные системы и программирование')
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (8, '09.02.2007', 'Информационные системы и программирование')
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (9, '09.02.2007', 'Информационные системы и программирование')
INSERT dbo.Specialty(ID_Specialty, Number_Specialty, Name_Specialty) VALUES (10, '09.02.2007', 'Информационные системы и программирование')
GO
SET IDENTITY_INSERT dbo.Specialty OFF
GO
-- 
-- Вывод данных для таблицы Statuss
--
PRINT (N'Вывод данных для таблицы Statuss')
SET IDENTITY_INSERT dbo.Statuss ON
GO
INSERT dbo.Statuss(Id_Status, Status_name) VALUES (1, N'Выполняется')
INSERT dbo.Statuss(Id_Status, Status_name) VALUES (2, N'Ожидается проверка')
INSERT dbo.Statuss(Id_Status, Status_name) VALUES (3, N'На проверке')
GO
SET IDENTITY_INSERT dbo.Statuss OFF
GO
-- 
-- Вывод данных для таблицы sysdiagrams
--
PRINT (N'Вывод данных для таблицы sysdiagrams')
SET IDENTITY_INSERT dbo.sysdiagrams ON
GO
EXEC(N'INSERT dbo.sysdiagrams(name, principal_id, diagram_id, version, definition) VALUES (N''Diagram_0'', 10, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF18000000FEFFFFFF0400000005000000060000000700000008000000250000000A0000000B0000000C0000000D0000000E0000000F0000001000000011000000120000001300000014000000150000001600000017000000FEFFFFFFFEFFFFFF1A0000001B0000001C0000001D0000001E0000001F0000002000000021000000220000002300000024000000FEFFFFFF26000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000020E9FD9F0EB3D60103000000C00F0000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000003A0A0000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000009000000E91D000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000290000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000FEFFFFFF2A000000FEFFFFFFFEFFFFFF2D0000002E0000002F000000300000003100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
+ N'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000434000A1E500C050000801B0000000F00FFFF500000001B000000007D0000626B0000DC4B0000039D00009284000046F9FFFFBC0A0000DE805B10F195D011B0A000AA00BDCB5C0000080030000000000200000300000038002B00000009000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002C0043200000000000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002C0043200000000000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C1B00000040090000009B016300002C00A509000007000080010000009802000000800000030000805363684772696400A41F00002E3B0000434D4B4700003000A50900000700008002000000A002000000800000070000805363684772696400A41F000016260000434D4B5F5255500000007400A5090000070000800300000052000000018000004C000000436F6E74726F6C002F290000732F0000210432044F0437044C042000220046004B005F0043004D004B00220020003C0435043604340443042000220043004D004B002200200038042000220043004D004B005F00520055005000220000002800B50100000700008004000000310000003F00000002800000436F6E74726F6C00752B00000236000000003800A50900000700008005000000B202000000800000100000805363684772696400825F000014370000456475636174696F6E616C5F556E697400003400A50900000700008006000000A6020000008000000A0000805363684772696400DE3F00006E28000045555F434D4B5F52555000000000B000A50900000700008007000000520000000180000086000000436F6E74726F6C003A550000C33A0000210432044F0437044C042000220046004B005F0045006400750063006100740069006F006E0061006C005F0055006E0069007400220020003C0435043604340443042000220045006400750063006100740069006F006E0061006C005F0055006E006900740022002000380420002200450055005F0043004D004B005F0052005500500022001E0600002800B50100000700008008000000310000005900000002800000436F6E74726F6C006F550000533A000000008C00A50900000700008009000000620000000180000062000000436F6E74726F6C00003500005B2A0000210432044F0437044C042000220046004B005F0043004D004B005F00520055005000220020003C0435043604340443042000220043004D004B005F0052005500500022002000380420002200450055005F0043004D004B005F005200550050002200730000002800B5010000070000800A000000310000004700000002800000436F6E74726F6C000D300000CC37000000009800A5090000070000800B0000006A000000018000006E000000436F6E74726F6C00CA3A00005A230000210432044F0437044C042000220046004B005F00450055005F0043004D004B005F00520055005000220020003C04350436043404430420002200450055005F0043004D004B005F0052005500500022002000380420002200450055005F0043004D004B005F005200550050002200000000002800B5010000070000800C000000310000004D00000002800000436F6E74726F6C00E63A00003525000000003800A5090000070000800D000000B0020000008000000F0000805363684772696400483F0000B0040000466F726D5F4F665F436F6E74726F6C0000003C00A5090000070000800E000000B602000000800000120000805363684772696400DE3F0000C0120000466F726D5F4F665F436F6E74726F6C5F455500000000BC00A5090000070000800F000000520000000180000092000000436F6E74726F6C0069490000960B0000210432044F0437044C042000220046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C00220020003C0435043604340443042000220046006F0072006D005F004F0066005F0043006F006E00740072006F006C002200200038042000220046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F00450055002200000000002800B50100000700008010000000310000005700000002800000436F6E74726F6C00F13E0000DA0F00000000B800A5090000070000801100000052000000018000008E000000436F6E74726F6C0069490000211C0000210432044F0437044C042000220046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F0045005500220020003C0435043604340443042000220046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F004500550022002000380420002200450055005F0043004D004B005F0052005500500022000E1D00002800B50100000700008012000000310000005D00000002800000436F6E74726F6C00CD3C0000F622000000002C00A509000007000080130000009802000000800000030000805363684772696400000000004A2E00005255504700007400A50'
+ N'90000070000801400000062000000018000004C000000436F6E74726F6C005C150000772A0000210432044F0437044C042000220046004B005F00520055005000220020003C043504360434044304200022005200550050002200200038042000220043004D004B005F00520055005000220000002800B50100000700008015000000310000003F00000002800000436F6E74726F6C00071F0000EC34000000003400A50900000700008016000000A40200000080000009000080536368477269640000000000504600005370656369616C747900000000008C00A50900000700008017000000520000000180000064000000436F6E74726F6C008B090000223A0000210432044F0437044C042000220046004B005F005300700065006300690061006C00740079005F00520055005000220020003C043504360434044304200022005300700065006300690061006C007400790022002000380420002200520055005000220000002800B50100000700008018000000310000005300000002800000436F6E74726F6C00A6000000F640000000004000A50900000700008019000000C202000000800000180000805363684772696400DE3F00003C5A0000547970655F4F665F456475636174696F6E616C5F556E69740000D000A5090000070000801A0000005200000001800000A6000000436F6E74726F6C0069490000144D0000210432044F0437044C042000220046004B005F0054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E0069007400220020003C0435043604340443042000220054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E006900740022002000380420002200450055005F0043004D004B005F005200550050002200000000002800B5010000070000801B000000310000006900000002800000436F6E74726F6C00AF4B00002F5700000000000000000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200D07FEE9F0EB3D6010202000010484500000000000000000000000000000000001E0200004400610074006100200053006F0075007200630065003D00380039002E003100370039002E003200340030002E003200320036002C00360033003300380038003B0049006E0069007400690061006C00200043006100740061006C006F0067003D0045006400750063006100740069006F006E0061006C005F0069006E0073007400690074007500740069006F006E003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B002143341208000000881600009D09000078563412070000001401000043004D004B00000000000000000000000000000000000080000000000000000000000000010000000000000080DC5D6D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC04000036060000470400000000000001000000881600009D09000000000000020000000200000002000000020000001C010000D70A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000400000043004D004B000000214334120800000088160000180C000078563412070000001401000043004D004B005F005200550050000000E8FBB2102015A502EC14A502989A1406509A1406BC16A5027816A502C009A5028409A5023409A502D408A502A810A5026810A502400AA5020C0AA502447E14068C7D1406C818A5028418A5023011A502F410A5028C1AA502481AA502D41BA502901BA502A020A5025C20A502'
+ N'781CA502341CA502E87E1406907E14065817A5021C17A5022C16A502EC15A502301BA502EC1AA502581DA502141DA502FC1FA502B81FA502381EA502F41DA5023423A5020023A502880FA502400FA5028824A5023424A5029C9714065C9714061C10A502E00FA502A015A5026C15A5026422000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC0400003606000047040000000000000100000088160000180C000000000000030000000300000002000000020000001C010000D70A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000043004D004B005F00520055005000000002000B00C62A00002E3B0000C62A00002E3200000000000002000000F0F0F00000000000000000000000000000000000010000000400000000000000752B0000023600006404000058010000320000000100000200006404000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D61060046004B005F0043004D004B00214334120800000071160000560A000078563412070000001401000045006400750063006100740069006F006E0061006C005F0055006E006900740000000000010000000000000080DC5D6D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC0400003606000047040000000000000100000071160000560A000000000000020000000200000002000000020000001C010000D70A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001100000045006400750063006100740069006F006E0061006C005F0055006E0069007400000021433412080000008816000061270000785634120700000014010000450055005F0043004D004B005F0052005500500000005C701B000000900100000000000060000000600000002000FDFF1F00200000000027CC0000004900000080CC140690CB14060000000000000000000000000C00000000000000000800004900000088CC14069CCB14060000000000000000000000000C00000014000000FBFFFFFF4900000078CC1406A8CB140600000000000000000000000008000000020000000800000049000000B4CC1406B4CB14060000000000000000000000000800FFFFD8000000E60000004900000090CC1406C0CB1406000000000000000000000000080068006F006D006100000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC040000360600004704000000000000010000008816000061270000000000000E0000000C00000002000000020000001C010000E60A0000000000000100000039130000D910000000000000060000000600000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A000000040'
+ N'00000640062006F0000000B000000450055005F0043004D004B005F00520055005000000002000B00825F00005A3C0000665600005A3C00000000000002000000F0F0F000000000000000000000000000000000000100000008000000000000006F550000533A00000A0B000058010000320000000100000200000A0B000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D61130046004B005F0045006400750063006100740069006F006E0061006C005F0055006E006900740004000B002C360000F22B00000E380000F22B00000E3800005A3C0000DE3F00005A3C00000000000002000000F0F0F00000000000000000000000000000000000010000000A000000000000000D300000CC3700005207000058010000320000000100000200005207000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D610A0046004B005F0043004D004B005F0052005500500005000B00DE3F00009A290000F63B00009A290000F63B0000862400000A410000862400000A4100006E2800000000000002000000F0F0F00000000000000000000000000000000000010000000C00000000000000E63A00003525000077090000580100003B0000000100000200007709000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D610D0046004B005F00450055005F0043004D004B005F005200550050002143341208000000881600009D09000078563412070000001401000046006F0072006D005F004F0066005F0043006F006E00740072006F006C0000002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F00500072006900760061007400650041007300730065006D0062006C006900650073002F00440061007400610043006F006C006C006500630074006F00720073002F00000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC04000036060000470400000000000001000000881600009D09000000000000020000000200000002000000020000001C010000D70A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001000000046006F0072006D005F004F0066005F0043006F006E00740072006F006C000000214334120800000088160000180C000078563412070000001401000046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F004500550000006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F00500072006F006A0065006300740043006F006D0070006F006E0065006E00740073002F004D006900630072006F0073006F00660074002E00530071006C0053006500000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC0400003606000047040000000000000100000088160000180C000000000000030000000300000002000000020000001C010000E60A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001300000046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F0045005500000002000B00004B00004D0E0000004B0000C01200000000000002000000F0F0F0000000000000000000000000000000000001000000100000'
+ N'0000000000F13E0000DA0F0000600B00005801000032000000010000020000600B000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D61120046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C0002000B00004B0000D81E0000004B00006E2800000000000002000000F0F0F00000000000000000000000000000000000010000001200000000000000CD3C0000F6220000840D00005801000032000000010000020000840D000058010000020000000000050000800800008001000000150001CC0000900144420100065461686F6D61150046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F0045005500214334120800000088160000930E000078563412070000001401000052005500500000002F002F0043003A002F00500072006F006700720061006D002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F0053007400610072007400500061006700650041007300730065006D0062006C006900650073002F004D006900630072006F0073006F00660074002E00530071006C00000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC0400003606000047040000000000000100000088160000930E000000000000040000000400000002000000020000001C010000D70A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000004000000520055005000000004000B008816000052350000581E000052350000581E0000F22B0000A41F0000F22B00000000000002000000F0F0F00000000000000000000000000000000000010000001500000000000000071F0000EC3400004704000058010000300000000100000200004704000058010000020000000000FFFFFF000800008001000000150001CC0000900144420100065461686F6D61060046004B005F00520055005000214334120800000088160000180C00007856341207000000140100005300700065006300690061006C0074007900000072006F006700720061006D002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F0053007400610072007400500061006700650041007300730065006D0062006C006900650073002F004D006900630072006F0073006F00660074002E00530071006C00000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC0400003606000047040000000000000100000088160000180C000000000000030000000300000002000000020000001C010000D70A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000005300700065006300690061006C0074007900000002000B00220B000050460000220B0000DD3C00000000000002000000F0F0F00000000000000000000000000000000000010000001800000000000000A6000000F6400000CD0900005801000031000000010000020000CD09000058010000020000000000FFFFFF000800008001000000150001CC0000900144420100065461686F6D61100046004B005F005300700065006300690061006C00740079005F0052005500500021433412080000005B170000F607000078563412070000001401000054007900700065005F004F00660'
+ N'05F0045006400750063006100740069006F006E0061006C005F0055006E006900740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000A30200004803000049020000EC040000EC040000EE020000EC040000360600004704000000000000010000005B170000F607000000000000020000000200000002000000020000001C0100006D0B00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000007A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001900000054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E0069007400000002000B00004B00003C5A0000004B0000CF4F00000000000002000000F0F0F00000000000000000000000000000000000010000001B00000000000000AF4B00002F5700007210000058010000130000000100000200007210000058010000020000000000FFFFFF000800008001000000150001CC0000900144420100065461686F6D611B0046004B005F0054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E006900740000000000000000000000000000000000000000000000000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000019000000D51700000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002B0000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002C000000720400000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000003E00000012000000000000000C00000046F9FFFFBC0A00000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C0031003200'
+ N'2C0032003700330030002C00310031002C0031003600380030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000300000003000000000000001E0000000100000001000000640062006F00000046004B005F0043004D004B0000000000000000000000C402000000000400000004000000030000000800000001170903581709030000000000000000AD0F0000010000050000000500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000060000000600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000070000000700000000000000380000000169637201000000640062006F00000046004B005F0045006400750063006100740069006F006E0061006C005F0055006E006900740000000000000000000000C402000000000800000008000000070000000800000001A8A910D0A8A9100000000000000000AD0F0000010000090000000900000000000000260000000176DC1C01000000640062006F00000046004B005F0043004D004B005F0052005500500000000000000000000000C402000000000A0000000A000000090000000800000001A9A91090A9A9100000000000000000AD0F00000100000B0000000B000000000000002C0000000100000001000000640062006F00000046004B005F00450055005F0043004D004B005F00520'
+ N'05500500000000000000000000000C402000000000C0000000C0000000B0000000800000001A4A91050A4A9100000000000000000AD0F00000100000D0000000D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000E0000000E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000F0000000F00000000000000360000000117E16D01000000640062006F00000046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C0000000000000000000000C4020000000010000000100000000F0000000800000001D0EE1CD8D0EE1C0000000000000000AD0F00000100001100000011000000000000003C0000000186092801000000640062006F00000046004B005F0046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F004500550000000000000000000000C402000000001200000012000000110000000800000001D1EE1C18D1EE1C0000000000000000AD0F0000010000130000001300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001400000014000000000000001E00000001A2B96D01000000640062006F00000046004B005F0052005500500000000000000000000000C402000000001500000015000000140000000800000001D2EE1CD8D2EE1C0000000000000000AD0F00000100001600'
+ N'00001600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003700370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000170000001700000000000000320000000117E16D01000000640062006F00000046004B005F005300700065006300690061006C00740079005F0052005500500000000000000000000000C402000000001800000018000000170000000800000001D1EE1C98D1EE1C0000000000000000AD0F0000010000190000001900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900320035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001A0000001A00000000000000480000000100690001000000640062006F00000046004B005F0054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E006900740000000000000000000000C402000000001B0000001B0000001A0000000800000001D2EE1C18D2EE1C0000000000000000AD0F00000100002D00000003000000010000000200000024000000250000000900000002000000060000005D0000008C0000000700000005000000060000005A0000008D0000000B00000006000000060000004C000000020000000F0000000D0000000E0000002700000024000000110000000E000000060000002500000024000000140000001300000002000000610000005C00000017000000160000001300000024000000250000001A000000190000000600000024000000250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055007300650072002000490044003D0056006F006C006B006F007600560041003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226000800000043004D004B00000008000000640062006F000000000226001000000043004D004B005F00520055005000000008000000640062006F0000000002260022000000450064007500630061007400690'
+ N'06F006E0061006C005F0055006E0069007400000008000000640062006F0000000002260016000000450055005F0043004D004B005F00520055005000000008000000640062006F000000000226002000000046006F0072006D005F004F0066005F0043006F006E00740072006F006C00000008000000640062006F000000000226002600000046006F0072006D005F004F0066005F0043006F006E00740072006F006C005F0045005500000008000000640062006F0000000002260008000000520055005000000008000000640062006F00000000022600140000005300700065006300690061006C0074007900000008000000640062006F000000000224003200000054007900700065005F004F0066005F0045006400750063006100740069006F006E0061006C005F0055006E0069007400000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D0000000000000000000000000000000000010003000000000000000C0000000B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)')
GO
SET IDENTITY_INSERT dbo.sysdiagrams OFF
GO
-- 
-- Вывод данных для таблицы Task_Comments
--
PRINT (N'Вывод данных для таблицы Task_Comments')
SET IDENTITY_INSERT dbo.Task_Comments ON
GO
INSERT dbo.Task_Comments(Id_Task_Comment, Text_comment, Type_CommentsId_Type_Comment, Task_DistributionsId_Task_Distribution) VALUES (1, N'Поправить задачу', 1, 1)
INSERT dbo.Task_Comments(Id_Task_Comment, Text_comment, Type_CommentsId_Type_Comment, Task_DistributionsId_Task_Distribution) VALUES (3, N'Задача сдана', 1, 4)
INSERT dbo.Task_Comments(Id_Task_Comment, Text_comment, Type_CommentsId_Type_Comment, Task_DistributionsId_Task_Distribution) VALUES (4, N'Зада не верна', 2, 8)
GO
SET IDENTITY_INSERT dbo.Task_Comments OFF
GO
-- 
-- Вывод данных для таблицы Task_Distributions
--
PRINT (N'Вывод данных для таблицы Task_Distributions')
SET IDENTITY_INSERT dbo.Task_Distributions ON
GO
INSERT dbo.Task_Distributions(Id_Task_Distribution, Time_Distribution, Date_Distribution, Period_Distribution, PluralityId_Plurality, TaskId_Task, StatusId_Status) VALUES (1, N'22.10.2020', N'22.10.2020', N'10 Дней', 1, 1, 1)
INSERT dbo.Task_Distributions(Id_Task_Distribution, Time_Distribution, Date_Distribution, Period_Distribution, PluralityId_Plurality, TaskId_Task, StatusId_Status) VALUES (4, N'26.10.2020', N'26.10.2020', N'11 дней', 3, 2, 2)
INSERT dbo.Task_Distributions(Id_Task_Distribution, Time_Distribution, Date_Distribution, Period_Distribution, PluralityId_Plurality, TaskId_Task, StatusId_Status) VALUES (8, N'26.10.2020', N'26.10.2020', N'10 дней', 7, 4, 3)
GO
SET IDENTITY_INSERT dbo.Task_Distributions OFF
GO
-- 
-- Вывод данных для таблицы Tasks
--
PRINT (N'Вывод данных для таблицы Tasks')
SET IDENTITY_INSERT dbo.Tasks ON
GO
INSERT dbo.Tasks(Id_Task, Task_Name, Task_Detail, Date_Open, Date_Close, TasksId_Task, StatusId_Status) VALUES (1, N'Починка ', N'Починить ПК', N'20.10.2020', N'22.10.2020', 2, 1)
INSERT dbo.Tasks(Id_Task, Task_Name, Task_Detail, Date_Open, Date_Close, TasksId_Task, StatusId_Status) VALUES (2, N'Ремонт', N'Ремонт пк', N'21.10.2029', N'22.10.2020', 1, 1)
INSERT dbo.Tasks(Id_Task, Task_Name, Task_Detail, Date_Open, Date_Close, TasksId_Task, StatusId_Status) VALUES (4, N'Проверить аудиторию', N'Проверить аудиторию', N'26.10.2020', N'26.10.2020', 4, 3)
GO
SET IDENTITY_INSERT dbo.Tasks OFF
GO
-- 
-- Вывод данных для таблицы Territory_Аudiences
--
PRINT (N'Вывод данных для таблицы Territory_Аudiences')
SET IDENTITY_INSERT dbo.Territory_Аudiences ON
GO
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (6, '322', '1243', '7211', '105', '123', 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (7, '329', '7201', '3922', '574', '501', 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (8, '320', '1321', '5033', '776', '752', 1, 1, 1)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (10, '300', '1321', '5033', '776', '752', 1, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (11, '321', '1321', '5033', '776', '752', 2, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (12, '323', '1321', '5033', '776', '752', 2, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (14, '100', NULL, NULL, NULL, NULL, 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (18, '100', NULL, NULL, NULL, NULL, 1, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (19, '101', NULL, NULL, NULL, NULL, 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (20, '101', NULL, NULL, NULL, NULL, 1, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (21, '200', NULL, NULL, NULL, NULL, 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (22, '200', NULL, NULL, NULL, NULL, 1, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (23, '201', NULL, NULL, NULL, NULL, 1, 1, 3)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (24, '201', NULL, NULL, NULL, NULL, 1, 2, 4)
INSERT dbo.Territory_Аudiences(ID_Territory_Аudiences, Number_Cabinet, Position_X, Position_Y, Width, Height, Color_ID, Traning_Area_ID, View_ID) VALUES (25, '333', NULL, NULL, NULL, NULL, 1, 1, 3)
GO
SET IDENTITY_INSERT dbo.Territory_Аudiences OFF
GO
-- 
-- Вывод данных для таблицы Traning_Area
--
PRINT (N'Вывод данных для таблицы Traning_Area')
SET IDENTITY_INSERT dbo.Traning_Area ON
GO
INSERT dbo.Traning_Area(ID_Training_Area, Full_Name, Abbreviated_Name) VALUES (1, 'Нахимовский проспект', 'Нахим')
INSERT dbo.Traning_Area(ID_Training_Area, Full_Name, Abbreviated_Name) VALUES (2, 'Нежинская улица', 'Нежка')
GO
SET IDENTITY_INSERT dbo.Traning_Area OFF
GO
-- 
-- Вывод данных для таблицы Type_Comments
--
PRINT (N'Вывод данных для таблицы Type_Comments')
SET IDENTITY_INSERT dbo.Type_Comments ON
GO
INSERT dbo.Type_Comments(Id_Type_Comment, Name_comment) VALUES (1, N'Положительный')
INSERT dbo.Type_Comments(Id_Type_Comment, Name_comment) VALUES (2, N'Отрицательный')
GO
SET IDENTITY_INSERT dbo.Type_Comments OFF
GO
-- 
-- Вывод данных для таблицы Type_Of_Educational_Unit
--
PRINT (N'Вывод данных для таблицы Type_Of_Educational_Unit')
SET IDENTITY_INSERT dbo.Type_Of_Educational_Unit ON
GO
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (1, 'Вид 1')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (2, 'Вид 2')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (3, 'Вид 3')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (19, 'Среднее общее образование')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (20, 'Базовые дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (21, 'Профильные дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (22, 'Предлагаемые ОО')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (23, 'ПРОФЕССИОНАЛЬНАЯ ПОДГОТОВКА')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (24, 'Общий гуманитарный и социально-экономический учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (25, 'Математический и общий естественнонаучный учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (26, 'Общепрофессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (27, 'Профессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (28, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (29, 'Осуществление интеграции программных модулей')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (30, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (31, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (32, 'Разработка, администрирование и защита баз данных')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (33, 'Среднее общее образование')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (34, 'Базовые дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (35, 'Профильные дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (36, 'Предлагаемые ОО')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (37, 'ПРОФЕССИОНАЛЬНАЯ ПОДГОТОВКА')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (38, 'Общий гуманитарный и социально-экономический учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (39, 'Математический и общий естественнонаучный учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (40, 'Общепрофессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (41, 'Профессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (42, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (43, 'Осуществление интеграции программных модулей')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (44, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (45, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (46, 'Разработка, администрирование и защита баз данных')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (47, 'Среднее общее образование')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (48, 'Базовые дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (49, 'Профильные дисциплины')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (50, 'Предлагаемые ОО')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (51, 'ПРОФЕССИОНАЛЬНАЯ ПОДГОТОВКА')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (52, 'Общий гуманитарный и социально-экономический учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (53, 'Математический и общий естественнонаучный учебный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (54, 'Общепрофессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (55, 'Профессиональный цикл')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (56, 'Разработка модулей программного обеспечения для компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (57, 'Осуществление интеграции программных модулей')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (58, 'Сопровождение и обслуживание программного обеспечения компьютерных систем')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (59, 'Соадминистрирование баз данных и серверов')
INSERT dbo.Type_Of_Educational_Unit(ID_Type_Of_Educational_Unit, Number_Of_Type) VALUES (60, 'Разработка, администрирование и защита баз данных')
GO
SET IDENTITY_INSERT dbo.Type_Of_Educational_Unit OFF
GO
-- 
-- Вывод данных для таблицы View_Cabinet
--
PRINT (N'Вывод данных для таблицы View_Cabinet')
SET IDENTITY_INSERT dbo.View_Cabinet ON
GO
INSERT dbo.View_Cabinet(ID_View, Name_View_Cabinet) VALUES (1, 'Лаборатория')
INSERT dbo.View_Cabinet(ID_View, Name_View_Cabinet) VALUES (3, 'Нахимовский')
INSERT dbo.View_Cabinet(ID_View, Name_View_Cabinet) VALUES (4, 'Неженская')
GO
SET IDENTITY_INSERT dbo.View_Cabinet OFF
GO
-- 
-- Вывод данных для таблицы View_Provision
--
PRINT (N'Вывод данных для таблицы View_Provision')
SET IDENTITY_INSERT dbo.View_Provision ON
GO
INSERT dbo.View_Provision(ID_View_Provision, Name_View_Provision) VALUES (2, 'Аппаратное обеспечение')
INSERT dbo.View_Provision(ID_View_Provision, Name_View_Provision) VALUES (3, 'Переферийное устройство')
INSERT dbo.View_Provision(ID_View_Provision, Name_View_Provision) VALUES (1, 'Программное обеспечение')
GO
SET IDENTITY_INSERT dbo.View_Provision OFF
GO

USE testBDD
GO

IF DB_NAME() <> N'testBDD' SET NOEXEC ON
GO

--
-- Создать внешний ключ [FK_Color1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]
--
PRINT (N'Создать внешний ключ [FK_Color1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]')
GO
ALTER TABLE dbo.Territory_Аudiences
  ADD CONSTRAINT FK_Color1_ID FOREIGN KEY (Color_ID) REFERENCES dbo.Color (ID_Color)
GO

--
-- Создать внешний ключ [FK_Training_Area1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]
--
PRINT (N'Создать внешний ключ [FK_Training_Area1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]')
GO
ALTER TABLE dbo.Territory_Аudiences
  ADD CONSTRAINT FK_Training_Area1_ID FOREIGN KEY (Traning_Area_ID) REFERENCES dbo.Traning_Area (ID_Training_Area)
GO

--
-- Создать внешний ключ [FK_View1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]
--
PRINT (N'Создать внешний ключ [FK_View1_ID] для объекта типа таблица [dbo].[Territory_Аudiences]')
GO
ALTER TABLE dbo.Territory_Аudiences
  ADD CONSTRAINT FK_View1_ID FOREIGN KEY (View_ID) REFERENCES dbo.View_Cabinet (ID_View)
GO

--
-- Создать внешний ключ [FK_Tasks_Statuss_StatusId_Status] для объекта типа таблица [dbo].[Tasks]
--
PRINT (N'Создать внешний ключ [FK_Tasks_Statuss_StatusId_Status] для объекта типа таблица [dbo].[Tasks]')
GO
ALTER TABLE dbo.Tasks
  ADD CONSTRAINT FK_Tasks_Statuss_StatusId_Status FOREIGN KEY (StatusId_Status) REFERENCES dbo.Statuss (Id_Status)
GO

--
-- Создать внешний ключ [FK_Tasks_Tasks_TasksId_Task] для объекта типа таблица [dbo].[Tasks]
--
PRINT (N'Создать внешний ключ [FK_Tasks_Tasks_TasksId_Task] для объекта типа таблица [dbo].[Tasks]')
GO
ALTER TABLE dbo.Tasks
  ADD CONSTRAINT FK_Tasks_Tasks_TasksId_Task FOREIGN KEY (TasksId_Task) REFERENCES dbo.Tasks (Id_Task)
GO

--
-- Создать внешний ключ [FK_Color_ID] для объекта типа таблица [dbo].[Form]
--
PRINT (N'Создать внешний ключ [FK_Color_ID] для объекта типа таблица [dbo].[Form]')
GO
ALTER TABLE dbo.Form
  ADD CONSTRAINT FK_Color_ID FOREIGN KEY (Color_ID) REFERENCES dbo.Color (ID_Color)
GO

--
-- Создать внешний ключ [FK_Specialty_RUP] для объекта типа таблица [dbo].[RUP]
--
PRINT (N'Создать внешний ключ [FK_Specialty_RUP] для объекта типа таблица [dbo].[RUP]')
GO
ALTER TABLE dbo.RUP
  ADD CONSTRAINT FK_Specialty_RUP FOREIGN KEY (Specialty_RUP_ID) REFERENCES dbo.Specialty (ID_Specialty)
GO

--
-- Создать внешний ключ [FK_CMK] для объекта типа таблица [dbo].[CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_CMK] для объекта типа таблица [dbo].[CMK_RUP]')
GO
ALTER TABLE dbo.CMK_RUP
  ADD CONSTRAINT FK_CMK FOREIGN KEY (CMK_ID) REFERENCES dbo.CMK (ID_CMK)
GO

--
-- Создать внешний ключ [FK_RUP] для объекта типа таблица [dbo].[CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_RUP] для объекта типа таблица [dbo].[CMK_RUP]')
GO
ALTER TABLE dbo.CMK_RUP
  ADD CONSTRAINT FK_RUP FOREIGN KEY (RUP_ID) REFERENCES dbo.RUP (ID_RUP)
GO

--
-- Создать внешний ключ [FK_CMK_RUP] для объекта типа таблица [dbo].[EU_CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_CMK_RUP] для объекта типа таблица [dbo].[EU_CMK_RUP]')
GO
ALTER TABLE dbo.EU_CMK_RUP
  ADD CONSTRAINT FK_CMK_RUP FOREIGN KEY (CMK_RUP_ID) REFERENCES dbo.CMK_RUP (ID_CMK_RUP)
GO

--
-- Создать внешний ключ [FK_Educational_Unit] для объекта типа таблица [dbo].[EU_CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_Educational_Unit] для объекта типа таблица [dbo].[EU_CMK_RUP]')
GO
ALTER TABLE dbo.EU_CMK_RUP
  ADD CONSTRAINT FK_Educational_Unit FOREIGN KEY (Educational_Unit_ID) REFERENCES dbo.Educational_Unit (ID_Educational_Unit)
GO

--
-- Создать внешний ключ [FK_EU_CMK_RUP] для объекта типа таблица [dbo].[EU_CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_EU_CMK_RUP] для объекта типа таблица [dbo].[EU_CMK_RUP]')
GO
ALTER TABLE dbo.EU_CMK_RUP
  ADD CONSTRAINT FK_EU_CMK_RUP FOREIGN KEY (EU_CMK_RUP_ID) REFERENCES dbo.EU_CMK_RUP (ID_EU_CMK_RUP)
GO

--
-- Создать внешний ключ [FK_Type_Of_Educational_Unit] для объекта типа таблица [dbo].[EU_CMK_RUP]
--
PRINT (N'Создать внешний ключ [FK_Type_Of_Educational_Unit] для объекта типа таблица [dbo].[EU_CMK_RUP]')
GO
ALTER TABLE dbo.EU_CMK_RUP
  ADD CONSTRAINT FK_Type_Of_Educational_Unit FOREIGN KEY (Type_Of_Educational_Unit_ID) REFERENCES dbo.Type_Of_Educational_Unit (ID_Type_Of_Educational_Unit)
GO

--
-- Создать внешний ключ [FK_Document_Template] для объекта типа таблица [dbo].[Documents_EU]
--
PRINT (N'Создать внешний ключ [FK_Document_Template] для объекта типа таблица [dbo].[Documents_EU]')
GO
ALTER TABLE dbo.Documents_EU
  ADD CONSTRAINT FK_Document_Template FOREIGN KEY (Document_Template_ID) REFERENCES dbo.Document_Template (ID_Document_Template)
GO

--
-- Создать внешний ключ [FK_EU_CMK_RUP1] для объекта типа таблица [dbo].[Documents_EU]
--
PRINT (N'Создать внешний ключ [FK_EU_CMK_RUP1] для объекта типа таблица [dbo].[Documents_EU]')
GO
ALTER TABLE dbo.Documents_EU
  ADD CONSTRAINT FK_EU_CMK_RUP1 FOREIGN KEY (EU_CMK_RUP_ID) REFERENCES dbo.EU_CMK_RUP (ID_EU_CMK_RUP)
GO

--
-- Создать внешний ключ [FK_EU_CMK_RUP_Form_Of_Control_EU] для объекта типа таблица [dbo].[Form_Of_Control_EU]
--
PRINT (N'Создать внешний ключ [FK_EU_CMK_RUP_Form_Of_Control_EU] для объекта типа таблица [dbo].[Form_Of_Control_EU]')
GO
ALTER TABLE dbo.Form_Of_Control_EU
  ADD CONSTRAINT FK_EU_CMK_RUP_Form_Of_Control_EU FOREIGN KEY (EU_CMK_RUP_Form_ID) REFERENCES dbo.EU_CMK_RUP (ID_EU_CMK_RUP)
GO

--
-- Создать внешний ключ [FK_Form_Of_Control] для объекта типа таблица [dbo].[Form_Of_Control_EU]
--
PRINT (N'Создать внешний ключ [FK_Form_Of_Control] для объекта типа таблица [dbo].[Form_Of_Control_EU]')
GO
ALTER TABLE dbo.Form_Of_Control_EU
  ADD CONSTRAINT FK_Form_Of_Control FOREIGN KEY (Form_Of_Control_ID) REFERENCES dbo.Form_Of_Control (ID_Form_Of_Control)
GO

--
-- Создать внешний ключ [FK_Kind_criteria_criteria] для объекта типа таблица [dbo].[Criteria]
--
PRINT (N'Создать внешний ключ [FK_Kind_criteria_criteria] для объекта типа таблица [dbo].[Criteria]')
GO
ALTER TABLE dbo.Criteria
  ADD CONSTRAINT FK_Kind_criteria_criteria FOREIGN KEY (kind_criteria_ID) REFERENCES dbo.Kind_criteria (ID_Kind_criteria)
GO

--
-- Создать внешний ключ [FK_View_Provision_ID] для объекта типа таблица [dbo].[Characteristic]
--
PRINT (N'Создать внешний ключ [FK_View_Provision_ID] для объекта типа таблица [dbo].[Characteristic]')
GO
ALTER TABLE dbo.Characteristic
  ADD CONSTRAINT FK_View_Provision_ID FOREIGN KEY (View_Provisions_ID) REFERENCES dbo.View_Provision (ID_View_Provision)
GO

--
-- Создать внешний ключ [FK_Characteristic_ID] для объекта типа таблица [dbo].[Characteristic_MO]
--
PRINT (N'Создать внешний ключ [FK_Characteristic_ID] для объекта типа таблица [dbo].[Characteristic_MO]')
GO
ALTER TABLE dbo.Characteristic_MO
  ADD CONSTRAINT FK_Characteristic_ID FOREIGN KEY (Characteristic_ID) REFERENCES dbo.Characteristic (ID_Characteristic)
GO

--
-- Создать внешний ключ [FK_Form_ID] для объекта типа таблица [dbo].[Characteristic_MO]
--
PRINT (N'Создать внешний ключ [FK_Form_ID] для объекта типа таблица [dbo].[Characteristic_MO]')
GO
ALTER TABLE dbo.Characteristic_MO
  ADD CONSTRAINT FK_Form_ID FOREIGN KEY (Form_ID) REFERENCES dbo.Form (ID_Form)
GO

--
-- Создать внешний ключ [FK_Material_Provisions_ID] для объекта типа таблица [dbo].[Characteristic_MO]
--
PRINT (N'Создать внешний ключ [FK_Material_Provisions_ID] для объекта типа таблица [dbo].[Characteristic_MO]')
GO
ALTER TABLE dbo.Characteristic_MO
  ADD CONSTRAINT FK_Material_Provisions_ID FOREIGN KEY (Material_Provisions_ID) REFERENCES dbo.Material_Provision (ID_Material_Provision)
GO

--
-- Создать внешний ключ [FK_Characteristic_MO_ID] для объекта типа таблица [dbo].[MTOK]
--
PRINT (N'Создать внешний ключ [FK_Characteristic_MO_ID] для объекта типа таблица [dbo].[MTOK]')
GO
ALTER TABLE dbo.MTOK WITH NOCHECK
  ADD CONSTRAINT FK_Characteristic_MO_ID FOREIGN KEY (Characteristic_MO_ID) REFERENCES dbo.Characteristic_MO (ID_Characteristic_MO)
GO

--
-- Создать внешний ключ [FK_MTOK_ID] для объекта типа таблица [dbo].[MTOK]
--
PRINT (N'Создать внешний ключ [FK_MTOK_ID] для объекта типа таблица [dbo].[MTOK]')
GO
ALTER TABLE dbo.MTOK
  ADD CONSTRAINT FK_MTOK_ID FOREIGN KEY (MTOK_ID) REFERENCES dbo.MTOK (ID_MTOK)
GO

--
-- Создать внешний ключ [FK_Territory_Аudiences_ID] для объекта типа таблица [dbo].[MTOK]
--
PRINT (N'Создать внешний ключ [FK_Territory_Аudiences_ID] для объекта типа таблица [dbo].[MTOK]')
GO
ALTER TABLE dbo.MTOK
  ADD CONSTRAINT FK_Territory_Аudiences_ID FOREIGN KEY (Territory_Аudiences_ID) REFERENCES dbo.Territory_Аudiences (ID_Territory_Аudiences)
GO

--
-- Создать внешний ключ [FK_Quality_control_criteria] для объекта типа таблица [dbo].[Quality_control]
--
PRINT (N'Создать внешний ключ [FK_Quality_control_criteria] для объекта типа таблица [dbo].[Quality_control]')
GO
ALTER TABLE dbo.Quality_control
  ADD CONSTRAINT FK_Quality_control_criteria FOREIGN KEY (criteria_ID) REFERENCES dbo.Criteria (ID_criteria)
GO

--
-- Создать внешний ключ [FK_Quality_control_MTOK] для объекта типа таблица [dbo].[Quality_control]
--
PRINT (N'Создать внешний ключ [FK_Quality_control_MTOK] для объекта типа таблица [dbo].[Quality_control]')
GO
ALTER TABLE dbo.Quality_control
  ADD CONSTRAINT FK_Quality_control_MTOK FOREIGN KEY (MTOK_ID) REFERENCES dbo.MTOK (ID_MTOK)
GO

--
-- Создать внешний ключ [FK_Plurality_Employees_EmployeeId_Employee] для объекта типа таблица [dbo].[Plurality]
--
PRINT (N'Создать внешний ключ [FK_Plurality_Employees_EmployeeId_Employee] для объекта типа таблица [dbo].[Plurality]')
GO
ALTER TABLE dbo.Plurality
  ADD CONSTRAINT FK_Plurality_Employees_EmployeeId_Employee FOREIGN KEY (EmployeeId_Employee) REFERENCES dbo.Employees (Id_Employee)
GO

--
-- Создать внешний ключ [FK_Plurality_Positions_PositionId_Position] для объекта типа таблица [dbo].[Plurality]
--
PRINT (N'Создать внешний ключ [FK_Plurality_Positions_PositionId_Position] для объекта типа таблица [dbo].[Plurality]')
GO
ALTER TABLE dbo.Plurality
  ADD CONSTRAINT FK_Plurality_Positions_PositionId_Position FOREIGN KEY (PositionId_Position) REFERENCES dbo.Positions (Id_Position)
GO

--
-- Создать внешний ключ [FK_Task_Distributions_Plurality_PluralityId_Plurality] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать внешний ключ [FK_Task_Distributions_Plurality_PluralityId_Plurality] для объекта типа таблица [dbo].[Task_Distributions]')
GO
ALTER TABLE dbo.Task_Distributions
  ADD CONSTRAINT FK_Task_Distributions_Plurality_PluralityId_Plurality FOREIGN KEY (PluralityId_Plurality) REFERENCES dbo.Plurality (Id_Plurality)
GO

--
-- Создать внешний ключ [FK_Task_Distributions_Statuss_StatusId_Status] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать внешний ключ [FK_Task_Distributions_Statuss_StatusId_Status] для объекта типа таблица [dbo].[Task_Distributions]')
GO
ALTER TABLE dbo.Task_Distributions
  ADD CONSTRAINT FK_Task_Distributions_Statuss_StatusId_Status FOREIGN KEY (StatusId_Status) REFERENCES dbo.Statuss (Id_Status)
GO

--
-- Создать внешний ключ [FK_Task_Distributions_Tasks_TaskId_Task] для объекта типа таблица [dbo].[Task_Distributions]
--
PRINT (N'Создать внешний ключ [FK_Task_Distributions_Tasks_TaskId_Task] для объекта типа таблица [dbo].[Task_Distributions]')
GO
ALTER TABLE dbo.Task_Distributions
  ADD CONSTRAINT FK_Task_Distributions_Tasks_TaskId_Task FOREIGN KEY (TaskId_Task) REFERENCES dbo.Tasks (Id_Task)
GO

--
-- Создать внешний ключ [FK_File_Tasks_Task_Distributions_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[File_Tasks]
--
PRINT (N'Создать внешний ключ [FK_File_Tasks_Task_Distributions_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[File_Tasks]')
GO
ALTER TABLE dbo.File_Tasks
  ADD CONSTRAINT FK_File_Tasks_Task_Distributions_Task_DistributionsId_Task_Distribution FOREIGN KEY (Task_DistributionsId_Task_Distribution) REFERENCES dbo.Task_Distributions (Id_Task_Distribution)
GO

--
-- Создать внешний ключ [FK_Task_Comments_Task_Distributions_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[Task_Comments]
--
PRINT (N'Создать внешний ключ [FK_Task_Comments_Task_Distributions_Task_DistributionsId_Task_Distribution] для объекта типа таблица [dbo].[Task_Comments]')
GO
ALTER TABLE dbo.Task_Comments
  ADD CONSTRAINT FK_Task_Comments_Task_Distributions_Task_DistributionsId_Task_Distribution FOREIGN KEY (Task_DistributionsId_Task_Distribution) REFERENCES dbo.Task_Distributions (Id_Task_Distribution)
GO

--
-- Создать внешний ключ [FK_Task_Comments_Type_Comments_Type_CommentsId_Type_Comment] для объекта типа таблица [dbo].[Task_Comments]
--
PRINT (N'Создать внешний ключ [FK_Task_Comments_Type_Comments_Type_CommentsId_Type_Comment] для объекта типа таблица [dbo].[Task_Comments]')
GO
ALTER TABLE dbo.Task_Comments
  ADD CONSTRAINT FK_Task_Comments_Type_Comments_Type_CommentsId_Type_Comment FOREIGN KEY (Type_CommentsId_Type_Comment) REFERENCES dbo.Type_Comments (Id_Type_Comment)
GO

--
-- Создать внешний ключ [FK_CMK_Distribution] для объекта типа таблица [dbo].[Distribution_CMK]
--
PRINT (N'Создать внешний ключ [FK_CMK_Distribution] для объекта типа таблица [dbo].[Distribution_CMK]')
GO
ALTER TABLE dbo.Distribution_CMK
  ADD CONSTRAINT FK_CMK_Distribution FOREIGN KEY (CMK_Distribution_ID) REFERENCES dbo.CMK (ID_CMK)
GO

--
-- Создать внешний ключ [FK_Plurality_Distribution] для объекта типа таблица [dbo].[Distribution_CMK]
--
PRINT (N'Создать внешний ключ [FK_Plurality_Distribution] для объекта типа таблица [dbo].[Distribution_CMK]')
GO
ALTER TABLE dbo.Distribution_CMK
  ADD CONSTRAINT FK_Plurality_Distribution FOREIGN KEY (Plurality_Distribution_ID) REFERENCES dbo.Plurality (Id_Plurality)
GO

--
-- Создать внешний ключ [FK_Role_In_CMK] для объекта типа таблица [dbo].[Distribution_CMK]
--
PRINT (N'Создать внешний ключ [FK_Role_In_CMK] для объекта типа таблица [dbo].[Distribution_CMK]')
GO
ALTER TABLE dbo.Distribution_CMK
  ADD CONSTRAINT FK_Role_In_CMK FOREIGN KEY (Role_In_CMK_ID) REFERENCES dbo.Role_In_CMK (ID_Role_In_CMK)
GO

--
-- Создать внешний ключ [FK_Distribution] для объекта типа таблица [dbo].[NLP]
--
PRINT (N'Создать внешний ключ [FK_Distribution] для объекта типа таблица [dbo].[NLP]')
GO
ALTER TABLE dbo.NLP
  ADD CONSTRAINT FK_Distribution FOREIGN KEY (Distribution_ID) REFERENCES dbo.Distribution_CMK (ID_Distribution)
GO

--
-- Создать внешний ключ [FK_Form_Of_Control_EU] для объекта типа таблица [dbo].[NLP]
--
PRINT (N'Создать внешний ключ [FK_Form_Of_Control_EU] для объекта типа таблица [dbo].[NLP]')
GO
ALTER TABLE dbo.NLP
  ADD CONSTRAINT FK_Form_Of_Control_EU FOREIGN KEY (Form_Of_Control_EU_ID) REFERENCES dbo.Form_Of_Control_EU (ID_Form_Of_Control_EU)
GO

--
-- Создать внешний ключ [FK_Group] для объекта типа таблица [dbo].[NLP]
--
PRINT (N'Создать внешний ключ [FK_Group] для объекта типа таблица [dbo].[NLP]')
GO
ALTER TABLE dbo.NLP
  ADD CONSTRAINT FK_Group FOREIGN KEY (Group_ID) REFERENCES dbo.GGroup (ID_Group)
GO

--
-- Создать внешний ключ [FK_NLP_ID] для объекта типа таблица [dbo].[Distribution]
--
PRINT (N'Создать внешний ключ [FK_NLP_ID] для объекта типа таблица [dbo].[Distribution]')
GO
ALTER TABLE dbo.Distribution
  ADD CONSTRAINT FK_NLP_ID FOREIGN KEY (NLP_ID) REFERENCES dbo.NLP (ID_NLP)
GO

--
-- Создать внешний ключ [FK_Territory_Аudiencess_ID] для объекта типа таблица [dbo].[Distribution]
--
PRINT (N'Создать внешний ключ [FK_Territory_Аudiencess_ID] для объекта типа таблица [dbo].[Distribution]')
GO
ALTER TABLE dbo.Distribution
  ADD CONSTRAINT FK_Territory_Аudiencess_ID FOREIGN KEY (Territory_Аudiences_ID) REFERENCES dbo.Territory_Аudiences (ID_Territory_Аudiences)
GO

--
-- Создать внешний ключ [FK_Rightss_Functions_FunctionId_Function] для объекта типа таблица [dbo].[Rightss]
--
PRINT (N'Создать внешний ключ [FK_Rightss_Functions_FunctionId_Function] для объекта типа таблица [dbo].[Rightss]')
GO
ALTER TABLE dbo.Rightss
  ADD CONSTRAINT FK_Rightss_Functions_FunctionId_Function FOREIGN KEY (FunctionId_Function) REFERENCES dbo.Functions (Id_Function)
GO

--
-- Создать внешний ключ [FK_Rightss_Roles_RoleId_Role] для объекта типа таблица [dbo].[Rightss]
--
PRINT (N'Создать внешний ключ [FK_Rightss_Roles_RoleId_Role] для объекта типа таблица [dbo].[Rightss]')
GO
ALTER TABLE dbo.Rightss
  ADD CONSTRAINT FK_Rightss_Roles_RoleId_Role FOREIGN KEY (RoleId_Role) REFERENCES dbo.Roles (Id_Role)
GO

--
-- Создать внешний ключ [FK_Accounts_Plurality_PluralityId_Plurality] для объекта типа таблица [dbo].[Accounts]
--
PRINT (N'Создать внешний ключ [FK_Accounts_Plurality_PluralityId_Plurality] для объекта типа таблица [dbo].[Accounts]')
GO
ALTER TABLE dbo.Accounts
  ADD CONSTRAINT FK_Accounts_Plurality_PluralityId_Plurality FOREIGN KEY (PluralityId_Plurality) REFERENCES dbo.Plurality (Id_Plurality)
GO

--
-- Создать внешний ключ [FK_Accounts_Rightss_RightsId_Rights] для объекта типа таблица [dbo].[Accounts]
--
PRINT (N'Создать внешний ключ [FK_Accounts_Rightss_RightsId_Rights] для объекта типа таблица [dbo].[Accounts]')
GO
ALTER TABLE dbo.Accounts
  ADD CONSTRAINT FK_Accounts_Rightss_RightsId_Rights FOREIGN KEY (RightsId_Rights) REFERENCES dbo.Rightss (Id_Rights)
GO
SET NOEXEC OFF
GO