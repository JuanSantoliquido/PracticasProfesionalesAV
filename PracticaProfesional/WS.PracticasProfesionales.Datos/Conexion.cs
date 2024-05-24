
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WS.PracticasProfesionales.Datos

{
    internal class Conexion
    {
        public static System.Data.SqlClient.SqlConnection ObtenerConnexionSQL()
        {
            string connectionString = @"Data Source=DESKTOP-5J66NV5\SQLEXPRESS;Initial Catalog=practica;Integrated Security=True";
            return new System.Data.SqlClient.SqlConnection(connectionString);
        }
    }
}