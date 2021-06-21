using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
    public class Comentario {
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
        Usuario usuario;

        public Usuario Usuario {
            get { return usuario; }
            set { usuario = value; }
        }
        DateTime fecha;

        public DateTime Fecha {
            get { return fecha; }
            set { fecha = value; }
        }
    }
}
