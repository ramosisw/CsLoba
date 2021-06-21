using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
    public class Subcategoria {
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
        public Subcategoria obtenerPorId(int id) {
            Subcategoria cat = null;
            using (ISession session= Persistencia.SessionFactory.OpenSession()) {
                ICriteria criteria = session.CreateCriteria(this.GetType());
                criteria.Add(Expression.Eq("Id", id));
                cat = criteria.UniqueResult<Subcategoria>();
            }
            return cat;
        }
        public IList<Subcategoria> obtenerTodas() {
            IList<Subcategoria> categorias = new List<Subcategoria>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    IQuery query = session.CreateQuery("from Subcategoria");
                    categorias = query.List<Subcategoria>();
                }

            } catch (Exception error) {
            }
            return categorias;
        }
    }
}
