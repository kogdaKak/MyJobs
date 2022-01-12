using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unifersitet
{
    class DBConnection
    {
        public SqlDependency Dependency = new SqlDependency();
        public static SqlConnection Connection = new SqlConnection(
            "Data Source = DMITROVDIMAA\\SERVERDMITROV; " + "Initial Catalog = InstityTT; Persist Security Info = true;" +
            "User ID=sa; Password=\"951159951159\"");
        public DataTable dtPosition = new DataTable("Position");
        public DataTable dtSpeciality = new DataTable("Speciality");
        public DataTable dtEnrolle = new DataTable("Enrolle");
        public DataTable dtRole = new DataTable("Role");
        public DataTable dtWRC_List = new DataTable("WRC_List");
        public DataTable dtAiuthorization = new DataTable("Aiuthorization");
        public DataTable dtProfile = new DataTable("Profile");
        public DataTable dtStudent = new DataTable("Student");
        public DataTable dtStaff = new DataTable("Staff");
        public DataTable dtGroup = new DataTable("Group");
        public DataTable dtAssignment_Of_Classes = new DataTable("Assignment_Of_Classes");
        public DataTable dtClass_Change = new DataTable("Class_Change");
        public DataTable dtClasses = new DataTable("Classes");
        public DataTable dtConduciton_Classes = new DataTable("Conduciton_Classes");
        public DataTable dtAttendance_Check = new DataTable("Attendance_Check");
        public DataTable dtWRC_Appointment = new DataTable("WRC_Appointment");
        public DataTable dtCarrying_WRC = new DataTable("Carrying_WRC");
        public DataTable dtResults_WRC = new DataTable("Results_WRC");
        public DataTable dtDiplomas = new DataTable("Diplomas");
        public static Int32 ID_User = 0;
        public static string
             qrPosition = "SELECT [ID_Position], [Name_Position] from [dbo].[Position]",

             qrSpeciality = "SELECT [ID_Speciality] , [Name_Speciality] from [dbo].[Speciality]",

            qrEnrolle = "SELECT [ID_Enrolle], [Surname_Enrolle], [Name_Enrolle], [Middlename_Enrolle],[Certification_Number],[Series_Passport],[Number_Passport]  from [dbo].[Enrolle]",

            qrRole = "SELECT [ID_Role] ,[Name_Role],[Access]  from [dbo].[Role]",

             qrWRC_List = "SELECT [ID_WRC_List],[Name_WRC]  from [dbo].[WRC_List]",

            qrAiuthorization = "SELECT [ID_Aiuthorization],[Login],[Password],[Name_Role] from [dbo].[Aiuthorization]" +
             "INNER JOIN [dbo].[Rolle]" +
                "ON [dbo].[Aiuthorization].[ID_Aiuthorization]" +
                "= [dbo].[Rolle].[ID_Rolle]",

            qrProfile = "SELECT [ID_Profile],[Name_Profile],[Login],[Surname_Staff],[Surname_Student]  from [dbo].[Profile]" +
            "INNER JOIN [dbo].[Staff]" +
                "ON [dbo].[Profile].[ID_Profile]" +
                "= [dbo].[Staff].[ID_Staff]" +

            "INNER JOIN [dbo].[Role]" +
                "ON [dbo].[Profile].[ID_Profile]" +
                "= [dbo].[Role].[ID_Role]",

            qrStudent = "SELECT [ID_Student],[Surname_Student],[Name_Student],[Middlename_Student],[Surname_Enrolle],[Name_Speciality]  from [dbo].[Student]" +
            "INNER JOIN [dbo].[Enrolle]" +
                "ON [dbo].[Student].[Enrolle_ID]" +
                "= [dbo].[Enrolle].[ID_Enrolle]" +

            "INNER JOIN [dbo].[Speciality]" +
                "ON [dbo].[Student].[Speciality_ID]" +
                "= [dbo].[Speciality].[ID_Speciality]",

            qrStaff = "SELECT [ID_Staff],[Surname_Staff],[Name_Staff],[Middlename_Staff],[Name_Position]  from [dbo].[Staff]" +
            "INNER JOIN [dbo].[Position]" +
                "ON [dbo].[Staff].[Position_ID]" +
                "= [dbo].[Position].[ID_Position]",

            qrGroup = "SELECT [ID_Group] ,[Number_Group],[Name_Group],[Surname_Student]  from [dbo].[Group]" +
            "INNER JOIN [dbo].[Student]" +
                "ON [dbo].[Group].[Studenttt_ID]" +
                "= [dbo].[Student].[ID_Student]",

            qrAssignment_Of_Classes = "SELECT [ID_Assignment_Of_Classes] ,[Name_Group],[Surname_Staff],[Name_OF_The_Change_Activity],[Name_Classes]  from [dbo].[Assignment_Of_Classes]" +
            "INNER JOIN [dbo].[Group]" +
                "ON [dbo].[Assignment_Of_Classes].[Group_ID]" +
                "= [dbo].[Group].[ID_Group]" +

            "INNER JOIN [dbo].[Staff]" +
                "ON [dbo].[Assignment_Of_Classes].[Staffi_ID]" +
                "= [dbo].[Staff].[ID_Staff]" +

            "INNER JOIN [dbo].[Class_Change]" +
                "ON [dbo].[Assignment_Of_Classes].[Class_Change_ID]" +
                "= [dbo].[Class_Change].[ID_Class_Change]" +

            "INNER JOIN [dbo].[Classes]" +
                "ON [dbo].[Assignment_Of_Classes].[Classes_ID]" +
                "= [dbo].[Classes].[ID_Classes]",

            qrClass_Change = "SELECT [ID_Class_Change],[Name_OF_The_Change_Activity]  from [dbo].[Class_Change]",

            qrClasses = "SELECT [ID_Classes],[Name_Classes]  from [dbo].[Classes]",

            qrConduciton_Classes = "SELECT [ID_Conduciton_Classes],[Time_Classes],[Date_Classes],[Surname_Staff]  from [dbo].[Conduciton_Classes]" +
            "INNER JOIN [dbo].[Staff]" +
                "ON [dbo].[Conduciton_Classes].[Assignment_Of_Classes_IDD]" +
                "= [dbo].[Staff].[ID_Staff]",

            qrAttendance_Check = "SELECT [ID_Attendance_Check],[Time_Attendance],[Date_Attendance],[Surname_Staff]  from [dbo].[Attendance_Check]" +
            //"INNER JOIN [dbo].[Conduciton_Classess]" +
            //    "ON [dbo].[Attendance_Check].[Conduciton_Classess_ID]" +
            //    "= [dbo].[Conduciton_Classess].[ID_Conduciton_Classes]",
            "INNER JOIN [dbo].[Staff]" +
                "ON [dbo].[Attendance_Check].[Conduciton_Classess_ID]" +
                "= [dbo].[Staff].[ID_Staff]",

            qrWRC_Appointment = "SELECT [ID_WRC_Appointment],[Date_Attendance],[Name_WRC],[Surname_Student]  from [dbo].[WRC_Appointment]" +
            "INNER JOIN [dbo].[Attendance_Check]" +
                "ON [dbo].[WRC_Appointment].[Attendance_Check_ID]" +
                "= [dbo].[Attendance_Check].[ID_Attendance_Check]" +

            "INNER JOIN [dbo].[WRC_List]" +
                "ON [dbo].[WRC_Appointment].[WRC_List_ID]" +
                "= [dbo].[WRC_List].[ID_WRC_List]" +

            "INNER JOIN [dbo].[Student]" +
                "ON [dbo].[WRC_Appointment].[Studentt_ID]" +
                "= [dbo].[Student].[ID_Student]",

            qrCarrying_WRC = "SELECT [ID_Carrying_WRC],[Time_WRC],[Date_WRC],[WRC_Appointment_ID]  from [dbo].[Carrying_WRC]" +
            "INNER JOIN [dbo].[WRC_Appointment]" +
                "ON [dbo].[Carrying_WRC].[WRC_Appointment_ID]" +
                "= [dbo].[WRC_Appointment].[ID_WRC_Appointment]",

            qrResults_WRC = "SELECT [ID_Results_WRC],[Ball_WRC],[Date_WRC]  from [dbo].[Results_WRC]" +
            "INNER JOIN [dbo].[Carrying_WRC]" +
                "ON [dbo].[Results_WRC].[Carrying_WRC_ID]" +
                "= [dbo].[Carrying_WRC].[ID_Carrying_WRC]",

        //    qrDiplomas = "SELECT [ID_Diplomas],[Name_Diplomas],[Number_Diplomas],[Ball_WRC]  from [dbo].[Diplomas]" +
        //"INNER JOIN [dbo].[Results_WRC]" +
        //        "ON [dbo].[Diplomas].[Results_WRC_ID]" +
        //        "= [dbo].[Results_WRC].[ID_Results_WRC]";

            qrDiplomas = "SELECT [Staff].[ID_Staff] ,[Staff].[Surname_Staff] ,[Staff].[Name_Staff] ,[Staff].[Middlename_Staff] ,[Diplomas].[ID_Diplomas] ,[Diplomas].[Name_Diplomas] ,[Diplomas].[Number_Diplomas] ,[Diplomas].[Results_WRC_ID] ,[Carrying_WRC].[Date_WRC] ,[Results_WRC].[Ball_WRC] FROM dbo.Diplomas  " +
"INNER JOIN [dbo].[Results_WRC] ON [Diplomas].[Results_WRC_ID] = [Results_WRC].[ID_Results_WRC]" +
"INNER JOIN [dbo].[Carrying_WRC] ON [Results_WRC].[Carrying_WRC_ID] = [Carrying_WRC].[ID_Carrying_WRC]" +
"INNER JOIN [dbo].[WRC_Appointment] ON [Carrying_WRC].[WRC_Appointment_ID] = [WRC_Appointment].[ID_WRC_Appointment]" +
"INNER JOIN [dbo].[Student] ON [WRC_Appointment].[Studentt_ID] = [Student].[ID_Student]" +
"INNER JOIN [dbo].[Profile] ON [Profile].[Student_ID] = [Student].[ID_Student]" +
"INNER JOIN [dbo].[Staff] ON [Profile].[Staff_ID] = [Staff].[ID_Staff]";
        private SqlCommand command = new SqlCommand("", Connection);

        public static Int32 IDrecord, IDuser;

        private void DtFill(DataTable table, string query)
        {
            command.Notification = null;
            Dependency.AddCommandDependency(command);
            SqlDependency.Start(Connection.ConnectionString);
            command.CommandText = query;
            Connection.Open();
            table.Load(command.ExecuteReader());
            Connection.Close();
        }

        private string QR = " ";
        public void PositionFill()
        {
            DtFill(dtPosition, qrPosition);
        }

        public void SpecialityFill()
        {
            DtFill(dtSpeciality, qrSpeciality);
        }

        public void EnrolleFill()
        {
            DtFill(dtEnrolle, qrEnrolle);
        }

        public void RoleFill()
        {
            DtFill(dtRole, qrRole);
        }

        public void WRC_ListFill()
        {
            DtFill(dtWRC_List, qrWRC_List);
        }

        public void AiuthorizationFill()
        {
            DtFill(dtAiuthorization, qrAiuthorization);
        }

        public void ProfileFill()
        {
            DtFill(dtProfile, qrProfile);
        }
        public void StudentFill()
        {
            DtFill(dtStudent, qrStudent);
        }
        public void StaffFill()
        {
            DtFill(dtStaff, qrStaff);
        }
        public void GroupFill()
        {
            DtFill(dtGroup, qrGroup);
        }
        public void Assignment_Of_ClassesFill()
        {
            DtFill(dtAssignment_Of_Classes, qrAssignment_Of_Classes);
        }
        public void Class_ChangeFill()
        {
            DtFill(dtClass_Change, qrClass_Change);
        }
        public void ClassesFill()
        {
            DtFill(dtClasses, qrClasses);
        }
        public void Conduciton_ClassesFill()
        {
            DtFill(dtConduciton_Classes, qrConduciton_Classes);
        }
        public void Attendance_CheckFill()
        {
            DtFill(dtAttendance_Check, qrAttendance_Check);
        }
        public void WRC_AppointmentFill()
        {
            DtFill(dtWRC_Appointment, qrWRC_Appointment);
        }
        public void Carrying_WRCFill()
        {
            DtFill(dtCarrying_WRC, qrCarrying_WRC);
        }
        public void Results_WRCFill()
        {
            DtFill(dtResults_WRC, qrResults_WRC);
        }
        public void DiplomasFill()
        {
            DtFill(dtDiplomas, qrDiplomas);
        }


        public string userInfo(Int32 ID_record)
        {
            string user = "";
            command.CommandText = "select '. Профиль '" +
                "+[Login]" +
                "from [dbo].[Aiuthorization] where [ID_Aiuthorization]=" + IDuser;
            Connection.Open();
            user = command.ExecuteScalar().ToString();
            Connection.Close();
            return user;
        }
    }


}
