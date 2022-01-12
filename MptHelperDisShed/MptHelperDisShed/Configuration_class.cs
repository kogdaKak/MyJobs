using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MptHelperDisShed
{
    class Configuration_class
    {
        DBConnection dBConnection = new DBConnection();
        public SqlConnection SqlConnection = new SqlConnection();
        public event Action<bool> Connection_Check;
        public event Action<DataTable> Server_List;
        public event Action<DataTable> Database_List;
        public string DS = "", IC = "", ds = "";
        public static SqlConnection connection = new SqlConnection();

        public void Server_Configuration_Get()
        {
            RegistryKey registr = Registry.CurrentUser;
            RegistryKey key = registr.CreateSubKey("Configuration_connect");
            try
            {
                DS = key.GetValue("DS").ToString();
                IC = key.GetValue("IC").ToString();
            }
            catch
            {
                DS = null;
                IC = null;
            }
            finally
            {
                connection.ConnectionString = "Data Source = " + DS +
                                    "; Initial Catalog = " + IC +
                                    "; Integrated Security = true;";
            }
        }

        public void Server_Configuration_Set(string DS, string Ic)
        {
            RegistryKey registr = Registry.CurrentUser;
            RegistryKey key = registr.CreateSubKey("Configuration_connect");
            key.SetValue("DS", DS);
            key.SetValue("IC", Ic);
            Server_Configuration_Get();
        }

        public void Connection_Checking()
        {
            Server_Configuration_Get();
            SqlConnection.ConnectionString = DBConnection.Connection.ConnectionString;
            //try
            //{
                SqlConnection.Open();
                Connection_Check?.Invoke(true);
            //}
            //catch
            //{
                Connection_Check?.Invoke(false);
            //}
            //finally
            //{
                SqlConnection.Close();
            //}
        }

        public void Server_Collection_Get()
        {
            SqlDataSourceEnumerator sqlDataSource = SqlDataSourceEnumerator.Instance;
            Server_List(sqlDataSource.GetDataSources()); // получили лист серверов
        }

        public void SQL_Data_Base_Collection_Get()
        {
            SqlConnection.ConnectionString = string.Format(
                "Data Source = {0}; Initial Catalog = master; " +
                "Integrated Security = True;", ds);
            SqlCommand command = new SqlCommand("select name " +
                "from sys.databases " +
                "where name like '%'", SqlConnection);

            try
            {
                SqlConnection.Open();
                DataTable table = new DataTable();
                table.Load(command.ExecuteReader());
                Database_List(table);
            }
            catch
            {

            }
            finally
            {
                SqlConnection.Close();
            }
        }

    }
}

