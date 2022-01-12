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
    /// Логика взаимодействия для ListPrepod.xaml
    /// </summary>
    public partial class ListPrepod : Window
    {
        public ListPrepod()
        {
            InitializeComponent();
        }
        private string QR = "";
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrConduciton_Classes;
            dgFill(QR);
            lbFill();
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.StaffFill();
            cbInfoGroup.ItemsSource = connection.dtStaff.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Staff";
            cbInfoGroup.DisplayMemberPath = "Surname_Staff";
        }
        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrStaff = qr;
            connection.StaffFill();
            dgSpisokS.ItemsSource = connection.dtStaff.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
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
                    e.Column.Header = "Отчество занятий";
                    break;
                case ("Position_ID"):
                    e.Column.Header = "Должность";
                    break;
            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            Profile mainWindow = new Profile();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup.Text)
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
                        " where [ID_Staff] = "
                        + cbInfoGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
    }
}
