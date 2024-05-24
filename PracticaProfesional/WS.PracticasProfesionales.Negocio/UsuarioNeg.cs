using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WS.PracticasProfesionales.Datos;
using WS.PracticasProfesionales.Datos.Models;


namespace WS.PracticasProfesionales.Negocio
{
    public class UsuarioNeg
    {

        #region Usuarios

        UsuarioDatos UsuarioDB = new UsuarioDatos();

        //Negocio SP RegistarLogin - InsertarLogin
        public int InsertarUsuario(DTOUsuarios usuario)
        {
            int rta = -1;
            try
            {
                rta = UsuarioDB.InsertarUsuario(usuario);
            }
            catch (System.Exception)
            {
                throw;
            }
            return rta;
        }

        //Negocio SP RegistrarLogin - InsertarLogin
        public int InsertarLogin(DTOLogins login)
        {
            int rta = -1;
            try
            {
                rta = UsuarioDB.InsertarLogin(login);
            }
            catch (System.Exception)
            {
                throw;
            }
            return rta;
        }


        //SP SELECT ->  obtenerUsuarios --- Esta bien?
        public string ObtenerUsuarios()
        {
            string rta = "";
            try
            {
                rta = UsuarioDB.ObtenerUsuarios();
            }
            catch (Exception)
            {
                throw;
            }
            return rta;
        }

        //SP SELECT -> obtenerUsuarioPorNombreUsuario --- Esta bien?

        public string obtenerUsuarioPorNombreUsuario()
        {
            string rta = "";
            try
            {
                rta = UsuarioDB.ObtenerUsuarioPorNombreUsuario();
            }
            catch (Exception)
            {
                throw;
            }
            return rta;
        }

        //SP UPDATE -> DatosPersonales --- Esta bien?

        public int ActualizarApplicationPoolDB(DTODatosPersonales datosPersonales)
        {
            int rta = -1;
            try
            {
                rta = UsuarioDB.actualizarDatosPersonales(datosPersonales);
            }
            catch (System.Exception)
            {
                throw;
            }
            return rta;
        }



        #endregion

    }
}