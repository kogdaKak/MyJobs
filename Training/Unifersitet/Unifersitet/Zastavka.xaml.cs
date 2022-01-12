
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
using System.Windows.Threading;

namespace Unifersitet
{
    /// <summary>
    /// Логика взаимодействия для Zastavka.xaml
    /// </summary>
    public partial class Zastavka : Window
    {
        public Zastavka()
        {
            InitializeComponent();
            media.Source = new Uri(Environment.CurrentDirectory + @"\Z.png");
            Loading();
        }

        private void MediaElement_MediaEnded(object sender, RoutedEventArgs e)
        {
 
        }
        DispatcherTimer timer = new DispatcherTimer();
        void Loading()
        {
            timer.Tick += timer_tick;
            timer.Interval = new TimeSpan(0, 0, 11);
            timer.Start();
        }
        private void timer_tick(object sender, EventArgs e)
        {
            
            media.Visibility = Visibility.Hidden;
            timer.Stop();
            Configuration mainWindow = new Configuration();
            mainWindow.Show();
            Hide();
        }
    }
}