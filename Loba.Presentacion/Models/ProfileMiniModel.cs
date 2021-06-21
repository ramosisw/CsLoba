using Loba.Modelo.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Loba.Presentacion.Models {
    public class ProfileMiniModel {
        Usuario usuario;

        public Usuario Usuario {
            get { return usuario; }
            set { usuario = value; }
        }
        int porMejResp;

        public int PorMejResp {
            get { return porMejResp; }
            set { porMejResp = value; }
        }
        int respuestas;

        public int Respuestas {
            get { return respuestas; }
            set { respuestas = value; }
        }

    }
}