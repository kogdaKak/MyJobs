using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using word = Microsoft.Office.Interop.Word;
using excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
using Microsoft.Win32;

namespace MptHelperDisShed
{
    class Document_Class
    {

        /// <summary>
        /// Список доступных видов отчётов
        /// </summary>
        internal enum Document_Type
        {
            Report, Statistic, List, Check
        }
        /// <summary>
        /// Итоговый выходной формат отчёта
        /// </summary>
        internal enum Document_Format
        {
            Word, PDF
        }

        /// <summary>
        /// Метод создания и сохранения документов
        /// в форматах Microsoft Word (doc, PDF),
        /// Excel (exls)
        /// </summary>
        /// <param name="type">Тип создаваемого документа
        /// отчёт или статистика</param>
        /// <param name="format">Формат сохранения 
        /// документ или таблица</param>
        /// <param name="name">Название документа</param>
        /// <param name="table">Входная таблица с данными</param>
        public void Document_Create(Document_Type type,
            Document_Format format, string name,
            DataTable table)
        {
            string filename = "";
            if (format == Document_Format.Word)
            {
               System.Windows.Forms.SaveFileDialog saveFileDialog = new System.Windows.Forms.SaveFileDialog();
                saveFileDialog.Filter = "Word документ (*.doc)|*.doc|Все файлы (*.*)|*.*";
                if (saveFileDialog.ShowDialog() == DialogResult.Cancel)
                    return;
                filename = saveFileDialog.FileName;
            }


            //Получение данных о конфигурации документа

            //Configuration_Class configuration_Class
            //    = new Configuration_Class();
            //configuration_Class.Document_Configuration_Get();

            //Проверка на пустоту названия
            switch (name != "" || name != null)
            {
                case true:
                    //Выбор формата либо Word либо PDF

                    //Запуск процесса в дистпечере задач
                    word.Application application
                        = new word.Application();
                    //создание документа в процессе
                    word.Document document
                        //Присвоение документа процессу, Visible: true
                        //возможность редактирования документа
                        = application.Documents.Add(Visible: true);
                    try
                    {
                        //Объявление дипапазона для формирования текста
                        word.Range range = document.Range(0, 0);
                        //Настройка отступов в документе

                        //document.Sections.PageSetup.LeftMargin
                        //    = application.CentimetersToPoints(
                        //        (float)Configuration_Class.
                        //        doc_Left_Merge);
                        //document.Sections.PageSetup.TopMargin
                        //    = application.CentimetersToPoints(
                        //        (float)Configuration_Class.
                        //        doc_Top_Merge);
                        //document.Sections.PageSetup.RightMargin
                        //    = application.
                        //    CentimetersToPoints((float)
                        //    Configuration_Class.doc_Right_Merg);
                        //document.Sections.PageSetup.BottomMargin
                        //    = application.CentimetersToPoints(
                        //        (float)Configuration_Class.
                        //        doc_Bottom_Merge);
                        ////Присвоение текстового знеачения в дипазон
                        //range.Text =
                        //    Configuration_Class.Organization_Name;

                        //Настройка выравнивания текста
                        range.ParagraphFormat.Alignment =
                            word.WdParagraphAlignment.
                            wdAlignParagraphCenter;
                        //Настройка интервала после абзаца
                        range.ParagraphFormat.SpaceAfter = 1;
                        //Настройка интервала перед абзаца
                        range.ParagraphFormat.SpaceBefore = 1;
                        //Настройка межстрочного интервала
                        range.ParagraphFormat.LineSpacingRule
                            = word.WdLineSpacing.wdLineSpaceSingle;
                        //Настройка названия шрифта
                        range.Font.Name = "Times New Roman";
                        //Настройка размера шрифта
                        range.Font.Size = 12;
                        //Добавление параграфов
                        document.Paragraphs.Add();//В конце текста
                        document.Paragraphs.Add();//Свободный
                        document.Paragraphs.Add();//Для будущего текста
                                                  //Параграф для названия документа
                        word.Paragraph Document_Name
                            = document.Paragraphs.Add();
                        //Настройка параграфа через свойство диапазона
                        Document_Name.Format.Alignment
                            = word.WdParagraphAlignment.wdAlignParagraphCenter;
                        Document_Name.Range.Font.Name = "Times New Roman";
                        Document_Name.Range.Font.Size = 16;
                        //Проверка на тип документа, отчёт или статистика
                        switch (type)
                        {
                            case Document_Type.Report:
                                Document_Name.Range.Text = "ОТЧЁТ";

                                break;
                            case Document_Type.Statistic:
                                Document_Name.Range.Text = "СТАТИСТИЧЕСКИЙ ОТЧЁТ";
                                break;
                            case Document_Type.List:
                                Document_Name.Range.Text = name;
                                break;
                            case Document_Type.Check:
                                Document_Name.Range.Text = "ЧЕК";
                                break;
                        }
                        document.Paragraphs.Add();
                        document.Paragraphs.Add();
                        document.Paragraphs.Add();
                        word.Paragraph statparg = document.Paragraphs.Add();
                        //Создание области таблицы в документе


                        if (type == Document_Type.Check)
                        {
                            word.Table stat_table2
                            = document.Tables.Add(statparg.Range,1, 5);
                            stat_table2.Borders.InsideLineStyle
                                    = word.WdLineStyle.wdLineStyleSingle;
                            //Настройка границ таблицы внешние
                            stat_table2.Borders.OutsideLineStyle
                                = word.WdLineStyle.wdLineStyleSingle;
                            //Выравнивание текста внутри ячеек по ширине 
                            stat_table2.Rows.Alignment
                                = word.WdRowAlignment.wdAlignRowCenter;
                            //Выравнивание текста внутри ячеек по высоте
                            stat_table2.Range.Cells.VerticalAlignment =
                                word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;
                            stat_table2.Range.Font.Size = 11;
                            stat_table2.Range.Font.Name = "Times New Roman";
                            stat_table2.Cell(1, 1).Range.Text = "Пара";
                            stat_table2.Cell(1, 2).Range.Text = "Группы";
                            stat_table2.Cell(1, 3).Range.Text = "Группы2";
                            stat_table2.Cell(1, 4).Range.Text = "Группы3";
                            stat_table2.Cell(1, 5).Range.Text = "Групп4";
                            stat_table2.Cell(2, 1).Range.Text = table.Rows[0][0].ToString();
                            stat_table2.Cell(2, 2).Range.Text = table.Rows[0][1].ToString();
                            stat_table2.Cell(2, 3).Range.Text = table.Rows[0][2].ToString();
                            stat_table2.Cell(2, 4).Range.Text = table.Rows[0][3].ToString();
                            stat_table2.Cell(2, 5).Range.Text = table.Rows[0][4].ToString();
                        }





                        if (type != Document_Type.Check)
                        {
                            word.Table stat_table
                                  //Добавление таблицы в область документа
                                  //Указывается параграф в котором документ создан
                                  //Количество строк и столбцов
                                  = document.Tables.Add(statparg.Range,
                                  table.Rows.Count, table.Columns.Count);

                            //Настройка границ таблицы внутренние 
                            stat_table.Borders.InsideLineStyle
                                        = word.WdLineStyle.wdLineStyleSingle;
                            //Настройка границ таблицы внешние
                            stat_table.Borders.OutsideLineStyle
                                = word.WdLineStyle.wdLineStyleSingle;
                            //Выравнивание текста внутри ячеек по ширине 
                            stat_table.Rows.Alignment
                                = word.WdRowAlignment.wdAlignRowCenter;
                            //Выравнивание текста внутри ячеек по высоте
                            stat_table.Range.Cells.VerticalAlignment =
                                word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;
                            stat_table.Range.Font.Size = 11;
                            stat_table.Range.Font.Name = "Times New Roman";
                            //Индексация столбцов и строк в Word начинается с 1,1
                            for (int row = 1; row <= table.Rows.Count; row++)
                                for (int col = 1; col <= table.Columns.Count; col++)
                                {
                                    stat_table.Cell(row, col).Range.Text = table.Rows[row - 1][col - 1].ToString();
                                }
                        }
                        document.Paragraphs.Add();
                        document.Paragraphs.Add();
                        //Парадграф с фиксациейц даты создания документа
                        word.Paragraph Footparg = document.Paragraphs.Add();
                        Footparg.Range.Text =
                            string.Format("Дата создания \t\t\t{0}",
                            DateTime.Now.ToString("dd.MM.yyyy"));
                    }
                    catch (Exception ex)
                    {
                        System.Windows.Forms.MessageBox.Show(ex.Message);
                    }
                    finally
                    {

                        switch (format)
                        {
                            case Document_Format.Word:
                                //Сохранение документа с названием из метода,
                                //и в формате doc
                                document.SaveAs2(filename,
                                    word.WdSaveFormat.wdFormatDocument);
                                document.SaveAs2(string.Format("{0}\\{1}", Environment.CurrentDirectory, name),
                                    word.WdSaveFormat.wdFormatDocument);
                                document.Close();
                                break;
                            case Document_Format.PDF:
                                //Сохранение документа в формате PDF
                                document.SaveAs2(string.Format("{0}\\{1}", Environment.CurrentDirectory, name),
                                    word.WdSaveFormat.wdFormatPDF);
                                break;
                        }
                        //Закрываем документ

                        //Выходим из процесса с его закрытием
                        application.Quit();
                    }
                    break;
            }

        }
    }
}
