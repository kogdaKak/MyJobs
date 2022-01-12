using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для WRC_Appointment.xaml
    /// </summary>
    public partial class WRC_Appointment : Window
    {
        public WRC_Appointment()
        {
            InitializeComponent();
        }
        private string QR = "";


        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrWRC_Appointment = qr;
            connection.WRC_AppointmentFill();
            dgSpisokS.ItemsSource = connection.dtWRC_Appointment.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;

        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.StudentFill();
            cbStudent.ItemsSource = connection.dtStudent.DefaultView;
            cbStudent.SelectedValuePath = "ID_Student";
            cbStudent.DisplayMemberPath = "Surname_Student";
            connection.WRC_ListFill();
            cbWRC.ItemsSource = connection.dtWRC_List.DefaultView;
            cbWRC.SelectedValuePath = "ID_WRC_List";
            cbWRC.DisplayMemberPath = "Name_WRC";
            connection.Attendance_CheckFill();
            cbAppointment.ItemsSource = connection.dtAttendance_Check.DefaultView;
            cbAppointment.SelectedValuePath = "ID_Attendance_Check";
            cbAppointment.DisplayMemberPath = "Date_Attendance";
        }




        private void DgWCR_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Date_Attendance"):
                    e.Column.Header = "Дата";
                    break;

                case ("Name_WRC"):
                    e.Column.Header = "Название ВКР";
                    break;

                case ("Surname_Student"):
                    e.Column.Header = "Фамилия";
                    break;

            }
        }
        

        private void cbFamiliya_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_WRC_List] = "
                        + cbWRC.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void cbOtchestvo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Student] = "
                        + cbStudent.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbInfoGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Attendance_Check] = "
                        + cbAppointment.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            Profile mainWindow = new Profile();
            mainWindow.Show();
            Hide();
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrWRC_Appointment;
            dgFill(QR);
            lbFill();
        }

        private void btExit_Click_1(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }

        private void btSerch_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbAppointment.Text ||
                    dataRow.Row.ItemArray[2].ToString() == cbWRC.Text ||
                    dataRow.Row.ItemArray[3].ToString() == cbStudent.Text)
                {
                    dgSpisokS.SelectedItem = dataRow;
                }
            }
        }
        DBProcedure procedures = new DBProcedure();
        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spWRC_Appointment_insert(Convert.ToInt32(cbStudent.SelectedValue), Convert.ToInt32(cbWRC.SelectedValue), Convert.ToInt32(cbAppointment.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spWRC_Appointment_Update(Convert.ToInt32(ID["ID_WRC_Appointment"]), Convert.ToInt32(cbStudent.SelectedValue), Convert.ToInt32(cbWRC.SelectedValue), Convert.ToInt32(cbAppointment.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spWRC_Appointment_delete(Convert.ToInt32(ID["ID_WRC_Appointment"]));
                    dgFill(QR);
                    lbFill();
                    break;
            }
        }
    }
}
