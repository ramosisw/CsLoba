using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Loba.Modelo.Entidades;
namespace Loba.Presentacion.Models {
    public class PreguntasModel {
        IList<Pregunta> preguntas;

        public IList<Pregunta> Preguntas {
            get { return preguntas; }
            set { preguntas = value; }
        }
    }
}