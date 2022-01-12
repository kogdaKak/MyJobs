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
    /// Логика взаимодействия для StudentMenu.xaml
    /// </summary>
    public partial class StudentMenu : Window
    {
        public StudentMenu()
        {
            InitializeComponent();
        }

        private void btGroup_Click(object sender, RoutedEventArgs e)
        {
            Groups mainWindow = new Groups();
            mainWindow.Show();
            Hide();
        }

        private void btPedagog_Click(object sender, RoutedEventArgs e)
        {
            ListPrepod mainWindow = new ListPrepod();
            mainWindow.Show();
            Hide();
        }
    }
}
