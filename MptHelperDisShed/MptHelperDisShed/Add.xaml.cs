using Microsoft.Office.Interop.Excel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Action = System.Action;
using Window = System.Windows.Window;

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class Add : Window
    {
        private string QR = "";
        DBProcedures procedures = new DBProcedures();
        public Add()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (cbNLP.SelectedValue == "")
            {
                System.Windows.MessageBox.Show("Ошибка1?", "Вы не выбрали значение 1", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            if (tbDay.Text == "")
            {
                System.Windows.MessageBox.Show("Ошибка2?", "Вы не ввели значение 1", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            if (tbNumberClasses.Text == "")
            {
                System.Windows.MessageBox.Show("Ошибка3?", "Вы не ввели значение ", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                procedures.spSchedule_NLP_insert(Convert.ToBoolean(chbOrder.IsChecked), tbDay.Text, Convert.ToInt32(tbNumberClasses.Text), Convert.ToInt32(cbNLP.SelectedValue.ToString()));
                dgFill(QR);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgNLP.SelectedValue;
            procedures.spSchedule_NLP_Update(Convert.ToInt32(ID["ID_Schedule_NLP"]), Convert.ToBoolean(chbOrder.IsChecked), tbDay.Text, Convert.ToInt32(tbNumberClasses.Text), Convert.ToInt32(cbNLP.SelectedValue.ToString()));
            dgFill(QR);
        }

        private void Button_Click_2(object sender, RoutedEventArgs e) //Нажатие на кнопку
        {
            switch (System.Windows.MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning)) //Вызов оператор выбора (Работа с messages)
            {
                case MessageBoxResult.Yes: //Условие оператора
                    DataRowView ID = (DataRowView)dgNLP.SelectedItems[0];
                    procedures.spSchedule_NLP_delete(Convert.ToInt32(ID["ID_Schedule_NLP"])); //Вызов процедуры
                    dgFill(QR);
                    break;
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrSchedule_NLP;
            dgFill(QR);
            lbFill();
        }

        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.NLPFill();
            cbNLP.ItemsSource = connection.dtNLP.DefaultView;
            cbNLP.SelectedValuePath = "ID_NLP";
            cbNLP.DisplayMemberPath = "Date_Forming";
        }

        private void dgFill(string qr)
        {
            Action action = () =>
            {
                DBConnection connection = new DBConnection();
                DBConnection.qrSchedule_NLP = qr;
                connection.Schedule_NLPFill();
                connection.Dependency.OnChange += Dependency_OnChange;
                dgNLP.ItemsSource = connection.dtSchedule_NLP.DefaultView;
                dgNLP.Columns[0].Visibility = Visibility.Collapsed;
            };
            Dispatcher.Invoke(action);
        }

        private void Dependency_OnChange(object sender, System.Data.SqlClient.SqlNotificationEventArgs e)
        {
            if (e.Info != SqlNotificationInfo.Invalid)
                dgFill(QR);
        }

        private void ChangeSize(int x, int y)
        {
            if ((x >= 0 && y >= 0) || (x < 800 && y < 600))
            {
                cbNLP.FontSize = 12;
                tbDay.FontSize = 12;
                tbNumberClasses.FontSize = 12;
                btBut.FontSize = 12;
                btClasses.FontSize = 12;
                btDelete.FontSize = 12;
                btEmploye.FontSize = 12;
                btExcel.FontSize = 12;
                btInsert.FontSize = 12;
                btRaspisanie.FontSize = 12;
                btShelder.FontSize = 12;
                btUpdate.FontSize = 12;
                chbOrder.FontSize = 12;
            }
            else
            {
                if ((x >= 800 && y >= 600) || (x <= 1280 && y <= 1024))
                {
                    cbNLP.FontSize = 24;
                    tbDay.FontSize = 24;
                    tbNumberClasses.FontSize = 24;
                    btBut.FontSize = 24;
                    btClasses.FontSize = 24;
                    btDelete.FontSize = 24;
                    btEmploye.FontSize = 24;
                    btExcel.FontSize = 24;
                    btInsert.FontSize = 24;
                    btRaspisanie.FontSize = 24;
                    btShelder.FontSize = 24;
                    btUpdate.FontSize = 24;
                    chbOrder.FontSize = 24;
                }
                else
                {
                    if ((x > 1280 && y > 1024) || (x <= 1680 && y <= 1050))
                    {
                        cbNLP.FontSize = 36;
                        tbDay.FontSize = 36;
                        tbNumberClasses.FontSize = 36;
                        btBut.FontSize = 36;
                        btClasses.FontSize = 36;
                        btDelete.FontSize = 36;
                        btEmploye.FontSize = 36;
                        btExcel.FontSize = 36;
                        btInsert.FontSize = 36;
                        btRaspisanie.FontSize = 36;
                        btShelder.FontSize = 36;
                        btUpdate.FontSize = 36;
                        chbOrder.FontSize = 36;
                    }
                }
            }
        }
        private void dgNLP_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            switch (e.Column.Header)
            {
                case ("ID_Schedule_NLP"):
                    e.Column.Header = "ID_Schedule_NLP";
                    break;
                case ("Order_Week"):
                    e.Column.Header = "Числитель/знаминатель";
                    break;
                case ("Day_Week"):
                    e.Column.Header = "День недели";
                    break;
                case ("Number_Classes"):
                    e.Column.Header = "Номер занятия";
                    break;
                case ("Date_Forming"):
                    e.Column.Header = "Дата формирования";
                    break;
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();

            excel.Visible = true;
            Workbook workbook = excel.Workbooks.Add(System.Reflection.Missing.Value);
            Worksheet sheet1 = (Worksheet)workbook.Sheets[1];
            Range range;
            Range myRange;
            for (int i = 1; i < dgNLP.Columns.Count; i++)
            {
                range = (Range)sheet1.Cells[1, i + 1];
                sheet1.Cells[1, i + 1].Font.Bold = true;
                range.Value = dgNLP.Columns[i].Header;

                for (int j = 0; j < dgNLP.Items.Count; j++)
                {
                    TextBlock a = dgNLP.Columns[i].GetCellContent(dgNLP.Items[j]) as TextBlock;
                    myRange = sheet1.Cells[j + 2, i + 1];
                    myRange.Value = a.Text;
                }
            }
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            Distributon main = new Distributon();
            main.Show();
            Hide();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            Group main = new Group();
            main.Show();
            Hide();
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            Employe main = new Employe();
            main.Show();
            Hide();
        }

        private void Window_Closed(object sender, EventArgs e)
        {

        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            Auditorniy main = new Auditorniy();
            main.Show();
            Hide();
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            //Import main = new Import();
            //main.Show();
            //Hide();
        }

        private void cbInfoGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (chbFilter.IsChecked)
            {
                case (true):
                    string newQR = QR +
                        " where [ID_NLP] = "
                        + cbNLP.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }

        private void chbOrder_Click(object sender, RoutedEventArgs e)
        {
            if (chbOrder.IsChecked == true)
            {
                chbOrder.Content = "Числитель";
            }
            if (chbOrder.IsChecked == false)
            {
                chbOrder.Content = "Знаминатель";
            }
        }

        private void Serch_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgNLP.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbNLP.Text ||
                    (dataRow.Row.ItemArray[2].ToString() == tbNumberClasses.Text ||
                    (dataRow.Row.ItemArray[2].ToString() == tbDay.Text)))
                {
                    dgNLP.SelectedItem = dataRow;
                }
            }
        }

        private void Word_Click(object sender, RoutedEventArgs e)
        {
            Document_Class document = new Document_Class();
            DBConnection dBConnection = new DBConnection();
            dBConnection.Schedule_NLPFill();
            document.Document_Create(Document_Class.Document_Type.List, Document_Class.Document_Format.Word, Window.Title, dBConnection.dtSchedule_NLP);
        }
    }
}
