using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Loba.Presentacion.Models;
using Loba.Modelo.Entidades;
using System.IO;
using Loba.Modelo.Enumeradores;

namespace Loba.Presentacion.Controllers {
    public class HomeController : Controller {
        //
        // GET: /Home/
        public ActionResult Index(string categoria,string subcategoria, string q) {
            PreguntasModel indexModel=new PreguntasModel();
            Categoria cat=null;
            Subcategoria subcat=null;
            if (categoria!=null) {
                cat=new Categoria().obtenerPorId(int.Parse(categoria));
                indexModel.Preguntas=new Pregunta().obtenerCategoria(cat);
            } else if (subcategoria!=null) {
                subcat=new Subcategoria().obtenerPorId(int.Parse(subcategoria));
                indexModel.Preguntas=new Pregunta().obtenerSubcategoria(subcat);
            }else if(q!=null){
                indexModel.Preguntas=new Pregunta().buscar(q);
            }   else {
                indexModel.Preguntas=new Pregunta().obtenerTodas();
            }
            return View("Index", indexModel);
        }
        //Cerrar session del Usuario
        public ActionResult Logout() {
            HttpContext.Session.Remove("userID");
            return RedirectToAction("Index");
        }
        //Iniciar session de Usuario
        public ActionResult Login(string registro,string p_id,string title) {
            if (HttpContext.Session["userID"]!=null) {
                return RedirectToAction("Index");
            }
            if (p_id!=null) {
                ViewData["p_id"]=p_id;
            }
            if (title!=null) {
                ViewData["titulo"]=title;
            }
            if (registro!=null && registro.Equals("True")) {
                ViewData["Exito"]="Te Registraste correctamnte, ahora inicia sesion.";
            }
            return View("Login", new Usuario());
        }
        [HttpPost]
        public ActionResult Login(Usuario usuario,string p_id, string titulo) {
            if (usuario.Login(usuario)==null) {
                ViewData.Add("Error", "Nombre de Usuario y/o Contraseña Incorrectos.");
                return View("Login", usuario);
            } else {
                usuario=usuario.Login(usuario);
                HttpContext.Session["userID"]=usuario.Id;
                if (p_id!=null) {
                    return RedirectToAction("Index", "Pregunta", new { id=p_id});
                }
                if (titulo!=null) {
                    return RedirectToAction("Nueva", "Pregunta", new { Titulo=titulo });
                }
                return RedirectToAction("Index");
            }
        }
        public ActionResult Register() {
            if (HttpContext.Session["userID"]!=null) {
                return RedirectToAction("Index");
            }
            Usuario usuario=new Usuario();
            return View("Register", usuario);
        }
        [HttpPost]
        public ActionResult Register(Usuario usuario, HttpPostedFileBase image_perfil, string dia, string mes, string anio) {
            List<string> errores = new List<string>();
            var path="";
            var file_img="";
            if (image_perfil!=null)
                if (image_perfil.ContentLength > 0) {
                    do {
                        try {
                            file_img=getRandom().ToString()+"."+image_perfil.FileName.Split('.')[1];
                            path = Path.Combine(Server.MapPath("~/Images/Upload"), file_img);
                        } catch (Exception ex) {
                            errores.Add("La Imagen no es correcta");
                        }
                    } while (System.IO.File.Exists(path));

                }
            DateTime fecha_nacimiento;
            if (!DateTime.TryParse(dia+"/"+mes+"/"+anio, out fecha_nacimiento)) {
                errores.Add("La Fecha esta incorrecta");
            }
            if (usuario.Nombre==null || usuario.Nombre_usuario==null || usuario.Apellidos==null || usuario.Contrasena==null) {
                errores.Add("Te falta llenar algunos campos");
            }
            if (usuario.existNameUser(usuario)) {
                errores.Add("Elige otro nombre de Usuario, ese ya existe.");
            }
            if (errores.Count()==0) {
                if (image_perfil!=null) {
                    image_perfil.SaveAs(path);
                    path = "~/Images/Upload/"+file_img;
                } else {
                    if (usuario.Sexo==EnumSexo.HOMBRE) {
                        path = "~/Images/hombre.png";
                    } else {
                        path = "~/Images/mujer.png";
                    }
                }
                usuario.FechaNacimiento=fecha_nacimiento;
                usuario.FechaRegistro=DateTime.Now;
                usuario.Path_imagen=path.ToString();
                usuario.Correo=usuario.Nombre_usuario+"@tortura.mx";
                usuario.guardar(usuario);
                return RedirectToAction("Login", new { registro=true });
            }
            ViewData["Errores"]=errores;
            return View("Register", usuario);
        }
        private int getRandom() {
            Random random = new Random();
            return random.Next(1000000, 9999999);
        }
        public Usuario getUsuarioActual() {
            if (HttpContext.Session["userID"]!=null) {
                try {
                    return new Usuario().obtenerPorId(int.Parse(HttpContext.Session["userID"].ToString()));
                } catch (Exception ex) {
                    return null;
                }
            }
            return null;
        }
        //Imprime el menu izq de las categorias
        public ActionResult _Menu_izq() {
            Categoria categoria=new Categoria();
            return PartialView("_Menu_izq", categoria);
        }
        //Imprime el menu derecho de la barra superior
        public ActionResult _Nav_Menu_Der() {
            Usuario usuario=getUsuarioActual();
            return PartialView("_Nav_Menu_Der", usuario);
        }

    }
}
