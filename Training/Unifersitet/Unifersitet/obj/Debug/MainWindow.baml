   M S B A M L   `   `   `  ����F  BUnifersitet, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:UnifersitetUnifersitet  5   	       Unifersitet.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Unifersitet     5   	     � Title$  Авторизация��5   	   $	��450��6   $	��800��6*   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   6.   �� 5      $	��17* �6   .+�5   
   �� -   5        $��lblEnterLogin��5      $��15(�6%   $��0��63   $��0��6@   $ ��Введите логин:��5      $��Center=�5      $
��0,15q�6+   6;   �� 5   
   -   5        $��lblEnterPassword��5      $��15(�6(   $��1��66   $��0��6C   $"��Введите пароль:��5      $��Center=�5      $
��0,15q�6+   6;   G� 5   
   -   5        $��tbEnterLogin��5      $��12(�6*   $��0��68   $��1��6E   $��Center=�5      $��2��6,   $
��0,19q�6@   6P   G� 5   
   -   5        $��tbEnterPassword��5      $��12(�6-   $��1��6;   $��1��6H   $��Center=�5      $��2��6-   $
��0,19q�6A   6Q   A� 5   
    A� Rows$ 2��6   $��0��6   $��2��6/   $��3��5      .+�5      �� -   5        $��btEnter��5      $��22(�6$   $��Вход��62   $��0��5       $��2��6!   $��2��6.   6D   �� 5!      -   5        $��btLeave��5!      $��22(�6$   $��Отмена��62   $��0��5"      $��2��6!   $��2��6.   6D   �� 5#      -   5        $��btReg��5#      $��22(�6"   $��Регистрация��60   $��
0,0,-397,0q�6F   6]   5$      5&      5'      