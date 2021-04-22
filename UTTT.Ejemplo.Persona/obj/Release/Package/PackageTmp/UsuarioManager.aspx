<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Inicio.aspx">Inicio</a>
    </nav>

    <%--inicia formulario--%>
    <form id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container well">
            <p>
                <div class="col-auto">
                    <h2>
                        <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True" BorderColor="Red"></asp:Label>
                    </h2>
                </div>
            </p>

            <%--Lbl de accion--%>
            <%--NOMBRE PERSONA--%>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row form-group">
                        <asp:Label ID="Label1" runat="server" Text="Nombre:" class="col-sm-2 col-form-label"></asp:Label>
                        <asp:DropDownList ID="ddlNombre" runat="server" CssClass="form-control col-auto" Height="35px" Width="400px" OnSelectedIndexChanged="ddlNombre_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlNombre" ErrorMessage="Persona Requerida" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlNombre" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

            <%--USUARIO--%>
            <div class="row">
                <asp:Label ID="Label2" runat="server" class="col-sm-2 col-form-label" Text="Nombre de usuario:"></asp:Label>
                <asp:TextBox ID="txtNomUsuario" class="form-control" runat="server" Height="35px" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNomUsuario" ErrorMessage="Ingresa un nombre de usuario"></asp:RequiredFieldValidator>
            </div>

            <%--CONTRASEÑA--%>
            <div class="row">
                <asp:Label ID="Label3" runat="server" Text="Contraseña:" class="col-sm-2 col-form-label"></asp:Label>
                <asp:TextBox ID="txtContraseña" Type="password" class="form-control" runat="server" Height="35px" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtContraseña" ErrorMessage="Ingresa una contraseña"></asp:RequiredFieldValidator>
            </div>

            <%--VERIFICAR CONTRASEÑA--%>
            <div class="row">
                <asp:Label ID="Label4" runat="server" class="col-sm-2 col-form-label" Text="Verifica contraseña:"></asp:Label>
                <asp:TextBox ID="txtVerificaContraseña" Type="password" class="form-control" runat="server"  Height="35px" Width="400px"></asp:TextBox>
                <asp:CompareValidator ID="CVContraseña" runat="server" ControlToCompare="txtVerificaContraseña" ControlToValidate="txtContraseña" ErrorMessage="Las contraseñas deben ser iguales"></asp:CompareValidator>
            </div>

            <%-- FECHA DE INGRESO--%>
            <div class="row">
                <asp:Label ID="Label5" runat="server" class="col-sm-2 col-form-label" Text="Fecha de Ingreso:"></asp:Label>
                <asp:TextBox ID="txtFechaIngreso" class="form-control" runat="server" Height="35px" Width="400px"></asp:TextBox>
            </div>

            <%--ESTADO DE USUARIO--%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row form-group">
                        <asp:Label ID="lblEstado" runat="server" class="col-sm-2 col-form-label" Text="Estado:"></asp:Label>
                        <asp:DropDownList ID="ddlCatEstadoUser" runat="server" CssClass="form-control col-auto" OnSelectedIndexChanged="ddlCatEstadoUser_SelectedIndexChanged" Height="35px" Width="400px"></asp:DropDownList>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlCatEstadoUser" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

            <%--BOTONES--%>
            <div class="row">
                <asp:Button ID="btnAceptar" class="btn btn-outline-success" runat="server" Text="Aceptar" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelar" class="btn btn-outline-primary" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text="."></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
