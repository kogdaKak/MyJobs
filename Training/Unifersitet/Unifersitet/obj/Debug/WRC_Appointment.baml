   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	   !    Unifersitet.WRC_Appointment   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  WRC_Appointment��5   	   $	��350��6!   $	��600��6.   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��200 �6   6-   �� 5      $	��190 �6   6-   �� 5      $��272.788 �6   61   .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��	dgSpisokS��5      $��0��6$   $��1��61   $��2��5      $��4��6$      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5         AutoGenerateColumns .    
IsReadOnly . 5      �� 5    
   -   5        $��	cbStudent��5       $��1��6$   $��2��64   $��Center=�6A   $��1��6\   6�   �� 5!   
   -   5        $��cbWRC��5!      $��1��6    $��3��60   $��Center=�6=   $��1��6X   6�   �� 5"   
   -   5        $��cbAppointment��5"      $��1��6(   $��4��68   $��Center=�6E   $��1��6`   6�   �� 5#   
   -   5        $��btInsert��5#      $��Добавить��6!   $��2��64   $��2��6D   $��Center=�6Q   $��1��6l   $��21��6�   $��	0,21,0,22q�6�   6�   �� 5$   
   -   5        $��btUpdate��5$      $��Изменить��6!   $��2��64   $��3��6D   $��Center=�6Q   $��1��6l   $��21��6�   $��	0,21,0,22q�6�   6�   �� 5%   
   -   5        $��btDelete��5%      $��Удалить��6!   $��2��63   $��4��6C   $��Center=�6P   $��1��6k   $��21��6   $��	0,21,0,22q�6�   6�   �� 5&   
   -	   5        $��btExit��5&      $��
Выйти��6   $��3��6/   $��4��6?   $��Center=�6L   $��1��6g   $��21��6{   $��
0,21,73,22q�6�   6�   �� 5'   
   -
   5        $��btSerch��5'      $��Искать��6    $��3��61   $��2��6A   $��Center=�6N   $��1��6i   $��21��6}   $��
0,21,72,22q�6�   6�   �� 5(   
   -   5         ��Name$ 	chbFilter��5(      $ ��Отфильтровать��6&   $
��Left=�6>   $��	28,25,0,0q�6Y   $��3��6l   $	��Top=�6y   $��3��6�   5)      5*      