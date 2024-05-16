using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using WS.PracticasProfesionales.Datos.Models;
using WS.PracticasProfesionales.Negocio;

namespace WS.PracticasProfesionales
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class GestionarUsuarios : WebService
    {
        //Libreria para gestionar registros, añadí el archivo log4net.config a la presentacion
        //private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(GestionarUsuarios).Name);

        #region WEBSITE


        [WebMethod(Description = "InsertarUsuario: Registra un usuario.")]
        public int InsertarUsuario(DTOUsuarios usuario)
        {

            int respuesta = -1;

            RegistroNeg usuarios = new RegistroNeg();
            try
            {
                if (usuario.PerfilId == "") { usuario.PerfilId = null; }
                respuesta = usuarios.InsertarUsuario(usuario);
            }
            catch (System.Data.SqlClient.SqlException exsql)
            {

                //log.Fatal(exsql.Message + "***" + exsql.StackTrace);
            }

            return respuesta;
        }
    }
    #endregion

}
