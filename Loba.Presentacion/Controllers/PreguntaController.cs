using Loba.Modelo.Entidades;
using Loba.Modelo.Enumeradores;
using Loba.Presentacion.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Loba.Presentacion.Controllers
{
    public class PreguntaController : Controller
    {
        //
        // GET: /Pregunta/

        public ActionResult Index(string id)
        {
            PreguntaModel preguntaViewModel=new PreguntaModel();
            preguntaViewModel.Pregunta=new Pregunta().obtenerPorId(int.Parse("0"+id));
            if (preguntaViewModel.Pregunta!=null) {
                preguntaViewModel.Usuario=getUsuarioActual();
                return View("Index", preguntaViewModel);
            }
            return RedirectToAction("Index", "Home");
        }
        
        [HttpPost]
        public ActionResult Nueva(Pregunta pregunta, String id_categoria, String id_sub_categoria) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home", new { title=pregunta.Titulo });
            }
            pregunta.Usuario=getUsuarioActual();
            pregunta.Categoria=new Categoria().obtenerPorId(int.Parse("0"+id_categoria));
            pregunta.Subcategoria=new Subcategoria().obtenerPorId(int.Parse("0"+id_sub_categoria));
            if (pregunta.Titulo!=null && pregunta.Descripcion!=null && pregunta.Categoria!=null && pregunta.Subcategoria!=null) {
                pregunta.Usuario=getUsuarioActual();
                pregunta.Fecha=DateTime.Now;
                pregunta.guardar(pregunta);
                return RedirectToAction("Index", new { id=pregunta.Id });
            } else if (id_categoria!=null) {
                ViewData.Add("Error", "Tu Pregunta no se creo correctamente, Te falta completar ciertos parametros, o estan mal.");
            }
            return View("Nueva", pregunta);
        }
        public ActionResult Nueva(Pregunta pregunta) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home", new { title=pregunta.Titulo });
            }
            pregunta.Usuario=getUsuarioActual();
            return View("Nueva", pregunta);
        }
        public ActionResult Editar(string id) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login");
            }
            if (id!=null) {
                Pregunta pregunta=new Pregunta().obtenerPorId(int.Parse("0"+id));
                return View("Editar", pregunta);
            } else {
                return RedirectToAction("Index","Home");
            }
        }
        [HttpPost]
        public ActionResult Editar(string id, string contenido) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login","Home");
            }
            if (id!=null && contenido!=null) {
                Pregunta pregunta=new Pregunta().obtenerPorId(int.Parse("0"+id));
                Actualizacion actualizacion=new Actualizacion();
                actualizacion.Contenido=contenido;
                actualizacion.Fecha=DateTime.Now;
                pregunta.Actualizaciones.Add(actualizacion);
                pregunta.update(pregunta);
                return RedirectToAction("Index", new { id=pregunta.Id });
            } else {
                return RedirectToAction("Index","Home");
            }

        }
        public ActionResult Eliminar(string id) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login","Home");
            }
            if (id!=null) {
                Pregunta pregunta=new Pregunta().obtenerPorId(int.Parse("0"+id));
                if (pregunta.Usuario.Id==getUsuarioActual().Id) {
                    pregunta.borrar(pregunta);
                    return RedirectToAction("Index","Home");
                } else {
                    return RedirectToAction("Index", new { id=pregunta.Id });
                }
            } else {
                return RedirectToAction("Index","Home");
            }
        }
        [HttpPost]
        public ActionResult Responder(Pregunta pregunta, string Cuerpo) {
            pregunta=pregunta.obtenerPorId(pregunta.Id);
            Respuesta respuesta=new Respuesta();
            respuesta.Cuerpo=Cuerpo;
            respuesta.Usuario=getUsuarioActual();
            respuesta.Fecha=DateTime.Now;
            pregunta.Respuestas.Add(respuesta);
            if (Cuerpo!=null && Cuerpo.Length>0) {
                pregunta.update(pregunta);
                return Json(new { comment=true }, @"application/json");
            } else {
                return Json(new { comment=false }, @"application/json");
            }
        }
        public ActionResult MejorRespuesta(string r_id,string p_id) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            Pregunta pregunta=new Pregunta();
            if (r_id!=null && p_id!=null) {
                pregunta=pregunta.obtenerPorId(int.Parse(p_id));
                pregunta.MejorRespuesta=new MejorRespuesta();
                pregunta.MejorRespuesta.Respuesta=new Respuesta().obtenerPorId(int.Parse(r_id));
                return View("MejorRespuesta",pregunta);
            } else {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public ActionResult MejorRespuesta(string r_id, string p_id,string comentario,string valoracion) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            Pregunta pregunta=new Pregunta();
            if (r_id!=null && p_id!=null) {
                pregunta=pregunta.obtenerPorId(int.Parse(p_id));
                pregunta.MejorRespuesta=new MejorRespuesta();
                pregunta.MejorRespuesta.Respuesta=new Respuesta().obtenerPorId(int.Parse(r_id));
                pregunta.MejorRespuesta.Comentario=comentario;
                pregunta.MejorRespuesta.Valoracion=int.Parse(valoracion)>5?5:int.Parse(valoracion);
                pregunta.Respuestas.Remove(pregunta.MejorRespuesta.Respuesta);
                pregunta.update(pregunta);
                return RedirectToAction("Index", new { id=pregunta.Id });
            } else {
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult RespuestaUp(string r_id,string p_id) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            if (r_id!=null && p_id!=null) {
                Respuesta respuesta=new Respuesta().obtenerPorId(int.Parse(r_id));
                Calificacion calificacion=new Calificacion();
                calificacion.Usuario=getUsuarioActual();
                bool califico=false;
                foreach(Calificacion cal in respuesta.Calificaciones){
                    if (cal.Usuario.Id == calificacion.Usuario.Id) {
                        calificacion=cal;
                        califico=true;
                        break;
                    }
                }
                calificacion.TipoVoto=TipoVoto.POSITIVO;
                if (!califico) {
                    respuesta.Calificaciones.Add(calificacion);
                }
                respuesta.update(respuesta);
                return RedirectToAction("Index", new { id=p_id });
            } else {
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult RespuestaDown(string r_id, string p_id) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            if (r_id!=null && p_id!=null) {
                Respuesta respuesta=new Respuesta().obtenerPorId(int.Parse(r_id));
                Calificacion calificacion=new Calificacion();
                calificacion.Usuario=getUsuarioActual();
                bool califico=false;
                foreach (Calificacion cal in respuesta.Calificaciones) {
                    if (cal.Usuario.Id == calificacion.Usuario.Id) {
                        calificacion=cal;
                        califico=true;
                        break;
                    }
                }
                calificacion.TipoVoto=TipoVoto.NEGATIVO;
                if (!califico) {
                    respuesta.Calificaciones.Add(calificacion);
                }
                respuesta.update(respuesta);
                return RedirectToAction("Index", new { id=p_id });
            } else {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public ActionResult ComentarRespuesta(string r_id,string contenido) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            if (r_id!=null && contenido!=null && contenido.Length>0) {
                Respuesta respuesta=new Respuesta();
                respuesta=respuesta.obtenerPorId(int.Parse(r_id));
                Comentario comentario=new Comentario();
                comentario.Contenido=contenido;
                comentario.Fecha=DateTime.Now;
                comentario.Usuario=getUsuarioActual();
                respuesta.Comentarios.Add(comentario);
                respuesta.update(respuesta);
                return Json(new { comment=true}, @"application/json");
            } else {
                return Json(new { comment=false }, @"application/json");
            }
        }
        [HttpPost]
        public ActionResult EditarRespuesta(string Id, string Cuerpo) {
            if (getUsuarioActual()==null) {
                return RedirectToAction("Login", "Home");
            }
            if (Id!=null && Cuerpo!=null && Cuerpo.Length>0) {
                Respuesta respuesta=new Respuesta();
                respuesta=respuesta.obtenerPorId(int.Parse(Id));
                respuesta.Cuerpo=Cuerpo;
                respuesta.Fecha=DateTime.Now;
                respuesta.update(respuesta);
                return Json(new { comment=true }, @"application/json");
            } else {
                return Json(new { comment=false }, @"application/json");
            }
        }
        public ActionResult EliminarRespuesta(string r_id,string p_id) {
            if (getUsuarioActual() == null) {
                return RedirectToAction("Login", "Home");
            }
            if (r_id != null && p_id != null) {
                Pregunta pregunta = new Pregunta().obtenerPorId(int.Parse(p_id));
                Respuesta resp = new Respuesta().obtenerPorId(int.Parse(r_id));
                foreach (var re in pregunta.Respuestas) {
                    if (re.Id == resp.Id) {
                        pregunta.Respuestas.Remove(re);
                        break;
                    }
                }
                pregunta.update(pregunta);
                resp.delete(resp);
                return RedirectToAction("Index", new { id = pregunta.Id });
            } else {
                return RedirectToAction("Index");
            }
        }
        //PARTIALS VIEW
        public ActionResult _SubCategorias_Question(string select) {
            Categoria categoria=new Categoria();
            if (select!=null) {
                categoria=categoria.obtenerPorId(int.Parse("0"+select));
            }
            return PartialView("_SubCategorias_Question", categoria);
        }

        public ActionResult _Categorias_Question(string select) {
            Categoria categoria=new Categoria();
            if (select!=null) {
                categoria.Id=int.Parse(select);
            }
            return PartialView("_Categorias_Question", categoria);
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
    }
}
