   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	       Unifersitet.ClassesPrep   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  ClassesPrep��5   	   $	��450��6   $	��800��6*   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��200 �6   6-   �� 5      $	��190 �6   6-   �� 5      $��272.788 �6   61   �� 5      $��127.212 �6   �� 5      $��* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��dgRosp��5      $��0��6!   $��1��6.   $��2��5      $��4��6$      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5         AutoGenerateColumns .    
IsReadOnly . 5      �� 5!   
   -   5        $��tbInsert��5!      $��2��6"   $��3��62   $��Center=�6?   �� 5#   
   -   5        $��btExit��5#      $��
Выход��6   $��4��6/   $��3��6?   $	��Top=�6L   $��Center=�6d   $��	45,0,38,0q�6�   $��44��6�   6�   �� 5$   
   -   5        $��btInsert��5$      $��Добавить��6!   $��1��64   $��3��6D   $	��Top=�6Q   $��Center=�6i   6�   �� 5%   
   -   5        $��btUpdate��5%      $��Изменить��6!   $��2��64   $��3��6D   $	��Top=�6Q   $��Center=�6i   6�   �� 5&   
   -   5        $��btDelete��5&      $��Удалить��6!   $��3��63   $��3��6C   $	��Top=�6P   $��Center=�6h   6�   �� 5'   
   -   5        $��
Найти��5'      $��1��6!   $
��Left=�61   $��	60,25,0,0q�6L   $��2��6_   $	��Top=�6l   $��75��6�   6�   �� 5(   
   -	   5         ��Name$ 	chbFilter��5(      $ ��Отфильтровать��6&   $
��Left=�6>   $��	29,28,0,0q�6Y   $��2��6l   $	��Top=�6y   $��2��6�   �� 5)   
   -
   5         ��Name$ cbInfoGroup��5)      $��3��6(   $��2��68   $��Center=�6E   $��1,27,122,37q�6�   $��20��6�   5+      5,      