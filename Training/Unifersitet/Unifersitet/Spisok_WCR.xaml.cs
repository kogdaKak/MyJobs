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
    /// Логика взаимодействия для Spisok_WCR.xaml
    /// </summary>
    public partial class Spisok_WCR : Window
    {
        DBProcedure procedures = new DBProcedure();
        public Spisok_WCR()
        {
            InitializeComponent();
        }
        private string QR = "";


        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrWRC_List = qr;
                    connection.WRC_ListFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtWRC_List.DefaultView;
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

        private void DgWCR_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Name_WRC"):
                    e.Column.Header = "ВКР лист";
                    break;

            }
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spWRC_List_insert(tbNumber.Text);
            dgFill(QR);
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spWRC_List_Update(Convert.ToInt32(ID["ID_WRC_List"]), tbNumber.Text);
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spWRC_List_delete(Convert.ToInt32(ID["ID_WRC_List"]));
                    dgFill(QR);
                    break;
            }


        }
        private void tbNumber_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsLetter(e.Text, 0)) e.Handled = true;
        }

        private void Winodws_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrWRC_List;
            dgFill(QR);
            //lbFill();
        }
    }
}

