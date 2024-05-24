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

        //SP insert --> RegistarUsuario
public int InsertarUsuario(DTOUsuarios usuario)
{
    using (System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL())
    {
        using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("registrarUsuario", oCnn))
        {
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NombreUsuario", usuario.NombreUsuario));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", usuario.email));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contraseña", usuario.Contraseña));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PerfilId", usuario.PerfilId));

            
            oCnn.Open();
            object result = cmd.ExecuteScalar();
            oCnn.Close();

           
            if (result != null) 
            {
              
                int rowsAffected = Convert.ToInt32(result);
                return rowsAffected;
            }
            else 
            {

                return -1;
            }
        }
    }
}





        //SP insert --> RegistarLogin
        public int InsertarLogin(DTOLogins login)
        {

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("registrarLogin", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@usuarioId", login.UsuarioId));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@direccionIP", login.DireccionIP));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@exitoso", login.Exitoso));
                
            int result = -1;
            cmd.Parameters.Add("@Result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            oCnn.Open();
            cmd.ExecuteNonQuery();
            result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            oCnn.Close();

            return result;
        }





        //SP SELECT ->  obtenerUsuarios --- Esta bien?
        public string ObtenerUsuarios()
        {
            string resultado = string.Empty;

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            oCnn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("obtenerUsuarios", oCnn);
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultado = reader["ID"].ToString();
                    }
                }
            };

            return resultado;
        }




        //SP SELECT -> obtenerUsuarioPorNombreUsuario --- Esta bien?
        public string ObtenerUsuarioPorNombreUsuario()
        {
            string resultado = string.Empty;

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            oCnn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("obtenerUsuarioPorNombreUsuario", oCnn);
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        resultado = reader["ID"].ToString();
                    }
                }
            };

            return resultado;
        }



        //SP UPDATE -> actualizarDatosPersonales --- Esta bien?
        public int actualizarDatosPersonales(DTODatosPersonales datosPersonales)
        {

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("actualizarDatosPersonales", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@usuarioId", datosPersonales.UsuarioId));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@nombre", datosPersonales.Nombre));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@apellido", datosPersonales.Apellido));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@fechaNacimiento", datosPersonales.FechaNacimiento));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@generoId", datosPersonales.GeneroId));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@direccion", datosPersonales.Direccion));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@nacionalidad", datosPersonales.Nacionalidad));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pais", datosPersonales.Pais));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@dni", datosPersonales.DNI));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@mail", datosPersonales.Mail));


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
