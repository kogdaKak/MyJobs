using System;
using System.Collections.Generic;
using System.Data;
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

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для Сonnection_Сonfiguration.xaml
    /// </summary>
    public partial class Сonnection_Сonfiguration : Window
    {
        Configuration_class configuration = new Configuration_class();
        public Сonnection_Сonfiguration()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Thread thread = new Thread(configuration.Server_Collection_Get);
            thread.Start();
            configuration.Server_List += Configuration_Server_List;
        }

        private void Configuration_Server_List(DataTable obj)
        {
            Action action = () =>
            {
                foreach (DataRow row in obj.Rows)
                {
                    cbServer.Items.Add(string.Format("{0}\\{1}", row[0], row[1]));
                }
                cbServer.IsEnabled = true;

            };
            Dispatcher.Invoke(action);

        }

        private void BtCheked_Click(object sender, RoutedEventArgs e)
        {
            configuration.ds = cbServer.Text;
            Thread thread = new Thread(configuration.SQL_Data_Base_Collection_Get);
            thread.Start();
            configuration.Database_List += Configuration_Database_List;
        }

        private void Configuration_Database_List(DataTable obj)
        {
            Action action = () =>
            {
                foreach (DataRow row in obj.Rows)
                {
                    cbDatabase.Items.Add(row[0]);
                }
                cbDatabase.IsEnabled = true;
                btConnect.IsEnabled = true;
            };
            Dispatcher.Invoke(action);
        }

        private void btConnect_Click(object sender, RoutedEventArgs e)
        {

            configuration.Server_Configuration_Set(cbServer.Text, cbDatabase.Text);
            Authorization authorization = new Authorization();
            authorization.Show();
            Hide();
        }

        private void BtCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void cbServers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            cbServer.Visibility = Visibility.Collapsed;
        }
    }
}
