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
    /// Логика взаимодействия для Results_WRC.xaml
    /// </summary>
    public partial class Results_WRC : Window
    {
        public Results_WRC()
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


        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrResults_WRC = qr;
                    connection.Results_WRCFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtResults_WRC.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.Carrying_WRCFill();
            cbAOS.ItemsSource = connection.dtCarrying_WRC.DefaultView;
            cbAOS.SelectedValuePath = "ID_Carrying_WRC";
            cbAOS.DisplayMemberPath = "Date_WRC";
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
                case ("Ball_WRC"):
                    e.Column.Header = "Баллы";
                    break;
                case ("Date_WRC"):
                    e.Column.Header = "Дата";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spResults_WRC_insert(tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spResults_WRC_Update(Convert.ToInt32(ID["ID_Results_WRC"]),tbTime.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
            lbFill();
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spConduciton_Classes_delete(Convert.ToInt32(ID["ID_Results_WRC"]));
                    dgFill(QR);
                    lbFill();
                    break;
            }
        }

        private void dgSpisokS_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrResults_WRC;
            dgFill(QR);
            lbFill();
        }
    }
}
