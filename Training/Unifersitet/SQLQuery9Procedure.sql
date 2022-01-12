set ansi_padding on
set quoted_identifier on
set ansi_nulls on
go

use [InstityTT]
go

create procedure [dbo].[Position_insert]
@Name_Position [varchar] (30)
as
	insert into [dbo].[Position] ([Name_Position])
	values (@Name_Position)
go

create procedure [dbo].[Position_update]
@ID_Position [int], @Name_Position [varchar] (30)
as
	update [dbo].[Position] set
	[Name_Position] = @Name_Position
	where
		[ID_Position] = @ID_Position

go

create procedure [dbo].[Position_delete]
@ID_Position [int]
as
	delete from [dbo].[Position]
	where
		[ID_Position] = @ID_Position
go

---------------Специальность
create procedure [dbo].[Speciality_Insert]
@Name_Speciality [varchar] (30)
as
	insert into [dbo].[Speciality] ([Name_Speciality])
	values (@Name_Speciality)
go

create procedure [dbo].[Speciality_Update]
@ID_Speciality [int], @Name_Speciality [varchar] (30)
as
	update [dbo].[Speciality] set
	[Name_Speciality] = @Name_Speciality
	where
		[ID_Speciality] = @ID_Speciality

go

create procedure [dbo].[Speciality_delete]
@ID_Speciality [int]
as
	delete from [dbo].[Speciality]
	where
		[ID_Speciality] = @ID_Speciality
go

---------------Абитуриент
create procedure [dbo].[Enrolle_Insert]
@Surname_Enrolle [varchar] (50),@Name_Enrolle [varchar] (50),@Middlename_Enrolle [varchar] (50),
@Certification_Number [varchar] (12),@Series_Passport [varchar] (5),@Number_Passport [varchar] (7)
as
	insert into [dbo].[Enrolle] ([Surname_Enrolle],[Name_Enrolle], [Middlename_Enrolle],
	 [Certification_Number], [Series_Passport],[Number_Passport])

	values (@Surname_Enrolle,@Name_Enrolle,@Middlename_Enrolle,@Certification_Number,@Series_Passport,@Number_Passport)
go 

create procedure [dbo].[Enrolle_Update]
@ID_Enrolle [int], @Surname_Enrolle [varchar] (50),@Name_Enrolle [varchar] (50),@Middlename_Enrolle [varchar] (50),
@Certification_Number [varchar] (12),@Series_Passport [varchar] (5),@Number_Passport [varchar] (7)
as
	update [dbo].[Enrolle] set
	[Surname_Enrolle] = @Surname_Enrolle,
	[Name_Enrolle] = @Name_Enrolle,
	[Middlename_Enrolle] = @Middlename_Enrolle,
	[Certification_Number] = @Certification_Number,
	[Series_Passport] = @Series_Passport,
	[Number_Passport] = @Number_Passport
	where
		[ID_Enrolle] = @ID_Enrolle

go

create procedure [dbo].[Enrolle_delete]
@ID_Enrolle [int]
as
	delete from [dbo].[Enrolle]
	where
		[ID_Enrolle] = @ID_Enrolle
go

-----------роли
create procedure [dbo].[Role_Insert]
@Name_Role [varchar] (50),@Access [varchar] (2)
as
	insert into [dbo].[Role] ([Name_Role],[Access])

	values (@Name_Role, @Access)
go

create procedure [dbo].[Role_Update]
@ID_Rolle [int], @Name_Role [varchar] (50),@Access [varchar] (2)
as
	update [dbo].[Role] set
	[Name_Role] = @Name_Role,
	[Access] = @Access
	where
		[ID_Rolle] = @ID_Rolle

go

create procedure [dbo].[Role_delete]
@ID_Rolle [int]
as
	delete from [dbo].[Role]
	where
		[ID_Rolle] = @ID_Rolle
go

