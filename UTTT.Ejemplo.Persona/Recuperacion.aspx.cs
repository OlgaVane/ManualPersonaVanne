using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class Recuperacion : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Convert.ToString(Request.QueryString["token"]);
            var token = valor;
            if (token == null)
            {
                this.Response.Redirect("~/login.aspx");
            }
            else
            {
                idPersona = 1;
            }
            try
            {
                var tok = token.ToString();
                this.Response.Buffer = true;
                this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.token == tok.ToString());
                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    if (this.idPersona == 0)
                    {

                    }
                    else
                    {
                        this.txtNombre.Text = this.baseEntity.strNombreUsuario;
                        //this.txtUsuario.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage("Ha Ocurrido un problema al cargar la aplicacion" + ex.Message);
                this.showMessageException(ex.Message);
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtContrasena.Text == txtContrasenaVerifi.Text && txtContrasena.Text == txtContrasenaVerifi.Text)
                {
                    string valor = Convert.ToString(Request.QueryString["token"]);
                    var value = valor;
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.token == value.ToString());
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                    if (dcGlobal != null)
                    {
                        usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.token == value.ToString());
                        var contra = (txtContrasena.Text);
                        usuario.strContraseña = this.txtContrasena.Text.ToString().Trim();
                        //usuario.strContraseña = Encrypt.GetSHA256(this.txtCntraseña.Text.Trim());
                        dcGuardar.SubmitChanges();
                        FormsAuthentication.SignOut();
                        Session.Abandon();
                        this.Response.Redirect("~/login.aspx");
                    }
                }
                else
                {
                    this.lblMessa.Text = "Vuelve a intentarlo, las contraseñas no coinciden";
                }
            }
            catch (Exception ex)
            {
                this.lblMessa.Text = ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/login.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }
    }
}