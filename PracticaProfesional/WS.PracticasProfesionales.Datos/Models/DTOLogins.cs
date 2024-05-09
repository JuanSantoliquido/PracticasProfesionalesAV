using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WS.PracticasProfesionales.Datos.Models
{
    public class DTOLogins
    {
        public string id { get; set; }

        public string UsuarioId { get; set; }

        public string FechaHora { get; set; }

        public string DireccionIP { get; set; }

        public string Exitoso { get; set; }

    }
}
