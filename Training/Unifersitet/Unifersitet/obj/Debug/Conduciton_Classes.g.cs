#pragma checksum "..\..\Conduciton_Classes.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "5AA4EAFAF0ED7AE9F8C196AFE0797C32824108CA2DB393D4B578F4757EF4AF90"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

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
using Unifersitet;


namespace Unifersitet {
    
    
    /// <summary>
    /// Conduciton_Classes
    /// </summary>
    public partial class Conduciton_Classes : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 26 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dgSpisokS;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btExit;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbDate;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbTime;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbAOS;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btInsert;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btUpdate;
        
        #line default
        #line hidden
        
        
        #line 42 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btDelete;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\Conduciton_Classes.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox chbFilter;
        
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
            System.Uri resourceLocater = new System.Uri("/Unifersitet;component/conduciton_classes.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\Conduciton_Classes.xaml"
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
            
            #line 8 "..\..\Conduciton_Classes.xaml"
            ((Unifersitet.Conduciton_Classes)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.dgSpisokS = ((System.Windows.Controls.DataGrid)(target));
            
            #line 30 "..\..\Conduciton_Classes.xaml"
            this.dgSpisokS.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.DgWCR_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            case 3:
            this.btExit = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\Conduciton_Classes.xaml"
            this.btExit.Click += new System.Windows.RoutedEventHandler(this.btExit_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.tbDate = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.tbTime = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.cbAOS = ((System.Windows.Controls.ComboBox)(target));
            
            #line 39 "..\..\Conduciton_Classes.xaml"
            this.cbAOS.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbAOS_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btInsert = ((System.Windows.Controls.Button)(target));
            
            #line 40 "..\..\Conduciton_Classes.xaml"
            this.btInsert.Click += new System.Windows.RoutedEventHandler(this.btInsert_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.btUpdate = ((System.Windows.Controls.Button)(target));
            
            #line 41 "..\..\Conduciton_Classes.xaml"
            this.btUpdate.Click += new System.Windows.RoutedEventHandler(this.btUpdate_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.btDelete = ((System.Windows.Controls.Button)(target));
            
            #line 42 "..\..\Conduciton_Classes.xaml"
            this.btDelete.Click += new System.Windows.RoutedEventHandler(this.btDelete_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            
            #line 45 "..\..\Conduciton_Classes.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            case 11:
            this.chbFilter = ((System.Windows.Controls.CheckBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

