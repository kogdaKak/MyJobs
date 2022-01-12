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
using Microsoft.Office.Interop.Excel;
using word = Microsoft.Office.Interop.Word;
using excel = Microsoft.Office.Interop.Excel;
using Microsoft.Win32;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace MptHelperDisShed
{
    /// <summary>
    /// Логика взаимодействия для EXCEL_PROCEDURE.xaml
    /// </summary>
    public partial class EXCEL_PROCEDURE : System.Windows.Window
    {
        public EXCEL_PROCEDURE()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Переменные для создание нового документа.
        /// </summary>
        Microsoft.Office.Interop.Excel.Application CreateNewDoc = new Microsoft.Office.Interop.Excel.Application();
        Microsoft.Office.Interop.Excel._Workbook NewDocWB = null;
        Microsoft.Office.Interop.Excel._Worksheet NewDocWS = null;
        Microsoft.Office.Interop.Excel.Range NewDocRange = null;
        Microsoft.Office.Interop.Excel.Worksheet ws = null;
        /// <summary>
        /// Функция по созданию нового документа
        /// </summary>
        public void CreateNewBook()
        {
            CreateNewDoc.Visible = true;
            //Get a new workbook.
            NewDocWB = CreateNewDoc.Workbooks.Add();
            NewDocWS = (excel._Worksheet)NewDocWB.ActiveSheet;
            NewDocWS.Name = "Понедельник";
        }
        /// <summary>
        /// Функция по созданию шаблона внутри нового документа
        /// </summary>

        public void CreateShablon()
        {
            NewDocWS.Cells[1, 1] = "ДЕНЬ:";
            NewDocWS.Cells[1, 4] = "ПОНЕДЕЛЬНИК";
            NewDocWS.Cells[1, 16] = "НЕДЕЛЯ:";
            NewDocWS.Cells[1, 18] = "Знаминатель";
            NewDocWS.Cells[2, 1] = "АУДИТОРНЫЙ ФОНД НА";
            NewDocWS.Cells[2, 8] = "ДАТА";
            NewDocWS.Cells[2, 18] = "УЧЕБНЫЙ ГОД";
            NewDocWS.Cells[5, 1] = "Пара";
            NewDocWS.Cells[7, 1] = "0";
            NewDocWS.Cells[8, 1] = "1";
            NewDocWS.Cells[9, 1] = "2";
            NewDocWS.Cells[10, 1] = "3";
            NewDocWS.Cells[11, 1] = "4";
            NewDocWS.Cells[12, 1] = "5";
            NewDocWS.Cells[13, 1] = "6";
            NewDocWS.Cells[14, 1] = "7";
            NewDocWS.Cells[17, 1] = "Пара";
            NewDocWS.Cells[19, 1] = "0";
            NewDocWS.Cells[20, 1] = "1";
            NewDocWS.Cells[21, 1] = "2";
            NewDocWS.Cells[22, 1] = "3";
            NewDocWS.Cells[23, 1] = "4";
            NewDocWS.Cells[24, 1] = "5";
            NewDocWS.Cells[25, 1] = "6";
            NewDocWS.Cells[26, 1] = "7";
            NewDocWS.Cells[29, 1] = "Пара";
            NewDocWS.Cells[31, 1] = "0";
            NewDocWS.Cells[32, 1] = "1";
            NewDocWS.Cells[33, 1] = "2";
            NewDocWS.Cells[34, 1] = "3";
            NewDocWS.Cells[35, 1] = "4";
            NewDocWS.Cells[36, 1] = "5";
            NewDocWS.Cells[37, 1] = "6";
            NewDocWS.Cells[38, 1] = "7";

            
        }
        public void cellsItem()
        {
            var cells = ws.get_Range("A4", "R14");
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideVertical].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние вертикальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideHorizontal].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние горизонтальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeTop].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // верхняя внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeRight].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // правая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeLeft].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // левая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeBottom].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
            cells = ws.get_Range("A16", "R26");
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideVertical].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние вертикальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideHorizontal].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние горизонтальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeTop].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // верхняя внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeRight].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // правая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeLeft].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // левая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeBottom].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
            cells = ws.get_Range("A28", "R38");
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideVertical].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние вертикальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlInsideHorizontal].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // внутренние горизонтальные
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeTop].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // верхняя внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeRight].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // правая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeLeft].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous; // левая внешняя
            cells.Borders[Microsoft.Office.Interop.Excel.XlBordersIndex.xlEdgeBottom].LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
        }
        /// <summary>
        /// Функция по подключению к БД, поиск групп, специальностей
        /// </summary>
        string cmd;
        SqlCommand createCommand;
        SqlDataAdapter dataAdp;
        System.Data.DataTable dt;
        public void FindSpecialty()
        {
            createCommand = new SqlCommand(cmd, DBConnection.Connection);
            DBConnection.Connection.Open();
            createCommand.ExecuteNonQuery();
            dataAdp = new SqlDataAdapter(createCommand);
            dt = new System.Data.DataTable("Number_Specialnost"); // В скобках указываем название таблицы
            dataAdp.Fill(dt);
            DBConnection.Connection.Close();
        }
        /// <summary>
        /// Переменны для открытия документа
        /// </summary>
        Microsoft.Office.Interop.Excel.Application OpenDoc;
        Microsoft.Office.Interop.Excel.Workbook OpenWB;
        Microsoft.Office.Interop.Excel.Worksheet OpenWS;
        Microsoft.Office.Interop.Excel.Range DocRange;
        /// <summary>
        /// Функция по открытию гового документа
        /// </summary>
        private void OpenBook()
        {
            try
            {
                OpenDoc = new Microsoft.Office.Interop.Excel.Application();
                OpenFileDialog openfile = new OpenFileDialog();
                openfile.DefaultExt = ".xlsx";
                openfile.Filter = "(.xlsx)|*.xlsx";
                var browsefile = openfile.ShowDialog();
                txtFilePath.Text = openfile.FileName;
                OpenWB = OpenDoc.Workbooks.Open(txtFilePath.Text.ToString(), 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
                OpenWS = (Microsoft.Office.Interop.Excel.Worksheet)OpenWB.Worksheets.get_Item(1);
                DocRange = OpenWS.UsedRange;
            }
            catch
            {

            }
        }
        /// <summary>
        /// Функция по заполнению в новом документе, групп построчно
        /// </summary>
        string[] CounterGG; //Переменная хранящая кол-во групп полученных при " , "
        int CounterGroupGroup; //Переменная проверяющя значение строки при помощи делителя " - "
        string GroupDelCounter1;
        string GroupDelCounter2;
        string GroupDelCounter3;
        string TakeGroupse; //Переменная хранит данные со столбца и строки как ячейка
        string[] addGroupse; //переменная хронящая в себе все делители полученной строки в " - "
        int GroupsNDStolbec; //Переменная заролнения в новом доументе групп
        int GroupsNDStroka; //Переменная заролнения в новом доументе групп
        public void addGroups()
        {
            if (CounterGroupGroup == 1)
            {
                GroupDelCounter1 = addGroupse[0];
                NewDocWS.Cells[GroupsNDStroka, GroupsNDStolbec] = GroupDelCounter1;
            }
            if (CounterGroupGroup == 2)
            {
                GroupDelCounter1 = addGroupse[0];
                GroupDelCounter2 = addGroupse[1];
                NewDocWS.Cells[GroupsNDStroka, GroupsNDStolbec] = GroupDelCounter1;
                NewDocWS.Cells[GroupsNDStroka + 1, GroupsNDStolbec] = GroupDelCounter2;
            }
            if (CounterGroupGroup == 3)
            {
                GroupDelCounter1 = addGroupse[0];
                GroupDelCounter2 = addGroupse[1];
                GroupDelCounter3 = addGroupse[2];
                NewDocWS.Cells[GroupsNDStroka, GroupsNDStolbec] = GroupDelCounter1 + "-" + GroupDelCounter2;
                NewDocWS.Cells[GroupsNDStroka + 1, GroupsNDStolbec] = GroupDelCounter3;
            }
        }
        /// <summary>
        /// Функция добавления специальности в новый документ
        /// </summary>
        int SpecialityNewDocSTROKA;
        int SpecialityNewDocSTOLBEC;
        string YacheikaSpeciality;
        string addSpecialtyYacheika;
        public void newSpecialty()
        {
            //Добавляем специальность над группой (Рработа с приложением)
            YacheikaSpeciality = NewDocWS.Cells[SpecialityNewDocSTROKA, SpecialityNewDocSTOLBEC].Text;
            if (YacheikaSpeciality == null || YacheikaSpeciality == "")
            {
                for (int BDStroka = 0; BDStroka < dt.Rows.Count; BDStroka++)
                {
                    for (int BDStolbez = 1; BDStolbez < dt.Columns.Count; BDStolbez++)
                    {
                        if (SpecialityNewDocSTROKA != 4 && SpecialityNewDocSTOLBEC >= 10)
                        {

                            SpecialityNewDocSTROKA = 17;
                            SpecialityNewDocSTOLBEC = 2;
                        }
                        else
                        {
                            if (SpecialityNewDocSTROKA != 16 && SpecialityNewDocSTOLBEC >= 10)
                            {
                                SpecialityNewDocSTROKA = 27;
                                SpecialityNewDocSTOLBEC = 2;
                            }
                            else
                            {
                                addSpecialtyYacheika = dt.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                                NewDocWS.Cells[SpecialityNewDocSTROKA, SpecialityNewDocSTOLBEC] = addSpecialtyYacheika;
                            }
                        }
                    }
                }
                SpecialityNewDocSTOLBEC++;
            }
            else
            {

            }
        }
        /// <summary>
        /// Функция заполнение и поиска практики
        /// </summary>
        string praktika;
        string[] Praktika;
        int Pka;
        int StrokaPrak;
        int StolbezPrak;
        public void FindPraktika()
        {
            praktika = xlRange_.Cells[StrokaPrak, StolbecOpenDOC].Text;
            StrokaPrak = GroupsNDStroka;
            StrokaPrak++;
            StrokaPrak++;
            StolbezPrak--;
            if (praktika == "ПРАКТИКА")
            {
                NewDocWS.Cells[StrokaPrak, StolbezPrak] = "П";
                NewDocWS.Cells[StrokaPrak + 1, StolbezPrak] = "Р";
                NewDocWS.Cells[StrokaPrak + 2, StolbezPrak] = "А";
                NewDocWS.Cells[StrokaPrak + 3, StolbezPrak] = "К";
                NewDocWS.Cells[StrokaPrak + 4, StolbezPrak] = "Т";
                NewDocWS.Cells[StrokaPrak + 5, StolbezPrak] = "И";
                NewDocWS.Cells[StrokaPrak + 6, StolbezPrak] = "К";
                NewDocWS.Cells[StrokaPrak + 7, StolbezPrak] = "А";
            }
        }
        /// <summary>
        /// Функция нахождения территорий по цвету ячеек
        /// </summary>
        double color;
        string nameTerry;
        int StrokaColor;
        int StolbezColor;
        public void FindNejka()
        {
            color = xlRange_.Cells[StrokaColor, StolbecOpenDOC].Interior.Color;
            StrokaColor = GroupsNDStroka;
            StrokaColor++;
            StrokaColor++;
            //Белый 16777215 - нежка
            //Розовый 10092543 - нахим
            if (color == 16777215)
            {
                nameTerry = "НЕЖЕНСКАЯ";
                //NewDocWS.Cells[StrokaColor, StolbezColor] = "Н";
                //NewDocWS.Cells[StrokaColor + 1, StolbezColor] = "Е";
                //NewDocWS.Cells[StrokaColor + 2, StolbezColor] = "Ж";
                //NewDocWS.Cells[StrokaColor + 3, StolbezColor] = "Е";
                //NewDocWS.Cells[StrokaColor + 4, StolbezColor] = "Н";
                //NewDocWS.Cells[StrokaColor + 5, StolbezColor] = "С";
                //NewDocWS.Cells[StrokaColor + 6, StolbezColor] = "К";
                //NewDocWS.Cells[StrokaColor + 7, StolbezColor] = "А";
            }
            if (color == 10092543)
            {
                nameTerry = "НАХИМОВСКИЙ";
                NewDocWS.Cells[StrokaColor, StolbezColor] = "Н";
                NewDocWS.Cells[StrokaColor, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 1, StolbezColor] = "А";
                NewDocWS.Cells[StrokaColor + 1, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 2, StolbezColor] = "Х";
                NewDocWS.Cells[StrokaColor + 2, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 3, StolbezColor] = "И";
                NewDocWS.Cells[StrokaColor + 3, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 4, StolbezColor] = "М";
                NewDocWS.Cells[StrokaColor + 4, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 5, StolbezColor] = "О";
                NewDocWS.Cells[StrokaColor + 5, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 6, StolbezColor] = "В";
                NewDocWS.Cells[StrokaColor + 6, StolbezColor].Interior.Color = 10092543;
                NewDocWS.Cells[StrokaColor + 7, StolbezColor] = "С";
                NewDocWS.Cells[StrokaColor + 7, StolbezColor].Interior.Color = 10092543;

            }
        }

        public void FindNaxim()
        {
            color = xlRange_.Cells[StrokaColor, StolbecOpenDOC].Interior.Color;
            StrokaColor = GroupsNDStroka;
            StrokaColor++;
            StrokaColor++;
            //Белый 16777215 - нежка
            //Розовый 10092543 - нахим
            if (color == 16777215)
            {
                nameTerry = "НЕЖЕНСКАЯ";
                NewDocWS.Cells[StrokaColor, StolbezColor] = "Н";
                NewDocWS.Cells[StrokaColor + 1, StolbezColor] = "Е";
                NewDocWS.Cells[StrokaColor + 2, StolbezColor] = "Ж";
                NewDocWS.Cells[StrokaColor + 3, StolbezColor] = "Е";
                NewDocWS.Cells[StrokaColor + 4, StolbezColor] = "Н";
                NewDocWS.Cells[StrokaColor + 5, StolbezColor] = "С";
                NewDocWS.Cells[StrokaColor + 6, StolbezColor] = "К";
                NewDocWS.Cells[StrokaColor + 7, StolbezColor] = "А";
            }
            if (color == 10092543)
            {
                nameTerry = "НАХИМОВСКИЙ";
                //NewDocWS.Cells[StrokaColor, StolbezColor] = "Н";
                //NewDocWS.Cells[StrokaColor + 1, StolbezColor] = "А";
                //NewDocWS.Cells[StrokaColor + 2, StolbezColor] = "Х";
                //NewDocWS.Cells[StrokaColor + 3, StolbezColor] = "И";
                //NewDocWS.Cells[StrokaColor + 4, StolbezColor] = "М";
                //NewDocWS.Cells[StrokaColor + 5, StolbezColor] = "О";
                //NewDocWS.Cells[StrokaColor + 6, StolbezColor] = "В";
                //NewDocWS.Cells[StrokaColor + 7, StolbezColor] = "С";
            }
        }
        /// <summary>
        /// Функция запроса для БД, нахождение кабинетов по сотрудникам
        /// </summary>
        SqlCommand SotrydnikiCommand;
        SqlDataAdapter SotrydnikiAPP;
        System.Data.DataTable DBSotrydniki;
        string sotrydniki;
        public void FindEmployee()
        {
            Surname = value.Substring(0, 2);
            Name = value.Substring(2, 2);
            FirstName = value.Substring(5);
            sotrydniki = "SELECT Territory_Аudiences.Number_Cabinet FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences INNER JOIN dbo.View_Cabinet ON Territory_Аudiences.View_ID = View_Cabinet.ID_View WHERE Employees.Second_Name + Employees.Name + Employees.Surname = '" + Surname + Name + FirstName + "' AND View_Cabinet.Name_View_Cabinet = '" + nameTerry + "' AND Distribution.Priority = (SELECT MAX(Distribution.Priority) FROM Distribution)";
            SotrydnikiCommand = new SqlCommand(sotrydniki, DBConnection.Connection);
            DBConnection.Connection.Open();
            SotrydnikiCommand.ExecuteNonQuery();
            SotrydnikiAPP = new SqlDataAdapter(SotrydnikiCommand);
            DBSotrydniki = new System.Data.DataTable("Cabinetes"); // В скобках указываем название таблицы
            SotrydnikiAPP.Fill(DBSotrydniki);
            DBConnection.Connection.Close();
        }
        /// <summary>
        /// Функция формирование аудиторного фонда №1.
        /// </summary>
        int StolbecOpenDOC; //Переменная котора отвечает за передвежение ячеек в открытом документе
        int StrokaOpenDOC; //Переменная котора отвечает за передвежение ячеек в открытом документе
        _Worksheet list_;
        Range xlRange_;
        Regex rg;
        int WhileNedeli; //Переменная которая отвечает за Конец проверки построчно в открытом документе
        int Group_Stroka_Plus;
        int ChisloGoup;
        int Stroka_Sotrydniki;
        int Stolbec_Sotrydniki;
        string authors; //Переменная которая будет хранить в себе ФИО сотрудника
        string[] ChisloSotrydnikov;
        int CounetrSOTRYDNIKI;
        MatchCollection matchedAuthors;
        string FSotrydnik;
        String value;
        String Surname;
        String Name;
        String FirstName;
        int StrokaCabinetes;
        int StolbezCabinetes;
        string addCabinet;
        public void cabs()
        {
            ChisloSotrydnikov = authors.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            CounetrSOTRYDNIKI = ChisloSotrydnikov.Count();
            if (NewDocWS.Cells[StrokaCabinetes, StolbezCabinetes].Text != null || NewDocWS.Cells[StrokaCabinetes, StolbezCabinetes].Text != "")
            {
                if (CounetrSOTRYDNIKI == 1)
                {
                    FSotrydnik = ChisloSotrydnikov[0];
                    // Получаем все совпадения  
                    matchedAuthors = rg.Matches(FSotrydnik);
                    try
                    {
                        /// Выводим всех подходящих авторов  
                        foreach (Match match in matchedAuthors)
                        {
                            value = match.ToString();
                            FindEmployee();
                            int BDStroka = 0;
                            for (int BDStolbez = 0; BDStolbez < DBSotrydniki.Columns.Count; BDStolbez++)
                            {
                                addCabinet = DBSotrydniki.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                                if (addCabinet == null || addCabinet == "")
                                {
                                    StrokaCabinetes++;
                                }
                                else
                                {
                                    NewDocWS.Cells[StrokaCabinetes, StolbezCabinetes] = addCabinet;
                                }
                            }
                            StrokaCabinetes++;
                        }
                    }
                    catch
                    {
                        StrokaCabinetes++;
                    }
                }
                if (CounetrSOTRYDNIKI == 2)
                {
                    FSotrydnik = ChisloSotrydnikov[0];
                    // Получаем все совпадения  
                    matchedAuthors = rg.Matches(FSotrydnik);
                    try
                    {
                        /// Выводим всех подходящих авторов
                        foreach (Match match in matchedAuthors)
                        {
                            value = match.ToString();
                            FindEmployee();
                            int BDStroka = 0;
                            for (int BDStolbez = 0; BDStolbez < DBSotrydniki.Columns.Count; BDStolbez++)
                            {
                                addCabinet = DBSotrydniki.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                                if (addCabinet == null || addCabinet == "")
                                {
                                    StrokaCabinetes++;
                                }
                                else
                                {
                                    NewDocWS.Cells[StrokaCabinetes, StolbezCabinetes] = addCabinet + "/";
                                }
                            }

                        }
                    }
                    catch
                    {

                    }
                    FSotrydnik = ChisloSotrydnikov[1];
                    // Получаем все совпадения  
                    matchedAuthors = rg.Matches(FSotrydnik);
                    try
                    {
                        /// Выводим всех подходящих авторов  
                        foreach (Match match in matchedAuthors)
                        {
                            value = match.ToString();
                            FindEmployee();
                            int BDStroka = 0;
                            for (int BDStolbez = 0; BDStolbez < DBSotrydniki.Columns.Count; BDStolbez++)
                            {
                                addCabinet = DBSotrydniki.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                                if (addCabinet == null || addCabinet == "")
                                {
                                    StrokaCabinetes++;
                                }
                                else
                                {
                                    NewDocWS.Cells[StrokaCabinetes, StolbezCabinetes] = addCabinet;
                                }
                            }
                            StrokaCabinetes++;
                        }
                    }
                    catch
                    {
                        StrokaCabinetes++;
                    }
                }
            }
        }
        int authors2;
        public void FSotrydniki()
        {
            while (Stroka_Sotrydniki <= WhileNedeli)
            {
                StrokaColor = StrokaOpenDOC;
                StrokaColor++;
                StrokaColor++;
                FindNejka();
                StrokaPrak = Stroka_Sotrydniki;
                StrokaPrak++;
                StolbezPrak = GroupsNDStolbec;
                FindPraktika();
                //Поиск сотрудника
                authors2 = Stroka_Sotrydniki;
                authors = xlRange_.Cells[Stroka_Sotrydniki, Stolbec_Sotrydniki].Text;

                if (authors == "")
                {
                    Stroka_Sotrydniki++;
                    authors = xlRange_.Cells[Stroka_Sotrydniki, Stolbec_Sotrydniki].Text;
                    if (authors == "")
                    {
                        Stroka_Sotrydniki++;
                        StrokaCabinetes++;
                    }
                    else
                    {
                        cabs();
                        Stroka_Sotrydniki++;
                    }
                }
                else
                {
                    cabs();
                    Stroka_Sotrydniki++;
                }
            }
        }
        public void FSotrydniki2()
        {
            while (Stroka_Sotrydniki <= WhileNedeli)
            {
                StrokaColor = StrokaOpenDOC;
                StrokaColor++;
                StrokaColor++;
                FindNaxim();
                StrokaPrak = Stroka_Sotrydniki;
                StrokaPrak++;
                StolbezPrak = GroupsNDStolbec;
                FindPraktika();
                //Поиск сотрудника
                authors2 = Stroka_Sotrydniki;
                authors = xlRange_.Cells[Stroka_Sotrydniki, Stolbec_Sotrydniki].Text;

                if (authors == "")
                {
                    Stroka_Sotrydniki++;
                    authors = xlRange_.Cells[Stroka_Sotrydniki, Stolbec_Sotrydniki].Text;
                    if (authors == "")
                    {
                        Stroka_Sotrydniki++;
                        StrokaCabinetes++;
                    }
                    else
                    {
                        cabs();
                        Stroka_Sotrydniki++;
                    }
                }
                else
                {
                    cabs();
                    Stroka_Sotrydniki++;
                }
            }
        }
        public void FChisloGroup()
        {
            Stroka_Sotrydniki = StrokaOpenDOC;
            Stolbec_Sotrydniki = StolbecOpenDOC;
            addGroupse = TakeGroupse.Split(new char[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
            CounterGroupGroup = addGroupse.Count();
            addGroups();
            //Добавляем специальность над группой (Рработа с БД)
            SpecialityNewDocSTOLBEC = GroupsNDStolbec;
            cmd = "SELECT GGroup.Name_Group,Specialty.Number_Specialty FROM dbo.GGroup INNER JOIN dbo.Specialty ON GGroup.Specialty_ID = Specialty.ID_Specialty WHERE Name_Group = '" + TakeGroupse.ToString() + "'";
            FindSpecialty();
            newSpecialty();
            StrokaColor = Stroka_Sotrydniki;
            StolbezColor = GroupsNDStolbec;
            StrokaCabinetes = GroupsNDStroka;
            StrokaCabinetes++;
            StrokaCabinetes++;
            StolbezCabinetes = GroupsNDStolbec;
            GroupsNDStolbec++;
            //Sotrydni
            FSotrydniki();
            StolbezCabinetes++;
        }
        public void FChisloGroup2()
        {
            Stroka_Sotrydniki = StrokaOpenDOC;
            Stolbec_Sotrydniki = StolbecOpenDOC;
            addGroupse = TakeGroupse.Split(new char[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
            CounterGroupGroup = addGroupse.Count();
            addGroups();
            //Добавляем специальность над группой (Рработа с БД)
            SpecialityNewDocSTOLBEC = GroupsNDStolbec;
            cmd = "SELECT GGroup.Name_Group,Specialty.Number_Specialty FROM dbo.GGroup INNER JOIN dbo.Specialty ON GGroup.Specialty_ID = Specialty.ID_Specialty WHERE Name_Group = '" + TakeGroupse.ToString() + "'";
            FindSpecialty();
            newSpecialty();
            StrokaColor = Stroka_Sotrydniki;
            StolbezColor = GroupsNDStolbec;
            StrokaCabinetes = GroupsNDStroka;
            StrokaCabinetes++;
            StrokaCabinetes++;
            StolbezCabinetes = GroupsNDStolbec;
            GroupsNDStolbec++;
            //Sotrydni
            FSotrydniki2();
            StolbezCabinetes++;
        }

        public void ChisloGroupTest()
        {
            if (ChisloGoup == 1)
            {
                FChisloGroup();
            }
            if (ChisloGoup == 2)
            {
                Stroka_Sotrydniki = 9;
                Stolbec_Sotrydniki = StolbecOpenDOC;
                TakeGroupse = CounterGG[0];
                FChisloGroup();
                //Stolbec_Sotrydniki--;
                Stroka_Sotrydniki = StrokaOpenDOC;
                TakeGroupse = CounterGG[1];
                FChisloGroup();
            }
        }
        public void ChisloGroupTest2()
        {
            if (ChisloGoup == 1)
            {
                FChisloGroup2();
            }
            if (ChisloGoup == 2)
            {
                Stroka_Sotrydniki = 9;
                Stolbec_Sotrydniki = StolbecOpenDOC;
                TakeGroupse = CounterGG[0];
                FChisloGroup2();
                //Stolbec_Sotrydniki--;
                Stroka_Sotrydniki = StrokaOpenDOC;
                TakeGroupse = CounterGG[1];
                FChisloGroup2();
            }
        }
        public void TestFunction()
        {
            while (StrokaOpenDOC <= WhileNedeli)
            {
                while (StolbecOpenDOC <= 9)
                {
                    Stolbec_Sotrydniki = StolbecOpenDOC;
                    if (StolbecOpenDOC == 3 || StolbecOpenDOC == 6 || StolbecOpenDOC == 9)
                    {
                        if (xlRange_.Cells[Group_Stroka_Plus, StolbecOpenDOC].value == null)
                        {

                        }
                        else
                        {
                            //Добaвляем группы
                            TakeGroupse = xlRange_.Cells[Group_Stroka_Plus, StolbecOpenDOC].Text;// Получение в переменную всех групп строки
                            CounterGG = TakeGroupse.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); //Деление строки при помощи знака
                            ChisloGoup = CounterGG.Count();
                            StolbezCabinetes = StolbecOpenDOC;
                            //1 Проверка, добавление групп
                            ChisloGroupTest();
                        }
                    }
                    StolbecOpenDOC++;
                }
                StrokaOpenDOC++;

            }
        }
        public void TestFunction2()
        {
            while (StrokaOpenDOC <= WhileNedeli)
            {
                while (StolbecOpenDOC <= 9)
                {
                    Stolbec_Sotrydniki = StolbecOpenDOC;
                    if (StolbecOpenDOC == 3 || StolbecOpenDOC == 6 || StolbecOpenDOC == 9)
                    {
                        if (xlRange_.Cells[Group_Stroka_Plus, StolbecOpenDOC].value == null)
                        {

                        }
                        else
                        {
                            //Добaвляем группы
                            TakeGroupse = xlRange_.Cells[Group_Stroka_Plus, StolbecOpenDOC].Text;// Получение в переменную всех групп строки
                            CounterGG = TakeGroupse.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries); //Деление строки при помощи знака
                            ChisloGoup = CounterGG.Count();
                            StolbezCabinetes = StolbecOpenDOC;
                            //1 Проверка, добавление групп
                            ChisloGroupTest2();
                        }
                    }
                    StolbecOpenDOC++;
                }
                StrokaOpenDOC++;

            }
        }
        public void CreateFondNejka()
        {
            CreateNewBook();
            OpenBook();
            string messages = "Полождите, идет загрузка";
            System.Threading.Tasks.Task.Factory.StartNew(() => MessageBox.Show(messages));
            //1 страница
            rg = new Regex(@"[А-Я]{1}[.]{1}[А-Я]{1}[.]{1} [А-Я]{1}([а-я]{0,17})?([a-z]{0,17})?");
            CreateShablon();
            SpecialityNewDocSTROKA = 4;
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                ws = NewDocWB.Worksheets.get_Item(1) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 23;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction();
            }
            catch
            {

            }
            //2 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Вторник";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                ws = NewDocWB.Worksheets.get_Item(2) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 37;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction();
            }
            catch
            {

            }
            //3 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Среда";

            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                ws = NewDocWB.Worksheets.get_Item(3) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 51;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction();
            }
            catch
            {

            }
            //4 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Четверг";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                ws = NewDocWB.Worksheets.get_Item(4) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 62;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction();
            }
            catch
            {

            }
            //5 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Пятница";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                ws = NewDocWB.Worksheets.get_Item(5) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 79;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction();
            }
            catch
            {

            }
            //6 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Суббота";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                ws = NewDocWB.Worksheets.get_Item(6) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 93;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction();
            }
            catch
            {

            }
        }
        public void CreateFondNaxim()
        {
            CreateNewBook();
            OpenBook();
            string messages = "Полождите, идет загрузка";
            System.Threading.Tasks.Task.Factory.StartNew(() => MessageBox.Show(messages));
            //1 страница
            rg = new Regex(@"[А-Я]{1}[.]{1}[А-Я]{1}[.]{1} [А-Я]{1}([а-я]{0,17})?([a-z]{0,17})?");
            CreateShablon();
            SpecialityNewDocSTROKA = 4;
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                ws = NewDocWB.Worksheets.get_Item(1) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 23;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 9;
                TestFunction2();
            }
            catch
            {

            }
            //2 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Вторник";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                ws = NewDocWB.Worksheets.get_Item(2) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 37;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 24;
                TestFunction2();
            }
            catch
            {

            }
            //3 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Среда";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                ws = NewDocWB.Worksheets.get_Item(3) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 51;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 38;
                TestFunction2();
            }
            catch
            {

            }
            //4 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Четверг";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                ws = NewDocWB.Worksheets.get_Item(4) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 62;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 52;
                TestFunction2();
            }
            catch
            {

            }
            //5 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Пятница";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                ws = NewDocWB.Worksheets.get_Item(5) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();

                WhileNedeli = 79;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 66;
                TestFunction2();
            }
            catch
            {

            }
            //6 страница
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Суббота";
            CreateShablon();
            NewDocWS.Cells[1, 4] = NewDocWS.Name;

            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                ws = NewDocWB.Worksheets.get_Item(6) as Microsoft.Office.Interop.Excel.Worksheet;
                cellsItem();
                WhileNedeli = 93;
                Group_Stroka_Plus = 9;

                GroupsNDStroka = 5;
                GroupsNDStolbec = 2;

                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction2();
            }
            catch
            {

            }
            try
            {
                list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
                xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
                Stroka_Sotrydniki = StrokaOpenDOC;
                Stroka_Sotrydniki++;
                StolbecOpenDOC = 3;
                StrokaOpenDOC = 80;
                TestFunction2();
            }
            catch
            {

            }
        }

        private void Excel_Click(object sender, RoutedEventArgs e)
        {
            CreateFondNejka();
            CreateFondNaxim();
        }
        public void CreateSpisokGG()
        {
            while (StolbecOpenDOC <= 10)
            {
                while (StrokaOpenDOC <= 15)
                {
                    authorsNEWDOC = NewDocWS.Cells[StrokaCreateDOC, StolbecCreateDOC].Text;
                    authors = xlRange_.Cells[StrokaOpenDOC, StolbecOpenDOC].Text;
                    if (authors == "" || authors == "П" || authors == "Р" || authors == "А" || authors == "К" || authors == "Т" || authors == "И" || authors == "К" || authors == "А" || authors == "Н" || authors == "Е" || authors == "Ж" || authors == "Е" || authors == "Н" || authors == "С" || authors == "К" || authors == "А" || authors == "Я" || authors == "Н" || authors == "А" || authors == "Х" || authors == "И" || authors == "М" || authors == "О" || authors == "В" || authors == "С" || authors == "К")
                    {

                    }
                    else
                    {
                        if (authorsNEWDOC != "")
                        {
                            while (authorsNEWDOC != "")
                            {
                                StolbecCreateDOC++;
                                authorsNEWDOC = NewDocWS.Cells[StrokaCreateDOC, StolbecCreateDOC].Text;
                            }
                            NewDocWS.Cells[StrokaCreateDOC, StolbecCreateDOC] = authors;
                        }
                        else
                        {
                            NewDocWS.Cells[StrokaCreateDOC, StolbecCreateDOC] = authors;
                            StolbecCreateDOC++;
                        }
                    }
                    StrokaOpenDOC++;
                }
                StrokaCreateDOC++;
                StrokaOpenDOC = Group_Stroka_Plus;
                StolbecCreateDOC = 1;
                StolbecOpenDOC++;
            }
        }
        int StrokaCreateDOC;
        int StolbecCreateDOC;
        string authorsNEWDOC;
        public void addLstGroup()
        {
            list_ = (_Worksheet)OpenWB.Sheets[1];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            CreateNewBook();
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            Group_Stroka_Plus = 5;
            StrokaOpenDOC = Group_Stroka_Plus;
            StrokaCreateDOC = 1;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
            list_ = (_Worksheet)OpenWB.Sheets[2];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            Group_Stroka_Plus = 7;
            StrokaOpenDOC = Group_Stroka_Plus;
            StrokaCreateDOC = 1;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
            list_ = (_Worksheet)OpenWB.Sheets[3];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            Group_Stroka_Plus = 7;
            StrokaOpenDOC = Group_Stroka_Plus;
            StrokaCreateDOC = 1;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
            list_ = (_Worksheet)OpenWB.Sheets[4];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            StrokaCreateDOC = 1;
            Group_Stroka_Plus = 7;
            StrokaOpenDOC = Group_Stroka_Plus;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
            list_ = (_Worksheet)OpenWB.Sheets[5];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            StrokaCreateDOC = 1;
            Group_Stroka_Plus = 7;
            StrokaOpenDOC = Group_Stroka_Plus;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
            list_ = (_Worksheet)OpenWB.Sheets[6];//Получаем первый лист
            xlRange_ = list_.UsedRange;//Получаем используемый сектор ячеек в листе
            NewDocWS.Name = "Список групп по кабинетам";
            StolbecOpenDOC = 2;
            Group_Stroka_Plus = 7;
            StrokaOpenDOC = Group_Stroka_Plus;
            StrokaCreateDOC = 1;
            StolbecCreateDOC = 1;
            CreateSpisokGG();
        }

        private void Spisok_Click(object sender, RoutedEventArgs e)
        {
            OpenBook();
            addLstGroup();
            NewDocWS = (excel._Worksheet)NewDocWB.Sheets.Add(After: NewDocWB.ActiveSheet);
            NewDocWS.Name = "Список преподавателей";
            cmd = "SELECT Employees.Surname +' '+ Employees.Name +' '+ Employees.Second_Name ,Territory_Аudiences.Number_Cabinet ,View_Cabinet.Name_View_Cabinet FROM dbo.Plurality INNER JOIN dbo.Employees ON Plurality.EmployeeId_Employee = Employees.Id_Employee  INNER JOIN dbo.Distribution_CMK ON Distribution_CMK.Plurality_Distribution_ID = Plurality.Id_Plurality INNER JOIN dbo.NLP ON NLP.Distribution_ID = Distribution_CMK.ID_Distribution INNER JOIN dbo.Distribution ON Distribution.NLP_ID = NLP.ID_NLP INNER JOIN dbo.Territory_Аudiences ON Distribution.Territory_Аudiences_ID = Territory_Аudiences.ID_Territory_Аudiences INNER JOIN dbo.View_Cabinet ON Territory_Аudiences.View_ID = View_Cabinet.ID_View GROUP BY Employees.Surname +' '+ Employees.Name +' '+ Employees.Second_Name ,Territory_Аudiences.Number_Cabinet ,View_Cabinet.Name_View_Cabinet";
            FindSpecialty();
            StrokaCreateDOC = 1;
            StolbecCreateDOC = 1;
            while (StolbecCreateDOC <= dt.Columns.Count)
            {
                for (int BDStolbez = 0; BDStolbez < dt.Columns.Count; BDStolbez++)
                {
                    for (int BDStroka = 0; BDStroka < dt.Rows.Count; BDStroka++)
                    {
                        addSpecialtyYacheika = dt.Rows[BDStroka].ItemArray[BDStolbez].ToString();
                        NewDocWS.Cells[StrokaCreateDOC, StolbecCreateDOC] = addSpecialtyYacheika;
                        StrokaCreateDOC++;
                    }
                    StrokaCreateDOC = 1;
                    StolbecCreateDOC++;
                }
            }
        }
    }
}
