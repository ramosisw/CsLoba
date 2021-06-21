using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
   public class Respuesta {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }

        string cuerpo;

        public string Cuerpo {
            get { return cuerpo; }
            set { cuerpo = value; }
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

        IList<Calificacion> calificaciones;

        public IList<Calificacion> Calificaciones {
            get { return calificaciones; }
            set { calificaciones = value; }
        }

        IList<Comentario> comentarios;

        public IList<Comentario> Comentarios {
            get { return comentarios; }
            set { comentarios = value; }
        }
        public int obtenerTotal(Usuario usuario) {
            IList<Respuesta> respuestas = new List<Respuesta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        ICriteria criteria = session.CreateCriteria(this.GetType());
                        criteria.Add(Expression.Eq("Usuario", usuario));
                        respuestas = criteria.List<Respuesta>();
                        transaction.Commit();
                        return respuestas.Count();
                    }
                }
            } catch (Exception error) {
                return respuestas.Count();
            }
        }
        public Respuesta obtenerPorId(int id) {
            Respuesta respuesta = null;
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        ICriteria criteria = session.CreateCriteria(this.GetType());
                        criteria.Add(Expression.Eq("Id", id));
                        respuesta = criteria.UniqueResult<Respuesta>();
                        transaction.Commit();
                    }
                }
            } catch (Exception error) {
            }
            return respuesta;
        }
        public void update(Respuesta respuesta) {
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Update("Respuesta",respuesta);
                        transaction.Commit();
                    }
                }
            } catch (Exception error) {
            }
        }
        public void delete(Respuesta respuesta) {

            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Delete("Respuesta", respuesta);
                        transaction.Commit();
                    }
                }
            } catch (Exception error) {
            }
        }
    }
}
