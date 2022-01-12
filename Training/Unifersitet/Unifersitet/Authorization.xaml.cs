using Microsoft.Win32;
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

namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {
        DBProcedure procedures = new DBProcedure();
        public Authorization()
        {
            SystemChek();
            switch (startup)
            {
                case true:
                    InitializeComponent();
                    tbEnterLogin.Clear();
                    tbEnterPassword.Clear();
                    ChangeSize((int)Width, (int)Height);
                    break;
                case false:
                    Close();
                    break;
            }
        }
        private void ChangeSize(int x, int y)
        {
            if ((x >= 0 && y >= 0) || (x < 800 && y < 600))
            {
                lblEnterLogin.FontSize = 12;
                lblEnterPassword.FontSize = 12;
                tbEnterLogin.FontSize = 12;
                tbEnterPassword.FontSize = 12;
                btEnter.FontSize = 12;
                btLeave.FontSize = 12;
            }
            else
            {
                if ((x >= 800 && y >= 600) || (x <= 1280 && y <= 1024))
                {
                    lblEnterLogin.FontSize = 24;
                    lblEnterPassword.FontSize = 24;
                    tbEnterLogin.FontSize = 24;
                    tbEnterPassword.FontSize = 24;
                    btEnter.FontSize = 24;
                    btLeave.FontSize = 24;
                }
                else
                {
                    if ((x > 1280 && y > 1024) || (x <= 1680 && y <= 1050))
                    {
                        lblEnterLogin.FontSize = 36;
                        lblEnterPassword.FontSize = 36;
                        tbEnterLogin.FontSize = 36;
                        tbEnterPassword.FontSize = 36;
                        btEnter.FontSize = 36;
                        btLeave.FontSize = 36;
                    }
                }
            }
        }
        private int Rolle = 1;
        private int Rollle = 2;
        bool startup = true;
        private void BtEnter_Click(object sender, RoutedEventArgs e)
        {
            DBProcedure procedures = new DBProcedure();
            Int32 ID_Record =
                procedures.Authorization(tbEnterLogin.Password.ToString(),
                tbEnterPassword.Password.ToString(), Rolle);
            switch (ID_Record)
            {
                case (0):
                    tbEnterLogin.Clear();
                    tbEnterPassword.Clear();
                    MessageBox.Show("Не верно введён логин или пароль! " +
                        "\n Повторите попытку ввода!", "Авторизация",
                        MessageBoxButton.OK, MessageBoxImage.Warning);
                    break;
                default:
                    DBConnection.IDuser = ID_Record;
                    PrepodMenu mainWindow = new PrepodMenu();
                    mainWindow.Show();
                    Hide();
                    Visibility = Visibility.Collapsed;
                    break;
            }

        }
        private void SystemChek()
        {
            int Major = Environment.OSVersion.Version.Major;
            int Minor = Environment.OSVersion.Version.Minor;
            if ((Major >= 6) && (Minor >= 0))
            {
                RegistryKey registrySQL = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\MICROSOFT\Microsoft SQL Server");
                if (registrySQL == null)
                {
                    MessageBox.Show("Запуск системы невозможен, в системе остутствует SQL Server", "Институт");
                    startup = false;
                }
                else
                {
                    try
                    {
                        DBConnection.Connection.Open();
                    }
                    catch
                    {
                        MessageBox.Show("Невозможно подключиться к источнику данных", "Институт");
                    }
                    finally
                    {
                        DBConnection.Connection.Close();
                    }
                }
            }
            else
            {
                MessageBox.Show("Данная операционная система не предназначена для запуска приложения", "Институт");
            }
        }

        private void BtLeave_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btRegister_Click(object sender, RoutedEventArgs e)
        {
            Registation mainWindow = new Registation();
            mainWindow.Show();
            Hide();
        }
    }
}
