<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" Debug="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/EstiloManager.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="Content/Js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        function validacion() {

            var sexo = document.getElementById("ddlSexo").value;
            var clavUnic = document.getElementById("txtClaveUnica").value;
            var nombre = document.getElementById("txtNombre").value;
            var apellidoP = document.getElementById("txtAPaterno").value;
            var apellidoM = document.getElementById("txtAMaterno").value;
            var fechaNac = document.getElementById("dteCalendar").value;
            var correo = document.getElementById("txtCorreo").value;
            var codigoP = document.getElementById("txtCPostal").value;
            var rfc = document.getElementById("txtRFC").value;
            var FechaNa = document.getElementById("txtFechaNac2").value;

            ValidaCorreo = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;//validacion de correo
            ValidaCodPost = /^([0-9]{5}$)/;
            ValidaRFC = /^[A-Z]{4}[0-9]{6}[A-Z0-9]{3}$/;


            if (clavUnic == "" || nombre == "" || apellidoP == "" || apellidoM == "" || fechaNac == "") {
                alert("No deje campos vacios");
                return false;
            }
            if (clavUnic.length > 3 || clavUnic.length < 3) {
                alert("La clave debe que tener 3 caracteres");
                return false;
            }
            if (clavUnic < 100 || clavUnic > 999) {
                alert("La clave debe ser un numero entre 100 y 999")
                return false;
            }
            if (isNaN(clavUnic)) {
                alert("La clave unica debe ser un numero");
                return false;
            }
            if (nombre.length < 3 || apellidoP.length < 3) {
                alert("El nombre o el apellido son muy cortos");
                return false;
            }
            if (nombre.length > 15 || nombre.length > 15) {
                alert("El nombre o el apellido son muy largos")
            }
            if (sexo == -1) {
                alert("Seleccione Masculino o Femenino");
                return false;
            }
            if (!ValidaCorreo.test(correo)) {
                alert("ERROR:: El correo no tiene la sintaxis correcta");
                return false;
            }
            if (!ValidaCodPost.test(codigoP)) {
                alert("ERROR:: EL CODIGO POSTAL SOLO DEBE TENER 5 NÚMEROS");
                return false;
            }
            if (!ValidaRFC.test(rfc)) {
                alert("ERROR:: EL RFC ES INCORRECTO");
                return false;
            }

            return true;
        }
    </script>


    <title></title>

</head>

