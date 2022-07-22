using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Windows;

namespace AgileProject.Utility {
    internal class SQLConnection {
        private static MySqlConnection? connection;

        public void Open() {
            connection = new MySqlConnection(
                "server=localhost;port=3306;database=agile_schema;Uid=root;Password=Cuthb3rt89!;"
            );

            try {
                connection.Open();
                SetConnection(connection);
                Console.Write("CONNECTED!");
            } catch (Exception ex) {
                Console.WriteLine(ex.Message);
            }
        }

        public MySqlConnection GetConnection() {
            return connection;
        }

        private static void SetConnection(MySqlConnection c) {
            connection = c;
        }

    }
}
