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
    /// Логика взаимодействия для Student.xaml
    /// </summary>
    public partial class Student : Window
    {
        public Student()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrStudent;
            dgFill(QR);
            lbFill();
        }

        private void dgFill(string qr)
        {
            Action action = () =>
            {
                DBConnection connection = new DBConnection();
                DBConnection.qrStudent = qr;
                connection.StudentFill();
                connection.Dependency.OnChange += Dependency_OnChange;
                dgSpisokS.ItemsSource = connection.dtStudent.DefaultView;
                dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;

            };
            Dispatcher.Invoke(action);
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.EnrolleFill();
            Enrolle.ItemsSource = connection.dtEnrolle.DefaultView;
            Enrolle.SelectedValuePath = "ID_Enrolle";
            Enrolle.DisplayMemberPath = "Surname_Enrolle";
            connection.SpecialityFill();
            SPecialnost.ItemsSource = connection.dtSpeciality.DefaultView;
            SPecialnost.SelectedValuePath = "ID_Speciality";
            SPecialnost.DisplayMemberPath = "Name_Speciality";
        }

        private void DgStudent_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Surname_Student"):
                    e.Column.Header = "Фамилия студента";
                    break;
                case ("Name_Student"):
                    e.Column.Header = "Имя студента";
                    break;
                case ("Middlename_Student"):
                    e.Column.Header = "Отчество студента";
                    break;
                case ("Surname_Enrolle"):
                    e.Column.Header = "Абитуриент";
                    break;
                case ("Name_Speciality"):
                    e.Column.Header = "Специальность";
                    break;
            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spStudent_Update(Convert.ToInt32(ID["ID_Student"]), Familiya.Text, Name.Text, Otchestvo.Text, Convert.ToInt32(Enrolle.SelectedValue), Convert.ToInt32(SPecialnost.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btUpdate_Click_1(object sender, RoutedEventArgs e)
        {
            procedures.spStudent_insert(Familiya.Text, Name.Text, Otchestvo.Text, Convert.ToInt32(Enrolle.SelectedValue), Convert.ToInt32(SPecialnost.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spStudent_delete(Convert.ToInt32(ID["ID_Student"]));
                    dgFill(QR);
                    lbFill();
                    break;
            }
        }
    }
}
