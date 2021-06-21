using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Loba.Modelo.Enumeradores;

namespace Loba.Modelo.Entidades {
    public class Calificacion {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }
        Usuario usuario;

        public Usuario Usuario {
            get { return usuario; }
            set { usuario = value; }
        }
        TipoVoto tipoVoto;

        public TipoVoto TipoVoto {
            get { return tipoVoto; }
            set { tipoVoto = value; }
        }
    }
}
