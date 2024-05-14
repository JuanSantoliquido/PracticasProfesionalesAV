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
            string _conString = System.Configuration.ConfigurationManager.ConnectionStrings["MapaDB"].ConnectionString;
            return new System.Data.SqlClient.SqlConnection(_conString);
        }
    }
}
