   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	       Unifersitet.StudentZan   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  
StudentZan��5   	   $	��450��6   $	��800��6)   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��150 �6   6-   �� 5      $	��150 �6   6-   �� 5      $	��500 �6   6-   �� 5      $��* �6   .+�5   
   �� -   5        $��btExit��5      $��
Выйти��6   $��0��6/   $��0��6?   $��Center=�6L   6j   �� 5   
   -   5        $��lblInfo��5      $3��-Список студентов группы:��6   $��1��6B   $��0��6R   $��Center=�6_   6}   �� 5   
   -   5        $��tbInfoGroup��5      $��2��6%   $��0��65   $��Center=�6B   �� 5   
   $��1��6   $��0��6"   $��3��62   $��1��6F   .+�5      �� -   5        $��lblPoisk��5      $��Поиск: ФИО��6$   $��Center=�69   $��0��6V   $��1��6f   $��Center=�6s   6�   �� 5      -   5        $��
cbFamiliya��5      $��1��6)   $��1��69   $��Center=�6F   $��2��6a   6x   �� 5      -   5        $��cbName��5      $��1��6%   $��1��65   $��Center=�6B   $��2��6]   6t   �� 5      -   5        $��cbOtchestvo��5      $��1��6*   $��1��6:   $��Center=�6G   $��2��6b   6y   5       �� 5"   
   -	   5        $��btAdd��5"      $��Добавить��6   $��0��61   $��2��6A   $	��Top=�6N   6h   �� 5#   
   -
   5        $��btUpdate��5#      $��Изменить��6!   $��1��64   $��2��6D   $	��Top=�6Q   6k   �� 5$   
   -   5        $��btDelete��5$      $��Удалить��6!   $��2��63   $��2��6C   $	��Top=�6P   6j   &   System.Windows.Controls.DataGrid  5&   
   -   5        $��	dgSpisokS��5&      $��0��6$   $��3��61   $��2��5'         ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5(         AutoGenerateColumns .    
IsReadOnly . 5+      5,      5-      