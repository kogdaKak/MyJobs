using LiveCharts;
using System;
using System.Collections.Generic;
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
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using System.Data.SqlClient;

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для Statistics.xaml
    /// </summary>
    public partial class Statistics : Window
    {
        private SqlCommand command = new SqlCommand();

        public SeriesCollection SeriesCollection { get; set; }
        System.Data.DataTable dt;
        string KolVo;
        string Cabs;
        string KolVo2;
        string Cabs2;
        string KolVo3;
        string Cabs3;
        int BDStolbez = 0;
        int BDStolbezZ = 1;
        int BDStroka = 0;
        /// <summary>
        /// Функция вывода статистики кол-во сотрудников в кабинете
        /// </summary>
        public Statistics()
        {
            string cmd = "SELECT COUNT( Distribution.NLP_ID), Number_Cabinet FROM dbo.NLP INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences WHERE Number_Cabinet = '100' GROUP BY Number_Cabinet";
            SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
            DBConnection.Connection.Open();
            createCommand.ExecuteNonQuery();
            SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
            dt = new System.Data.DataTable("Employee"); // В скобках указываем название таблицы
            dataAdp.Fill(dt);
            DBConnection.Connection.Close();
            string cmd2 = "SELECT COUNT( Distribution.NLP_ID), Number_Cabinet FROM dbo.NLP INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences WHERE Number_Cabinet = '101' GROUP BY Number_Cabinet";
            SqlCommand createCommand2 = new SqlCommand(cmd2, DBConnection.Connection);
            DBConnection.Connection.Open();
            createCommand.ExecuteNonQuery();
            SqlDataAdapter dataAdp2 = new SqlDataAdapter(createCommand2);
            var dt2 = new System.Data.DataTable("Employee"); // В скобках указываем название таблицы
            dataAdp2.Fill(dt2);
            DBConnection.Connection.Close();
            string cmd3 = "SELECT COUNT( Distribution.NLP_ID), Number_Cabinet FROM dbo.NLP INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences WHERE Number_Cabinet = '321' GROUP BY Number_Cabinet";
            SqlCommand createCommand3 = new SqlCommand(cmd3, DBConnection.Connection);
            DBConnection.Connection.Open();
            createCommand3.ExecuteNonQuery();
            SqlDataAdapter dataAdp3 = new SqlDataAdapter(createCommand3);
            var dt3 = new System.Data.DataTable("Employee"); // В скобках указываем название таблицы
            dataAdp3.Fill(dt3);
            DBConnection.Connection.Close();


            Cabs = dt.Rows[BDStroka].ItemArray[BDStolbezZ].ToString();
            KolVo = dt.Rows[BDStroka].ItemArray[BDStolbez].ToString();
            Cabs2 = dt2.Rows[BDStroka].ItemArray[BDStolbezZ].ToString();
            KolVo2 = dt2.Rows[BDStroka].ItemArray[BDStolbez].ToString();
            Cabs3 = dt3.Rows[BDStroka].ItemArray[BDStolbezZ].ToString();
            KolVo3 = dt3.Rows[BDStroka].ItemArray[BDStolbez].ToString();
            SeriesCollection = new SeriesCollection
                    {
                        new PieSeries
                        {
                            Title = Cabs.ToString(),
                            Values = new ChartValues<ObservableValue> { new ObservableValue(Convert.ToInt32(KolVo.ToString())) },
                            DataLabels = true
                        },
                        new PieSeries
                        {
                            Title = Cabs2.ToString(),
                            Values = new ChartValues<ObservableValue> { new ObservableValue(Convert.ToInt32(KolVo2.ToString())) },
                            DataLabels = true
                        },
                        new PieSeries
                        {
                            Title = Cabs3.ToString(),
                            Values = new ChartValues<ObservableValue> { new ObservableValue(Convert.ToInt32(KolVo3.ToString())) },
                            DataLabels = true
                        },
                    };
                DataContext = this;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow import = new MainWindow();
            import.Show();
            Hide();
        }
    }
}
