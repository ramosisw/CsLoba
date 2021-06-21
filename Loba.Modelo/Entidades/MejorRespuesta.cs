using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
    public class MejorRespuesta {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }
        Respuesta respuesta;

        public Respuesta Respuesta {
            get { return respuesta; }
            set { respuesta = value; }
        }
        string comentario;

        public string Comentario {
            get { return comentario; }
            set { comentario = value; }
        }
        int valoracion; 

        public int Valoracion {
            get { return valoracion; }
            set { valoracion = value; }
        }
        public int obtenerTotal(Usuario usuario) {
            IList<MejorRespuesta> respuestas = new List<MejorRespuesta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        /*ICriteria criteria = session.CreateCriteria(this.GetType());
                        criteria.Add(Expression.Sql("Respuesta.Usuario.Id =?", usuario.Id, NHibernateUtil.Int32));
                        respuestas = criteria.List<MejorRespuesta>();
                        transaction.Commit();*/
                        IQuery query = session.CreateQuery("from MejorRespuesta as r WHERE r.Respuesta.Usuario.Id=:Id");
                        query.SetInt32("Id",usuario.Id);
                        respuestas = query.List<MejorRespuesta>();
                        return respuestas.Count();
                    }
                }
            } catch (Exception error) {
                return respuestas.Count();
            }
        }
    }
}
