   M S B A M L   `   `   `  ���� K  GMptHelperDisShed, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:MptHelperDisShedMptHelperDisShed  !    MptHelperDisShed.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962a>design1http://materialdesigninxaml.net/winfx/xaml/themes  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  *localclr-namespace:MptHelperDisShed  -     � Title$#  Загрузка данных�� � WindowState$ 	Maximized=����#C1D5e0.���  � RowDefinitions �� �� $��25 ��� �� �� �� �� �� ��  � ColumnDefinitions �� �� �� �� �� $��28 ��� �� �� $��28 ��� .  (MaterialDesignThemes.Wpf.ColorZoneAssist   
Background
 �   ��� 
 �   ��� $��28 �
 �   ��� 
 �   ��� 
 �   ��� 
 �   �.+��� $��0��$��2��$��1��$��2��$��Путь к файлу��$��Center=��� -   $��txtFilePath�� �� 
IsReadOnly . $��0��$��2��$��1��$��9��$��30��$	��550��$��15(� J� Opacity$ 1Q�$	��Top=��� -   $��btRaspredelenie��$	��150��$��0��$��12��$��1��$��2��$ ��Распределение��$��Center=�$��Bottom=�3  -MaterialDesignThemes.Wpf.ButtonProgressAssist   IndicatorBackground
 ��  �+  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10�����	#FF8BAFC2
���   �$��Normal$��� -   $��btImport��$	��150��$��0��$��12��$��1��$��2��$��Загрузить��$��Center=�$	��Top=�
 ��  �$ 10�����	#FF8BAFC2
���   �$��Normal$��� $)��#Список сотрудников��$��1��$��0��$��1��$��4��&   System.Windows.Controls.DataGrid  -   $��Employe��	   AutoGenerateColumns	 . 
   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$

 auto    
IsReadOnly . $��2��$��0��$��7��$��4���� $��Список групп��$��1��$��5��$��1��$��2��  -   $��Group��	 . $

 auto  . $��2��$��5��$��7��$��2���� $%��Список кабинетов��$��1��$��8��$��1��$��2��  -   $��	Cabinetes��	 . $

 auto  . $��2��$��8��$��7��$��2���� $)��#Список сотрудников��$��1��$��11��$��1��$��3��  -   $��	Territory��	 . $

 auto  . $��2��$��11��$��7��$��3��