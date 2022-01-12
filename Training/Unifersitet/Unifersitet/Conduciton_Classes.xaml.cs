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
    /// Логика взаимодействия для Conduciton_Classes.xaml
    /// </summary>
    public partial class Conduciton_Classes : Window
    {
        public Conduciton_Classes()
        {
            InitializeComponent();
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrConduciton_Classes;
            dgFill(QR);
            lbFill();
        }
        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrConduciton_Classes = qr;
                    connection.Conduciton_ClassesFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtConduciton_Classes.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.Assignment_Of_ClassesFill();
            cbAOS.ItemsSource = connection.dtAssignment_Of_Classes.DefaultView;
            cbAOS.SelectedValuePath = "ID_Assignment_Of_Classes";
            cbAOS.DisplayMemberPath = "Surname_Staff";
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void DgWCR_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Time_Classes"):
                    e.Column.Header = "Время занятий";
                    break;
                case ("Date_Classes"):
                    e.Column.Header = "Дата занятий";
                    break;
                case ("Surname_Staff"):
                    e.Column.Header = "Номер";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spConduciton_Classes_insert(tbDate.Text, tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spConduciton_Classes_Update(Convert.ToInt32(ID["ID_Conduciton_Classes"]), tbDate.Text, tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spConduciton_Classes_delete(Convert.ToInt32(ID["ID_Conduciton_Classes"]));
                    dgFill(QR);
                    lbFill();
                    break;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[3].ToString() == cbAOS.Text ||
                    dataRow.Row.ItemArray[2].ToString() == tbTime.Text ||
                    dataRow.Row.ItemArray[1].ToString() == tbDate.Text)
                {
                    dgSpisokS.SelectedItem = dataRow;
                }
            }
        }

       

        private void cbAOS_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Assignment_Of_Classes] = "
                        + cbAOS.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
    }
}
