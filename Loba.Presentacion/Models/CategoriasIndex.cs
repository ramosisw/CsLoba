using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Loba.Modelo.Entidades;

namespace Loba.Presentacion.Models {
    public class CategoriasIndex {
        IList<Categoria> categorias;
        Usuario usuario;

        public Usuario Usuario {
            get { return usuario; }
            set { usuario = value; }
        }

        public IList<Categoria> Categorias {
            get { return categorias; }
            set { categorias = value; }
        }
        IList<Categoria> subcategorias;

        public IList<Categoria> Subcategorias {
            get { return subcategorias; }
            set { subcategorias = value; }
        }
    }
}