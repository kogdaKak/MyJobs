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
    /// Логика взаимодействия для Registation.xaml
    /// </summary>
    public partial class Registation : Window
    {
        public Registation()
        {
            InitializeComponent();
        }
        private string QR = " ";
        private int Rolle = 1;
        DBProcedure procedures = new DBProcedure();


        private void btRegistartion_Click(object sender, RoutedEventArgs e)
        {
            procedures.spAuthorization_insert(tbLogin.Text, tbPassword.Text, Rolle);
            procedures.spEnrolle_insert(tbName.Text, tbOtchestv.Text, tbFamily.Text, tbCertificat.Text, tbNumber.Text, tbSeries.Text);
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            QR = DBConnection.qrAiuthorization;
            QR = DBConnection.qrEnrolle;
        }

        private void btExit_Click(object sender, RoutedEventArgs e)
        {
            Authorization mainWindow = new Authorization();
            mainWindow.Show();
            Hide();
        }

        private void tbSeries_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }

        private void tbCertificat_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }

        private void tbNumber_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }
    }
}