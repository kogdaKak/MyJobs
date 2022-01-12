--alter database [InstityTT]set single_user with rollback immediate
--use [master]
--drop database [InstityTT]
--go

set ansi_padding on
set quoted_identifier on
set ansi_nulls on
go

create database [InstityTT]
go
use [InstityTT]
go

--Должности
create table [dbo].[Position]
(
[ID_Position] [int] not null identity(1,1),
constraint [PK_ID_Position] primary key clustered ([ID_Position] ASC) on [PRIMARY],
[Name_Position] [varchar] (30) not null,
constraint [CH_Name_Position] check ([Name_Position] like '%[А-Я]%')
)
go
insert into [dbo].[Position] ([Name_Position])
values ('Администратор'),
('Преподаватель'),
('Педагог организатор'),
('Приёмная комиссия'),
('Член комиссии')
go


--Специальности
create table [dbo].[Speciality]
(
[ID_Speciality] [int] not null identity(1,1),
constraint [PK_ID_Speciality] primary key clustered ([ID_Speciality] ASC) on [PRIMARY],
[Name_Speciality] [varchar] (30) not null,
constraint [CH_Name_Speciality] check ([Name_Speciality] like '%[А-Я]%')
)
go
insert into [dbo].[Speciality] ([Name_Speciality])
values ('Программист'),
('Техник'),
('Тестировщик'),
('Программист-тестировщик'),
('Инженер'),
('Программист-Инженер'),
('Программист-Техник')
go


