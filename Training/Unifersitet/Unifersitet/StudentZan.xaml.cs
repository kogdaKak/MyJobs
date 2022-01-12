
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
    /// Логика взаимодействия для StudentZan.xaml
    /// </summary>
    public partial class StudentZan : Window
    {
        DBProcedure procedures = new DBProcedure();
        public StudentZan()
        {
            InitializeComponent();
            //    switch (DBConnection.IDuser)
            //    {
            //        case (0):
            //            MessageBox.Show("Вход на форму не возможен!",
            //                "Группа", MessageBoxButton.OK,
            //                MessageBoxImage.Error);
            //            Application.Current.Shutdown();
            //            break;
            //        default:
            //            DBConnection connection = new DBConnection();
            //            tbInfoGroup.Text +=
            //                            connection.userInfo(DBConnection.IDuser);
            //            break;
            //    }
            }
                private string QR = "";
        

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrStudent;
            dgFill(QR);
            lbFill();
        }

        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrStudent = qr;
            connection.StudentFill();
            dgSpisokS.ItemsSource = connection.dtStudent.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;

        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.StudentFill();
            cbFamiliya.ItemsSource = connection.dtStudent.DefaultView;
            cbFamiliya.SelectedValuePath = "ID_Student";
            cbFamiliya.DisplayMemberPath = "Surname_Student";
            cbName.ItemsSource = connection.dtStudent.DefaultView;
            cbName.SelectedValuePath = "ID_Student";
            cbName.DisplayMemberPath = "Name_Student";
            cbOtchestvo.ItemsSource = connection.dtStudent.DefaultView;
            cbOtchestvo.SelectedValuePath = "ID_Student";
            cbOtchestvo.DisplayMemberPath = "Middlename_Student";
        }




        private void DgStudent_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Surname_Student"):
                    e.Column.Header = "Фамилия";
                    break;
                case ("Name_Student"):
                    e.Column.Header = "Имя";
                    break;
                case ("Middlename_Student"):
                    e.Column.Header = "Отчество";
                    break;
            }
        }
    }
    
}
