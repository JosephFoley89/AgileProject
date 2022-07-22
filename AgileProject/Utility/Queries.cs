using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace AgileProject.Utility {
    internal class Queries {
        private static MySqlConnection connection;
        private static MySqlCommand query;
        private static MySqlDataAdapter adapter;
        private static DataTable datatable;

        //This is used to lower the total amount of code necessary to write.
        //Creates a SQLConnection object to gather the active connection,
        //creates a new MySqlCommand object using the argument and the aforementioned
        //connection, creates the datatable object, creates the MySqlAdaptor instance
        //and finally fills the data table with the adapted data from the database.
        private void SendQuery(string queryString) {
            SQLConnection con = new SQLConnection();
            connection = con.GetConnection();
            query = new MySqlCommand(queryString, connection);
            datatable = new DataTable();
            adapter = new MySqlDataAdapter(query);
            adapter.Fill(datatable);
        }

        //Used to get all from x table and return the resulting data to be populated
        //in whichever datagridview
        public DataTable GetAllFromTable(string table) {
            SendQuery($"SELECT * FROM {table}");
            return datatable;
        }

        //Used to get all from x table where y = z and return the resulting data to be populated
        //in whichever datagridview. This will likely mostly be used in this application to gather
        //related records from the database.
        public DataTable GetAllFromTableWhere(string table, string value, string selector) {
            SendQuery($"SELECT * FROM {table} WHERE {value}={selector}");
            return datatable;
        }

    }
}
