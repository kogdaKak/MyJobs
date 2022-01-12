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
    /// Логика взаимодействия для Enrolle.xaml
    /// </summary>
    public partial class Enrolle : Window
    {
        public Enrolle()
        {
            InitializeComponent();
        }

        private string QR = "";
        DBProcedure procedures = new DBProcedure();

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrEnrolle;
            dgFill(QR);
            lbFill();
        }

        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrEnrolle = qr;
                    connection.EnrolleFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtEnrolle.DefaultView;
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

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.EnrolleFill();
            cbInfoGroup.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup.DisplayMemberPath = "Surname_Enrolle";
            connection.EnrolleFill();
            cbInfoGroup_Copy.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup_Copy.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup_Copy.DisplayMemberPath = "Name_Enrolle";
            connection.EnrolleFill();
            cbInfoGroup_Copy1.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup_Copy1.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup_Copy1.DisplayMemberPath = "Middlename_Enrolle";
            connection.EnrolleFill();
            cbInfoGroup_Copy2.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup_Copy2.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup_Copy2.DisplayMemberPath = "Certification_Number";
            connection.EnrolleFill();
            cbInfoGroup_Copy3.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup_Copy3.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup_Copy3.DisplayMemberPath = "Series_Passport";
            connection.EnrolleFill();
            cbInfoGroup_Copy4.ItemsSource = connection.dtEnrolle.DefaultView;
            cbInfoGroup_Copy4.SelectedValuePath = "ID_Enrolle";
            cbInfoGroup_Copy4.DisplayMemberPath = "Number_Passport";
        }

        private void DgEnrolle_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
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


        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spEnrolle_Update(Convert.ToInt32(ID["ID_Enrolle"]), Familiya.Text, Name.Text, Otchestvo.Text,Sertifikat.Text,Seriya.Text,Nomer.Text);
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            
                switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
                {
                    case MessageBoxResult.Yes:
                        DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                        procedures.spEnrolle_delete(Convert.ToInt32(ID["ID_Enrolle"]));
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
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup.Text ||
                    dataRow.Row.ItemArray[2].ToString() == cbInfoGroup_Copy.Text ||
                    dataRow.Row.ItemArray[3].ToString() == cbInfoGroup_Copy1.Text ||
                    dataRow.Row.ItemArray[4].ToString() == cbInfoGroup_Copy2.Text ||
                    dataRow.Row.ItemArray[5].ToString() == cbInfoGroup_Copy3.Text ||
                    dataRow.Row.ItemArray[6].ToString() == cbInfoGroup_Copy4.Text)
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
                        " where [ID_Enrolle] = "
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
                        " where [ID_Enrolle] = "
                        + cbInfoGroup_Copy.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
        private void cbInfoGroup_SelectionChanged2(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Enrolle] = "
                        + cbInfoGroup_Copy1.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
        private void cbInfoGroup_SelectionChanged3(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Enrolle] = "
                        + cbInfoGroup_Copy2.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
        private void cbInfoGroup_SelectionChanged4(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Enrolle] = "
                        + cbInfoGroup_Copy3.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
        private void cbInfoGroup_SelectionChanged5(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Enrolle] = "
                        + cbInfoGroup_Copy4.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
    }
}

