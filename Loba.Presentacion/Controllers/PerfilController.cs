using Loba.Modelo.Entidades;
using Loba.Presentacion.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Loba.Presentacion.Controllers
{
    public class PerfilController : Controller
    {
        //
        // GET: /Perfil/

        public ActionResult Mini(Usuario usuario)
        {
            usuario=usuario.obtenerPorId(usuario.Id);
            ProfileMiniModel pMini=new ProfileMiniModel();
            pMini.Respuestas=new Respuesta().obtenerTotal(usuario);
            int respMej=new MejorRespuesta().obtenerTotal(usuario);
            if(pMini.Respuestas!=0)
            pMini.PorMejResp=respMej*100/pMini.Respuestas;
            pMini.Usuario=usuario;
            return PartialView("_Layout_profile", pMini);
        }

    }
}
