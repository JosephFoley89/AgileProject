using System.Windows;
using AgileProject.Utility;

namespace AgileProject {
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application {
        public App() {
            InitializeComponent();
            EstablishConnection();
        }

        // <summary>
        // Connecting to the local database.
        // </summary>

        private void EstablishConnection() {
            SQLConnection connection = new SQLConnection();
            connection.Open();
        }

    }
}
