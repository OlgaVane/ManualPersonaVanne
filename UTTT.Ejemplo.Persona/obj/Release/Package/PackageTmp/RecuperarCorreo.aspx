<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarCorreo.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RecuperarCorreo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recupera Contraseña</title>
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
                    <span class="login100-form-title-1">Recuperar contraseña
                    </span>
                </div>
                <form id="form2" runat="server" class="login100-form validate-form">
                    <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                        <span class="label-input100">E-mail</span>

                        <span class="focus-input100"></span>
                        <asp:TextBox ID="txtCorreo" runat="server" Width="320px" ViewStateMode="Disabled"></asp:TextBox>

                    </div>
                    <div class="flex-sb-m w-full p-b-30">
                        <asp:Label ID="lblMessage" runat="server" class="txt1" Text="..."></asp:Label>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Debe ingresar un Correo"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Email incorrecto"
                            ForeColor="Blue"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>


                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" ViewStateMode="Disabled" class="login100-form-btn" />

                        <asp:Button OnClientClick="return comprueba();" ID="btnCancelar" runat="server" Text="Cancelar" ViewStateMode="Disabled" OnClick="btnCancelar_Click" class="login100-form-btn" />

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
