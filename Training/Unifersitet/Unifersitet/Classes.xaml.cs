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
    /// Логика взаимодействия для Classes.xaml
    /// </summary>
    public partial class Classes : Window
    {
        public Classes()
        {
            InitializeComponent();
        }
        private string QR = "";
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrClasses;
            dgFill(QR);
            lbFill();
        }
        private void dgFill(string qr)
        {
            DBConnection connection = new DBConnection();
            DBConnection.qrClasses = qr;
            connection.ClassesFill();
            dgSpisokS.ItemsSource = connection.dtClasses.DefaultView;
            dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.ClassesFill();
            cbInfoGroup.ItemsSource = connection.dtClasses.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Classes";
            cbInfoGroup.DisplayMemberPath = "Name_Classes";
        }
        private void DgClass_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Name_Classes"):
                    e.Column.Header = "Название занятия";
                    break;
                
            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
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
                        " where [ID_Classes] = "
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
