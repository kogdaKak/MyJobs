using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
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
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {
        Configuration_class configuration = new Configuration_class();

        public Authorization()
        {
            InitializeComponent();
        }

        public static string Number_Specialty = "0";
        private string QR2 = "";
        private int pot;
        string data;
        System.Data.DataTable dt;
        System.Data.DataTable dt2;

        private void btEnter_Click(object sender, RoutedEventArgs e)
        {
            if (tbLogin.Text.Length > 0) // проверяем введён ли логин     
            {
                if (psBox.Password.Length > 0) // проверяем введён ли пароль         
                {             // ищем в базе данных пользователя с такими данными 
                    string cmd = $"SELECT [RightsId_Rights] FROM [dbo].[Accounts] WHERE [login] = '{tbLogin.Text}' AND [Password] = '{psBox.Password}' AND ( [RightsId_Rights] = 1 OR [RightsId_Rights] = 2 OR [RightsId_Rights] = 3)";
                    SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                    DBConnection.Connection.Open();
                    createCommand.ExecuteNonQuery();
                    SqlDataAdapter dataAdp = new SqlDataAdapter(createCommand);
                    dt = new System.Data.DataTable("RightsId_Rights"); // В скобках указываем название таблицы
                    dataAdp.Fill(dt);
                    DBConnection.Connection.Close();

                    //Определение Email сотрудника по его логину с помощью запроса
                    string cmd2 = $"SELECT [Email] FROM [dbo].[Accounts] WHERE [Login] = '{tbLogin.Text}'";
                    SqlCommand createCommand2 = new SqlCommand(cmd2, DBConnection.Connection);
                    DBConnection.Connection.Open();
                    createCommand2.ExecuteNonQuery();
                    SqlDataAdapter dataAdp2 = new SqlDataAdapter(createCommand2);
                    dt2 = new System.Data.DataTable("Email"); // В скобках указываем название таблицы
                    dataAdp2.Fill(dt2);
                    DBConnection.Connection.Close();

                    for (int BDStolbez = 0; BDStolbez < dt.Columns.Count; BDStolbez++)
                    {
                        for (int BDStroka = 0; BDStroka < dt2.Rows.Count; BDStroka++)
                        {
                            data = dt2.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                        }
                    }
                    //Проверка на введёный элеткронный адрес
                    if (data != null)
                    {
                        //Формирование сообцения 
                        SmtpClient CLient = new SmtpClient();
                        CLient.Credentials = new NetworkCredential("i_d.a.dmitrov@mpt.ru", "zvqehpgqomckkjsa");
                        CLient.Host = "smtp.gmail.com";
                        CLient.Port = 587;
                        CLient.EnableSsl = true;
                        MailMessage mail = new MailMessage();
                        mail.From = new MailAddress("i_d.a.dmitrov@mpt.ru");
                        
                        mail.To.Add(new MailAddress(data.ToString()));
                        mail.Subject ="Код для авторизации." + DateTime.Now;
                        //Генерация случайного кода для проверки
                        Random r = new Random();
                        int n = r.Next(100000, 999999);
                        pot = n;
                        mail.Body = "Код подтверждения: " + pot.ToString();
                        CLient.Send(mail);
                        tb_kod.IsEnabled = true;
                        
                    }
                    else
                        //Сообщение об ошибке если Email сотрудника не существует
                        MessageBox.Show("Такого Email не существует!", "Ошибка", MessageBoxButton.OK,
                            MessageBoxImage.Warning);

                    
                }
                else MessageBox.Show("Введите пароль"); // выводим ошибку    
            }
            else MessageBox.Show("Введите логин"); // выводим ошибку 
        }

        private void btReg_Click(object sender, RoutedEventArgs e)
        {
            Registration registration = new Registration();
            registration.Show();
            Hide();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Thread thread = new Thread(configuration.Connection_Checking);
            thread.Start();
            configuration.Connection_Check += Configuration_Connection_Check;
        }

        private void Configuration_Connection_Check(bool obj)
        {
            Action action = () =>
            {
                if (obj)
                {
                    MessageBox.Show("Connection open!");
                }
                else
                {
                    Сonnection_Сonfiguration сonnection = new Сonnection_Сonfiguration();
                    сonnection.ShowDialog();
                }
            };
            Dispatcher.Invoke(action);
        }

        private void btOkey_Click(object sender, RoutedEventArgs e)
        {
            if (tb_kod.Text.Length != 0)
            {
                if (Convert.ToInt32(tb_kod.Text.ToString()) == pot)
                {
                    if (dt != null && !dt.Equals(0))
                    {
                        if (dt.Equals(1))
                        {
                            MessageBox.Show("Admin"); // говорим, что авторизовался как администратор
                            MainWindow import = new MainWindow();
                            import.Show();
                            Hide();
                        }
                        else
                        {
                            if (dt.Equals(2))
                            {
                                MessageBox.Show("Заведущий лабораториями"); // говорим, что авторизовался как заведующий лабораториями
                                Distribution_Priority distribution_Priority = new Distribution_Priority();
                                distribution_Priority.Show();
                                Hide();
                            }
                            else
                            {
                                if (dt.Equals(3))
                                {
                                    MessageBox.Show("Лаборант"); // говорим, что авторизовался как лаборант
                                    Distribution_Priority distribution_Priority = new Distribution_Priority();
                                    distribution_Priority.Show();
                                    Hide();
                                }
                            }
                        }
                        MessageBox.Show("Пользователь авторизовался"); // говорим, что авторизовался 
                        MainWindow main = new MainWindow();
                        main.Show();
                        Hide();
                    }
                    else
                    {
                        MessageBox.Show("Пользователя не найден"); // выводим ошибку
                    }
                }
                //Сообщение об ошибке, если введеный код неверный
                else MessageBox.Show("Неверный код!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            //Сообщение об ошибке, когда поле для кода пустое, требуется его ввести
            else MessageBox.Show("Пожалуйста введите код из почты!", "!", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        private void Hyperlink_Click(object sender, RoutedEventArgs e)
        {
            Change_Password change_Password = new Change_Password();
            change_Password.Show();
            Hide();
        }
    }
}
