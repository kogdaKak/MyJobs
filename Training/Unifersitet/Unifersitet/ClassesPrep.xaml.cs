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
    /// Логика взаимодействия для ClassesPrep.xaml
    /// </summary>
    public partial class ClassesPrep : Window
    {
        public ClassesPrep()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();



        private void dgFill(string qr)
        {
            

            Action action = () =>
            {
                DBConnection connection = new DBConnection();
                DBConnection.qrClass_Change = qr;
                connection.Class_ChangeFill();
                connection.Dependency.OnChange += Dependency_OnChange;
                dgRosp.ItemsSource = connection.dtClass_Change.DefaultView;
                dgRosp.Columns[0].Visibility = Visibility.Collapsed;
            };
            Dispatcher.Invoke(action);
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.Class_ChangeFill();
            cbInfoGroup.ItemsSource = connection.dtClass_Change.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Class_Change";
            cbInfoGroup.DisplayMemberPath = "Name_OF_The_Change_Activity";
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void DgRaspisanie_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Name_OF_The_Change_Activity"):
                    e.Column.Header = "Замена";
                    break;

            }
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrClass_Change;
            dgFill(QR);
            lbFill();
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spClass_Change_insert(tbInsert.Text);
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
            DataRowView ID = (DataRowView)dgRosp.SelectedValue;
            procedures.spClass_Change_Update(Convert.ToInt32(ID["ID_Class_Change"]), tbInsert.Text);
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgRosp.SelectedItems[0];
                    procedures.spClass_Change_delete(Convert.ToInt32(ID["ID_Class_Change"]));
                    break;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgRosp.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup.Text)
                {
                    dgRosp.SelectedItem = dataRow;
                }
            }
        }

        private void cbInfoGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Class_Change] = "
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

