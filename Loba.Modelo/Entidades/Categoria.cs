using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
    public class Categoria {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }
        string nombre;

        public string Nombre {
            get { return nombre; }
            set { nombre = value; }
        }
        IList<Subcategoria> subcategorias;

        public IList<Subcategoria> Subcategorias {
            get { return subcategorias; }
            set { subcategorias = value; }
        }

        public IList<Categoria> obtenerTodas() {
            IList<Categoria> categorias = new List<Categoria>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    IQuery query = session.CreateQuery("from Categoria");
                    categorias = query.List<Categoria>();
                }

            } catch (Exception error) {
            }
            return categorias;
        }
        public IList<Categoria> obtenerCategorias() {
            IList<Categoria> categorias = new List<Categoria>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    IQuery query = session.CreateQuery("from Categoria").SetMaxResults(9);
                    categorias = query.List<Categoria>();
                }

            } catch (Exception error) {
            }
            return categorias;
        }
        public IList<Categoria> obtenerSubCategorias() {
            IList<Categoria> categorias = new List<Categoria>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    IQuery query = session.CreateQuery("from Categoria").SetFirstResult(9).SetMaxResults(20);
                    categorias = query.List<Categoria>();
                }

            } catch (Exception error) {
            }
            return categorias;
        }
        public Categoria obtenerPorId(int id) {
            Categoria cat = null;
            using (ISession session= Persistencia.SessionFactory.OpenSession()) {
                ICriteria criteria = session.CreateCriteria(this.GetType());
                criteria.Add(Expression.Eq("Id", id));
                cat = criteria.UniqueResult<Categoria>();
            }
            return cat;
        }

    }
}
