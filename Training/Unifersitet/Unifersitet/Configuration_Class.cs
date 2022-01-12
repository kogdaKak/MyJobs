using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Win32;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Net;
using System.Net.NetworkInformation;
namespace Unifersitet
{
    public class Configuration_Class
    {

        public event Action<DataTable> Server_Collection;
        //Получает колекцию доступных серверов
        public event Action<DataTable> Data_Base_Collection;
        //Получает колекцию доступных БД на сервере
        public event Action<bool> Conection_Checked;
        //Определяет статус подключения
        public string DS = "Empty",// Переменная Data Source
            IC = "Empty";//Переменная Initial Catalog
        public string ds = "";//Проверка подключения Data Source
        public static SqlConnection connection = new SqlConnection();
        /// <summary>
        /// Ментод получения информации о строке подключения к БД
        /// свойств Data Source и Initial Catalog технологии долступа 
        /// к данным ADO.Net
        /// </summary>
        public void SQL_Server_Configuration_Get()
        {
            //Создаёт каталог в одном из корней реестра ОС
            RegistryKey registry = Registry.CurrentUser;
            //Создаёт папку в выбраном коревом каталоге рееста ОС
            RegistryKey key = registry.CreateSubKey("Server_Configuration");
            try
            {
                //Пытаюсь получить значения из переменных в реестре
                DS = key.GetValue("DS").ToString();
                IC = key.GetValue("IC").ToString();
            }
            catch
            {
                DS = "Empty";
                IC = "Empty";
            }
            finally
            {
                //Обновление строки подкючения
                connection.ConnectionString = "Data Source = " + DS +
                    "; Initial Catalog = " + IC +
                    "; Integrated Security = true;";
            }
        }
        /// <summary>
        /// Метод обновления информации о подкелючении к источнику данных
        /// по технологии ADO.Net
        /// </summary>
        /// <param name="ds">Запись значения Data Source</param>
        /// <param name="ic">Запись значения Initial Catalog</param>
        public void SQL_Server_Configuration_Set(string ds, string ic)
        {
            RegistryKey registry = Registry.CurrentUser;
            RegistryKey key = registry.CreateSubKey("Server_Configuration");
            key.SetValue("DS", ds);//Запись значения в переменную реестра
            key.SetValue("IC", ic);
            SQL_Server_Configuration_Get();
        }
        /// <summary>
        /// Метод возвращает список доступных серверов в локаьном окружении
        /// </summary>
        public void SQL_Server_Enumurator()
        {
            //Полдучет сведения о доступных серверах
            SqlDataSourceEnumerator sourceEnumerator
                = SqlDataSourceEnumerator.Instance;
            //Присвоение Event Action списка серверов ввиде таблицы
            Server_Collection(sourceEnumerator.GetDataSources());
        }
        /// <summary>
        /// Метод проверки подключения к источнику данных
        /// </summary>
        public void SQL_Data_Base_Checking()
        {
            connection.ConnectionString = "Data Source = " + ds + "; " +
                "Initial Catalog = master; Integrated Security = True";
            try
            {
                //Если подключение по источнеику данных открыть можно
                // в Event Action присваиваю true
                connection.Open();
                Conection_Checked(true);
            }
            catch
            //В противном случае false
            {
                Conection_Checked(false);
            }
            finally
            {
                connection.Close();
            }
        }
        /// <summary>
        /// Метод получает список доступных на сервере 
        /// баз данных по технологии доступа к данным ADO.Net
        /// </summary>
        public void SQL_Data_Base_Collection()
        {
            //Запрос на выборку названия баз данных с конкретного сервера
            //где база не назвается master, model, tempdb, msdb
            //и имеет схожее название с Sale_Data_Base
            SqlCommand command = new SqlCommand("select name from sys.databases " +
                "where name not in ('master','tempdb','model','msdb') " +
                "and name like 'Restoran%'", connection);

            try
            {
                connection.Open();
                DataTable table = new DataTable();
                table.Load(command.ExecuteReader());
                Data_Base_Collection(table);
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
        }

        public void Machine_Name_Get()
        {
            RegistryKey registry = Registry.CurrentUser;
            RegistryKey key = registry.CreateSubKey("Server_Configuration");
            Machine_Name = key.GetValue("Machine_Name").ToString();

        }

        public void Machine_Name_Set(string machine_name)
        {
            RegistryKey registry = Registry.CurrentUser;
            RegistryKey key = registry.CreateSubKey("Server_Configuration");
            key.SetValue("Machine_Name", machine_name);
            Machine_Name_Get();
        }
        //Строковые статические переменные
        //Название организации, Путь сохранения документа,
        //Название персонального компьютера
        public static string Organization_Name,
            Save_Files_Path, Machine_Name;
        //Переменные отступа в документе
        public static Int32 doc_Left_Merge,
            doc_Right_Merg,
            doc_Top_Merge, doc_Bottom_Merge;
        /// <summary>
        /// Получение данных о конфигурации документа
        /// </summary>
        public void Document_Configuration_Get()
        {
            RegistryKey registry = Registry.CurrentUser;
            RegistryKey key
                = registry.
                CreateSubKey("Server_Configuration");
            try
            {
                Organization_Name
                    = key.GetValue("Organization_Name")
                    .ToString();
                doc_Left_Merge
                    = Convert.ToInt32(key
                    .GetValue("doc_Left_Merge").ToString());
                doc_Right_Merg
                    = Convert.ToInt32(key
                    .GetValue("doc_Right_Merg").ToString());
                doc_Top_Merge
                    = Convert.ToInt32(
                        key.GetValue("doc_Top_Merge")
                        .ToString());
                doc_Bottom_Merge
                    = Convert.ToInt32(
                        key.GetValue("doc_Bottom_Merge")
                        .ToString());
            }
            catch
            {
                Organization_Name = "Empty";
                doc_Left_Merge = 0;
                doc_Right_Merg = 0;
                doc_Top_Merge = 0;
                doc_Bottom_Merge = 0;

            }


            RegistryKey remote_key;
            try
            {
                Machine_Name_Get();
                remote_key = RegistryKey.OpenRemoteBaseKey(
                    RegistryHive.CurrentUser, Machine_Name);

            }
            catch
            {

            }
        }

        public void Document_Configuration_set(string organization_Name, Int32 Doc_Left_Merge,
            Int32 Doc_Right_Merg, Int32 Doc_Top_Merge, Int32 Doc_Bottom_Merge)
        {
            RegistryKey registry = Registry.CurrentUser;
            RegistryKey key = registry.CreateSubKey("Server_Configuration");
            key.SetValue("Organization_Name", organization_Name);
            key.SetValue("doc_Left_Merge", Doc_Left_Merge);
            key.SetValue("doc_Right_Merg", Doc_Right_Merg);
            key.SetValue("doc_Top_Merge", Doc_Top_Merge);
            key.SetValue("doc_Bottom_Merge", Doc_Bottom_Merge);
            Document_Configuration_Get();
        }
    }
}

