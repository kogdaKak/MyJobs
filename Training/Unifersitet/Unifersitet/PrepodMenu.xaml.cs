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
    /// Логика взаимодействия для PrepodMenu.xaml
    /// </summary>
    public partial class PrepodMenu : Window
    {
        public PrepodMenu()
        {
            InitializeComponent();
            DBConnection connection = new DBConnection();
            lblFio.Content +=
                            connection.userInfo(DBConnection.IDuser);
            lblFio.FontSize -= 10;
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            Authorization mainWindow = new Authorization();
            mainWindow.Show();
            Hide();
        }

        private void btGroups_Click(object sender, RoutedEventArgs e)
        {
            Groups mainWindow = new Groups();
            mainWindow.Show();
            Hide();
        }

        private void btWRCList_Click(object sender, RoutedEventArgs e)
        {
            Spisok_WCR mainWindow = new Spisok_WCR();
            mainWindow.Show();
            Hide();
        }

        private void btClass_Change_Click(object sender, RoutedEventArgs e)
        {
            ClassesPrep mainWindow = new ClassesPrep();
            mainWindow.Show();
            Hide();
        }

        private void btClasses_Click(object sender, RoutedEventArgs e)
        {
            Classes mainWindow = new Classes();
            mainWindow.Show();
            Hide();
        }

        private void btDiploms_Click(object sender, RoutedEventArgs e)
        {
            Diplomas mainWindow = new Diplomas();
            mainWindow.Show();
            Hide();
        }

        private void btLeaveClasses_Click(object sender, RoutedEventArgs e)
        {
            Assignment_Of_Classes mainWindow = new Assignment_Of_Classes();
            mainWindow.Show();
            Hide();
        }

        private void Staff_Click(object sender, RoutedEventArgs e)
        {
            Staff mainWindow = new Staff();
            mainWindow.Show();
            Hide();
        }

        private void Enrolle_Click(object sender, RoutedEventArgs e)
        {
            Student mainWindow = new Student();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Enrolle mainWindow = new Enrolle();
            mainWindow.Show();
            Hide();
        }

        private void Doljnost_Click(object sender, RoutedEventArgs e)
        {
            Doljnost mainWindow = new Doljnost();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Conduciton_Classes mainWindow = new Conduciton_Classes();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Specialnost mainWindow = new Specialnost();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            Carrying_WRC mainWindow = new Carrying_WRC();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            WRC_Appointment mainWindow = new WRC_Appointment();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            Attendance_Check mainWindow = new Attendance_Check();
            mainWindow.Show();
            Hide();
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            Results_WRC mainWindow = new Results_WRC();
            mainWindow.Show();
            Hide();
        }
    }
}
