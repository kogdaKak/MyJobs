using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MptHelperDisShed
{
    class DBProcedures
    {
        private SqlCommand command = new SqlCommand("", DBConnection.Connection);
        private void commandConfig(string config)
        {
            command.CommandType =
                System.Data.CommandType.StoredProcedure;
            command.CommandText = "[dbo].[" + config + "]";
            command.Parameters.Clear();
        }
        public void UpdatePassword(Int32 Id_Account, string Password)
        {
            commandConfig("UpdatePassword");
            command.Parameters.AddWithValue("@Id_Account", Id_Account);
            command.Parameters.AddWithValue("@Password", Password);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }


        //Процедуры Distribution
        public void spdistribution_insert(Int32 priority, Int32 territory_аudiences_id, Int32 NLP_ID)
        {
            commandConfig("distribution_insert");
            command.Parameters.AddWithValue("@priority", priority);
            command.Parameters.AddWithValue("@territory_аudiences_id", territory_аudiences_id);
            command.Parameters.AddWithValue("@NLP_ID", NLP_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spdistribution_Update(Int32 id_distribution, Int32 priority, Int32 territory_аudiences_id, Int32 nlp_id)
        {
            commandConfig("distribution_Update");
            command.Parameters.AddWithValue("@id_distribution", id_distribution);
            command.Parameters.AddWithValue("@priority", priority);
            command.Parameters.AddWithValue("@territory_аudiences_id", territory_аudiences_id);
            command.Parameters.AddWithValue("@nlp_id", nlp_id);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spdistribution_delete(Int32 id_distribution)
        {
            commandConfig("distribution_delete");
            command.Parameters.AddWithValue("@id_distribution", id_distribution);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        //Процеуры NLP
        public void spSchedule_NLP_insert(bool Order_Week, string Day_Week, Int32 number_Classes, Int32 NLP_ID)
        {
            commandConfig("Schedule_NLP_insert");
            command.Parameters.AddWithValue("@Order_Week", Order_Week);
            command.Parameters.AddWithValue("@Day_Week", Day_Week);
            command.Parameters.AddWithValue("@number_Classes", number_Classes);
            command.Parameters.AddWithValue("@NLPp_ID", NLP_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spSchedule_NLP_Update(Int32 ID_Schedule_NLP, bool Order_Week, string Day_Week, Int32 number_Classes, Int32 NLP_ID)
        {
            commandConfig("Schedule_NLP_Update");
            command.Parameters.AddWithValue("@ID_Schedule_NLP", ID_Schedule_NLP);
            command.Parameters.AddWithValue("@Order_Week", Order_Week);
            command.Parameters.AddWithValue("@Day_Week", Day_Week);
            command.Parameters.AddWithValue("@number_Classes", number_Classes);
            command.Parameters.AddWithValue("@NLPp_ID", NLP_ID);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void spSchedule_NLP_delete(Int32 ID_Schedule_NLP)
        {
            commandConfig("Schedule_NLP_Delete");
            command.Parameters.AddWithValue("@ID_Schedule_NLP", ID_Schedule_NLP);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }

        public void sp_registration(String Login, String Password, String Phone_Number, String Email)
        {
            //commandConfig("sp_registration");
            command.Parameters.AddWithValue("@Login", Login);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@Phone_Number", Phone_Number);
            command.Parameters.AddWithValue("@Email", Email);
            DBConnection.Connection.Open();
            command.ExecuteNonQuery();
            DBConnection.Connection.Close();
        }
    }
}
