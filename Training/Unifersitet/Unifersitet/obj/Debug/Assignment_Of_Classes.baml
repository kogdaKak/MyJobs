   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	   '    !Unifersitet.Assignment_Of_Classes   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  Assignment_Of_Classes��5   	   $	��450��6'   $	��600��64   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��200 �6   6-   �� 5      $	��190 �6   6-   �� 5      $��272.788 �6   61   �� 5      $��127.212 �6   �� 5      $��* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��	dgSpisokS��5      $��0��6$   $��1��61   $��1��5      $��4��6$      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5         AutoGenerateColumns .    
IsReadOnly . 5      �� 5   
   -   5        $��btExit��5      $��
Выход��6   $��1��6/   $��1��6?   $	��Top=�6L   $��Center=�6d   $��
83,74,79,0q�6�   6�   �� 5   
   -   5        $��
Найти��5      $��1��6!   $
��Left=�61   $��	66,40,0,0q�6L   $��1��6_   $	��Top=�6l   $��75��6�   6�   �� 5    
   -   5         ��Name$ 	chbFilter��5       $ ��Отфильтровать��6&   $
��Left=�6>   $��	14,48,0,0q�6Y   $��1��6l   $	��Top=�6y   $��2��6�   �� 5!   
   -   5         ��Name$ cbInfoGroup��5!      $��2��6(   $��1��68   $��Center=�6E   $��
8,0,32,187q�6�   �� 5"   
   -   5        $ cbInfoGroup_Copy��5"      $��1��6-   $��Center=�6=   $��22,209,28,188q�6�   $��2��6�   �� 5#   
   -   5        $ cbInfoGroup_Copy1��5#      $��3��6.   $��Center=�6>   $��24,0,99,187.5q�6�   $��1��6�   5$      5%      