   M S B A M L   `   `   `  ���� K  GMptHelperDisShed, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:MptHelperDisShedMptHelperDisShed  "    MptHelperDisShed.Distributon   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962a>design1http://materialdesigninxaml.net/winfx/xaml/themes  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  *localclr-namespace:MptHelperDisShed  -   $��Window��  � Title$7  1Распределение сотрудников�� � WindowState$ 	Maximized=����#C1D5e0.���  � RowDefinitions �� �� �� �� �� �� �� ��  � ColumnDefinitions �� �� �� �� �� �� �� �� �� �� �� �� �� .+�&   System.Windows.Controls.DataGrid  -   $��dgDistribution��$��0��$��3��$��7��$��9��   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto    
IsReadOnly .    AutoGenerateColumns . $
��Left=�$	��Top=��� -    ��Name$ btInsert��$��0��$��0��$��1��$��2��$��Добавить��$	��120��$��Center=�$��Center=�3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IndicatorBackground
 ��  �+  %MaterialDesignThemes.Wpf.ButtonAssist	   CornerRadius$	 10�����	#FF8BAFC2
���   �$��Normal$��� -   $ btUpdate��$��1��$��0��$��1��$��2��$��Изменитть��$	��120��$��Center=�$��Center=�
 ��  �$	 10�����	#FF8BAFC2
���   �$��Normal$��� -   $ btDelete��$��2��$��0��$��1��$��2��$��Удалить��$	��120��$��Center=�$��Center=�
 ��  �$	 10�����	#FF8BAFC2
���   �$��Normal$��� -   
 ��Name$
 cbOne��$��3��$��0��$��1��$��3��
�������$y�Visible=�$��Center=�$��Center=�$	��150���� $	��Top=�$��3��$��1��$��1��$��2��$!��Выбор кабинета���� -   $��	chbFilter��$��Фильтрация��$��4��$��1��$��1��$��Center=�$
��Left=�$��3���� -   $

 cbTy��$��5��$��0��$��1��$��3��$y�Visible=�$��Center=�$��Center=�$	��150��
��������� $	��Top=�$��5��$��1��$��1��$��2��$%��Выбор сотрудника���� -	    ��Name$ tbText��$��6��$��0��$��1��$��3�� �� 	MaxLength$ 10��$	��150��$��Center=�$	��Top=�.  (MaterialDesignThemes.Wpf.TextFieldAssist   UnderlineBrush
 � � �)  #MaterialDesignThemes.Wpf.HintAssist   
Foreground �	#FF000000   Hint$' !Введите приоритет������ *SelectedItem.Indicator+ �� ElementName$ dgDistribution���� $��Bottom=�$
��Left=�$��6��$��0��$��1��$��4���� -
   
���   �.�=;Оцените наш программный продукт�� -   $��7��$��0��$��1��$��2��$��Выгрузить��$��Center=�$��Center=�$	��120��
 ��  �$	 10�����	#FF8BAFC2
���   �$��Normal$