--------------Список ВКР
create procedure [dbo].[WRC_List_Insert]
@Name_WRC [varchar] (50)
as
	insert into [dbo].[WRC_List] ([Name_WRC])
	values (@Name_WRC)
go

create procedure [dbo].[WRC_List_Update]
@ID_WRC_List [int], @Name_WRC [varchar] (50)
as
	update [dbo].[WRC_List] set
	[Name_WRC] = @Name_WRC
	where
		[ID_WRC_List] = @ID_WRC_List

go

create procedure [dbo].[WRC_List_delete]
@ID_WRC_List [int]
as
	delete from [dbo].[WRC_List]
	where
		[ID_WRC_List] = @ID_WRC_List
go

-------------------------Авторизация--------------------
create procedure [dbo].[Authorization_Insert]
@Login [varchar] (20),@Password [varchar] (25),@Rolle_ID [int]
as
	insert into [dbo].[Aiuthorization] ([Login],[Password],[Rolle_ID])
	values (@Login,@Password,@Rolle_ID)
go

--create procedure [dbo].[Authorization_Update]
--@ID_WRC_List [int], @Name_WRC [varchar] (50)
--as
--	update [dbo].[WRC_List] set
--	[Name_WRC] = @Name_WRC
--	where
--		[ID_WRC_List] = @ID_WRC_List

--go

create procedure [dbo].[Authorization_delete]
@ID_Aiuthorization [int]
as
	delete from [dbo].[Aiuthorization]
	where
		[ID_Aiuthorization] = @ID_Aiuthorization
go
-------------Авторизация-----------------


----------Профиль
create procedure [dbo].[Profile_Insert]
@Name_Profile [varchar] (50), @Aiuthorization_ID [int] , @Staff_ID [int] , @Student_ID [int]
as
	insert into [dbo].[Profile] ([Name_Profile],[Aiuthorization_ID], [Staff_ID],[Student_ID])
	values (@Name_Profile,@Aiuthorization_ID, @Staff_ID,@Student_ID)
go

create procedure [dbo].[Profile_Update]
@ID_Profile [int],@Name_Profile [varchar] (50), @Aiuthorization_ID [int] , @Staff_ID [int] , @Student_ID [int]
as
	update [dbo].[Profile] set
	[Name_Profile] = @Name_Profile,
	[Aiuthorization_ID] = @Aiuthorization_ID,
	[Staff_ID] = @Staff_ID,
	[Student_ID] = @Student_ID
	where
		[ID_Profile] = @ID_Profile

go

create procedure [dbo].[Profile_Delete]
@ID_Profile [int]
as
	delete from [dbo].[Profile]
	where
		[ID_Profile] = @ID_Profile
go

-----------------Студент
create procedure [dbo].[Student_Insert]
@Surname_Student [varchar] (50),@Name_Student [varchar] (50),@Middlename_Student [varchar] (50),
@Enrolle_ID [int] , @Speciality_ID [int]
as
	insert into [dbo].[Student] ([Surname_Student],[Name_Student], [Middlename_Student],
	 [Enrolle_ID], [Speciality_ID])

	values (@Surname_Student,@Name_Student,@Middlename_Student,@Enrolle_ID,@Speciality_ID)
go 

create procedure [dbo].[Student_Update]
@ID_Student [int], @Surname_Student [varchar] (50),@Name_Student [varchar] (50),@Middlename_Student [varchar] (50),
@Enrolle_ID [int] , @Speciality_ID [int]
as	update [dbo].[Student] set
	[Surname_Student] = @Surname_Student,
	[Name_Student] = @Name_Student,
	[Middlename_Student] = @Middlename_Student,
	[Enrolle_ID] = @Enrolle_ID,
	[Speciality_ID] = @Speciality_ID
	where
		[ID_Student] = @ID_Student

go

create procedure [dbo].[Student_delete]
@ID_Student [int]
as
	delete from [dbo].[Student]
	where
		[ID_Student] = @ID_Student
go

