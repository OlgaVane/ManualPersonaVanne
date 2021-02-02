<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <link rel="stylesheet" media="all" href="css/EstiloManager.css" />
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">--%>
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
           if (clavUnic < 100 || clavUnic>999)
           {
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
    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
    <form class="form-horizontal" id="form1" runat="server" > <%--onsubmit="return validacion()"--%>
        <fieldset>
            <legend class="text-center bigicon">Persona</legend>
          <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <div class="text-center header"><asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True" BorderColor="Red"></asp:Label></div>
        
        </div>
        <div>

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
            <asp:RangeValidator ID="rvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" CultureInvariantValues="True" ErrorMessage="La clave debe ser entre 100 y 999" ForeColor="Black" MaximumValue="999" MinimumValue="100" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            <asp:RequiredFieldValidator ID="rfvClaveUnica" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Clave única requerida"></asp:RequiredFieldValidator>
        
            <asp:RegularExpressionValidator ID="revClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="La clave debe tener 3 numeros" ForeColor="#000099" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
        
        </div>
        <div>
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
            Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox 
            MaxLength="50" ID="txtNombre" runat="server" Width="249px" ViewStateMode="Disabled"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
            
        
            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ForeColor="#000099" ValidationExpression="^[a-z A-Z]{3,50}"></asp:RegularExpressionValidator>
            
        
        </div>
        <div> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            A Paterno:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                 MaxLength="50" ID="txtAPaterno" runat="server" Width="249px" ViewStateMode="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Apellido paterno requerido"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ForeColor="#000099" ValidationExpression="^[a-z A-Z]{3,50}"></asp:RegularExpressionValidator>
        </div>
        <div>
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Materno:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox MaxLength="50" ID="txtAMaterno" runat="server" Width="248px" 
                ViewStateMode="Disabled"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Apellido materno requerido"></asp:RequiredFieldValidator>
        
            <asp:RegularExpressionValidator ID="revAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="minimo 3 caracteres y no ingrese simbolos o numeros" ForeColor="#000099" ValidationExpression="^[a-z A-Z]{3,50}"></asp:RegularExpressionValidator>
        
        </div>
    <div> 
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fecha de nacimiento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Calendar MaxLength="50" ID="dteCalendar" runat="server" OnSelectionChanged="dteCalendar_SelectionChanged" style="margin-left: 215px; margin-top: 0px;" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
    
        
    
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
            <asp:TextBox ID="txtCPostal" runat="server" MaxLength="5" ViewStateMode="Disabled" Width="246px"></asp:TextBox>

            <asp:RegularExpressionValidator ID="revCodigoP" runat="server" ControlToValidate="txtCPostal" ErrorMessage="El codigo postal solo debe tener 5 digitos" ForeColor="#000099" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="rfvCPostal" runat="server" ControlToValidate="txtCPostal" ErrorMessage="Código postal requerido"></asp:RequiredFieldValidator>

        </div>
        <div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RFC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtRFC" runat="server" MaxLength="13" ViewStateMode="Disabled" Width="246px"></asp:TextBox>

            <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="El RFC es incorrecto" ForeColor="Black" ValidationExpression="^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))"></asp:RegularExpressionValidator>

            <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC requerido"></asp:RequiredFieldValidator>

        </div>
    <div>
     
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" 
            onclick="btnAceptar_Click" ViewStateMode="Disabled"  /> <%--OnClientClick="return validacion();"--%>&nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            onclick="btnCancelar_Click" ViewStateMode="Disabled" />
        
    
    </div>

        
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red">...</asp:Label>
        
            </fieldset>
    </form>
                </div>
            </div>
        </div>
        </div>
</body>
    
</html>
