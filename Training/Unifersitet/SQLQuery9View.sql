
use [InstityTT]
go

create view [dbo].[Student_WCR]
("Имя студента","Название ВКР")
as
	select [Name_Student],[Name_WRC]
	from [dbo].[Student] 
	inner join [dbo].[WRC_List] on [dbo].[Student].[ID_Student] = [dbo].[WRC_List].[ID_WRC_List]
go
--select*from [dbo].[Student_WCR]

create view [dbo].[Student_Classes_Attendance]
("Имя студента","Занятие","Время проверки","Дата проверки")
as
	select [Name_Student],[Name_Classes],[Time_Attendance],[Date_Attendance]
	from [dbo].[Student] 
	inner join [dbo].[Classes] on [dbo].[Student].[ID_Student] = [dbo].[Classes].[ID_Classes] 
	inner join [dbo].[Attendance_Check] on [dbo].[Student].[ID_Student] = [dbo].[Attendance_Check].[ID_Attendance_Check]
go
--select*from [dbo].[Student_Classes_Attendance]

create view [dbo].[Staff_Profile]
("Название профиля", "Фамилия сотрудника")
as 
	select [Name_Profile],[Surname_Staff]
	from [dbo].[Profile]
	inner join [dbo].[Staff] on [dbo].[Profile].[ID_Profile] = [dbo].[Staff].[ID_Staff]
go

--select*from [dbo].[Staff_Profile]

create view [dbo].[Role_Profile]
("Название роли","Название профиля")
as 
	select [Name_Role],[Name_Profile]
	from [dbo].[Profile]
	inner join [dbo].[Role] on [dbo].[Profile].[ID_Profile] = [dbo].[Role].[ID_Rolle]
go

--select * from [dbo].[Role_Profile]