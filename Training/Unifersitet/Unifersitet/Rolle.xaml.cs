using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для Rolle.xaml
    /// </summary>
    public partial class Rolle : Window
    {
        public Rolle()
        {
            InitializeComponent();
        }

        private string QR = "";

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrRole;
            dgFill(QR);
            //lbFill();
        }

        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrRole = qr;
            connection.RoleFill();
            dgSpisokS.ItemsSource = connection.dtRole.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;

        }

        //private void lbFill()
        //{
        //    DBConnection connection = new DBConnection();
        //    connection.StudentFill();
        //    cbFamiliya.ItemsSource = connection.dtStudent.DefaultView;
        //    cbFamiliya.SelectedValuePath = "ID_Student";
        //    cbFamiliya.DisplayMemberPath = "Surname_Student";
        //    cbName.ItemsSource = connection.dtStudent.DefaultView;
        //    cbName.SelectedValuePath = "ID_Student";
        //    cbName.DisplayMemberPath = "Name_Student";
        //    cbOtchestvo.ItemsSource = connection.dtStudent.DefaultView;
        //    cbOtchestvo.SelectedValuePath = "ID_Student";
        //    cbOtchestvo.DisplayMemberPath = "Middlename_Student";
        //}

        private void DgRole_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Surname_Enrolle"):
                    e.Column.Header = "Фамилия";
                    break;
                case ("Name_Enrolle"):
                    e.Column.Header = "Имя";
                    break;
                case ("Middlename_Enrolle"):
                    e.Column.Header = "Отчество";
                    break;
                case ("Certification_Number"):
                    e.Column.Header = "№ аттестата";
                    break;
                case ("Series_Passport"):
                    e.Column.Header = "Серия паспорта";
                    break;
                case ("Number_Passport"):
                    e.Column.Header = "Номер паспорта";
                    break;
            }
        }
    }
}

