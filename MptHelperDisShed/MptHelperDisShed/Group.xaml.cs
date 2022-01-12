using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
    /// Логика взаимодействия для Group.xaml
    /// </summary>
    public partial class Group : Window
    {
        private string QR = "";
        DBProcedures procedures = new DBProcedures();

        public Group()
        {
            InitializeComponent();
        }

        private void windowWidthHeigh()
        {
            dgFillf.Width = Window.Width;
            dgFillf.Height = Window.Height;
            GridMenu.Height = Window.Height;
            GridMenu.Width = Window.Width;
            //stpOne.Width = Window.Width;
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.ViewDistribution_GroupFill();
            cbGroup.ItemsSource = connection.dtViewDistribution_Group.DefaultView;
            cbGroup.SelectedValuePath = "NLP_ID";
            cbGroup.DisplayMemberPath = "Name_Group";
        }

        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrViewDistribution_Group = qr;
                    connection.ViewDistribution_GroupFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgFillf.ItemsSource = connection.dtViewDistribution_Group.DefaultView;
                };
                Dispatcher.Invoke(action);
            }
        }


        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrViewDistribution_Group;
            dgFill(QR);
            lbFill();
            windowWidthHeigh();
        }

        private void dgFillf_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("NLP_ID"):
                    e.Column.Header = "ID";
                    break;
                case ("Name_Group"):
                    e.Column.Header = "Имя группы";
                    break;
                case ("Date_Forming"):
                    e.Column.Header = "Дата формирования";
                    break;
                case ("Number_Cabinet"):
                    e.Column.Header = "Номер кабинета";
                    break;
            }
        }


        private void cbGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chBox.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [NLP_ID] = "
                        + cbGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbClasses_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //switch (chBox.IsChecked)
            //{
            //    case (true):
            //        string newQR = QR +
            //            " where [Number_Cabinet] = "
            //            + cbClasses.SelectedValue.ToString();
            //        dgFill(newQR);
            //        break;
            //    case (false):
            //        dgFill(QR);
            //        break;
            //}
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            Hide();
        }

        private void Serch_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgFillf.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbGroup.Text )
                {
                    dgFillf.SelectedItem = dataRow;
                }
            }
        }
    }
}