-----------------Сотрудники
create procedure [dbo].[Staff_Insert]
@Surname_Staff [varchar] (50),@Name_Staff [varchar] (50),@Middlename_Staff [varchar] (50),
@Position_ID [int]
as
	insert into [dbo].[Staff] ([Surname_Staff],[Name_Staff], [Middlename_Staff],
	 [Position_ID])

	values (@Surname_Staff,@Name_Staff,@Middlename_Staff,@Position_ID)
go 

create procedure [dbo].[Staff_Update]
@ID_Staff [int], @Surname_Staff [varchar] (50),@Name_Staff [varchar] (50),@Middlename_Staff [varchar] (50),
@Position_ID [int]
as	update [dbo].[Staff] set
	[Surname_Staff] = @Surname_Staff,
	[Name_Staff] = @Name_Staff,
	[Middlename_Staff] = @Middlename_Staff,
	[Position_ID] = @Position_ID
	where
		[ID_Staff] = @ID_Staff

go

create procedure [dbo].[Staff_delete]
@ID_Staff [int]
as
	delete from [dbo].[Staff]
	where
		[ID_Staff] = @ID_Staff
go

----------Группы
create procedure [dbo].[Group_Insert]
@Number_Group [varchar] (6), @Name_Group [varchar] (50), @Studenttt_ID [int]
as
	insert into [dbo].[Group] ([Number_Group],[Name_Group],[Studenttt_ID])
	values (@Number_Group,@Name_Group,@Studenttt_ID)
go

create procedure [dbo].[Group_Update]
@ID_Group [int] , @Number_Group [varchar] (6), @Name_Group [varchar] (50), @Studenttt_ID [int]
as
	update [dbo].[Group] set
	[Number_Group] = @Number_Group,
	[Name_Group] = @Name_Group,
	[Studenttt_ID] = @Studenttt_ID
	where
		[ID_Group] = @ID_Group

go

create procedure [dbo].[Group_delete]
@ID_Group [int]
as
	delete from [dbo].[Group]
	where
		[ID_Group] = @ID_Group
go

---------------Назначение занятий
create procedure [dbo].[Assignment_Of_Classes_Insert]
@Group_ID [int] , @Staffi_ID [int], @Class_Change_ID [int], @Classes_ID [int]
as
	insert into [dbo].[Assignment_Of_Classes] ([Group_ID],[Staffi_ID],[Class_Change_ID],[Classes_ID])
	values (@Group_ID,@Staffi_ID,@Class_Change_ID,@Classes_ID)
go

create procedure [dbo].[Assignment_Of_Classes_Update]
@ID_Assignment_Of_Classes [int] , @Group_ID [int] , @Staffi_ID [int], @Class_Change_ID [int], @Classes_ID [int]
as
	update [dbo].[Assignment_Of_Classes] set
	[Group_ID] = @Group_ID,
	[Staffi_ID] = @Staffi_ID,
	[Class_Change_ID] = @Class_Change_ID,
	[Classes_ID] = @Classes_ID
	where
		[ID_Assignment_Of_Classes] = @ID_Assignment_Of_Classes

go

create procedure [dbo].[Assignment_Of_Classes_Delete]
@ID_Assignment_Of_Classes [int]
as
	delete from [dbo].[Assignment_Of_Classes]
	where
		[ID_Assignment_Of_Classes] = @ID_Assignment_Of_Classes
go

-------------Изменение занятий
create procedure [dbo].[Class_Change_Insert]
@Name_OF_The_Change_Activity [varchar] (50)
as
	insert into [dbo].[Class_Change] ([Name_OF_The_Change_Activity])
	values (@Name_OF_The_Change_Activity)
go

create procedure [dbo].[Class_Change_Update]
@ID_Class_Change [int] ,@Name_OF_The_Change_Activity [varchar] (50)
as
	update [dbo].[Class_Change] set
	[Name_OF_The_Change_Activity] = @Name_OF_The_Change_Activity
	where
		[ID_Class_Change] = @ID_Class_Change

