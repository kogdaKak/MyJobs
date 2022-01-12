using System;
using System.Collections.Generic;
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
using System.Data;


namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Assignment_Of_Classes.xaml
    /// </summary>
    public partial class Assignment_Of_Classes : Window
    {
        public Assignment_Of_Classes()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();
        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrAssignment_Of_Classes;
            dgFill(QR);
            lbFill();
        }
        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrAssignment_Of_Classes = qr;
                    connection.Assignment_Of_ClassesFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtAssignment_Of_Classes.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.GroupFill();
            cbInfoGroup_Copy.ItemsSource = connection.dtGroup.DefaultView;
            cbInfoGroup_Copy.SelectedValuePath = "ID_Group";
            cbInfoGroup_Copy.DisplayMemberPath = "Name_Group";
            connection.StaffFill();
            cbInfoGroup.ItemsSource = connection.dtStaff.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Staff";
            cbInfoGroup.DisplayMemberPath = "Surname_Staff";
            connection.ClassesFill();
            cbInfoGroup_Copy1.ItemsSource = connection.dtClasses.DefaultView;
            cbInfoGroup_Copy1.SelectedValuePath = "ID_Classes";
            cbInfoGroup_Copy1.DisplayMemberPath = "Name_Classes";
        }

            private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }
        private void DgWCR_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Name_Group"):
                    e.Column.Header = "Группы";
                    break;
                case ("Surname_Staff"):
                    e.Column.Header = "Сотрудники";
                    break;
                case ("Name_OF_The_Change_Activity"):
                    e.Column.Header = "Замены";
                    break;
                case ("Name_Classes"):
                    e.Column.Header = "Занятия";
                    break;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup_Copy.Text ||
                    dataRow.Row.ItemArray[2].ToString() == cbInfoGroup.Text ||
                    dataRow.Row.ItemArray[3].ToString() == cbInfoGroup_Copy1.Text)
                {
                    dgSpisokS.SelectedItem = dataRow;
                }
            }
        }

        private void cbInfoGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Group] = "
                        + cbInfoGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbInfoGroup_SelectionChanged1(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Staff] = "
                        + cbInfoGroup_Copy1.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbInfoGroup_SelectionChanged2(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Classes] = "
                        + cbInfoGroup_Copy.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
    }
}
