using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Loba.Modelo.Enumeradores;


namespace Loba.Modelo.Entidades {
    public class Usuario {
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
        string apellidos;

        public string Apellidos {
            get { return apellidos; }
            set { apellidos = value; }
        }
        string correo;

        public string Correo {
            get { return correo; }
            set { correo = value; }
        }
        string nombre_usuario;

        public string Nombre_usuario {
            get { return nombre_usuario; }
            set { nombre_usuario = value; }
        }
        string contrasena;

        public string Contrasena {
            get { return contrasena; }
            set { contrasena = value; }
        }
        DateTime fechaRegistro;

        public DateTime FechaRegistro {
            get { return fechaRegistro; }
            set { fechaRegistro = value; }
        }
        DateTime fechaNacimiento;

        public DateTime FechaNacimiento {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }
        EnumSexo sexo;

        public EnumSexo Sexo {
            get { return sexo; }
            set { sexo = value; }
        }       
        string path_imagen;
        public string Path_imagen {
            get { return path_imagen; }
            set { path_imagen = value; }
        }

        public Usuario Login(Usuario usuario) {
            using (ISession session= Persistencia.SessionFactory.OpenSession()) {
                ICriteria criteria = session.CreateCriteria(this.GetType());
                criteria.Add(Expression.Eq("Nombre_usuario", usuario.Nombre_usuario));
                criteria.Add(Expression.Eq("Contrasena", usuario.Contrasena));
                usuario = criteria.UniqueResult<Usuario>();
            }
            return usuario;
        }
        public Usuario obtenerPorId(int id) {
            Usuario usuario_l = null;
            using (ISession session= Persistencia.SessionFactory.OpenSession()) {
                ICriteria criteria = session.CreateCriteria(this.GetType());
                criteria.Add(Expression.Eq("Id", id));
                usuario_l = criteria.UniqueResult<Usuario>();
            }
            return usuario_l;
        }
        public void guardar(Usuario usuario) {
            try {
                using (ISession session = Persistencia.SessionFactory.OpenSession()) {
                    using (ITransaction transaction = session.BeginTransaction()) {
                        session.Save("Usuario", usuario);
                        transaction.Commit();
                    }
                }
            } catch (Exception error) {  }
        }

        public bool existNameUser(Usuario usuario) {
            Usuario usuario_l = null;
            using (ISession session= Persistencia.SessionFactory.OpenSession()) {
                ICriteria criteria = session.CreateCriteria(this.GetType());
                criteria.Add(Expression.Eq("Nombre_usuario", usuario.Nombre_usuario));
                usuario_l = criteria.UniqueResult<Usuario>();
            }
            return usuario_l==null?false:true;
        }
    }
}
