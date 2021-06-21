using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Loba.Modelo.Entidades;

namespace Loba.Presentacion.Models {
    public class PreguntaModel {
        Usuario usuario;

        public Usuario Usuario {
            get { return usuario; }
            set { usuario = value; }
        }
        Pregunta pregunta;

        public Pregunta Pregunta {
            get { return pregunta; }
            set { pregunta = value; }
        }
    }
}