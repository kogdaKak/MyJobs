﻿using System;
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
    /// Логика взаимодействия для Carrying_WRC.xaml
    /// </summary>
    public partial class Carrying_WRC : Window
    {
        public Carrying_WRC()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();


        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }
        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrCarrying_WRC = qr;
                    connection.Carrying_WRCFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtCarrying_WRC.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.WRC_AppointmentFill();
            cbAOS.ItemsSource = connection.dtWRC_Appointment.DefaultView;
            cbAOS.SelectedValuePath = "WRC_Appointment_ID";
            cbAOS.DisplayMemberPath = "ID_WRC_Appointment";
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
                case ("Time_WRC"):
                    e.Column.Header = "Время ВКР";
                    break;
                case ("Date_WRC"):
                    e.Column.Header = "Дата ВКР";
                    break;
                case ("WRC_Appointment_ID"):
                    e.Column.Header = "Номер ВКР";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spCarrying_WRC_insert(tbNumberDiplom.Text, tbNameDiplom.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spCarrying_WRC_Update(Convert.ToInt32(ID["ID_Carrying_WRC"]), tbNumberDiplom.Text, tbNameDiplom.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spCarrying_WRC_delete(Convert.ToInt32(ID["ID_Carrying_WRC"]));
                    dgFill(QR);
                    break;
            }
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrCarrying_WRC;
            dgFill(QR);
            lbFill();
        }
    }
}