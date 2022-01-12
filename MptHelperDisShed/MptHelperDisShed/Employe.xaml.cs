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
    /// Логика взаимодействия для Employe.xaml
    /// </summary>
    public partial class Employe : Window
    {
        private string QR = "";
        DBProcedures procedures = new DBProcedures();
        public Employe()
        {
            InitializeComponent();
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.ViewDistribution_EmployeFill();
            cbGroup.ItemsSource = connection.dtViewDistribution_Employe.DefaultView;
            cbGroup.SelectedValuePath = "Id_Employee";
            cbGroup.DisplayMemberPath = "Name";
            
            //connection.ViewDistribution_EmployeFill();
            //cbClasses.ItemsSource = connection.dtViewDistribution_Employe.DefaultView;
            //cbClasses.SelectedValuePath = "ID_Territory_Аudiences";
            //cbClasses.DisplayMemberPath = "Number_Cabinet";
        }

        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrViewDistribution_Employe = qr;
                    connection.ViewDistribution_EmployeFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgFillf.ItemsSource = connection.dtViewDistribution_Employe.DefaultView;
                    dgFillf.Columns[2].Visibility = Visibility.Collapsed;
                    dgFillf.Columns[1].Visibility = Visibility.Collapsed;
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
            QR = DBConnection.qrViewDistribution_Employe;
            dgFill(QR);
            windowWidthHeigh();
            lbFill();
        }

        private void dgFillf_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Surname"):
                    e.Column.Header = "Фамилия";
                    break;
                case ("Name"):
                    e.Column.Header = "Имя";
                    break;
                case ("EmployeeId_Employee"):
                    e.Column.Header = "EmployeeId_Employee";
                    break;
                case ("Plurality_Distribution_ID"):
                    e.Column.Header = "Plurality_Distribution_ID";
                    break;
                case ("Date_Forming"):
                    e.Column.Header = "Дата формирования";
                    break;
                case ("Priority"):
                    e.Column.Header = "Приоритет";
                    break;
                case ("Number_Cabinet"):
                    e.Column.Header = "Номер кабинета";
                    break;
                case ("Abbreviated_Name"):
                    e.Column.Header = "Территория";
                    break;
            }
        }

        private void windowWidthHeigh()
        {
            dgFillf.Width = Window.Width;
            dgFillf.Height = Window.Height;
            GridMenu.Height = Window.Height;
            GridMenu.Width = Window.Width;
        }

        private void cbGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chBox.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [Id_Employee] = "
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
            //            " where [ID_Territory_Аudiences] = "
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
                if (dataRow.Row.ItemArray[1].ToString() == cbGroup.Text)
                {
                    dgFillf.SelectedItem = dataRow;
                }
            }
        }

        public static string Surname = "0";
        private string QR2 = "";
        DBConnection dBConnection = new DBConnection();

        private void dgFill1(string qr2)
        {
            Action action = () =>
            {
                string cmd = "SELECT Employees.Surname ,Employees.Name ,Territory_Аudiences.Number_Cabinet, Abbreviated_Name FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences  INNER JOIN dbo.Traning_Area ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area WHERE Employees.Surname = '" + Surname + "'";
                SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                DBConnection.Connection.Open();
                createCommand.ExecuteNonQuery();
                SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                System.Data.DataTable dt = new System.Data.DataTable("Employee"); // В скобках указываем название таблицы
                dataAdp.Fill(dt);
                dgFillf.ItemsSource = dt.DefaultView; // Сам вывод
                DBConnection.Connection.Close();
            };
            Dispatcher.Invoke(action);
        }

        private void Surname_Click(object sender, RoutedEventArgs e)
        {
            Hyperlink link = (Hyperlink)e.OriginalSource;
            //Process.Start(link.NavigateUri.ToString());
            Surname = link.NavigateUri.ToString();
            //MessageBox.Show(Name_Group);
            dgFill1(QR2);
        }

        private void Refresh_Click(object sender, RoutedEventArgs e)
        {
            dgFill(QR);
        }

        //private void btn_OpenMenu_Click(object sender, RoutedEventArgs e)
        //{
        //    btn_OpenMenu.Visibility = Visibility.Collapsed;
        //    btn_CloseMenu.Visibility = Visibility.Visible;
        //}

        //private void btn_CloseMenu_Click(object sender, RoutedEventArgs e)
        //{
        //    btn_OpenMenu.Visibility = Visibility.Visible;
        //    btn_CloseMenu.Visibility = Visibility.Collapsed;
        //}
    }
}

