#pragma checksum "..\..\Сonnection_Сonfiguration.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "03E8906D47B412A793542B122C5870601CB6FD4DECD8708F261E1918EB48AA5A"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

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
    /// Сonnection_Сonfiguration
    /// </summary>
    public partial class Сonnection_Сonfiguration : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 28 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblMainTitle;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblServer;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbServer;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblDate;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbDatabase;
        
        #line default
        #line hidden
        
        
        #line 43 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btCheked;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btConnect;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\Сonnection_Сonfiguration.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btCancel;
        
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
            System.Uri resourceLocater = new System.Uri("/MptHelperDisShed;component/%d0%a1onnection_%d0%a1onfiguration.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\Сonnection_Сonfiguration.xaml"
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
            this.lblMainTitle = ((System.Windows.Controls.Label)(target));
            return;
            case 2:
            this.lblServer = ((System.Windows.Controls.Label)(target));
            return;
            case 3:
            this.cbServer = ((System.Windows.Controls.ComboBox)(target));
            
            #line 32 "..\..\Сonnection_Сonfiguration.xaml"
            this.cbServer.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbServers_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.lblDate = ((System.Windows.Controls.Label)(target));
            return;
            case 5:
            this.cbDatabase = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 6:
            this.btCheked = ((System.Windows.Controls.Button)(target));
            
            #line 43 "..\..\Сonnection_Сonfiguration.xaml"
            this.btCheked.Click += new System.Windows.RoutedEventHandler(this.BtCheked_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btConnect = ((System.Windows.Controls.Button)(target));
            
            #line 44 "..\..\Сonnection_Сonfiguration.xaml"
            this.btConnect.Click += new System.Windows.RoutedEventHandler(this.btConnect_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.btCancel = ((System.Windows.Controls.Button)(target));
            
            #line 45 "..\..\Сonnection_Сonfiguration.xaml"
            this.btCancel.Click += new System.Windows.RoutedEventHandler(this.BtCancel_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

