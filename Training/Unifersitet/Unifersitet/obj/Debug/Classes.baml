   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	       Unifersitet.Classes   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	   -   5          � Title$  Classes��5   	   $	��220��6   $	��700��6&   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $	��100 �6   6-   �� 5      $	��190 �6   6-   �� 5      $	��350 �6   6-   �� 5      $��10 �6   6,   �� 5      $	��300 �6   .+�5   
   �� -   5        $��btExit��5      $��
Выйти��6   $��0��6/   $��0��6?   $��Center=�6L   6�   �� 5   
   -   5        $��lblInfo��5      $>��8Список занятий и посещаемость:��6   $��1��6H   $��0��6X   $��Center=�6e   6�   &   System.Windows.Controls.DataGrid  5   
   -   5        $��	dgSpisokS��5      $��0��6$   $��2��61   $��2��5      $��1��6$      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$
 auto 5         AutoGenerateColumns .    
IsReadOnly . 5      �� 5!   
   -   5         ��Name$ 	chbFilter��5!      $ ��Отфильтровать��6&   $
��Left=�6>   $��3,65,0,0q�6Y   $	��Top=�6k   $��2��6�   �� 5"   
   -   5         ��Name$ cbInfoGroup��5"      $��Center=�6(   $��1,82,136,86q�6t   $��21��6�   $��2��6�   $��2��6�   �� 5#   
   -   5        $��
Найти��5#      $
��Left=�6!   $��	21,17,0,0q�6<   $	��Top=�6O   $��74��6g   $��1��6�   5$      5%      