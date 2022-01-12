using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MptHelperDisShed
{
    class DBConnection
    {
        public SqlDependency Dependency = new SqlDependency(); //Переменная отвечающая за запрос к SQL
        public static SqlConnection Connection = new SqlConnection(
            "Data Source = DMITROVDIMAA\\SERVERDMITROV; " + "Initial Catalog = testBDD; Persist Security Info = true;" +
            "User ID=sa; Password=\"951159951159\""); //Переменная отвечающая за статическую строку подключения к БД

        public DataTable dtDistribution = new DataTable("Distribution"); //Переменная класса dataTable
        public DataTable dtSchedule_NLP = new DataTable("Schedule_NLP");//Переменная класса dataTable

        //Витины
        public DataTable dtTerritory_Аudiences = new DataTable("Territory_Аudiences"); //Переменная класса dataTable
        public DataTable dtTraning_Area = new DataTable("Traning_Area");//Переменная класса dataTable
        //Вовы
        public DataTable dtNLP = new DataTable("NLP");//Переменная класса dataTable
        public DataTable dtGGroup = new DataTable("GGroup");//Переменная класса dataTable
        //Саши
        public DataTable dtEmployees = new DataTable("Employees");

        //Представления
        public DataTable dtRaspredelenie_View = new DataTable("Raspredelenie_View");//Переменная класса dataTable
        public DataTable dtViewDistribution_Employe = new DataTable("Distribution_Employe");//Переменная класса dataTable
        public DataTable dtViewDistribution_Group = new DataTable("Distribution_Group");//Переменная класса dataTable
        public DataTable dtViewRaspisanie = new DataTable("Raspisanie");//Переменная класса dataTable

        //Представление в ЛББОХ
        public DataTable dtEmployye = new DataTable("Distribution");//Переменная класса dataTable
        public DataTable dtNames = new DataTable("Distribution");//Переменная класса dataTable
        public DataTable dtTerritory = new DataTable("Cabinetes");
        public DataTable dtRaspredelenye = new DataTable("Territory");
        public DataTable dtCBNaxim = new DataTable("Naximovsk");
        public DataTable dtCBNejka = new DataTable("Nejka");

        public static Int32 ID_User = 0; //Статическая переменная
        public static string //Переменные принимающие в себя запросы к БД
        qrDistribution = "SELECT  [ID_Distribution], [Priority], [Number_Cabinet], [Date_Forming] from [dbo].[Distribution]" +
            "INNER JOIN [dbo].[Territory_Аudiences]" +
            "ON [dbo].[Distribution].[Territory_Аudiences_ID]" +
            "= [dbo].[Territory_Аudiences].[ID_Territory_Аudiences]" +

            "INNER JOIN [dbo].[NLP]" +
            "ON [dbo].[Distribution].[NLP_ID]" +
            "= [dbo].[NLP].[ID_NLP]",

        qrSchedule_NLP = "SELECT [ID_Schedule_NLP] , [Order_Week],[Day_Week],[Number_Classes],[Date_Forming] from [dbo].[Schedule_NLP]" +

            "INNER JOIN [dbo].[NLP]" +
            "ON [dbo].[Schedule_NLP].[NLPp_ID]" +
            "= [dbo].[NLP].[ID_NLP]",

        //Витины таблицы
        qrTerritory_Аudiences = "SELECT [ID_Territory_Аudiences],[Number_Cabinet],[Position_X],[Position_Y],[Width],[Height],[Color_ID],[Traning_Area_ID],[View_ID] from [dbo].[Territory_Аudiences]",
        qrTraning_Area = "SELECT [ID_Training_Area],[Full_Name],[Abbreviated_Name] from [dbo].[Traning_Area]",
        //Вовы таблицы
        qrNLP = "SELECT [ID_NLP],[Date_Forming],[Number_Of_Weeks],[Hours_Per_Week],[EU_CMK_RUP_NLP_ID],[Group_ID],[Distribution_ID] from [dbo].[NLP]",
        qrGGroup = "SELECT [ID_Group],[Name_Group],[Specialty_ID] from [dbo].[GGroup]",
        //Таблицы Саши
        qrEmployees = "SELECT [Id_Employee],[Surname],[Name],[Second_Name],[Employee_Number] from [dbo].[Employees]",

        //Представления
        qrViewRaspisanie = "SELECT [ID_Schedule_NLP] ,[Order_Week] ,[Day_Week] ,[Number_Classes] ,[Name_Group] ,[Number_Specialty] ,[Number_Cabinet] ,[Name_View_Cabinet] FROM [dbo].[Schedule_NLP]" +
            "INNER JOIN [dbo].[NLP] ON [Schedule_NLP].[NLPp_ID] = [NLP].[ID_NLP]" +
            "INNER JOIN [dbo].[Distribution] ON [Distribution].[NLP_ID] = [NLP].[ID_NLP]" +
            "INNER JOIN [dbo].[GGroup] ON [NLP].[Group_ID] = [GGroup].[ID_Group]" +
            "INNER JOIN [dbo].[Specialty] ON [GGroup].[Specialty_ID] = [Specialty].[ID_Specialty]" +
            "INNER JOIN [dbo].[Territory_Аudiences] ON [Distribution].[Territory_Аudiences_ID] = [Territory_Аudiences].[ID_Territory_Аudiences]" +
            "INNER JOIN [dbo].[View_Cabinet] ON [Territory_Аudiences].[View_ID] = [View_Cabinet].[ID_View]",

         qrRaspredelenie_View = "SELECT [Distribution].[ID_Distribution] ,[Employees].[Name] ,[Employees].[Surname] ,[Employees].[Second_Name]  ,[Distribution].[Priority]" +
            ",[Territory_Аudiences].[Number_Cabinet] ,[Traning_Area].[Full_Name] FROM [dbo].[Distribution]" +

                "INNER JOIN [dbo].[Territory_Аudiences] ON [Distribution].[Territory_Аudiences_ID] = [Territory_Аudiences].[ID_Territory_Аudiences]" +
                "INNER JOIN [dbo].[Traning_Area] ON [Territory_Аudiences].[Traning_Area_ID] = [Traning_Area].[ID_Training_Area] " +
                "INNER JOIN [dbo].[NLP] ON [Distribution].[NLP_ID] = [NLP].[ID_NLP]" +
                "INNER JOIN [dbo].[Distribution_CMK] ON [NLP].[Distribution_ID] = [Distribution_CMK].[ID_Distribution] " +
                "INNER JOIN [dbo].[Plurality] ON [Distribution_CMK].[Plurality_Distribution_ID] = [Plurality].[Id_Plurality]" +
                "INNER JOIN [dbo].[Employees] ON [Plurality].[EmployeeId_Employee] = [Employees].[Id_Employee]",

            qrViewDistribution_Employe = "SELECT [Distribution_ID], [Surname],[Name],[Date_Forming] ,[Priority] ,[Number_Cabinet], [Abbreviated_Name] FROM [dbo].[Distribution]" +
                "INNER JOIN [dbo].[NLP] ON [Distribution].[NLP_ID] = [NLP].[ID_NLP] " +
                "INNER JOIN [dbo].[Distribution_CMK] ON [NLP].[Distribution_ID] = [Distribution_CMK].[ID_Distribution]" +
                "INNER JOIN [dbo].[Plurality] ON [Distribution_CMK].[Plurality_Distribution_ID] = [Plurality].[Id_Plurality]" +
                "INNER JOIN [dbo].[Employees] ON [Plurality].[EmployeeId_Employee] = [Employees].[Id_Employee] " +
                "INNER JOIN [dbo].[Territory_Аudiences] ON [Distribution].[Territory_Аudiences_ID] = [Territory_Аudiences].[ID_Territory_Аudiences]" +
                "INNER JOIN [dbo].[Traning_Area] ON [Territory_Аudiences].[Traning_Area_ID] = [Traning_Area].[ID_Training_Area]",


            qrViewDistribution_Group = "SELECT [NLP_ID], [Name_Group] ,[Date_Forming] ,[Number_Cabinet] FROM [dbo].[NLP]" +
            "INNER JOIN [dbo].[GGroup] ON [NLP].[Group_ID] = [GGroup].[ID_Group] " +
            "INNER JOIN [dbo].[Distribution] ON [Distribution].[NLP_ID] = [NLP].[ID_NLP]" +
            "INNER JOIN [dbo].[Territory_Аudiences] ON [Distribution].[Territory_Аudiences_ID] = [Territory_Аudiences].[ID_Territory_Аudiences]",

        qrEmployye = "SELECT [ID_Territory_Аudiences], [Number_Cabinet] + ' ' + [Abbreviated_Name] as Cabinetes FROM [dbo].[Territory_Аudiences]" +
            "INNER JOIN [dbo].[Traning_Area] ON [Territory_Аudiences].[Traning_Area_ID] = [Traning_Area].[ID_Training_Area]",


            qrNames = "SELECT NLP.ID_NLP, Employees.Surname + ' ' + Employees.Name + ' ' + Employees.Second_Name AS sotrydniki FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution",
            qrTerritory = "SELECT [ID_View],[Name_View_Cabinet] as Territories from [dbo].[View_Cabinet]",
            qrRaspredelenye = "SELECT Traning_Area.Full_Name,Territory_Аudiences.Number_Cabinet, Distribution.Priority,Employees.Surname +' '+Employees.Name +' '+ Employees.Second_Name AS FIO FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences INNER JOIN dbo.Traning_Area ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area",
            QRCBNejka = "SELECT ID_Territory_Аudiences, Territory_Аudiences.Number_Cabinet FROM dbo.Territory_Аudiences INNER JOIN dbo.View_Cabinet ON View_Cabinet.ID_View = Territory_Аudiences.View_ID WHERE Name_View_Cabinet = 'Неженская'",
            QRCBNaxim = "SELECT ID_Territory_Аudiences, Territory_Аudiences.Number_Cabinet FROM dbo.Territory_Аudiences INNER JOIN dbo.View_Cabinet ON View_Cabinet.ID_View = Territory_Аudiences.View_ID WHERE Name_View_Cabinet = 'Нахимовский'";


        private SqlCommand command = new SqlCommand(); //Переменная класса SqlCommand

        public static Int32 IDrecord, IDuser; //Статичесакие переменные

        private void DtFill(DataTable table, string query) //
        {
            command.Connection = Connection;
            command.Notification = null;
            Dependency.AddCommandDependency(command);
            SqlDependency.Start(Connection.ConnectionString);
            command.CommandText = query;
            Connection.Open();
            table.Load(command.ExecuteReader());
            Connection.Close();
        }

        private string QR = " ";
        public void DistributionFill()
        {
            DtFill(dtDistribution, qrDistribution);
        }
        public void qrNaximCBFill()
        {
            DtFill(dtCBNaxim, QRCBNaxim);
        }

        public void qrNejkaCBFill()
        {
            DtFill(dtCBNejka, QRCBNejka);
        }

        public void qrREspredelenyeFill()
        {
            DtFill(dtRaspredelenye, qrRaspredelenye);
        }

        public void qrNamesFIll()
        {
            DtFill(dtNames, qrNames);
        }

        public void qrTerritoryFill()
        {
            DtFill(dtTerritory, qrTerritory);
        }

        public void Schedule_NLPFill()
        {
            DtFill(dtSchedule_NLP, qrSchedule_NLP);
        }

        public void Territory_АudiencesFill()
        {
            DtFill(dtTerritory_Аudiences, qrTerritory_Аudiences);
        }
        public void ViewDistribution_EmployeFill()
        {
            DtFill(dtViewDistribution_Employe, qrViewDistribution_Employe);
        }

        public void ViewRaspisanieFill()
        {
            DtFill(dtViewRaspisanie, qrViewRaspisanie);
        }

        public void ViewDistribution_GroupFill()
        {
            DtFill(dtViewDistribution_Group, qrViewDistribution_Group);
        }

        public void Traning_AreaFill()
        {
            DtFill(dtTraning_Area, qrTraning_Area);
        }

        public void NLPFill()
        {
            DtFill(dtNLP, qrNLP);
        }
        public void GGroupFill()
        {
            DtFill(dtGGroup, qrGGroup);
        }

        public void qrEmployyeFill()
        {
            DtFill(dtEmployye, qrEmployye);
        }

        public void EmployeesFill()
        {
            DtFill(dtEmployees, qrEmployees);
        }
        public void Raspredelenie_ViewFill()
        {
            DtFill(dtRaspredelenie_View, qrRaspredelenie_View);
        }
    }
}
