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
    /// Логика взаимодействия для Specialnost.xaml
    /// </summary>
    public partial class Specialnost : Window
    {
        public Specialnost()
        {
            InitializeComponent();
        }
        private string QR = "";

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrSpeciality;
            dgFill(QR);
            //lbFill();
        }
        DBProcedure procedures = new DBProcedure();
        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrSpeciality = qr;
                    connection.SpecialityFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtSpeciality.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
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

        private void DgSpecialnost_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Name_Speciality"):
                    e.Column.Header = "Название специальности";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spSpeciality_insert(tbInsert.Text);
            dgFill(QR);
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spSpeciality_Update(Convert.ToInt32(ID["ID_Speciality"]), tbInsert.Text);
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spSpeciality_delete(Convert.ToInt32(ID["ID_Speciality"]));
                    break;
            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }
    }
}
