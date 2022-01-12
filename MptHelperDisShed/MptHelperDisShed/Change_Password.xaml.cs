using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
    /// Логика взаимодействия для Change_Password.xaml
    /// </summary>
    public partial class Change_Password : Window
    {
        public Change_Password()
        {
            InitializeComponent();
        }
        private int pot;
        /// <summary>
        /// Выход на окно авторизации
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Bt_Exit_Click(object sender, RoutedEventArgs e)
        {
            Authorization authorization = new Authorization();
            authorization.Show();
            Hide();
        }

        /// <summary>
        /// Функция восстановления пароля через почту
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Bt_Otp(object sender, RoutedEventArgs e)
        {
            //Проверка введённой почты
            string cmd = $"SELECT [Email] FROM [dbo].[Accounts] WHERE [Email] = '{tb_email.Text}'";
            SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
            DBConnection.Connection.Open();
            var dt = createCommand.ExecuteScalar();
            DBConnection.Connection.Close();

            //Проверка на введёный элеткронный адрес
            if (dt != null)
            {
                //Формирование сообцения 
                SmtpClient CLient = new SmtpClient();
                CLient.Credentials = new NetworkCredential("i_d.a.dmitrov@mpt.ru", "svkdyrhyudzevdld");
                CLient.Host = "smtp.gmail.com";
                //CLient.Port = 465;
                CLient.Port = 587;
                CLient.EnableSsl = true;
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("i_d.a.dmitrov@mpt.ru");
                mail.To.Add(new MailAddress(dt.ToString()));
                mail.Subject =
                    "Восстановление пароля. " + DateTime.Now;

                //Генерация рандомного кода для проверки
                Random r = new Random();
                int n = r.Next(100000, 999999);
                pot = n;
                mail.Body = "Код подтверждения: " + pot.ToString();
                CLient.Send(mail);

                tb_Conf.Visibility = Visibility.Visible;
                bt_Otp.IsEnabled = false;
                lbl_POT.Visibility = Visibility.Visible;
                bt_Potverdit.Visibility = Visibility.Visible;
            }
            else
                MessageBox.Show("Введён неверный E-mail адрес, проверьте его и повторите попытку!", "Ошибка", MessageBoxButton.OK,
                    MessageBoxImage.Warning);
        }

        /// <summary>
        /// Проверка кода
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Bt_Potverdit_OnClick(object sender, RoutedEventArgs e)
        {
            if (tb_Conf.Text.Length != 0)
            {
                if (Convert.ToInt32(tb_Conf.Text.ToString()) == pot)
                {
                    bt_Potverdit.Visibility = Visibility.Hidden;
                    bt_Potverdit2.Visibility = Visibility.Visible;
                    tb_Conf.Visibility = Visibility.Collapsed;
                    tb_password.Visibility = Visibility.Visible;
                    tb_password2.Visibility = Visibility.Visible;
                    lbl_POT.Visibility = Visibility.Hidden;
                    lbl_Ch_Pass1.Visibility = Visibility.Visible;
                    lbl_Ch_Pass2.Visibility = Visibility.Visible;
                }
                else MessageBox.Show("Неверный код!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else MessageBox.Show("Пожалуйста введите код из почты!", "!", MessageBoxButton.OK, MessageBoxImage.Warning);
        }

        /// <summary>
        /// Смена пароля и проверка полей ввода на пустые значения и совпадение паролей
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Bt_Potverdit2_OnClick(object sender, RoutedEventArgs e)
        {
            //Условие / Проверка на пустые поля
            if (tb_password.Password == "" | tb_password2.Password == "")
            {
                //Сообщение об ошибке
                MessageBox.Show("Поля не заполнены!" +
                " Заполните поля и повторите попытку ввода!", "Ошибка",
                MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                //Сравнение паролей
                if (tb_password.Password != tb_password2.Password)
                {
                    //Сообщение об ошибке
                    MessageBox.Show("Пороли не совпадают!" +
                    " Проверьте их и повторите попытку!", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                else
                {
                    string cmd = $"SELECT [Id_Account] FROM [dbo].[Accounts] WHERE [Email] = '{tb_email.Text}'";
                    SqlCommand createCommand = new SqlCommand(cmd, DBConnection.Connection);
                    DBConnection.Connection.Open();
                    var dt = createCommand.ExecuteScalar();
                    DBConnection.Connection.Close();

                    DBProcedures procedures = new DBProcedures();

                    procedures.UpdatePassword(Convert.ToInt32(dt.ToString()), tb_password.Password);

                    MessageBox.Show("Пароль успешно обновлен!");
                    new Authorization().Show();
                    Hide();

                }
            }
        }
    }
}