go

create procedure [dbo].[Class_Change_Delete]
@ID_Class_Change [int]
as
	delete from [dbo].[Class_Change]
	where
		[ID_Class_Change] = @ID_Class_Change
go

--------------------Занятия
create procedure [dbo].[Classes_Insert]
@Name_Classes [varchar] (50)
as
	insert into [dbo].[Classes] ([Name_Classes])
	values (@Name_Classes)
go

create procedure [dbo].[Classes_Update]
@ID_Classes [int] ,@Name_Classes [varchar] (50)
as
	update [dbo].[Classes] set
	[Name_Classes] = @Name_Classes
	where
		[ID_Classes] = @ID_Classes

go

create procedure [dbo].[Classes_Delete]
@ID_Classes [int]
as
	delete from [dbo].[Classes]
	where
		[ID_Classes] = @ID_Classes
go

--------------Проведение занятий
create procedure [dbo].[Conduciton_Classes_Insert]
@Time_Classes [varchar] (5), @Date_Classes [varchar] (10),@Assignment_Of_Classes_IDD [int]
as
	insert into [dbo].[Conduciton_Classes] ([Time_Classes],[Date_Classes],[Assignment_Of_Classes_IDD])
	values (@Time_Classes,@Date_Classes,@Assignment_Of_Classes_IDD)
go

create procedure [dbo].[Conduciton_Classes_Update]
@ID_Conduciton_Classes [int] ,@Time_Classes [varchar] (5), @Date_Classes [varchar] (10),@Assignment_Of_Classes_IDD [int]
as
	update [dbo].[Conduciton_Classes] set
	[Time_Classes] = @Time_Classes,
	[Date_Classes] = @Date_Classes,
	[Assignment_Of_Classes_IDD] = @Assignment_Of_Classes_IDD
	where
		[ID_Conduciton_Classes] = @ID_Conduciton_Classes

go

create procedure [dbo].[Conduciton_Classes_Delete]
@ID_Conduciton_Classes [int]
as
	delete from [dbo].[Conduciton_Classes]
	where
		[ID_Conduciton_Classes] = @ID_Conduciton_Classes
go

--------------Проверка посещаемости
create procedure [dbo].[Attendance_Check_Insert]
@Time_Attendance [varchar] (5), @Date_Attendance [varchar] (10),@Conduciton_Classess_ID [int]
as
	insert into [dbo].[Attendance_Check] ([Time_Attendance],[Date_Attendance],[Conduciton_Classess_ID])
	values (@Time_Attendance,@Date_Attendance,@Conduciton_Classess_ID)
go

create procedure [dbo].[Attendance_Check_Update]
@ID_Attendance_Check [int] ,@Time_Attendance [varchar] (5), @Date_Attendance[varchar] (10),@Conduciton_Classess_ID [int]
as
	update [dbo].[Attendance_Check] set
	[Time_Attendance] = @Time_Attendance,
	[Date_Attendance] = @Date_Attendance,
	[Conduciton_Classess_ID] = @Conduciton_Classess_ID
	where
		[ID_Attendance_Check] = @ID_Attendance_Check

go

create procedure [dbo].[Attendance_Check_Delete]
@ID_Attendance_Check [int]
as
	delete from [dbo].[Attendance_Check]
	where
		[ID_Attendance_Check] = @ID_Attendance_Check
go

--------------------Назначение ВКР
create procedure [dbo].[WRC_Appointment_Insert]
@Attendance_Check_ID [int], @WRC_List_ID [int], @Studentt_ID [int]
as
	insert into [dbo].[WRC_Appointment] ([Attendance_Check_ID],[WRC_List_ID],[Studentt_ID])
	values (@Attendance_Check_ID,@WRC_List_ID,@Studentt_ID)
go

