using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WS.PracticasProfesionales.Datos.Models
{
    public class DTODatosPersonales
    {

        public string id { get; set; }

        public string UsuarioId { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string FechaNacimiento { get; set; }

        public string GeneroId { get; set; }

        public string Direccion { get; set; }

        public string Nacionalidad { get; set; }

        public string Pais { get; set; }

        public string DNI { get; set; }

        public string Mail { get; set; }
    }
}