--Абитуриент
create table [dbo].[Enrolle]
(
[ID_Enrolle] [int] not null identity(1,1),
constraint [PK_ID_Enrolle] primary key clustered ([ID_Enrolle] ASC) on [PRIMARY],
[Surname_Enrolle] [varchar] (50) not null,
[Name_Enrolle] [varchar] (50) not null,
[Middlename_Enrolle] [varchar] (50)null,
[Certification_Number] [varchar] (12) not null,
[Series_Passport] [varchar] (5) not null, 
[Number_Passport] [varchar] (7) not null,
constraint [UQ_Certification_Number] unique ([Certification_Number]),
constraint [UQ_Number_Passport] unique ([Number_Passport]),
constraint [CH_Surname_Enrolle] check ([Surname_Enrolle] like '%[А-Я]%' or [Surname_Enrolle] like '%[A-Z]%'),
constraint [CH_Name_Enrolle] check ([Name_Enrolle] like '%[А-Я]%' or [Name_Enrolle] like '%[A-Z]%'),
constraint [CH_Middlename_Enrolle] check ([Middlename_Enrolle] like '%[А-Я]%' or [Middlename_Enrolle] like '%[A-Z]%'),
constraint [CH_Certification_Number] check ([Certification_Number] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint [CH_Series_Passport] check ([Series_Passport] like '[0-9][0-9] [0-9][0-9]'),
constraint [CH_Number_Passport] check ([Number_Passport] like '[0-9][0-9][0-9] [0-9][0-9][0-9]'),
)
go
insert into [dbo].[Enrolle] ([Surname_Enrolle],[Name_Enrolle],[Middlename_Enrolle],[Certification_Number],[Series_Passport],[Number_Passport])
values ('Тест','Тест','Тест','000000000000','00 00','000 000'),
('Иванов','Иван','Иванович','000000000001','01 10','001 001'),
('Петров','Петр','Петрович','000000000002','01 11','002 001'),
('Андреев','Андрей','Андреевич','000000000003','01 12','001 002'),
('Соколова','Лариса','Алексеевна','000000000004','02 22','222 222'),
('Быков','Денис','Алексеевич','000000000005','11 22','333 121'),
('Беков','Александ','Михайлович','000000000006','66 66','666 666'),
('Алексеенко','Артем','Артемович','000000000007','99 99','999 999')
go

--Роли
create table [dbo].[Role]
(
[ID_Rolle] [int] not null identity(1,1),
constraint [PK_ID_Rolle] primary key clustered ([ID_Rolle] ASC) on [PRIMARY],
[Name_Role] [varchar] (50)not null,
[Access] [varchar] (2)not null,
constraint [CH_Access] check ([Access] like '[0-9][0-9]'),
constraint [CH_Name_Role] check ([Name_Role] like '%[А-Я]%')
)
go
insert into [dbo].[Role] ([Name_Role],[Access])
values ('Администратор','10'),
('Преподаватель','06'),
('Педагог организатор','07'),
('Приёмная комиссия','05'),
('Член комиссии','05'),
('Студент','04'),
('Гость','01')
go

--Список ВКР
create table [dbo].[WRC_List]
(
[ID_WRC_List] [int] not null identity(1,1),
constraint [PK_ID_WRC_List] primary key clustered ([ID_WRC_List] ASC) on [PRIMARY],
[Name_WRC] [varchar] (50)not null,
constraint [CH_Name_WRC] check ([Name_WRC] like '%[А-Я]%'),
)
go
insert into [dbo].[WRC_List] ([Name_WRC])
values ('Программист СС'),
('Техник ПК'),
('Тестировщик приложений СС'),
('Программист-тестировщик СС'),
('Инженер ПК'),
('Программист-Инженер СС'),
('Программист-Техник СС')
go

--Авторизация
create table [dbo].[Aiuthorization]
(
[ID_Aiuthorization] [int] not null identity(1,1),
constraint [PK_ID_Aiuthorization] primary key clustered ([ID_Aiuthorization] ASC) on [PRIMARY],
[Login] [varchar] (20) not null,
[Password] [varchar] (25) not null,
constraint [UQ_Login] unique ([Login]),
[Rolle_ID] [int],
constraint [CH_Login] check ([Login] like '%[А-Я]%' or [Login] like '%[A-Z]%'),
--constraint [CH_Login] check ([Login] like '%[0-9]%'),
constraint [CH_Password] check ([Password] like '%[А-Я]%' or [Password] like '%[A-Z]%'),
--constraint [CH_Password] check ([Password] like '%[0-9]%'),
constraint [FK_Rolle_ID] foreign key ([Rolle_ID]) references [dbo].[Role] ([ID_Rolle]),
)
go
insert into [dbo].[Aiuthorization] ([Login],[Password],[Rolle_ID])
values ('Admin','ADMIN','1'),
('Prepod','PREPOD1','2'),
('PedagogO','PDGO1','3'),
('PRIMKS','PRIMKS1','4'),
('CHKS','CHKS1','5'),
('Student','Student11','6'),
('Gost','Gost','7')
go
--Студент
create table [dbo].[Student]
(
[ID_Student] [int] not null identity(1,1),
constraint [PK_ID_Student] primary key clustered ([ID_Student] ASC) on [PRIMARY],
[Surname_Student] [varchar] (50) not null,
[Name_Student] [varchar] (50) not null,
[Middlename_Student] [varchar] (50)null,
[Enrolle_ID] [int] not null,
constraint [FK_Enrolle_ID] foreign key ([Enrolle_ID]) references [dbo].[Enrolle] ([ID_Enrolle]),
[Speciality_ID] [int] not null,
constraint [CH_Surname_Student] check ([Surname_Student] like '%[А-Я]%' or [Surname_Student] like '%[A-Z]%'),
constraint [CH_Name_Student] check ([Name_Student] like '%[А-Я]%' or [Name_Student] like '%[A-Z]%'),
constraint [CH_Middlename_Student] check ([Middlename_Student] like '%[А-Я]%' or [Middlename_Student] like '%[A-Z]%'),
constraint [FK_Speciality_ID] foreign key ([Speciality_ID]) references [dbo].[Speciality] ([ID_Speciality])
)
go
insert into [dbo].[Student] ([Surname_Student],[Name_Student],[Middlename_Student],[Enrolle_ID],[Speciality_ID])
values ('Тест','Тест','Тест','1','1'),
('Иванов','Иван','Иванович','2','2'),
('Петров','Петр','Петрович','3','3'),
('Андреев','Андрей','Андреевич','4','3'),
('Соколова','Лариса','Алексеевна','5','4'),
('Быков','Денис','Алексеевич','6','5'),
('Беков','Александ','Михайлович','7','7'),
('Алексеенко','Артем','Артемович','8','6')
go
--Сотрудники
create table [dbo].[Staff]
(
[ID_Staff] [int] not null identity(1,1),
constraint [PK_ID_Staff] primary key clustered ([ID_Staff] ASC) on [PRIMARY],
[Surname_Staff] [varchar] (50) not null,
[Name_Staff] [varchar] (50) not null,
[Middlename_Staff] [varchar] (50)null,
[Position_ID] [int] not null,
constraint [CH_Surname_Staff] check ([Surname_Staff] like '%[А-Я]%' or [Surname_Staff] like '%[A-Z]%'),
constraint [CH_Name_Staff] check ([Name_Staff] like '%[А-Я]%' or [Name_Staff] like '%[A-Z]%'),
constraint [CH_Middlename_Staff] check ([Middlename_Staff] like '%[А-Я]%' or [Middlename_Staff] like '%[A-Z]%'),
constraint [FK_Position_ID] foreign key ([Position_ID]) references [dbo].[Position] ([ID_Position]),
)
go
insert into [dbo].[Staff] ([Surname_Staff],[Name_Staff],[Middlename_Staff],[Position_ID])
values ('Тест','Тест','Тест','1'),
('Иванов','Иван','Иванович','2'),
('Петров','Петр','Петрович','3'),
('Андреев','Андрей','Андреевич','4'),
('Соколова','Лариса','Алексеевна','5'),
('Быков','Денис','Алексеевич','4'),
('Беков','Александ','Михайлович','1'),
('Алексеенко','Артем','Артемович','3')
go

--Профиль
create table [dbo].[Profile]
(
[ID_Profile] [int] not null identity(1,1),
constraint [PK_ID_Profile] primary key clustered ([ID_Profile] ASC) on [PRIMARY],
[Name_Profile] [varchar] (50) not null,
constraint [UQ_Name_Profile] unique ([Name_Profile]),
[Aiuthorization_ID] [int] not null,
[Staff_ID] [int] not null,
[Student_ID] [int] not null,
constraint [CH_Name_Profile] check ([Name_Profile] like '%[A-Z]%'),
--constraint [CH_Name_Profile] check ([Name_Profile] like '%[0-9]%'),
constraint [FK_Aiuthorization_ID] foreign key ([Aiuthorization_ID]) references [dbo].[Aiuthorization] ([ID_Aiuthorization]),
constraint [FK_Staff_ID] foreign key ([Staff_ID]) references [dbo].[Staff] ([ID_Staff]),
constraint [FK_Student_ID] foreign key ([Student_ID]) references [dbo].[Student] ([ID_Student]),
)
go
insert into [dbo].[Profile] ([Name_Profile],[Aiuthorization_ID],[Staff_ID],[Student_ID])
values ('Admin','1','7','1'),
('Prepod 1','2','8','1'),
('PedagogO','3','3','1'),
('PRIMKS','4','5','1'),
('CHKS','5','2','1'),
('Student','6','1','3'),
('Gost','7','1','2')
go

--Группы
create table [dbo].[Group]
(
[ID_Group] [int] not null identity(1,1),
constraint [PK_ID_Group] primary key clustered ([ID_Group] ASC) on [PRIMARY],
[Number_Group] [varchar] (6) not null,
constraint [UQ_Number_Groupp] unique ([Number_Group]),
constraint [CH_Number_Group] check ([Number_Group] like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
[Name_Group] [varchar] (50) not null,
constraint [CH_Name_Group] check ([Name_Group] like '%[А-Я]%'),
[Studenttt_ID] [int] not null,
constraint [FK_Studenttt_ID] foreign key ([Studenttt_ID]) references [dbo].[Student] ([ID_Student])
)
go
insert into [dbo].[Group] ([Number_Group],[Name_Group],[Studenttt_ID])
values ('000001','Программисты','2'),
('000002','Техник ПК','3'),
('000003','Тестировщик приложений СС','4'),
('000004','Программист-тестировщик СС','5'),
('000005','Инженер ПК','6'),
('000006','Программист-Инженер СС','7'),
('000007','Программист-Техник СС','8')
go
--Занятия
create table [dbo].[Classes]
(
[ID_Classes] [int] not null identity(1,1),
constraint [PK_ID_Classes] primary key clustered ([ID_Classes] ASC) on [PRIMARY],
[Name_Classes] [varchar] (50) not null,
)
go
insert into [dbo].[Classes] ([Name_Classes])
values ('Нет занятий'),
('Программирование'),
('Тестирование'),
('Инженерия'),
('Моделирование'),
('Экономика'),
('Введение в специальность')
go

--Изменение занятий
create table [dbo].[Class_Change]
(
[ID_Class_Change] [int] not null identity(1,1),
constraint [PK_ID_Class_Change] primary key clustered ([ID_Class_Change] ASC) on [PRIMARY],
[Name_OF_The_Change_Activity] [varchar] (50) not null
)
go
insert into [dbo].[Class_Change] ([Name_OF_The_Change_Activity])
values ('Нет замен'),
('Программирование на тестирование'),
('Тестирование на программирование'),
('Инженерию на программирование'),
('Программирование на инженерию'),
('Экономику на инженерию'),
('Введение в специальность на экономику')
go

--Назначение занятий
create table [dbo].[Assignment_Of_Classes] 
(
[ID_Assignment_Of_Classes] [int] not null identity(1,1),
[Group_ID] [int] not null,
[Staffi_ID] [int] not null,
[Class_Change_ID] [int] not null,
[Classes_ID] [int] not null,
constraint [PK_ID_Assignment_Of_Classes] primary key clustered ([ID_Assignment_Of_Classes] ASC) on [PRIMARY],
constraint [FK_Group_ID] foreign key ([Group_ID]) references [dbo].[Group] ([ID_Group]),
constraint [FK_Staffi_ID] foreign key ([Staffi_ID]) references [dbo].[Staff] ([ID_Staff]),
constraint [FK_Class_Change_ID] foreign key ([Class_Change_ID]) references [dbo].[Class_Change] ([ID_Class_Change]),
constraint [FK_Classes_ID] foreign key ([Classes_ID]) references [dbo].[Classes] ([ID_Classes]),
)
go
insert into [dbo].[Assignment_Of_Classes] ([Group_ID],[Staffi_ID],[Class_Change_ID],[Classes_ID])
values ('1','7','1','2'),
('2','8','1','3'),
('3','3','1','4'),
('4','2','1','5'),
('5','1','1','6'),
('6','4','2','2'),
('7','5','1','2')
go

--Проведение занятий
create table [dbo].[Conduciton_Classes]
(
[ID_Conduciton_Classes] [int] not null identity(1,1),
constraint [PK_ID_Conduciton_Classes] primary key clustered ([ID_Conduciton_Classes] ASC) on [PRIMARY],
[Time_Classes] [varchar] (5) not null,
[Date_Classes] [varchar] (10) not null,
[Assignment_Of_Classes_IDD] [int] not null,
constraint [CH_Time_Classes] check ([Time_Classes] like '[0-9][0-9]:[0-9][0-9]'),
constraint [CH_Date_Classes] check ([Date_Classes] like '[0-9][0-9].[0-9][0-9].[0-9][0-9][0-9][0-9]'),
constraint [FK_Assignment_Of_Classes_ID] foreign key ([Assignment_Of_Classes_IDD]) references [dbo].[Assignment_Of_Classes] ([ID_Assignment_Of_Classes]),
)
go
insert into [dbo].[Conduciton_Classes] ([Time_Classes],[Date_Classes],[Assignment_Of_Classes_IDD])
values ('08:30','01.09.2020','1'),
('08:30','01.09.2020','2'),
('08:30','01.09.2020','3'),
('10:00','01.09.2020','4'),
('08:30','01.09.2020','5'),
('10:00','01.09.2020','6'),
('12:00','01.09.2020','7')
go

--Проверка посещаемости
create table [dbo].[Attendance_Check]
(
[ID_Attendance_Check] [int] not null identity(1,1),
constraint [PK_ID_Attendance_Check] primary key clustered ([ID_Attendance_Check] ASC) on [PRIMARY],
[Time_Attendance] [varchar] (5) not null,
[Date_Attendance] [varchar] (10) not null,
constraint [CH_Time_Attendance] check ([Time_Attendance] like '[0-9][0-9]:[0-9][0-9]'),
constraint [CH_Date_Attendance] check ([Date_Attendance] like '[0-9][0-9].[0-9][0-9].[0-9][0-9][0-9][0-9]'),
[Conduciton_Classess_ID] [int] not null,
constraint [FK_Conduciton_Classess_ID] foreign key ([Conduciton_Classess_ID]) references [dbo].[Conduciton_Classes] ([ID_Conduciton_Classes]),
)
go
insert into [dbo].[Attendance_Check] ([Time_Attendance],[Date_Attendance],[Conduciton_Classess_ID])
values ('08:31','01.09.2020','1'),
('08:32','01.09.2020','2'),
('08:32','01.09.2020','3'),
('10:10','01.09.2020','4'),
('08:31','01.09.2020','5'),
('10:15','01.09.2020','6'),
('12:01','01.09.2020','7')
go

--Назначение ВКР
create table [dbo].[WRC_Appointment]
(
[ID_WRC_Appointment] [int] not null identity(1,1),
constraint [PK_ID_WRC_Appointment] primary key clustered ([ID_WRC_Appointment] ASC) on [PRIMARY],
[Attendance_Check_ID] [int] not null,
constraint [FK_Attendance_Check_ID] foreign key ([Attendance_Check_ID]) references [dbo].[Attendance_Check] ([ID_Attendance_Check]),
[WRC_List_ID] [int] not null,
constraint [FK_WRC_List_ID] foreign key ([WRC_List_ID]) references [dbo].[WRC_List] ([ID_WRC_List]),
[Studentt_ID] [int] not null,
constraint [FK_Studentt_ID] foreign key ([Studentt_ID]) references [dbo].[Student] ([ID_Student])
)
go
insert into [dbo].[WRC_Appointment] ([Attendance_Check_ID],[WRC_List_ID],[Studentt_ID])
values ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7')
go

--Проведение ВКР
create table [dbo].[Carrying_WRC]
(
[ID_Carrying_WRC] [int] not null identity(1,1),
constraint [PK_ID_Carrying_WRC] primary key clustered ([ID_Carrying_WRC] ASC) on [PRIMARY],
[Time_WRC] [varchar] (5) not null,
[Date_WRC] [varchar] (10) not null,
constraint [CH_Time_WRC] check ([Time_WRC] like '[0-9][0-9]:[0-9][0-9]'),
constraint [CH_Date_WRC] check ([Date_WRC] like '[0-9][0-9].[0-9][0-9].[0-9][0-9][0-9][0-9]'),
[WRC_Appointment_ID] [int] not null,
constraint [FK_WRC_Appointment_ID] foreign key ([WRC_Appointment_ID]) references [dbo].[WRC_Appointment] ([ID_WRC_Appointment])
)
go 
insert into [dbo].[Carrying_WRC] ([Time_WRC],[Date_WRC],[WRC_Appointment_ID])
values ('08:30','01.09.2020','1'),
('08:30','01.09.2020','2'),
('08:30','01.09.2020','3'),
('10:10','01.09.2020','4'),
('08:30','01.09.2020','5'),
('10:15','01.09.2020','6'),
('12:00','01.09.2020','7')
go

--Результаты ВКР
create table [dbo].[Results_WRC]
(
[ID_Results_WRC] [int] not null identity(1,1),
constraint [PK_ID_Results_WRC] primary key clustered ([ID_Results_WRC] ASC) on [PRIMARY],
[Ball_WRC] [varchar] (2) not null,
constraint [CH_Ball_WRC] check ([Ball_WRC] like '[0-9][0-9]'),
[Carrying_WRC_ID] [int] not null,
constraint [FK_Carrying_WRC_ID] foreign key ([Carrying_WRC_ID]) references [dbo].[Carrying_WRC] ([ID_Carrying_WRC])
)
go
insert into [dbo].[Results_WRC] ([Ball_WRC],[Carrying_WRC_ID])
values ('02','1'),
('05','2'),
('05','3'),
('05','4'),
('03','5'),
('04','6'),
('04','7')
go

--Дипломы
create table [dbo].[Diplomas]
(
[ID_Diplomas] [int] not null identity(1,1),
constraint [PK_ID_Diplomas] primary key clustered ([ID_Diplomas] ASC) on [PRIMARY],
[Name_Diplomas] [varchar] (50) not null,
[Number_Diplomas] [varchar] (8) not null,
constraint [UQ_Number_Diplomas] unique ([Number_Diplomas]),
constraint [CH_Number_Diplomas] check ([Number_Diplomas] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
[Results_WRC_ID] [int] not null,
constraint [FK_Results_WRC_ID] foreign key ([Results_WRC_ID]) references [dbo].[Results_WRC] ([ID_Results_WRC])
)
go
insert into [dbo].[Diplomas] ([Name_Diplomas],[Number_Diplomas],[Results_WRC_ID])
values ('Диплом для студента 1','00000001','1'),
('Диплом для студента 2','00000002','2'),
('Диплом для студента 3','00000003','3'),
('Диплом для студента 4','00000004','4'),
('Диплом для студента 5','00000005','5'),
('Диплом для студента 6','00000006','6'),
('Диплом для студента 7','00000007','7')
go