<body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Inicio.aspx">Inicio</a>
    </nav>

    <%--INICIA EL FORMULARIO--%>
    <form class="form-horizontal container" id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container well">

            <%--Lbl de accion--%>
            <p>
                <div class="col-auto">
                    <%--<h2>--%>
                    <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True" BorderColor="Red"></asp:Label>
                    </h2>
                </div>
            </p>


            <%-- sexo--%>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row form-group">
                        <asp:Label ID="lblSexo" runat="server" class="col-sm-2 col-form-label">Sexo:</asp:Label>
                        <asp:DropDownList ID="ddlSexo" align="center" runat="server" CssClass="form-control col-auto" Height="35px" Width="400px"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Sexo Requerido" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

            <%--Estado civil--%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row form-group">
                        <asp:Label ID="lblEstadoCivil" runat="server" class="col-sm-2 col-form-label">Estado Civil:</asp:Label>
                        <asp:DropDownList ID="ddlEstadoCivil" align="center" runat="server" CssClass="form-control col-auto" Height="35px" Width="400px"></asp:DropDownList>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlEstadoCivil" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

            <%--Clave unica--%>
            <div class="row">
                <asp:Label ID="lblClave" runat="server" class="col-sm-2 col-form-label">Clave unica:</asp:Label>
                <asp:TextBox ID="txtClaveUnica" MaxLength="3" placeholder="Ingrese su clave" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Clave requerida"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Clave única requerida"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" CultureInvariantValues="True" ErrorMessage="La clave debe ser entre 100 y 999" ForeColor="Black" MaximumValue="999" MinimumValue="100" Type="Integer"></asp:RangeValidator>
                <asp:RegularExpressionValidator ID="revClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="La clave debe tener 3 numeros" ForeColor="#000099" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>

            </div>

            <%--Nombre--%>
            <div class="row form-group">
                <asp:Label ID="lblNombre" runat="server" class="col-sm-2 col-form-label">Nombre:</asp:Label>
                <asp:TextBox ID="txtNombre" MaxLength="50" placeholder="Ingrese su nombre" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Nombre requerido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ForeColor="#000099"></asp:RegularExpressionValidator>

            </div>

            <%--Apellido Paterno--%>
            <div class="row  form-group">
                <asp:Label ID="lblAP" runat="server" class="col-sm-2 col-form-label">Apellido paterno:</asp:Label>
                <asp:TextBox ID="txtAPaterno" MaxLength="50" placeholder="Ingrese su apellido paterno" Class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Apellido paterno requerido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ForeColor="#000099" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>

            </div>

            <%--Apellido Materno--%>
            <div class="row  form-group">
                <asp:Label ID="lblAM" runat="server" Text="Apellido materno:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox MaxLength="50" ID="txtAMaterno" placeholder="Ingrese su apellido materno" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Apellido materno requerido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ForeColor="#000099" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>

            </div>

            <%--Fecha--%>
            <div class="row form-group">
                <asp:Label ID="lblCalendar2" runat="server" Text="Fecha de nacimiento:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox ID="txtFechaNac2" placeholder="Seleccione su fecha de nacimiento" runat="server" OnTextChanged="txtFechaNac2_TextChanged" MaxLength="10" class="form-control" Height="35px" Width="400px" required="Fecha de nacimiento requerido" pattern="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))"></asp:TextBox>
                <asp:ImageButton ID="imbtnCalendar" runat="server" Height="25px" ImageUrl="~/Images/Calendario.png" Width="25px" />
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy/MM/dd" PopupButtonID="imbtnCalendar" PopupPosition="BottomRight" TargetControlID="txtFechaNac2"></ajaxToolkit:CalendarExtender>
                <asp:Label ID="lblCalendario" runat="server" ForeColor="Red" Text="." Visible="False"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvFechaNac" runat="server" ControlToValidate="txtFechaNac2" ErrorMessage="Seleccione una fecha"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFechaNac2" ErrorMessage="Fecha invalida" ValidationExpression="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))" ForeColor="#000099"></asp:RegularExpressionValidator>
            </div>
            <%-- Correo--%>
            <div class="row form-group">
                <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox ID="txtCorreo" MaxLength="50" placeholder="Ingrese su correo electrónico" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Ingrese un correo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electrónico requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electrónico invalido" ForeColor="#000099" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </div>
            <%--Codigo Postal--%>
            <div class="row form-group">
                <asp:Label ID="lblCp" runat="server" Text="Codigo postal:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox ID="txtCPostal" MaxLength="5" placeholder="Ingrese su código postal" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="Código postal requerido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCPostal" runat="server" ControlToValidate="txtCPostal" ErrorMessage="Código postal requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCodigoP" runat="server" ControlToValidate="txtCPostal" ErrorMessage="El codigo postal solo debe tener 5 digitos" ForeColor="#000099" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>

            </div>
            <%--RFC--%>
            <div class="row form-group">
                <asp:Label ID="lblRFC" runat="server" Text="RFC:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox ID="txtRFC" MaxLength="50" placeholder="Ingrese su RFC" class="form-control" runat="server" ViewStateMode="Disabled" Height="35px" Width="400px" required="RFC requerido"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="El RFC es incorrecto" ForeColor="Black" ValidationExpression="^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))"></asp:RegularExpressionValidator>

            </div>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red">...</asp:Label>


            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div>
         <asp:Button ID="btnAceptar" class="btn btn-outline-success" runat="server" Text="Aceptar"
             OnClick="btnAceptar_Click" ViewStateMode="Disabled" OnClientClick="validacion()" CausesValidation="true" />
         <asp:Button ID="btnCancelar" class="btn btn-outline-primary" runat="server" Text="Cancelar"
             OnClick="btnCancelar_Click" ViewStateMode="Disabled" CausesValidation="false" formnovalidate="" />
     </div>
            </div>








        </div>
        <%--</fieldset>--%>
    </form>



</body>

</html>
