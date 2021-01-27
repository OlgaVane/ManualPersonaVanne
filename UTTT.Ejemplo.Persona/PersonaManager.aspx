<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">

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
    <form id="form1" runat="server"   > <%--onsubmit="return validacion()"--%>
    <div style="font-family: Arial; font-size: medium; font-weight: bold">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Persona</div>

        <div>
        
        </div>
          <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
        
        </div>
        <div>

        </div>
        <div>

        </div>
            <div>

        <div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sexo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="ddlSexo" runat="server" 
                 Height="25px" Width="253px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Sexo Requerido" InitialValue="-1" SetFocusOnError="True" ></asp:RequiredFieldValidator>
    </div>

        </div>
        <div> 
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Clave Única:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
            <asp:TextBox MaxLength="3" ID="txtClaveUnica" runat="server" 
                Width="249px" ViewStateMode="Disabled"></asp:TextBox>  <%--ViewStateMode="Disabled"--%>
            <asp:RequiredFieldValidator ID="rfvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Clave única requerida"></asp:RequiredFieldValidator>
        
            <asp:RegularExpressionValidator ID="revClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="La clave solo debe tener 3 numeros" ForeColor="#000099" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
        
        </div>
        <div>
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
            Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox 
                MaxLength="50" ID="txtNombre" runat="server" Width="249px" ViewStateMode="Disabled"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
        
            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Su nombre debe tener minimo 3 caracteres y 15 como maximo" ForeColor="Black" ValidationExpression="^[a-zA-Z]{3,15}$"></asp:RegularExpressionValidator>
        
        </div>
        <div> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            A Paterno:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                 MaxLength="50" ID="txtAPaterno" runat="server" Width="249px" ViewStateMode="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Apellido paterno requerido"></asp:RequiredFieldValidator>
        </div>
        <div>
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Materno:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox MaxLength="50" ID="txtAMaterno" runat="server" Width="248px" 
                ViewStateMode="Disabled"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Apellido materno requerido"></asp:RequiredFieldValidator>
        
        </div>
    <div> 
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fecha de nacimiento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Calendar MaxLength="50" ID="dteCalendar" runat="server" OnSelectionChanged="dteCalendar_SelectionChanged" style="margin-left: 215px; margin-top: 0px;"></asp:Calendar>
    
        
    
        &nbsp;</div>
        <div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Correo Electrónico:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCorreo" runat="server" Width="246px" MaxLength="50" ViewStateMode="Disabled"></asp:TextBox>
    
            <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electrónico invalido" ForeColor="Black" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    
            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Correo electrónico requerido"></asp:RequiredFieldValidator>
    
        </div>
        <div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Código Postal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="txtCPostal" runat="server" MaxLength="50" ViewStateMode="Disabled" Width="246px"></asp:TextBox>

            <asp:RegularExpressionValidator ID="revCodigoP" runat="server" ControlToValidate="txtCPostal" ErrorMessage="El codigo postal solo debe tener 5 digitos" ForeColor="#000099" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="rfvCPostal" runat="server" ControlToValidate="txtCPostal" ErrorMessage="Código postal requerido"></asp:RequiredFieldValidator>

        </div>
        <div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RFC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtRFC" runat="server" MaxLength="50" ViewStateMode="Disabled" Width="246px"></asp:TextBox>

            <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="El RFC es incorrecto" ForeColor="Black" ValidationExpression="^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC requerido"></asp:RequiredFieldValidator>

        </div>
    <div>
     
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
            onclick="btnAceptar_Click" ViewStateMode="Disabled" OnClientClick="return validacion();" /> <%--OnClientClick="return validacion();"--%>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            onclick="btnCancelar_Click" ViewStateMode="Disabled" />
    
    </div>
    </form>
</body>
    
</html>
