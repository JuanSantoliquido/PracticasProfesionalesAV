using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WS.PracticasProfesionales.Datos;
using WS.PracticasProfesionales.Datos.Models;


namespace WS.PracticasProfesionales.Negocio
{

    public class RegistroNeg
    {

        #region Usuarios

        UsuarioDatos UsuarioDB = new UsuarioDatos();


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
      
        #endregion

    }
}