﻿#pragma checksum "..\..\Import.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "B23C827CB2DF51557E45DBCBA1E8E61D9CA6DC7AF8378F01A20EA3778F0BD976"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using MptHelperDisShed;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace MptHelperDisShed {
    
    
    /// <summary>
    /// MainWindow
    /// </summary>
    public partial class MainWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 39 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtFilePath;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btRaspredelenie;
        
        #line default
        #line hidden
        
        
        #line 42 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btImport;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btEmploye;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid Employe;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid Group;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid Cabinetes;
        
        #line default
        #line hidden
        
        
        #line 55 "..\..\Import.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid Territory;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/MptHelperDisShed;component/import.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\Import.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 9 "..\..\Import.xaml"
            ((MptHelperDisShed.MainWindow)(target)).Closed += new System.EventHandler(this.Window_Closed);
            
            #line default
            #line hidden
            
            #line 9 "..\..\Import.xaml"
            ((MptHelperDisShed.MainWindow)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.txtFilePath = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.btRaspredelenie = ((System.Windows.Controls.Button)(target));
            
            #line 40 "..\..\Import.xaml"
            this.btRaspredelenie.Click += new System.Windows.RoutedEventHandler(this.btRaspredelenie_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.btImport = ((System.Windows.Controls.Button)(target));
            
            #line 42 "..\..\Import.xaml"
            this.btImport.Click += new System.Windows.RoutedEventHandler(this.btImport_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.btEmploye = ((System.Windows.Controls.Button)(target));
            
            #line 45 "..\..\Import.xaml"
            this.btEmploye.Click += new System.Windows.RoutedEventHandler(this.bt_employe);
            
            #line default
            #line hidden
            return;
            case 6:
            this.Employe = ((System.Windows.Controls.DataGrid)(target));
            
            #line 49 "..\..\Import.xaml"
            this.Employe.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.Employe_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            case 7:
            this.Group = ((System.Windows.Controls.DataGrid)(target));
            
            #line 51 "..\..\Import.xaml"
            this.Group.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.Group_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            case 8:
            this.Cabinetes = ((System.Windows.Controls.DataGrid)(target));
            
            #line 53 "..\..\Import.xaml"
            this.Cabinetes.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.Cabinetes_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            case 9:
            this.Territory = ((System.Windows.Controls.DataGrid)(target));
            
            #line 55 "..\..\Import.xaml"
            this.Territory.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.Territory_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}
