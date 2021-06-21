using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Loba.Modelo.Entidades {
    public class Actualizacion {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }
        string contenido;

        public string Contenido {
            get { return contenido; }
            set { contenido = value; }
        }
        DateTime fecha;

        public DateTime Fecha {
            get { return fecha; }
            set { fecha = value; }
        }
    }
}
