using System.Windows;
using AgileProject.Utility;

namespace AgileProject {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        private static Queries query;

        public MainWindow() {
            InitializeComponent();
            BindTable();
        }

        private void BindTable() {
            query = new Queries();
            datatable.DataContext = query.GetAllFromTableWhere("acceptancecriteria", "userstoryid", "1");
        }

    }
}
