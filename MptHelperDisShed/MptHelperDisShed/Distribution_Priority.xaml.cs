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

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для Distribution_Priority.xaml
    /// </summary>
    public partial class Distribution_Priority : Window
    {
        private string QR = "";
        DataTable Cabinetes = new DataTable();//Вызов функция другого класса

        /// <summary>
        /// Функция получение данных из БД путем подключения и ввода зпроса
        /// </summary>
        private void lbFillCabimet()
        {
            DBConnection connection = new DBConnection();
            connection.qrNaximCBFill();
            cbCabs.ItemsSource = connection.dtCBNaxim.DefaultView;
            cbCabs.SelectedValuePath = "ID_Territory_Аudiences";
            cbCabs.DisplayMemberPath = "Number_Cabinet";
        }
        /// <summary>
        /// Функция получение данных из БД путем подключения и ввода зпроса
        /// </summary>
        private void lbNejka()
        {
            DBConnection connection = new DBConnection();
            connection.qrNejkaCBFill();
            cbCabs.ItemsSource = connection.dtCBNejka.DefaultView;
            cbCabs.SelectedValuePath = "ID_Territory_Аudiences";
            cbCabs.DisplayMemberPath = "Number_Cabinet";
        }
        /// <summary>
        /// Функция получение данных из БД путем подключения и ввода зпроса
        /// </summary>
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.qrNamesFIll();
            cbEmploye.ItemsSource = connection.dtNames.DefaultView;
            cbEmploye.SelectedValuePath = "ID_NLP";
            cbEmploye.DisplayMemberPath = "sotrydniki";
            connection.qrTerritoryFill();
            CbTerritory.ItemsSource = connection.dtTerritory.DefaultView;
            CbTerritory.SelectedValuePath = "ID_View";
            CbTerritory.DisplayMemberPath = "Territories";
        }

        //Вызов функция другого класса
        DBProcedures procedures = new DBProcedures();


        public static string Terra = "0"; //Переменная хранящая в себе статическое число для данных по территории
        public static string Cabs = "0";    //Переменная хранящая в себе статическое число для данных по кабинетам
        public static string Employe = "0"; //Переменная хранящая в себе статическое число для данных по сотрудникам
        /// <summary>
        /// Функция получение данных из БД путем подключения и ввода зпроса
        /// </summary>
        /// <param name="QR"></param>
        private void dgFIll(string QR)
        {
            Action action = () =>
            {
                try
                {
                    string cmd = $"SELECT Distribution.ID_Distribution,ID_Territory_Аudiences,Territory_Аudiences.Number_Cabinet as 'Номер кабинета', Distribution.Priority as 'Приоритет',Employees.Surname + ' ' + Employees.Name + ' ' + Employees.Second_Name AS 'ФИО' FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences INNER JOIN dbo.Traning_Area ON Territory_Аudiences.Traning_Area_ID = Traning_Area.ID_Training_Area WHERE Number_Cabinet = '{Cabs}' AND SurName + ' ' + Name + ' ' + Second_Name = '{Employe}'";
                    SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                    DBConnection.Connection.Open();
                    createCommand.ExecuteNonQuery();
                    SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                    System.Data.DataTable dt = new System.Data.DataTable("ID_Territory_Аudiences"); // В скобках указываем название таблицы
                    dataAdp.Fill(dt);
                    dgSoedinenie.ItemsSource = dt.DefaultView; // Сам выводэ
                    dgSoedinenie.Columns[0].Visibility = Visibility.Collapsed;
                    dgSoedinenie.Columns[1].Visibility = Visibility.Collapsed;
                    DBConnection.Connection.Close();
                }
                catch
                {

                }
            };
            Dispatcher.Invoke(action);
        }
        /// <summary>
        /// Функция получение данных из БД путем подключения и ввода зпроса
        /// </summary>
        /// <param name="QR"></param>
        private void Obnivit(string QR)
        {
            Action action = () =>
            {
                string cmd = "";
                SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                DBConnection.Connection.Open();
                createCommand.ExecuteNonQuery();
                SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                System.Data.DataTable dt = new System.Data.DataTable("Territory2"); // В скобках указываем название таблицы
                dataAdp.Fill(dt);
                dgSoedinenie.ItemsSource = dt.DefaultView; // Сам вывод
                dgSoedinenie.Columns[0].Visibility = Visibility.Collapsed;

                DBConnection.Connection.Close();
            };
            Dispatcher.Invoke(action);
        }
        private void Dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            throw new NotImplementedException();
        }

        private void cbEmploye_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        /// <summary>
        /// Функция при выборе данных в combox 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CbTerritory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CbTerritory.Text.ToString() == "Нахимовский")
            {
                lbNejka();
            }
            else
            {
                lbFillCabimet();
            }
        }

        private void cbCabs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        /// <summary>
        /// Функция вызова окна, прогрузка datagrid , combox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            lbFill();
            dgFIll(QR);
        }

        /// <summary>
        /// Свойство кнопки для "поиска"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DataRowView dataRowView = (DataRowView)((Button)e.Source).DataContext;
            Terra = CbTerritory.Text.ToString();
            Cabs = cbCabs.Text.ToString();
            Employe = cbEmploye.Text.ToString();
            dgFIll(QR);
        }
        /// <summary>
        /// Свойство кнопки "Добавить"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (cbCabs.SelectedIndex == null || cbCabs.Text == "" && cbEmploye.SelectedIndex == null || cbEmploye.Text == "" && CbTerritory.SelectedIndex == null || CbTerritory.Text == "")
            {
                MessageBox.Show("Поля заполнения пустые, проверьте поля на заполнения значениями");
            }
            else
            {
                try
                {
                    procedures.spdistribution_insert(Convert.ToInt32(tbPrioritet.Text), Convert.ToInt32(cbCabs.SelectedValue), Convert.ToInt32(cbEmploye.SelectedValue));
                }
                catch
                {
                    MessageBox.Show("Ошибка при добавлении, проверьте правильность заполнения, возможно данные уже существуют");
                }
            }
            dgFIll(QR);
        }
        /// <summary>
        /// Свойство кнопки удалить
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                for (int i = 0; i < dgSoedinenie.SelectedItems.Count; i++)
                {
                    try
                    {
                        switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
                        {
                            case MessageBoxResult.Yes:
                                DataRowView ID = (DataRowView)dgSoedinenie.SelectedItems[i];
                                procedures.spdistribution_delete(Convert.ToInt32(ID["ID_Distribution"]));
                                break;
                        }
                    }
                    catch
                    {

                    }
                }
            }
            catch
            {
                MessageBox.Show("Ошибка при удалении, проверьте правильность заполнения, возможно данные уже удалены");
            }
            dgFIll(QR);
        }
        /// <summary>
        /// Свойство кнопки изменить
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            if (cbCabs.SelectedIndex == null || cbCabs.Text == "" && cbEmploye.SelectedIndex == null || cbEmploye.Text == "" && CbTerritory.SelectedIndex == null || CbTerritory.Text == "")
            {
                MessageBox.Show("Поля заполнения пустые, проверьте поля на заполнения значениями");
            }
            else
            {
                try
                {
                    DataRowView ID = (DataRowView)dgSoedinenie.SelectedValue;
                    procedures.spdistribution_Update(Convert.ToInt32(ID["ID_Distribution"]), Convert.ToInt32(tbPrioritet.Text), Convert.ToInt32(cbCabs.SelectedValue), Convert.ToInt32(cbEmploye.SelectedValue));
                }
                catch
                {
                    MessageBox.Show("Ошибка при изменении, проверьте правильность заполнения");
                }
            }
            dgFIll(QR);
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            Statistics statistics = new Statistics();
            statistics.Show();
            Hide();
        }
        
        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            EXCEL_PROCEDURE statistics = new EXCEL_PROCEDURE();
            statistics.Show();
            Hide();
        }
    }
}
