   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	       Unifersitet.Staff   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  Staff��5   	   $	��450��6   $	��800��6$   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��200 �6   6-   �� 5      $	��190 �6   6-   �� 5      $��272.788 �6   61   �� 5      $��127.212 �6   �� 5      $��* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��	dgSpisokS��5      $��0��6$   $��1��61   $��2��5      $��4��6$      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5         AutoGenerateColumns .    
IsReadOnly . 5      �� 5!   
   -   5        $��tbName��5!      $��12(�6    $��4��6.   $��1��6;   $��Center=�5"      $��1��6,   6B   �� 5#   
   -   5        $��tbFamily��5#      $��12(�6"   $��4��60   $��2��6=   $��Center=�5$      $��1��6,   6B   �� 5%   
   -   5        $��tbotchestvo��5%      $��12(�6%   $��4��63   $��3��6@   $��Center=�5&      $��1��6,   6B   �� 5'   
   -   5        $
��CBox��5'      $��12(�6   $��4��6-   $��4��6:   $��Center=�5(      $��1��6,   6B   �� 5*   
   -   5        $��btExit��5*      $��
Выход��6   $��4��6/   $��3��6?   $	��Top=�6L   $��Center=�6d   6�   �� 5+   
   -   5        $��btInsert��5+      $��Добавить��6!   $��1��64   $��3��6D   $��Center=�6Q   $��
72,0,72,64q�6n   6�   �� 5,   
   -	   5        $��btUpdate��5,      $��Изменить��6!   $��2��64   $��3��6D   $	��Top=�6Q   $��Center=�6i   6�   �� 5-   
   -
   5        $��btDelete��5-      $��Удалить��6!   $��3��63   $��3��6C   $	��Top=�6P   $��Center=�6h   6�   5.      5/      