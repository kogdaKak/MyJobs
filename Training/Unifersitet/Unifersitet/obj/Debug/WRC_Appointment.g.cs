﻿#pragma checksum "..\..\WRC_Appointment.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "22DF7F471F4353B2C1E7B77C2EC75725736FB345874B6888CBB7D7D65D1209D1"
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
    /// WRC_Appointment
    /// </summary>
    public partial class WRC_Appointment : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 25 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dgSpisokS;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbStudent;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbWRC;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cbAppointment;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btInsert;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btUpdate;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btDelete;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btExit;
        
        #line default
        #line hidden
        
        
        #line 39 "..\..\WRC_Appointment.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btSerch;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\WRC_Appointment.xaml"
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
            System.Uri resourceLocater = new System.Uri("/Unifersitet;component/wrc_appointment.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\WRC_Appointment.xaml"
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
            
            #line 8 "..\..\WRC_Appointment.xaml"
            ((Unifersitet.WRC_Appointment)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded_1);
            
            #line default
            #line hidden
            return;
            case 2:
            this.dgSpisokS = ((System.Windows.Controls.DataGrid)(target));
            
            #line 29 "..\..\WRC_Appointment.xaml"
            this.dgSpisokS.AutoGeneratingColumn += new System.EventHandler<System.Windows.Controls.DataGridAutoGeneratingColumnEventArgs>(this.DgWCR_AutoGeneratingColumn);
            
            #line default
            #line hidden
            return;
            case 3:
            this.cbStudent = ((System.Windows.Controls.ComboBox)(target));
            
            #line 32 "..\..\WRC_Appointment.xaml"
            this.cbStudent.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbOtchestvo_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.cbWRC = ((System.Windows.Controls.ComboBox)(target));
            
            #line 33 "..\..\WRC_Appointment.xaml"
            this.cbWRC.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbFamiliya_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.cbAppointment = ((System.Windows.Controls.ComboBox)(target));
            
            #line 34 "..\..\WRC_Appointment.xaml"
            this.cbAppointment.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cbInfoGroup_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btInsert = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\WRC_Appointment.xaml"
            this.btInsert.Click += new System.Windows.RoutedEventHandler(this.btInsert_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btUpdate = ((System.Windows.Controls.Button)(target));
            
            #line 36 "..\..\WRC_Appointment.xaml"
            this.btUpdate.Click += new System.Windows.RoutedEventHandler(this.btUpdate_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.btDelete = ((System.Windows.Controls.Button)(target));
            
            #line 37 "..\..\WRC_Appointment.xaml"
            this.btDelete.Click += new System.Windows.RoutedEventHandler(this.btDelete_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.btExit = ((System.Windows.Controls.Button)(target));
            
            #line 38 "..\..\WRC_Appointment.xaml"
            this.btExit.Click += new System.Windows.RoutedEventHandler(this.btExit_Click_1);
            
            #line default
            #line hidden
            return;
            case 10:
            this.btSerch = ((System.Windows.Controls.Button)(target));
            
            #line 39 "..\..\WRC_Appointment.xaml"
            this.btSerch.Click += new System.Windows.RoutedEventHandler(this.btSerch_Click);
            
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

