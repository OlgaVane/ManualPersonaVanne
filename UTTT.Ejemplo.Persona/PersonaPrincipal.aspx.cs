#region Using
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using EASendMail;

#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaPrincipal : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strNombreUsuario"] == null)
                Response.Redirect("login.aspx");
            try
            {
                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    List<CatSexo> lista = dcTemp.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    catTemp.id = -1;
                    catTemp.strValor = "Todos";
                    lista.Insert(0, catTemp);
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";
                    this.ddlSexo.DataSource = lista;
                    this.ddlSexo.DataBind();
                    //String mensaje = String.Empty;

                    List<CatEstadoCivil> listaCatEstadoCivil = dcTemp.GetTable<CatEstadoCivil>().ToList();
                    CatEstadoCivil TempCatEstadoCivil = new CatEstadoCivil();
                    TempCatEstadoCivil.id = -1;
                    TempCatEstadoCivil.strValor = "Todos";
                    listaCatEstadoCivil.Insert(0, TempCatEstadoCivil);
                    this.ddlEstadocivilPrincipal.DataTextField = "strValor";
                    this.ddlEstadocivilPrincipal.DataValueField = "id";
                    this.ddlEstadocivilPrincipal.DataSource = listaCatEstadoCivil;
                    this.ddlEstadocivilPrincipal.DataBind();
                }
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }
        

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                this.DataSourcePersona.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                this.session.Pantalla = "~/PersonaManager.aspx";
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.Response.Redirect(this.session.Pantalla, false);
                
               
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        

        protected void DataSourcePersona_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreBool = false;
                bool sexoBool = false;
                bool estadoCivil = false;
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    nombreBool = true;
                }
                if (this.ddlSexo.Text != "-1")
                {
                    sexoBool = true;
                }
                if (this.ddlEstadocivilPrincipal.Text != "-1")
                {
                    estadoCivil = true;
                }

                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Persona, bool>>
                    predicate =
                    (c =>
                    ((sexoBool) ? c.idCatSexo == int.Parse(this.ddlSexo.Text) : true) &&
                    ((estadoCivil) ? c.idCadEstadoCivil == int.Parse(this.ddlEstadocivilPrincipal.Text) : true) &&
                    ((nombreBool) ? (((nombreBool) ? c.strNombre.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                    );

                //Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Persona, bool>> 
                //    predicate =
                //    (c =>
                //    ((sexoBool) ? c.idCatSexo == int.Parse(this.ddlSexo.Text) : true) &&             
                //    ((nombreBool) ? (((nombreBool) ? c.strNombre.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                //    );

                predicate.Compile();

                List<UTTT.Ejemplo.Linq.Data.Entity.Persona> listaPersona =
                    dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(predicate).ToList();
                e.Result = listaPersona;        
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        protected void dgvPersonas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idPersona = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idPersona);
                        break;
                    case "Eliminar":
                        this.eliminar(idPersona);
                        break;
                    case "Direccion":
                        this.direccion(idPersona);
                        break;
                }
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        #endregion 

        #region Metodos

        private void editar(int _idPersona)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", _idPersona.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/PersonaManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);

            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        private void eliminar(int _idPersona)
        {
            try
            {
                DataContext dcDelete = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(
                    c => c.id == _idPersona);
                dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().DeleteOnSubmit(persona);
                dcDelete.SubmitChanges();
                this.showMessage("El registro se agrego correctamente.");
                this.DataSourcePersona.RaiseViewChanged();                
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }

        private void direccion(int _idPersona)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", _idPersona.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/DireccionManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/PageError.aspx", false);

                this.EnviarCorreo("olgavanessasanchezcruz27@gmail.com", "Exception", mensaje);
            }
        }
        public void EnviarCorreo(string correoDestino, string asunto, string mensajeCorreo)
        {
            string mensaje = "Error al enviar correo.";

            try
            {
                SmtpMail objetoCorreo = new SmtpMail("TryIt");

                objetoCorreo.From = "olgavanessasanchezcruz27@gmail.com";
                objetoCorreo.To = correoDestino;
                objetoCorreo.Subject = asunto;
                objetoCorreo.TextBody = mensajeCorreo;

                SmtpServer objetoServidor = new SmtpServer("smtp.gmail.com");

                objetoServidor.User = "olgavanessasanchezcruz27@gmail.com";
                objetoServidor.Password = "OSC5197v";
                objetoServidor.Port = 587;
                objetoServidor.ConnectType = SmtpConnectType.ConnectSSLAuto;

                SmtpClient objetoCliente = new SmtpClient();
                objetoCliente.SendMail(objetoServidor, objetoCorreo);
                mensaje = "Correo Enviado Correctamente.";


            }
            catch (Exception ex)
            {
                mensaje = "Error al enviar correo." + ex.Message;
            }
        }
        #endregion


        protected void dgvPersonas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);

            }
        }

        protected void txtNombre_TextChanged1(object sender, EventArgs e)
        {
           //ScriptManager.RegisterClientScriptBlock(UpdatePanelBusca, this.GetType(), "", "alert('" + txtNombre.Text + "')", true);
        }
    }
}