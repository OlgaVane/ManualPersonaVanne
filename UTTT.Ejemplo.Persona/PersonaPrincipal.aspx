<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal" Debug="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/EstiloManager.css" rel="stylesheet" />
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

    <%--Inicializacion del formulario--%>
    <form id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container well">

            <%--<div style="color: #000000; font-size: medium; font-family: Arial; font-weight: bold">Persona</div>--%>
            <div class="col-xl-12">
                <h2>Persona</h2>
            </div>

            <%--div para mantener en una sola fila el contenido--%>
            <div class="row">
                <%--Nombre y btn del nombre--%>

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
                <%--Sexo y btn de sexo--%>
                <div class="row form-group col-auto">
                    <div class="form-group col-auto">
                        <asp:Label ID="lblSexoPrincipal" runat="server" Text="Estado:"></asp:Label>
                    </div>
                    <div class="form-group col-auto">
                        <asp:DropDownList ID="ddlSexo" class="form-control input-lg" Height="35px" Width="177px" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <%--Estado civil--%>
                <div class="row form-group col-auto">
                    <div class="form-group col-auto">
                        <asp:Label ID="lblEstadocivilPrincipal" runat="server" Text="Estado civil:"></asp:Label>
                    </div>
                    <div class="form-group col-auto">
                        <asp:DropDownList ID="ddlEstadocivilPrincipal" class="form-control input-lg" Height="35px" Width="177px" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <%--Botones para buscar y agregar--%>
                <div class="form-group col-auto">
                    <div class="row">
                        <div class="form-group col-auto">
                            <asp:Button ID="btnBuscar" class="btn btn-outline-primary" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ViewStateMode="Disabled" />
                        </div>
                        <div class="form-group col-auto">
                            <asp:Button ID="btnAgregar" class="btn btn-outline-success" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ViewStateMode="Disabled" />
                        </div>
                    </div>
                </div>
            </div>





            <p>
                <h3>Detalle</h3>
            </p>
            <div>
            </div>


            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <%--<table class="table">--%>

                        <asp:GridView ID="dgvPersonas" runat="server" class="table table-info"
                            AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona"
                            Width="1067px" CellPadding="3" GridLines="Horizontal"
                            OnRowCommand="dgvPersonas_RowCommand" BackColor="White"
                            ViewStateMode="Disabled">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica"
                                    ReadOnly="True" SortExpression="strClaveUnica" />
                                <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True"
                                    SortExpression="strNombre" />
                                <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True"
                                    SortExpression="strAPaterno" />
                                <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True"
                                    SortExpression="strAMaterno" />
                                <asp:BoundField DataField="CatSexo" HeaderText="Sexo"
                                    SortExpression="CatSexo" />
                                <asp:BoundField DataField="CatEstadoCivil" HeaderText="Estado Civil" SortExpression="CatEstadoCivil" />
                                <asp:TemplateField HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" class="btn btn-outline-primary" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Eliminar" Visible="True">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" class="btn btn-outline-danger" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Direccion">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" class="btn btn-outline-warning" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%--</table>--%>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <asp:LinqDataSource ID="DataSourcePersona" runat="server"
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                OnSelecting="DataSourcePersona_Selecting"
                Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, CatEstadoCivil, strClaveUnica,id)"
                TableName="Persona" EntityTypeName="">
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
