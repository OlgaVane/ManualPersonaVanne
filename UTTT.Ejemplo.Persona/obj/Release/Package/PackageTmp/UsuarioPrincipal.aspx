<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Inicio.aspx">Inicio</a>
    </nav>

    <%--INICIO DEL FORMILARIO--%>
    <form id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container well">

            <div class="col-xl-12">
                <h2>Usuario</h2>
            </div>

            <div class="row">
                <%--NOMBRE--%>
                <div class="row form-group">
                    <div class="form-group col-auto">
                        <asp:Label ID="lblNombrePrincipal" class="col-form-label" runat="server" Text="Nombre:"></asp:Label>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanelBusca" runat="server">
                        <ContentTemplate>
                            <input type="submit" name="btnTrick" value="" id="btnTrick" style="display: none;" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="form-group col-auto">
                        <asp:TextBox ID="txtNombre" class="form-control" runat="server" Height="35px" Width="177px" ViewStateMode="Disabled"></asp:TextBox>
                    </div>
                </div>

                <%--SEXO--%>
                <div class="row form-group col-auto">
                    <div class="form-group col-auto">
                        <asp:Label ID="lblSexoPrincipal" runat="server" Text="Estado:"></asp:Label>
                    </div>
                    <div class="form-group col-auto">
                        <asp:DropDownList ID="ddlSexo" class="form-control input-lg" Height="35px" Width="177px" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <%--BOTONES--%>

                <div class="form-group col-auto">
                    <div class="row">
                        <div class="form-group col-auto">
                            <asp:Button ID="BtnBuscar" class="btn btn-outline-primary" runat="server" Text="Buscar" OnClick="BtnBuscar_Click" />
                        </div>
                        <div class="form-group col-auto">
                            <asp:Button ID="BtnAgregar" class="btn btn-outline-success" runat="server" Text="Agregar" OnClick="BtnAgregar_Click" />
                        </div>
                    </div>
                </div>
            </div>



            <p>
                <h3>Detalle</h3>
            </p>


            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:GridView ID="dgvUsuario" runat="server" class="table table-info" Width="1067px"
                            AllowPaging="True" AutoGenerateColumns="False"
                            DataSourceID="DataSourceUsuario" CellPadding="3" GridLines="Horizontal"
                            ViewStateMode="Disabled" OnRowCommand="dgvUsuarios" BackColor="White">
                            <Columns>
                                <asp:BoundField DataField="strNombreUsuario" HeaderText="Nombre" ReadOnly="True" SortExpression="strNombreUsuario" />
                                <asp:BoundField DataField="dteFechaRegistro" HeaderText="Fecha" ReadOnly="True" SortExpression="dteFechaRegistro" />
                                <asp:TemplateField HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" class="btn btn-outline-primary" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />


                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" class="btn btn-outline-danger" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>



            </div>

            <asp:LinqDataSource ID="DataSourceUsuario" runat="server"
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                OnSelecting="DataSourceUsuario_Selecting"
                Select="new (strNombreUsuario, dteFechaRegistro,id)"
                TableName="Usuario" EntityTypeName="">
            </asp:LinqDataSource>

        </div>
    </form>
    <script type="text/javascript">
        var nombre = document.getElementById("txtNombre").value;
        document.querySelector('#txtNombre').addEventListener('keyup', function () {
            const btnTrick = document.querySelector('#btnTrick');
            btnTrick.click();
        });
    </script>
</body>
</html>
