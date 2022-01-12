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
    /// Логика взаимодействия для Staff.xaml
    /// </summary>
    public partial class Staff : Window
    {
        public Staff()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrStaff;
            dgFill(QR);
            lbFill();
        }

        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrStaff = qr;
                    connection.StaffFill();
                    connection.Dependency.OnChange += Dependency_OnChange1;
                    dgSpisokS.ItemsSource = connection.dtStaff.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }

        private void Dependency_OnChange1(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }



        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.PositionFill();
            CBox.ItemsSource = connection.dtPosition.DefaultView;
            CBox.SelectedValuePath = "ID_Position";
            CBox.DisplayMemberPath = "Name_Position";

        }

        private void DgStaff_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Surname_Staff"):
                    e.Column.Header = "Фамилия";
                    break;
                case ("Name_Staff"):
                    e.Column.Header = "Имя";
                    break;
                case ("Middlename_Staff"):
                    e.Column.Header = "Отчество";
                    break;
                case ("Name_Position"):
                    e.Column.Header = "Должность";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spStaff_insert(tbName.Text, tbFamily.Text, tbotchestvo.Text, Convert.ToInt32(CBox.SelectedValue.ToString()));
            dgFill(QR);
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spStaff_Update(Convert.ToInt32(ID["ID_Staff"]),tbName.Text, tbFamily.Text, tbotchestvo.Text, CBox.SelectedIndex);
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spStaff_delete(Convert.ToInt32(ID["ID_Staff"]));
                    dgFill(QR);
                    break;
            }
        }
    }
}
