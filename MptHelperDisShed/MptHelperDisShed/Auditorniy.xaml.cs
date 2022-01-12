using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using Action = System.Action;

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для Auditorniy.xaml
    /// </summary>
    public partial class Auditorniy : System.Windows.Window
    {
        private string QR = "";
        DBProcedures procedures = new DBProcedures();
        public Auditorniy()
        {
            InitializeComponent();
        }
        private void windowWidthHeigh()
        {
            dgFillf.Width = Window.Width;
            dgFillf.Height = Window.Height;
            GridMenu.Height = Window.Height;
            GridMenu.Width = Window.Width;
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.ViewRaspisanieFill();
            cbGroup.ItemsSource = connection.dtViewRaspisanie.DefaultView;
            cbGroup.SelectedValuePath = "ID_Schedule_NLP";
            cbGroup.DisplayMemberPath = "Name_Group";
        }

        private void dgFill(string qr)
        {
            {
                Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrViewRaspisanie = qr;
                    connection.ViewRaspisanieFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgFillf.ItemsSource = connection.dtViewRaspisanie.DefaultView;
                    dgFillf.Columns[2].Visibility = Visibility.Collapsed;
                    dgFillf.Columns[7].Visibility = Visibility.Collapsed;
                    dgFillf.Columns[6].Visibility = Visibility.Collapsed;

                };
                Dispatcher.Invoke(action);
            }
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid) ;
            dgFill(QR);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrViewRaspisanie;
            dgFill(QR);
            lbFill();
            windowWidthHeigh();
        }

        private void dgFillf_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("Order_Week"):
                    e.Column.Header = "Числитель/знаминатель";
                    break;
                case ("Day_Week"):
                    e.Column.Header = "День недели";
                    break;
                case ("Number_Classes"):
                    e.Column.Header = "Номер Занятия";
                    break;
                case ("Name_Group"):
                    e.Column.Header = "Номер группы";
                    break;
                case ("Number_Specialty"):
                    e.Column.Header = "Номер специальности";
                    break;
                case ("Number_Cabinet"):
                    e.Column.Header = "Номер кабинета";
                    break;
                case ("Name_View_Cabinet"):
                    e.Column.Header = "Территория";
                    break;
            }
        }


        private void cbGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chBox.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Schedule_NLP] = "
                        + cbGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void cbClasses_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chBox.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_Schedule_NLP] = "
                        + cbGroup.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            Hide();
        }

        private void Button_ex(object sender, RoutedEventArgs e)
        {
            Document_Class document = new Document_Class();
            DBConnection dBConnection = new DBConnection();
            dBConnection.ViewRaspisanieFill();
            document.Document_Create(Document_Class.Document_Type.List, Document_Class.Document_Format.Word, Window.Title, dBConnection.dtViewRaspisanie);
        }

        private void Serch_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgFillf.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbGroup.Text)
                {
                    dgFillf.SelectedItem = dataRow;
                }
            }
        }

        public static string Number_Specialty = "0";
        private string QR2 = "";
        DBConnection dBConnection = new DBConnection();
        private void dgFill1(string qr2)
        {
            Action action = () =>
            {
                string cmd = "SELECT Number_Specialty, Name_Group FROM[dbo].[GGroup] INNER JOIN[dbo].[Specialty] ON [GGroup].[Specialty_ID]= [Specialty].[ID_Specialty] WHERE Number_Specialty = '" + Number_Specialty + "'";
                SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                DBConnection.Connection.Open();
                createCommand.ExecuteNonQuery();
                SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                System.Data.DataTable dt = new System.Data.DataTable("Specialty"); // В скобках указываем название таблицы
                dataAdp.Fill(dt);
                dgFillf.ItemsSource = dt.DefaultView; // Сам вывод
                DBConnection.Connection.Close();
            };
            Dispatcher.Invoke(action);
        }
        public static string Name_Group = "0";
        private string QR3 = "";
        private void dgFill2(string qr3)
        {
            Action action = () =>
            {
                string cmd = "  SELECT GGroup.Name_Group ,Schedule_NLP.Order_Week ,Schedule_NLP.Day_Week ,Schedule_NLP.Number_Classes FROM dbo.NLP INNER JOIN dbo.GGroup ON NLP.Group_ID = GGroup.ID_Group INNER JOIN dbo.Schedule_NLP ON Schedule_NLP.NLPp_ID = NLP.ID_NLP WHERE ggROUP.Name_Group = '" + Name_Group + "'";
                SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                DBConnection.Connection.Open();
                createCommand.ExecuteNonQuery();
                SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                System.Data.DataTable dt = new System.Data.DataTable("GGroup"); // В скобках указываем название таблицы
                dataAdp.Fill(dt);
                dgFillf.ItemsSource = dt.DefaultView; // Сам вывод
                DBConnection.Connection.Close();
            };
            Dispatcher.Invoke(action);
        }

        private void HyperLink_Group(object sender, RoutedEventArgs e)
        {
            Hyperlink link = (Hyperlink)e.OriginalSource;
            //Process.Start(link.NavigateUri.ToString());
            Name_Group = link.NavigateUri.ToString();
            //MessageBox.Show(Name_Group);
            dgFill2(QR3);
        }

        
        private void HyperLink_Speciality(object sender, RoutedEventArgs e)
        {
            Hyperlink link = (Hyperlink)e.OriginalSource;
            //Process.Start(link.NavigateUri.ToString());
            Number_Specialty = link.NavigateUri.ToString();
            //MessageBox.Show(Name_Group);
            dgFill1(QR2);
        }
        private void btEnter(object sender, RoutedEventArgs e)
        {
            DataRowView dataRowView = (DataRowView)((Button)e.Source).DataContext;
            Number_Specialty = dataRowView[5].ToString();
            //MessageBox.Show(Number_Specialty);
            dgFill1(QR2);
        }

        private void btNaiti_Click(object sender, RoutedEventArgs e)
        {
            //Number_Specialty = Convert.ToString(tbNaiti.Text.ToString());
            //dgFill1(QR2);
            dgFill(QR);
            //dgFill2(QR3);

            //Regex rg = new Regex(@"[А-Я]{1}[0-9]{1}[.]{1}[0-9]{1}([а-я]{0,17})?([a-z]{0,17})?");
            //string authors;
            //authors = Number_Specialty;
            //// Получаем все совпадения  
            //MatchCollection matchedAuthors = rg.Matches(authors);
            ///// Выводим всех подходящих авторов  
            //foreach (Match match in matchedAuthors)
            //{
            //    try
            //    {
            //        MessageBox.Show("Работает");
            //        //queryOfTables("INSERT INTO Employees values('" + FirstName + "','" + Name + "' ,'" + Surname + "' , 1 )");
            //    }
            //    catch
            //    {
            //        MessageBox.Show("НЕ НЕ НЕЕРаботает");
            //    }
            //}

        }

        private void btGroup_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}