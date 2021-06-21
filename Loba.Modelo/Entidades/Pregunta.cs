using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Loba.Modelo.Entidades {
    public class Pregunta {
        int id;

        public int Id {
            get { return id; }
            set { id = value; }
        }
        string titulo;

        public string Titulo {
            get { return titulo; }
            set { titulo = value; }
        }
        string descripcion;

        public string Descripcion {
            get { return descripcion; }
            set { descripcion = value; }
        }
        IList<Respuesta> respuestas;

        public IList<Respuesta> Respuestas {
            get { return respuestas; }
            set { respuestas = value; }
        }
        Categoria categoria;

        public Categoria Categoria {
            get { return categoria; }
            set { categoria = value; }
        }
        Subcategoria subcategoria;

        public Subcategoria Subcategoria {
            get { return subcategoria; }
            set { subcategoria = value; }
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
        string actualizacion;

        public string Actualizacion {
            get { return actualizacion; }
            set { actualizacion = value; }
        }
        IList<Actualizacion> actualizaciones;

        public IList<Actualizacion> Actualizaciones {
            get { return actualizaciones; }
            set { actualizaciones = value; }
        }
        MejorRespuesta mejorRespuesta;

        public MejorRespuesta MejorRespuesta {
            get { return mejorRespuesta; }
            set { mejorRespuesta = value; }
        }
        public IList<Pregunta> obtenerTodas() {
            IList<Pregunta> preguntas = new List<Pregunta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    IQuery query = session.CreateQuery("from Pregunta ORDER BY Fecha DESC");
                    preguntas = query.List<Pregunta>();
                    
                }

            } catch (Exception error) {
            }
            return preguntas;
        }
        public Pregunta obtenerPorId(int id) {
            Pregunta pregunta = null;
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        ICriteria criteria = session.CreateCriteria(this.GetType());
                        criteria.Add(Expression.Eq("Id", id));
                        pregunta = criteria.UniqueResult<Pregunta>();
                        transaction.Commit();
                    }
                }
            } catch (Exception error) {
            }    
            return pregunta;
        }
        public void guardar(Pregunta pregunta) {
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Save("Pregunta",pregunta);
                        transaction.Commit();
                    }
                }

            } catch (Exception error) {
            }            
        }
        public IList<Pregunta> obtenerCategoria(Categoria categoria) {
            IList<Pregunta> preguntas = new List<Pregunta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    ICriteria criteria = session.CreateCriteria(this.GetType());
                    criteria.Add(Expression.Eq("Categoria", categoria));
                    criteria.AddOrder(Order.Desc("Fecha"));
                    preguntas = criteria.List<Pregunta>();
                }

            } catch (Exception error) {
            }
            return preguntas;
        }
        public IList<Pregunta> obtenerSubcategoria(Subcategoria subcategoria) {
            IList<Pregunta> preguntas = new List<Pregunta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    ICriteria criteria = session.CreateCriteria(this.GetType());
                    criteria.Add(Expression.Eq("Subcategoria", subcategoria));
                    criteria.AddOrder(Order.Desc("Fecha"));
                    preguntas = criteria.List<Pregunta>();
                }

            } catch (Exception error) {
            }
            return preguntas;
        }

        public void update(Pregunta pregunta) {
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Update("Pregunta", pregunta);
                        transaction.Commit();
                    }
                }

            } catch (Exception error) {
            }
        }
        public void borrar(Pregunta pregunta) {
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Delete("Pregunta", pregunta);
                        transaction.Commit();
                    }
                }

            } catch (Exception error) {
            }
        }

        public IList<Pregunta> buscar(string q) {
            IList<Pregunta> preguntas = new List<Pregunta>();
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    ICriteria criteria = session.CreateCriteria(this.GetType());
                    criteria.Add(Restrictions.InsensitiveLike("Titulo", q, MatchMode.Anywhere));
                    criteria.AddOrder(Order.Desc("Fecha"));
                    preguntas = criteria.List<Pregunta>();
                }

            } catch (Exception error) {
            }
            return preguntas;
        }
    }

}
