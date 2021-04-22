using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Modelo;

namespace UTTT.Ejemplo.Persona
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strNombreUsuario"] == null)
                Response.Redirect("login.aspx");
        }
        

        protected void imbtnPersona_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("~/PersonaPrincipal.aspx", false);
        }

        protected void imbtnUsuario_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}