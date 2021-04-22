using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class login : System.Web.UI.Page
    {
        private int idUsuario = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                Usuario usuario = new Usuario();
                Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                string Usuario;
                Usuario = this.txtUsuario.Text.Trim();
                string contrasenaUsuario;
                contrasenaUsuario = this.txtContraseña.Text.Trim();

                var usuarioLogin = dcGuardar.GetTable<Usuario>().FirstOrDefault(c => c.strNombreUsuario == Usuario);


                if (usuarioLogin != null)
                {
                    if (Usuario == usuarioLogin.strNombreUsuario && contrasenaUsuario == usuarioLogin.strContraseña)
                    {
                        if (usuarioLogin.idCatEstadoUser == 1)
                        {
                            this.showMessage("Usuario Valido");
                            Session["strNombreUsuario"] = txtUsuario.Text.Trim();
                            this.Response.Redirect("~/Inicio.aspx", false);
                        }
                        else
                        {
                            this.showMessage("Tu usuario no esta activo");
                        }

                    }
                    else
                    {
                        this.showMessage("Datos no validos");
                    }
                }
                else
                {
                    this.showMessage("Ingresa los datos correctos");
                }

            }
            catch (Exception)
            {
                this.showMessage("Ingresa los datos correctos");
                this.Response.Redirect("~/login.aspx", false);
            }
        }
    }
}