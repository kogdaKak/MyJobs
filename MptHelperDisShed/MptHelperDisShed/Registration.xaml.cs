using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        DBProcedures procedures = new DBProcedures();

        public Registration()
        {
            InitializeComponent();
        }
        /// <summary>
        /// Функция регистрации новых пользователей.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btEnter_Click(object sender, RoutedEventArgs e)
        {
            if (tbLogin.Text.Length != 0) // проверяем логин
            {
                if (psBox.Password.Length != 0) // проверяем пароль
	            {
                    if (tbEmail.Text.Length != 0) 
		            {
                        if (tbPhone.Text.Length != 0)
                        {
                            string[] dataLogin = tbEmail.Text.Split('@'); // делим строку на две части
                            if (dataLogin.Length == 2) // проверяем если у нас две части
                            {
                                string[] data2Login = dataLogin[1].Split('.'); // делим вторую часть ещё на две части
                                if (data2Login.Length == 2)
                                {
                                    if (psBox.Password.Length >= 6)
                                    {
                                        bool en = true; // английская раскладка
                                        bool symbol = false; // символ
                                        bool number = false; // цифра

                                        for (int i = 0; i < psBox.Password.Length; i++) // перебираем символы
                                        {
                                            if (psBox.Password[i] >= 'А' & psBox.Password[i] <= 'Я') en = false; // если русская раскладка
                                            if (psBox.Password[i] >= '0' & psBox.Password[i] <= '9') number = true; // если цифры
                                            if (psBox.Password[i] == '_' || psBox.Password[i] == '-' || psBox.Password[i] == '!') symbol = true; // если символ
                                        }

                                        if (!en)
                                            MessageBox.Show("Доступна только английская раскладка"); // выводим сообщение
                                        else
                                        if (!symbol)
                                            MessageBox.Show("Добавьте один из следующих символов: _ - !"); // выводим сообщение
                                        else
                                        if (!number)
                                            MessageBox.Show("Добавьте хотя бы одну цифру"); // выводим сообщение
                                        if (en & symbol & number) // проверяем соответствие
                                        {
                                            if (tbLogin.Text.Length > 0 & tbPhone.Text.Length > 0 & tbEmail.Text.Length > 0)
                                            {
                                                SqlConnection Connection = new SqlConnection(
                                                "Data Source = DMITROVDIMAA\\SERVERDMITROV; " + "Initial Catalog = testBDD; Persist Security Info = true;" +
                                                "User ID=sa; Password=\"951159951159\"");
                                                Connection.Open();
                                                SqlCommand cmd = new SqlCommand("Insert into Accounts (login,Date_Create,password,Phone_Number,Email) values('" + tbLogin.Text + "','" + DateTime.Now + "','" + psBox.Password + "','" + tbPhone.Text + "','" + tbEmail.Text + "')", Connection);
                                                cmd.CommandType = CommandType.Text;
                                                cmd.ExecuteNonQuery();
                                                Connection.Close();
                                                SmtpClient Smtp = new SmtpClient();
                                                Smtp.Credentials = new NetworkCredential("i_d.a.dmitrov@mpt.ru", "zvqehpgqomckkjsa");
                                                Smtp.Host = "smtp.gmail.com";
                                                Smtp.Port = 587;
                                                Smtp.EnableSsl = true;
                                                MailMessage Message = new MailMessage();
                                                Message.From = new MailAddress("i_d.a.dmitrov@mpt.ru", "Dimomas");
                                                Message.To.Add(new MailAddress(tbEmail.Text));
                                                Message.Subject = "Вы были зарегестрированные в приложении MPTHelperDisShed " + DateTime.Now; ;
                                                Message.Body = "Вашь логин: '" + tbLogin.Text + "' и пароль: '" + psBox.Password + "'";
                                                Smtp.Send(Message); // Отправка
                                            }
                                        }
                                    }
                                    else MessageBox.Show("пароль слишком короткий, минимум 6 символов");
                                }
                                else MessageBox.Show("Укажите почту в форме х@x.x");
                            }
                            else MessageBox.Show("Укажите почту в форме х@x.x");
                        }
                        else MessageBox.Show("Укажите Телефон");
                    }
                    else MessageBox.Show("Укажите почту");
                }
                else MessageBox.Show("Укажите пароль");
            }
            else MessageBox.Show("Укажите логин");

            
        }

        private void Email_Click(object sender, RoutedEventArgs e)
        {
            Authorization authorization = new Authorization();
            authorization.Show();
            Hide();
        }
    }
}
