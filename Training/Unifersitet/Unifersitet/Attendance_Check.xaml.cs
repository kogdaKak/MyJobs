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

namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Attendance_Check.xaml
    /// </summary>
    public partial class Attendance_Check : Window
    {
        public Attendance_Check()
        {
            InitializeComponent();
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();


        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrAttendance_Check = qr;
                    connection.Attendance_CheckFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtAttendance_Check.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.Conduciton_ClassesFill();
            cbAOS.ItemsSource = connection.dtConduciton_Classes.DefaultView;
            cbAOS.SelectedValuePath = "ID_Conduciton_Classes";
            cbAOS.DisplayMemberPath = "Surname_Staff";
            connection.Attendance_CheckFill();
            cbInfoGroup.ItemsSource = connection.dtAttendance_Check.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Attendance_Check";
            cbInfoGroup.DisplayMemberPath = "Time_Attendance";
            connection.Attendance_CheckFill();
            cbInfoGroup_Copy1.ItemsSource = connection.dtAttendance_Check.DefaultView;
            cbInfoGroup_Copy1.SelectedValuePath = "ID_Attendance_Check";
            cbInfoGroup_Copy1.DisplayMemberPath = "Date_Attendance";
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
                case ("Time_Attendance"):
                    e.Column.Header = "Время назначения";
                    break;
                case ("Date_Attendance"):
                    e.Column.Header = "Дата назначения";
                    break;
                case ("Surname_Staff"):
                    e.Column.Header = "Фамилия";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spAttendance_Check_insert(tbDate.Text, tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spAttendance_Check_Update(Convert.ToInt32(ID["ID_Attendance_Check"]), tbDate.Text, tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spAttendance_Check_delete(Convert.ToInt32(ID["ID_Attendance_Check"]));
                    dgFill(QR);
                    lbFill();
                    break;
            }
        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrAttendance_Check;
            dgFill(QR);
            lbFill();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup.Text ||
                    (dataRow.Row.ItemArray[2].ToString() == cbInfoGroup_Copy1.Text))
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
                        " where [ID_Attendance_Check] = "
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
                        " where [ID_Attendance_Check] = "
                        + cbInfoGroup_Copy1.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

    }
}
