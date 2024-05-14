using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WS.PracticasProfesionales.Datos.Models
{
    public class Registro
    {
        #region  Usuarios
        public List<DTOUsuarios> ListarApplicationPoolDB_IdVirtualWebSite(string id)
        {
            List<DTOUsuarios> rta = new List<DTOUsuarios>();

            DTOUsuarios Usuarios;

            using (System.Data.SqlClient.SqlConnection con = Conexion.ObtenerConnexionSQL())
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolListarIdVirtualWebSite", con)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IdVirtualWebSite", id));
                con.Open();

                using (System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {

                        Usuarios = new DTOUsuarios
                        {
                            id = dr["id"].ToString(),
                            NombreUsuario = dr["NombreUsuario"].ToString(),
                            email = dr["email"].ToString(),
                            Contraseña = dr["Contraseña"].ToString(),
                            PerfilId = dr["PerfilId"].ToString(),
                            FechaCreacion = dr["FechaCreacion"].ToString(),
                            UltimoAcceso = dr["UltimoAcceso"].ToString(),
                            FechaBaja = dr["FechaBaja"].ToString()



                        };
                        rta.Add(Usuarios);
                    }
                }
            }
            return rta;
        }
        public List<DTOUsuarios> ListarApplicationPoolDB(string terminoDeBusqueda = "")
        {
            List<DTOUsuarios> rta = new List<DTOUsuarios>();

            DTOUsuarios ApplicationPool;

            using (System.Data.SqlClient.SqlConnection con = Conexion.ObtenerConnexionSQL())
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolListar", con)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TerminoDeBusqueda", terminoDeBusqueda));

                con.Open();

                using (System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {

                        ApplicationPool = new DTOUsuarios
                        {
                            id = dr["id"].ToString(),
                            NombreUsuario = dr["NombreUsuario"].ToString(),
                            email = dr["email"].ToString(),
                            Contraseña = dr["Contraseña"].ToString(),
                            PerfilId = dr["PerfilId"].ToString(),
                            FechaCreacion = dr["FechaCreacion"].ToString(),
                            UltimoAcceso = dr["UltimoAcceso"].ToString(),
                            FechaBaja = dr["FechaBaja"].ToString()



                        };
                        rta.Add(ApplicationPool);
                    }
                }
            }
            return rta;
        }

        public DTOUsuarios BuscarApplicationPoolDB(string id)
        {
            DTOUsuarios ApplicationPool = new DTOUsuarios();
            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolBuscarId", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Id", id));
            oCnn.Open();

            using (System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    ApplicationPool = new DTOUsuarios
                    {
                        id = dr["id"].ToString(),
                        NombreUsuario = dr["NombreUsuario"].ToString(),
                        email = dr["email"].ToString(),
                        Contraseña = dr["Contraseña"].ToString(),
                        PerfilId = dr["PerfilId"].ToString(),
                        FechaCreacion = dr["FechaCreacion"].ToString(),
                        UltimoAcceso = dr["UltimoAcceso"].ToString(),
                        FechaBaja = dr["FechaBaja"].ToString()

                    };
                }
            }
            return ApplicationPool;
        }
        public int ActualizarApplicationPoolDB(DTOUsuarios pool, string usuario)
        {

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolActualizar", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", pool.id));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NombreUsuario", pool.NombreUsuario));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@email", pool.email));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contraseña", pool.Contraseña));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PerfilId", pool.PerfilId));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FechaCreacion", pool.FechaCreacion));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@UltimoAcceso", pool.UltimoAcceso));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FechaBaja", pool.FechaBaja));

            int result = -1;
            cmd.Parameters.Add("@Result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            oCnn.Open();
            cmd.ExecuteNonQuery();
            result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            oCnn.Close();

            return result;
        }
        public int InsertarApplicationPoolDB(DTOUsuarios pool, string usuario)
        {

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolInsertar", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@id", pool.id));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@NombreUsuario", pool.NombreUsuario));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@email", pool.email));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Contraseña", pool.Contraseña));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PerfilId", pool.PerfilId));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FechaCreacion", pool.FechaCreacion));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@UltimoAcceso", pool.UltimoAcceso));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FechaBaja", pool.FechaBaja));

            int result = -1;
            cmd.Parameters.Add("@Result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            oCnn.Open();
            cmd.ExecuteNonQuery();
            result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            oCnn.Close();

            return result;
        }
        public int BorrarApplicationPoolDB(string id, string usuario)
        {
            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolDelete", oCnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Id", id));
            cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Usuario", usuario));

            int result = -1;
            cmd.Parameters.Add("@Result", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            oCnn.Open();
            cmd.ExecuteNonQuery();
            result = Convert.ToInt32(cmd.Parameters["@Result"].Value);
            oCnn.Close();

            return result;
        }


        public string ObtenerApplicationPoolID()
        {
            string resultado = string.Empty;

            System.Data.SqlClient.SqlConnection oCnn = Conexion.ObtenerConnexionSQL();
            oCnn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("applicationPoolObtenerUltimoID", oCnn);
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

        #endregion

    }
}
