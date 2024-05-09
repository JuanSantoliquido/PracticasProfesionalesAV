using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WS.PracticasProfesionales.Datos.Models
{
    public class DTOUsuarios
    {
        public string id { get; set; }

        public string NombreUsuario { get; set; }

        public string email { get; set; }

        public string Contraseña { get; set; }

        public string PerfilId { get; set; }

        public string FechaCreacion { get; set; }

        public string UltimoAcceso { get; set; }

        public string FechaBaja { get; set; }
    }
}
