using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Connection.xaml
    /// </summary>
    public partial class Configuration : Window
    {
        public Configuration()
        {
            InitializeComponent();
        }

        private void BtCheked_Click(object sender, RoutedEventArgs e)
        {
            switch (cbDatabases.Text =="")
            {
                case true:
                    MessageBox.Show("Ошибка");
                    cbDatabases.Focus();
                    break;
                case false:
                    btConnect.IsEnabled = true;
                    break;
            }
                
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //вызов класса конфигурации
            Configuration_Class configuration = new Configuration_Class();
            //присвоение event action событий
            configuration.Server_Collection += Configuration_Server_Collection; ;
            //
            Thread threadservers = new Thread(configuration.SQL_Server_Enumurator);
            //запуск потока
            threadservers.Start();
        }

        private void Configuration_Server_Collection(DataTable obj)
        {
            //Вызов делегата для присвоения в него фрагмента кода
            //Через лямбда выражение => в делегат приваиватся код
            Action action = () =>
            {
                //Для каждой строки таблицы в выпадающий список 
                //Дополнить колекцию пунктов Server Name\Machine Name
                foreach (DataRow r in obj.Rows)
                {
                    cbServers.Items.Add(
                        string.Format(@"{0}\{1}", r[0], r[1]));
                }
                cbServers.IsEnabled = true;
                btCheked.IsEnabled = true;
                cbDatabases.IsEnabled = true;
            };
            //Присвоение фонового потока в основной
            Dispatcher.Invoke(action);
        }
        /// <summary>
        /// Метод вызова доступных баз данных
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cbServers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Configuration_Class configuration
               = new Configuration_Class();
            configuration.ds = cbServers.SelectedItem.ToString();
            configuration.Conection_Checked += Configuration_Conection_Checked;
            Thread thread
                = new Thread(configuration.SQL_Data_Base_Checking);
            thread.Start();
            cbDatabases.IsEnabled = true;
        }
        private void Configuration_Conection_Checked(bool obj)
        {
            switch (obj)
            {
                //Если подключение выполнено верно то появляется сообщение
                case true:
                    MessageBox.Show("Проверка выполнена!");
                    Action action = () =>
                    {
                        //Повторение метода выбора
                        Configuration_Class configuration_coll
                            = new Configuration_Class();
                        configuration_coll.Data_Base_Collection
                            += Configuration_Data_Base_Collection;
                        Thread threadBases
                            = new Thread(configuration_coll.SQL_Data_Base_Collection);
                        threadBases.Start();
                        btConnect.IsEnabled = true;
                        cbDatabases.IsEnabled = true;
                    };
                    Dispatcher.Invoke(action);
                    break;
                case false:
                    //Вслучае если  нет подключения повторяем сбор данных
                    //о сервере
                    Configuration_Class configuration
                        = new Configuration_Class();
                    configuration.Server_Collection
                        += Configuration_Server_Collection;
                    Thread threadServers
                        = new Thread(configuration.SQL_Server_Enumurator);
                    threadServers.Start();
                    break;
            }
        }

        //Получение списка таблиц БД
        private void Configuration_Data_Base_Collection(DataTable obj)
        {
            Action action = () =>
            {
                foreach (DataRow r in obj.Rows)
                {
                    cbDatabases.Items.Add(r[0]);
                }
                cbDatabases.IsEnabled = true;
                btCheked.IsEnabled = true;
                cbDatabases.IsEnabled = true;
            };
            Dispatcher.Invoke(action);
        }
        private void btConnect_Click(object sender, RoutedEventArgs e)
        {
                    Authorization main = new Authorization();
                    main.Show();
                    Visibility = Visibility.Collapsed;
            Hide();
        }

        private void BtCancel_Click(object sender, RoutedEventArgs e)
        {
            //Закрытиек окна
            Close();
        }
    }
}
