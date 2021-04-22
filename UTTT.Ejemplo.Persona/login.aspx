<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login V15</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="Logincss/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/fonts/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/animate/animate.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/animsition/css/animsition.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/select2/select2.min.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <!--===============================================================================================-->
    <link href="Logincss/css/main.css" rel="stylesheet" />
    <link href="Logincss/css/util.css" rel="stylesheet" />
    <!--===============================================================================================-->
</head>
<body>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-form-title" style="background-image: url(Logincss/images/bg-01.jpg);">
                    <span class="login100-form-title-1">Sign In
                    </span>
                </div>
                <form id="form1" runat="server" class="login100-form validate-form">
                    <%--USUARIO--%>
                    <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                        <span class="label-input100">Usuario</span>
                        <asp:TextBox ID="txtUsuario" runat="server" class="input100"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <%--CONTRASEÑA--%>

                    <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                        <span class="label-input100">Contraseña</span>
                        <asp:TextBox ID="txtContraseña" runat="server" class="input100" TextMode="Password"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>
                    <%--RECUPERACION--%>
                    <div class="flex-sb-m w-full p-b-30">
                        <div>
                            <a href="#" class="txt1" onclick="window.open('RecuperarCorreo.aspx','FP','width=500,height=50,top=300,left=500,fullscreeen=no,resizable=0');">¿Has olvidado tu contraseña?</a>
                        </div>
                    </div>
                    <%--BOTON--%>
                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="login100-form-btn" OnClick="btnAceptar_Click" />
                        <asp:Label ID="lblMensaje" runat="server" Text="."></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="vendor/bootstrap/js/popper.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
</body>
</html>
