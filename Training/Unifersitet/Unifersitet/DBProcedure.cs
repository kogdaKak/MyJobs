using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unifersitet
{
    class DBProcedure
    {
        private SqlCommand command = new SqlCommand("", DBConnection.Connection);
        private void commandConfig(string config)
        {
            command.CommandType =
                System.Data.CommandType.StoredProcedure;
            command.CommandText = "[dbo].[" + config + "]";
            command.Parameters.Clear();
        }
        public void spPosition_insert(string Name_Position)
        {
            commandConfig("Position_insert");
            command.Parameters.AddWithValue("@Name_Position", Name_Position);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spPosition_Update(Int32 ID_Position, string Name_Position)
        {
            commandConfig("Position_Update");
            command.Parameters.AddWithValue("@Name_Position", Name_Position);
            command.Parameters.AddWithValue("@ID_Position", ID_Position);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spPosition_delete(Int32 ID_Position)
        {
            commandConfig("Position_Delete");
            command.Parameters.AddWithValue("@ID_Position", ID_Position);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spSpeciality_insert(string Name_Speciality)
        {
            commandConfig("Speciality_insert");
            command.Parameters.AddWithValue("@Name_Speciality", Name_Speciality);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spSpeciality_Update(Int32 ID_Speciality, string Name_Speciality)
        {
            commandConfig("Speciality_Update");
            command.Parameters.AddWithValue("@Name_Speciality", Name_Speciality);
            command.Parameters.AddWithValue("@ID_Speciality", ID_Speciality);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spSpeciality_delete(Int32 ID_Speciality)
        {
            commandConfig("Speciality_Delete");
            command.Parameters.AddWithValue("@ID_Speciality", ID_Speciality);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spEnrolle_insert(string Surname_Enrolle, string Name_Enrolle , string Middlename_Enrolle , string Certification_Number, 
            string Series_Passport, string Number_Passport)
        {
            commandConfig("Enrolle_insert");
            command.Parameters.AddWithValue("@Surname_Enrolle", Surname_Enrolle);
            command.Parameters.AddWithValue("@Name_Enrolle", Name_Enrolle);
            command.Parameters.AddWithValue("@Middlename_Enrolle", Middlename_Enrolle);
            command.Parameters.AddWithValue("@Certification_Number", Certification_Number);
            command.Parameters.AddWithValue("@Series_Passport", Series_Passport);
            command.Parameters.AddWithValue("@Number_Passport", Number_Passport);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spEnrolle_Update(Int32 ID_Enrolle, string Surname_Enrolle, string Name_Enrolle, string Middlename_Enrolle, string Certification_Number,
            string Series_Passport, string Number_Passport)
        {
            commandConfig("Enrolle_Update");
            command.Parameters.AddWithValue("@ID_Enrolle", ID_Enrolle);
            command.Parameters.AddWithValue("@Name_Speciality", Surname_Enrolle);
            command.Parameters.AddWithValue("@Name_Enrolle", Name_Enrolle);
            command.Parameters.AddWithValue("@Middlename_Enrolle", Middlename_Enrolle);
            command.Parameters.AddWithValue("@Certification_Number", Certification_Number);
            command.Parameters.AddWithValue("@Series_Passport", Series_Passport);
            command.Parameters.AddWithValue("@Number_Passport", Number_Passport);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spEnrolle_delete(Int32 ID_Enrolle)
        {
            commandConfig("Enrolle_Delete");
            command.Parameters.AddWithValue("@ID_Enrolle", ID_Enrolle);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spRole_insert(string Name_Role, string Access)
        {
            commandConfig("Role_insert");
            command.Parameters.AddWithValue("@Name_Role", Name_Role);
            command.Parameters.AddWithValue("@Access", Access);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spRole_Update(Int32 ID_Role, string Name_Role, string Access)
        {
            commandConfig("Role_Update");
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            command.Parameters.AddWithValue("@Name_Role", Name_Role);
            command.Parameters.AddWithValue("@Access", Access);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spRole_delete(Int32 ID_Role)
        {
            commandConfig("Role_Delete");
            command.Parameters.AddWithValue("@ID_Role", ID_Role);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spWRC_List_insert(string Name_WRC)
        {
            commandConfig("WRC_List_insert");
            command.Parameters.AddWithValue("@Name_WRC", Name_WRC);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spWRC_List_Update(Int32 ID_WRC_List, string Name_WRC)
        {
            commandConfig("WRC_List_Update");
            command.Parameters.AddWithValue("@ID_WRC_List", ID_WRC_List);
            command.Parameters.AddWithValue("@Name_WRC", Name_WRC);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spWRC_List_delete(Int32 ID_WRC_List)
        {
            commandConfig("WRC_List_Delete");
            command.Parameters.AddWithValue("@ID_WRC_List", ID_WRC_List);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spProfile_insert(string Name_Profile,Int32 Aiuthorization_ID,Int32 Staff_ID, Int32 Student_ID)
        {
            commandConfig("Profile_insert");
            command.Parameters.AddWithValue("@Name_Profile", Name_Profile);
            command.Parameters.AddWithValue("@Aiuthorization_ID", Aiuthorization_ID);
            command.Parameters.AddWithValue("@Staff_ID", Staff_ID);
            command.Parameters.AddWithValue("@Student_ID", Student_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spProfile_Update(Int32 ID_Profile, string Name_Profile, Int32 Aiuthorization_ID, Int32 Staff_ID, Int32 Student_ID)
        {
            commandConfig("Profile_Update");
            command.Parameters.AddWithValue("@ID_Profile", ID_Profile);
            command.Parameters.AddWithValue("@Name_Profile", Name_Profile);
            command.Parameters.AddWithValue("@Aiuthorization_ID", Aiuthorization_ID);
            command.Parameters.AddWithValue("@Staff_ID", Staff_ID);
            command.Parameters.AddWithValue("@Student_ID", Student_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spProfile_delete(Int32 ID_Profile)
        {
            commandConfig("Profile_Delete");
            command.Parameters.AddWithValue("@ID_Profile", ID_Profile);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spStudent_insert(string Surname_Student, string Name_Student, string Middlename_Student, Int32 Enrolle_ID,
            Int32 Speciality_ID)
        {
            commandConfig("Student_insert");
            command.Parameters.AddWithValue("@Surname_Student", Surname_Student);
            command.Parameters.AddWithValue("@Name_Student", Name_Student);
            command.Parameters.AddWithValue("@Middlename_Student", Middlename_Student);
            command.Parameters.AddWithValue("@Enrolle_ID", Enrolle_ID);
            command.Parameters.AddWithValue("@Speciality_ID", Speciality_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spStudent_Update(Int32 ID_Student, string Surname_Student, string Name_Student, string Middlename_Student, Int32 Enrolle_ID,
            Int32 Speciality_ID)
        {
            commandConfig("Student_Update");
            command.Parameters.AddWithValue("@Surname_Student", Surname_Student);
            command.Parameters.AddWithValue("@Name_Student", Name_Student);
            command.Parameters.AddWithValue("@Middlename_Student", Middlename_Student);
            command.Parameters.AddWithValue("@Enrolle_ID", Enrolle_ID);
            command.Parameters.AddWithValue("@Speciality_ID", Speciality_ID);
            command.Parameters.AddWithValue("@ID_Student", ID_Student);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spStudent_delete(Int32 ID_Student)
        {
            commandConfig("Student_Delete");
            command.Parameters.AddWithValue("@ID_Student", ID_Student);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spStaff_insert(string Surname_Staff, string Name_Staff, string Middlename_Staff, Int32 Position_ID)
        {
            commandConfig("Staff_insert");
            command.Parameters.AddWithValue("@Surname_Staff", Surname_Staff);
            command.Parameters.AddWithValue("@Name_Staff", Name_Staff);
            command.Parameters.AddWithValue("@Middlename_Staff", Middlename_Staff);
            command.Parameters.AddWithValue("@Position_ID", Position_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spStaff_Update(Int32 ID_Staff, string Surname_Staff, string Name_Staff, string Middlename_Staff, Int32 Position_ID)
        {
            commandConfig("Staff_Update");
            command.Parameters.AddWithValue("@ID_Staff", ID_Staff);
            command.Parameters.AddWithValue("@Surname_Staff", Surname_Staff);
            command.Parameters.AddWithValue("@Name_Staff", Name_Staff);
            command.Parameters.AddWithValue("@Middlename_Staff", Middlename_Staff);
            command.Parameters.AddWithValue("@Position_ID", Position_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spStaff_delete(Int32 ID_Staff)
        {
            commandConfig("Staff_Delete");
            command.Parameters.AddWithValue("@ID_Staff", ID_Staff);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spGroup_insert(string Number_Group, string Name_Group, Int32 Studenttt_ID)
        {
            commandConfig("Group_insert");
            command.Parameters.AddWithValue("@Number_Group", Number_Group);
            command.Parameters.AddWithValue("@Name_Group", Name_Group);
            command.Parameters.AddWithValue("@Studenttt_ID", Studenttt_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spGroup_Update(Int32 ID_Group, string Number_Group, string Name_Group, Int32 Studenttt_ID)
        {
            commandConfig("Group_Update");
            command.Parameters.AddWithValue("@ID_Group", ID_Group);
            command.Parameters.AddWithValue("@Number_Group", Number_Group);
            command.Parameters.AddWithValue("@Name_Group", Name_Group);
            command.Parameters.AddWithValue("@Studenttt_ID", Studenttt_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spGroup_delete(Int32 ID_Group)
        {
            commandConfig("Group_Delete");
            command.Parameters.AddWithValue("@ID_Group", ID_Group);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spAssignment_Of_Classes_insert(Int32 Group_ID, Int32 Staffi_ID, Int32 Class_Change_ID, Int32 Classes_ID)
        {
            commandConfig("Assignment_Of_Classes_insert");
            command.Parameters.AddWithValue("@Group_ID", Group_ID);
            command.Parameters.AddWithValue("@Staffi_ID", Staffi_ID);
            command.Parameters.AddWithValue("@Class_Change_ID", Class_Change_ID);
            command.Parameters.AddWithValue("@Classes_ID", Classes_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAssignment_Of_Classes_Update(Int32 ID_Assignment_Of_Classes, Int32 Group_ID, Int32 Staffi_ID, Int32 Class_Change_ID, Int32 Classes_ID)
        {
            commandConfig("Assignment_Of_Classes_Update");
            command.Parameters.AddWithValue("@ID_Assignment_Of_Classes", ID_Assignment_Of_Classes);
            command.Parameters.AddWithValue("@Group_ID", Group_ID);
            command.Parameters.AddWithValue("@Staffi_ID", Staffi_ID);
            command.Parameters.AddWithValue("@Class_Change_ID", Class_Change_ID);
            command.Parameters.AddWithValue("@Classes_ID", Classes_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAssignment_Of_Classes_delete(Int32 ID_Assignment_Of_Classes)
        {
            commandConfig("Assignment_Of_Classes_Delete");
            command.Parameters.AddWithValue("@ID_Assignment_Of_Classes", ID_Assignment_Of_Classes);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spClass_Change_insert(string Name_OF_The_Change_Activity)
        {
            commandConfig("Class_Change_insert");
            command.Parameters.AddWithValue("@Name_OF_The_Change_Activity", Name_OF_The_Change_Activity);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spClass_Change_Update(Int32 ID_Class_Change, string Name_OF_The_Change_Activity)
        {
            commandConfig("Class_Change_Update");
            command.Parameters.AddWithValue("@ID_Class_Change", ID_Class_Change);
            command.Parameters.AddWithValue("@Name_OF_The_Change_Activity", Name_OF_The_Change_Activity);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spClass_Change_delete(Int32 ID_Class_Change)
        {
            commandConfig("Class_Change_Delete");
            command.Parameters.AddWithValue("@ID_Class_Change", ID_Class_Change);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spClasses_insert(string Name_Classes)
        {
            commandConfig("Classes_insert");
            command.Parameters.AddWithValue("@Name_Classes", Name_Classes);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spClasses_Update(Int32 ID_Classes, string Name_Classes)
        {
            commandConfig("Classes_Update");
            command.Parameters.AddWithValue("@ID_Classes", ID_Classes);
            command.Parameters.AddWithValue("@Name_Classes", Name_Classes);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spClasses_delete(Int32 ID_Classes)
        {
            commandConfig("Classes_Delete");
            command.Parameters.AddWithValue("@ID_Classes", ID_Classes);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spConduciton_Classes_insert(string Time_Classes, string Date_Classes, Int32 Assignment_Of_Classes_IDD)
        {
            commandConfig("Conduciton_Classes_insert");
            command.Parameters.AddWithValue("@Time_Classes", Time_Classes);
            command.Parameters.AddWithValue("@Date_Classes", Date_Classes);
            command.Parameters.AddWithValue("@Assignment_Of_Classes_IDD", Assignment_Of_Classes_IDD);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spConduciton_Classes_Update(Int32 ID_Conduciton_Classes, string Time_Classes, string Date_Classes, Int32 Assignment_Of_Classes_IDD)
        {
            commandConfig("Conduciton_Classes_Update");
            command.Parameters.AddWithValue("@ID_Conduciton_Classes", ID_Conduciton_Classes);
            command.Parameters.AddWithValue("@Time_Classes", Time_Classes);
            command.Parameters.AddWithValue("@Date_Classes", Date_Classes);
            command.Parameters.AddWithValue("@Assignment_Of_Classes_IDD", Assignment_Of_Classes_IDD);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spConduciton_Classes_delete(Int32 ID_Conduciton_Classes)
        {
            commandConfig("Conduciton_Classes_Delete");
            command.Parameters.AddWithValue("@ID_Conduciton_Classes", ID_Conduciton_Classes);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spAttendance_Check_insert(string Time_Attendance, string Date_Attendance, Int32 Conduciton_Classess_ID)
        {
            commandConfig("Attendance_Check_insert");
            command.Parameters.AddWithValue("@Time_Attendance", Time_Attendance);
            command.Parameters.AddWithValue("@Date_Attendance", Date_Attendance);
            command.Parameters.AddWithValue("@Conduciton_Classess_ID", Conduciton_Classess_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAttendance_Check_Update(Int32 ID_Attendance_Check, string Time_Attendance, string Date_Attendance, Int32 Conduciton_Classess_ID)
        {
            commandConfig("Attendance_Check_Update");
            command.Parameters.AddWithValue("@ID_Attendance_Check", ID_Attendance_Check);
            command.Parameters.AddWithValue("@Time_Attendance", Time_Attendance);
            command.Parameters.AddWithValue("@Date_Attendance", Date_Attendance);
            command.Parameters.AddWithValue("@Conduciton_Classess_ID", Conduciton_Classess_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAttendance_Check_delete(Int32 ID_Attendance_Check)
        {
            commandConfig("Attendance_Check_Delete");
            command.Parameters.AddWithValue("@ID_Attendance_Check", ID_Attendance_Check);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spWRC_Appointment_insert(Int32 Attendance_Check_ID, Int32 WRC_List_ID, Int32 Studentt_ID)
        {
            commandConfig("WRC_Appointment_insert");
            command.Parameters.AddWithValue("@Attendance_Check_ID", Attendance_Check_ID);
            command.Parameters.AddWithValue("@WRC_List_ID", WRC_List_ID);
            command.Parameters.AddWithValue("@Studentt_ID", Studentt_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spWRC_Appointment_Update(Int32 ID_WRC_Appointment, Int32 Attendance_Check_ID, Int32 WRC_List_ID, Int32 Studentt_ID)
        {
            commandConfig("WRC_Appointment_Update");
            command.Parameters.AddWithValue("@ID_WRC_Appointment", ID_WRC_Appointment);
            command.Parameters.AddWithValue("@Attendance_Check_ID", Attendance_Check_ID);
            command.Parameters.AddWithValue("@WRC_List_ID", WRC_List_ID);
            command.Parameters.AddWithValue("@Studentt_ID", Studentt_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spWRC_Appointment_delete(Int32 ID_WRC_Appointment)
        {
            commandConfig("WRC_Appointment_Delete");
            command.Parameters.AddWithValue("@ID_WRC_Appointment", ID_WRC_Appointment);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spCarrying_WRC_insert(String Time_WRC, String Date_WRC, Int32 WRC_Appointment_ID)
        {
            commandConfig("Carrying_WRC_insert");
            command.Parameters.AddWithValue("@Time_WRC", Time_WRC);
            command.Parameters.AddWithValue("@Date_WRC", Date_WRC);
            command.Parameters.AddWithValue("@WRC_Appointment_ID", WRC_Appointment_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spCarrying_WRC_Update(Int32 ID_Carrying_WRC, String Time_WRC, String Date_WRC, Int32 WRC_Appointment_ID)
        {
            commandConfig("Carrying_WRC_Update");
            command.Parameters.AddWithValue("@ID_Carrying_WRC", ID_Carrying_WRC);
            command.Parameters.AddWithValue("@Time_WRC", Time_WRC);
            command.Parameters.AddWithValue("@Date_WRC", Date_WRC);
            command.Parameters.AddWithValue("@WRC_Appointment_ID", WRC_Appointment_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spCarrying_WRC_delete(Int32 ID_Carrying_WRC)
        {
            commandConfig("Carrying_WRC_Delete");
            command.Parameters.AddWithValue("@ID_Carrying_WRC", ID_Carrying_WRC);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spResults_WRC_insert(String Ball_WRC,Int32 Carrying_WRC_ID)
        {
            commandConfig("Results_WRC_insert");
            command.Parameters.AddWithValue("@Ball_WRC", Ball_WRC);
            command.Parameters.AddWithValue("@Carrying_WRC_ID", Carrying_WRC_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spResults_WRC_Update(Int32 ID_Results_WRC, String Ball_WRC, Int32 Carrying_WRC_ID)
        {
            commandConfig("Results_WRC_Update");
            command.Parameters.AddWithValue("@ID_Results_WRC", ID_Results_WRC);
            command.Parameters.AddWithValue("@Ball_WRC", Ball_WRC);
            command.Parameters.AddWithValue("@Carrying_WRC_ID", Carrying_WRC_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spResults_WRC_delete(Int32 ID_Results_WRC)
        {
            commandConfig("Results_WRC_Delete");
            command.Parameters.AddWithValue("@ID_Results_WRC", ID_Results_WRC);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
        public void spDiplomas_insert(String Name_Diplomas, String Number_Diplomas, Int32 Results_WRC_ID)
        {
            commandConfig("Diplomas_insert");
            command.Parameters.AddWithValue("@Name_Diplomas", Name_Diplomas);
            command.Parameters.AddWithValue("@Number_Diplomas", Number_Diplomas);
            command.Parameters.AddWithValue("@Results_WRC_ID", Results_WRC_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spDiplomas_Update(Int32 ID_Diplomas, String Name_Diplomas, String Number_Diplomas, Int32 Results_WRC_ID)
        {
            commandConfig("Diplomas_Update");
            command.Parameters.AddWithValue("@ID_Diplomas", ID_Diplomas);
            command.Parameters.AddWithValue("@Name_Diplomas", Name_Diplomas);
            command.Parameters.AddWithValue("@Number_Diplomas", Number_Diplomas);
            command.Parameters.AddWithValue("@Results_WRC_ID", Results_WRC_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spDiplomas_delete(Int32 ID_Diplomas)
        {
            commandConfig("Diplomas_Delete");
            command.Parameters.AddWithValue("@ID_Diplomas", ID_Diplomas);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAuthorization_insert(String Login, String Password, Int32 Rolle_ID)
        {
            commandConfig("Authorization_Insert");
            command.Parameters.AddWithValue("@Login", Login);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@Rolle_ID", Rolle_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spAuthorization_delete(Int32 ID_Aiuthorization)
        {
            commandConfig("Authorization_Insert");
            command.Parameters.AddWithValue("@ID_Aiuthorization", ID_Aiuthorization);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public Int32 Authorization(string Login, string Password, int Rolle_ID)
        {
            Int32 ID_record = 0;
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = "select count(*) from [dbo].[Aiuthorization]  where [Login] = '" + Login + "' and [Password] = '" + Password + "' and [Rolle_ID] = '" + Rolle_ID +"'";
            DBConnection.Connection.Open();
            ID_record = Convert.ToInt32(command.ExecuteScalar().ToString());
            DBConnection.Connection.Close();
            return (ID_record);
        }
    }
}
