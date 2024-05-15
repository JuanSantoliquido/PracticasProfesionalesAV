using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WS.PracticasProfesionales.Datos.Models;

namespace WS.PracticasProfesionales.Datos
{
    public class UsuarioDatos
    {
        #region  Usuarios
 
        public int InsertarUsuario(DTOUsuarios usuario)
        {

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("registrarUsuario", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NombreUsuario", usuario.NombreUsuario));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", usuario.email));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contraseña", usuario.Contraseña));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PerfilId", usuario.PerfilId));

            int result = -1;
            cmd.Parameters.Add("@Result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            oCnn.Open();
            cmd.ExecuteNonQuery();
            result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            oCnn.Close();

            return result;
        }







        #endregion

    }
}
