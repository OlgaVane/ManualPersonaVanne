<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UTTT.Ejemplo.Persona.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Inicio.aspx">Inicio</a>
    </nav>
    
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="Button1" runat="server" Text="Cerrar sesion" OnClick="Button1_Click" aling="right" />
    </div>
        <div class="form-group">
            <div class="text-center">

                <div>

                    <asp:Label ID="lblSesion" runat="server" Text="."></asp:Label>

                    <div>
                        <asp:ImageButton ID="imbtnPersona" runat="server" Height="190px" ImageUrl="~/Images/persona.png" Width="170px" OnClick="imbtnPersona_Click" />
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Persona"></asp:Label>
                    </div>
                </div>
                <div>
                    <asp:ImageButton ID="imbtnUsuario" runat="server" Height="190px" ImageUrl="~/Images/Usuario.png" Width="170px" OnClick="imbtnUsuario_Click" />
                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Usuario"></asp:Label>
                </div>
            </div>
        </div>


    </form>
</body>

</html>
