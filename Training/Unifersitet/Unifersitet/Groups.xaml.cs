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
    /// Логика взаимодействия для Groups.xaml
    /// </summary>
    public partial class Groups : Window
    {
        public Groups()
        {
            InitializeComponent();
        }
        private string QR = "";

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrGroup;
            dgFill(QR);
            lbFill();
        }

        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrGroup = qr;
            connection.GroupFill();
            dgSpisokS.ItemsSource = connection.dtGroup.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;

        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.StudentFill();
            cbFamiliya.ItemsSource = connection.dtStudent.DefaultView;
            cbFamiliya.SelectedValuePath = "ID_Student";
            cbFamiliya.DisplayMemberPath = "Surname_Student";
            connection.GroupFill();
            cbOtchestvo.ItemsSource = connection.dtGroup.DefaultView;
            cbOtchestvo.SelectedValuePath = "ID_Group";
            cbOtchestvo.DisplayMemberPath = "Name_Group";
            connection.GroupFill();
            cbInfoGroup.ItemsSource = connection.dtGroup.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Group";
            cbInfoGroup.DisplayMemberPath = "Number_Group";
        }




        private void DgGroups_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("ID_Student"):
                    e.Column.Header = "Студент";
                    break;
                
                case ("Name_Group"):
                    e.Column.Header = "Имя группы";
                    break;
                case ("Number_Group"):
                    e.Column.Header = "Номер группы";
                    break;
                case ("Surname_Student"):
                    e.Column.Header = "Фамилия";
                    break;

            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbFamiliya.Text ||
                    dataRow.Row.ItemArray[2].ToString() == cbOtchestvo.Text ||
                    dataRow.Row.ItemArray[3].ToString() == cbInfoGroup.Text)
                {
                    dgSpisokS.SelectedItem = dataRow;
                }
            }
        }

        private void cbFamiliya_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Student] = "
                        + cbFamiliya.SelectedValue.ToString();
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
                        " where [ID_Group] = "
                        + cbOtchestvo.SelectedValue.ToString();
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
                        " where [ID_Group] = "
                        + cbInfoGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
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
