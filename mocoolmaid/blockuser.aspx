<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="blockuser.aspx.cs" Inherits="mocoolmaid.blockuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #gvs {
            width: 100%;
            margin: 25px;
        }

        th {
            background: #494e5d;
            color: white;
        }

        h10 {
            align-content: center;
            font-family: 'Lucida Calligraphy';
            font-size: 30px;
            color: darkblue;
            padding-left: 560px;
            padding-top: 60px;
            padding-bottom: 60px;
        }

        .hi {
            padding-left: 150px;
            padding-right:150px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <div class="row">
        <div class="col-lg-12">
            <h10>Block active Housekeeper:</h10>
            <br />
        </div>
    </div>

    <div class="hi">

        <asp:GridView ID="gvs"
            OnPreRender="gvs_PreRender"
            ForeColor="Navy"
            BorderColor="Navy"
            BackColor="CornflowerBlue"
            AlternatingRowStyle-BackColor="WhiteSmoke"
            CssClass="table table-striped table-bordered"
            runat="server" AutoGenerateColumns="false">

            <Columns>
                <asp:ImageField DataImageUrlField="HK_imageurl" ControlStyle-Width="100"
                    DataImageUrlFormatString="~../img/{0}" HeaderText="Profile picture" />
                <asp:BoundField DataField="HK_firstname" HeaderText="First Name" />
                <asp:BoundField DataField="HK_lastname" HeaderText="Last Name" />
                <asp:BoundField DataField="HK_username" HeaderText="Username" />
                <asp:TemplateField HeaderText="Block HK">
                    <ItemTemplate>
                        <%-- Assign the HK_Id to the link button using the CommandArgument --%>
                        <asp:LinkButton ID="lnkblock" CssClass="btn btn-outline-danger"
                            OnClick="lnkblock_Click"
                            CommandArgument='<%# Eval("HK_Id") %>'
                            runat="server">Block</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

    <br />
    <br />

    <div class="row">
        <div class="col-lg-12">
            <h10>Block active Houseowner:</h10>
            <br />
        </div>
    </div>

    <div class="hi">

    <asp:GridView ID="GridView1"
        OnPreRender="GridView1_PreRender"
        ForeColor="Navy"
        BorderColor="Navy"
        BackColor="CornflowerBlue"
        AlternatingRowStyle-BackColor="WhiteSmoke"
        CssClass="table table-striped table-bordered"
        runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:ImageField DataImageUrlField="HO_imageurl" ControlStyle-Width="100"
                DataImageUrlFormatString="~../img/{0}" HeaderText="Profile picture" />
            <asp:BoundField DataField="HO_firstname" HeaderText="First Name" />
            <asp:BoundField DataField="HO_lastname" HeaderText="Last Name" />
            <asp:BoundField DataField="HO_username" HeaderText="Username" />
            <asp:TemplateField HeaderText="Block HO">
                <ItemTemplate>
                    <%-- Assign the HO_Id to the link button using the CommandArgument --%>
                    <asp:LinkButton ID="lnkhoblock" CssClass="btn btn-outline-danger"
                        OnClick="lnkhoblock_Click"
                        CommandArgument='<%# Eval("HO_Id") %>'
                        runat="server">Block</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    </div>

    <br />
    <br />

</asp:Content>