create procedure [dbo].[WRC_Appointment_Update]
@ID_WRC_Appointment [int] ,@Attendance_Check_ID [int], @WRC_List_ID [int], @Studentt_ID [int]
as
	update [dbo].[WRC_Appointment] set
	[Attendance_Check_ID] = @Attendance_Check_ID,
	[WRC_List_ID] = @WRC_List_ID,
	[Studentt_ID] = @Studentt_ID
	where
		[ID_WRC_Appointment] = @ID_WRC_Appointment

go

create procedure [dbo].[WRC_Appointment_Delete]
@ID_WRC_Appointment [int]
as
	delete from [dbo].[WRC_Appointment]
	where
		[ID_WRC_Appointment] = @ID_WRC_Appointment
go

--------------------Проведение ВКР
create procedure [dbo].[Carrying_WRC_Insert]
@Time_WRC [varchar] (5), @Date_WRC [varchar] (10),@WRC_Appointment_ID [int]
as
	insert into [dbo].[Carrying_WRC] ([Time_WRC],[Date_WRC],[WRC_Appointment_ID])
	values (@Time_WRC,@Date_WRC,@WRC_Appointment_ID)
go

create procedure [dbo].[Carrying_WRC_Update]
@ID_Carrying_WRC [int] ,@Time_WRC [varchar] (5), @Date_WRC [varchar] (10),@WRC_Appointment_ID [int]
as
	update [dbo].[Carrying_WRC] set
	[Time_WRC] = @Time_WRC,
	[Date_WRC] = @Date_WRC,
	[WRC_Appointment_ID] = @WRC_Appointment_ID
	where
		[ID_Carrying_WRC] = @ID_Carrying_WRC

go

create procedure [dbo].[Carrying_WRC_Delete]
@ID_Carrying_WRC [int]
as
	delete from [dbo].[Carrying_WRC]
	where
		[ID_Carrying_WRC] = @ID_Carrying_WRC
go

--------------------Результаты ВКР
create procedure [dbo].[Results_WRC_Insert]
@Ball_WRC [varchar] (2), @Carrying_WRC_ID [int]
as
	insert into [dbo].[Results_WRC] ([Ball_WRC],[Carrying_WRC_ID])
	values (@Ball_WRC,@Carrying_WRC_ID)
go

create procedure [dbo].[Results_WRC_Update]
@ID_Results_WRC [int] ,@Ball_WRC [varchar] (2), @Carrying_WRC_ID [int]
as
	update [dbo].[Results_WRC] set
	[Ball_WRC] = @Ball_WRC,
	[Carrying_WRC_ID] = @Carrying_WRC_ID
	where
		[ID_Results_WRC] = @ID_Results_WRC

go

create procedure [dbo].[Results_WRC_Delete]
@ID_Results_WRC [int]
as
	delete from [dbo].[Results_WRC]
	where
		[ID_Results_WRC] = @ID_Results_WRC
go

--------------------Дипломы
create procedure [dbo].[Diplomas_Insert]
@Name_Diplomas [varchar] (50), @Number_Diplomas [varchar] (8), @Results_WRC_ID [int]
as
	insert into [dbo].[Diplomas] ([Name_Diplomas],[Number_Diplomas],[Results_WRC_ID])
	values (@Name_Diplomas,@Number_Diplomas,@Results_WRC_ID)
go

create procedure [dbo].[Diplomas_Update]
@ID_Diplomas [int] ,@Name_Diplomas [varchar] (50), @Number_Diplomas [varchar] (8), @Results_WRC_ID [int]
as
	update [dbo].[Diplomas] set
	[Name_Diplomas] = @Name_Diplomas,
	[Number_Diplomas] = @Number_Diplomas,
	[Results_WRC_ID] = @Results_WRC_ID
	where
		[ID_Diplomas] = @ID_Diplomas

go

create procedure [dbo].[Diplomas_Delete]
@ID_Diplomas [int]
as
	delete from [dbo].[Diplomas]
	where
		[ID_Diplomas] = @ID_Diplomas
go