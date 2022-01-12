using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
using MessageBox = System.Windows.MessageBox;
using Microsoft.Office.Interop.Excel;
using Window = System.Windows.Window;

namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Diplomas.xaml
    /// </summary>
    public partial class Diplomas : Window
    {
        public Diplomas()
        {
            InitializeComponent();
        }
        private string QR = "";
        DBProcedure procedures = new DBProcedure();
        Document_Class document = new Document_Class();

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrDiplomas;
            dgFill(QR);
            lbFill();
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            PrepodMenu mainWindow = new PrepodMenu();
            mainWindow.Show();
            Hide();
        }
        private void dgFill(string qr)
        {
            {
                System.Action action = () =>
                {
                    DBConnection connection = new DBConnection();
                    DBConnection.qrDiplomas = qr;
                    connection.DiplomasFill();
                    connection.Dependency.OnChange += Dependency_OnChange;
                    dgSpisokS.ItemsSource = connection.dtDiplomas.DefaultView;
                    dgSpisokS.Columns[0].Visibility = Visibility.Collapsed;
                    dgSpisokS.Columns[4].Visibility = Visibility.Collapsed;
                };
                Dispatcher.Invoke(action);
            }
        }
        private void lbFill()
        {
            DBConnection connection = new DBConnection();
            connection.Results_WRCFill();
            cbAOS.ItemsSource = connection.dtResults_WRC.DefaultView;
            cbAOS.SelectedValuePath = "ID_Results_WRC";
            cbAOS.DisplayMemberPath = "Ball_WRC";
            connection.DiplomasFill();
            cbInfoGroup.ItemsSource = connection.dtDiplomas.DefaultView;
            cbInfoGroup.SelectedValuePath = "ID_Diplomas";
            cbInfoGroup.DisplayMemberPath = "Name_Diplomas";
            connection.DiplomasFill();
            cbInfoGroup_Copy1.ItemsSource = connection.dtDiplomas.DefaultView;
            cbInfoGroup_Copy1.SelectedValuePath = "ID_Diplomas";
            cbInfoGroup_Copy1.DisplayMemberPath = "Number_Diplomas";
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
                case ("ID_Staff"):
                    e.Column.Header = "Назваение диплома";
                    break;
                case ("Surname_Staff"):
                    e.Column.Header = "Фамилия";
                    break;
                case ("Name_Staff"):
                    e.Column.Header = "Имя";
                    break;
                case ("Middlename_Staff"):
                    e.Column.Header = "Отчество";
                    break;
                case ("ID_Diplomas"):
                    e.Column.Header = "Номер диплома";
                    break;
                case ("Name_Diplomas"):
                    e.Column.Header = "Наименование";
                    break;
                case ("Number_Diplomas"):
                    e.Column.Header = "Номер диплома";
                    break;
                case ("Results_WRC_ID"):
                    e.Column.Header = "Результаты";
                    break;
                case ("Date_WRC"):
                    e.Column.Header = "Дата ВКР";
                    break;
                case ("Ball_WRC"):
                    e.Column.Header = "Оценка ВКР";
                    break;
            }
        }

        private void btInsert_Click(object sender, RoutedEventArgs e)
        {
            procedures.spDiplomas_insert(tbNameDiplom.Text, tbNumberDiplom.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
        }

        private void btUpdate_Click(object sender, RoutedEventArgs e)
        {
            DataRowView ID = (DataRowView)dgSpisokS.SelectedValue;
            procedures.spDiplomas_Update(Convert.ToInt32(ID["ID_Diplomas"]), tbNameDiplom.Text, tbNumberDiplom.Text, Convert.ToInt32(cbAOS.SelectedValue));
            dgFill(QR);
        }

        private void btDelete_Click(object sender, RoutedEventArgs e)
        {
            switch (MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo, MessageBoxImage.Warning))
            {
                case MessageBoxResult.Yes:
                    DataRowView ID = (DataRowView)dgSpisokS.SelectedItems[0];
                    procedures.spDiplomas_delete(Convert.ToInt32(ID["ID_Diplomas"]));
                    dgFill(QR);
                    break;
            }
        }
        private void btWord_Click(object sender, RoutedEventArgs e)
        {
            Document_Class document = new Document_Class();
            DBConnection dBConnection = new DBConnection();
            dBConnection.DiplomasFill();
            document.Document_Create(Document_Class.Document_Type.List, Document_Class.Document_Format.Word, "Дипломы", dBConnection.dtDiplomas);
        }

        private void btPDF_Click(object sender, RoutedEventArgs e)
        {
            Document_Class document = new Document_Class();
            DBConnection dBConnection = new DBConnection();
            dBConnection.DiplomasFill();
            document.Document_Create(Document_Class.Document_Type.List, Document_Class.Document_Format.PDF, "Диплом", dBConnection.dtDiplomas);
        }

        private void btExcel_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();

            excel.Visible = true;
            Workbook workbook = excel.Workbooks.Add(System.Reflection.Missing.Value);
            Worksheet sheet1 = (Worksheet)workbook.Sheets[1];
            Range range;
            Range myRange;
            for (int i = 1; i < dgSpisokS.Columns.Count; i++)
            {
                range = (Range)sheet1.Cells[1, i + 1];
                sheet1.Cells[1, i + 1].Font.Bold = true;
                range.Value = dgSpisokS.Columns[i].Header;

                for (int j = 0; j < dgSpisokS.Items.Count; j++)
                {
                    TextBlock b = dgSpisokS.Columns[i].GetCellContent(dgSpisokS.Items[j]) as TextBlock;
                    myRange = sheet1.Cells[j + 2, i + 1];
                    myRange.Value = b.Text;
                }
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            foreach (DataRowView dataRow in (DataView)dgSpisokS.ItemsSource)
            {
                if (dataRow.Row.ItemArray[1].ToString() == cbInfoGroup.Text ||
                    (dataRow.Row.ItemArray[2].ToString() == cbInfoGroup_Copy1.Text))
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
                        " where [ID_Diplomas] = "
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
                        " where [ID_Diplomas] = "
                        + cbInfoGroup_Copy1.SelectedValue.ToString();
                    dgFill(newQR);
                    break;
                case (false):
                    dgFill(QR);
                    break;
            }
        }
    }
}