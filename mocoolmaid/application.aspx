<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="application.aspx.cs"
    Inherits="mocoolmaid.application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .darshi {
            width: 60%;
            margin: 0 auto;
            background-color: honeydew;
            color: darkred;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: Cooper;
        }

        .form-horizontal {
            width: 60%;
            margin: 0 auto;
            background-color: Navy;
            color: white;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: Cooper;
        }

        h7 {
            padding-left: 325px;
            padding-bottom: 20px;
            font-size: 150%;
            color: White;
            font-weight: bolder;
            font-family: 'Lucida Calligraphy';
        }

        .man {
            padding-left: 420px;
        }

        .wm {
            padding-right: 150px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <div class="form-horizontal">

        <h7>My Applicants: </h7>
    </div>

    <div class="darshi">

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lblappid"
                CssClass="col-md-2 col-form-label">Applicant Id: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtappid"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvappid" runat="server" Text="*"
                         ControlToValidate="txtappid" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lblappdate"
                CssClass="col-md-2 col-form-label">Application date: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtappdate"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvappdate" runat="server" Text="*"
                         ControlToValidate="txtappdate" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lbllname"
                CssClass="col-md-2 col-form-label">Last name: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtlname"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvlname" runat="server" Text="*"
                         ControlToValidate="txtlname" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lblfname"
                CssClass="col-md-2 col-form-label">First name: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtfname"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvfname" runat="server" Text="*"
                         ControlToValidate="txtfname" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lblemail"
                CssClass="col-md-2 col-form-label">Email: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtemail"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" Text="*"
                         ControlToValidate="txtemail" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" ID="lblstats"
                CssClass="col-md-2 col-form-label">Status: </asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtstats"
                    CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvstats" runat="server" Text="*"
                         ControlToValidate="txtstats" ForeColor="Red" ValidationGroup="vgAdd" />
            </div>
        </div>

        <div class="wm">
            <div class="form-group row justify-content-center">
                <div class="offset-md-2 col-md-4">
                    <asp:Button runat="server" ID="btnupdate"
                        OnClick="btnupdate_Click"
                        Text="Update Application" ValidationGroup="vgAdd"
                        CssClass="btn btn-block btn-outline-primary" />
                    <asp:Button runat="server" ID="btncancel"
                        OnClick="btncancel_Click"
                        Text="Cancel" ValidationGroup="vgAdd"
                        OnClientClick="return confirm('Are you sure you wanna clear the form?')"
                        CssClass="btn btn-block btn-outline-success" />
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>

    </div>

    <hr />

    <div class="man">
        <asp:GridView ID="gvs" DataKeyNames="HK_Id"
            AutoGenerateColumns="false"
            OnSelectedIndexChanged="gvs_SelectedIndexChanged"
            ClientIDMode="Static" Width="700" runat="server">
            <HeaderStyle BackColor="Navy" ForeColor="White" Font-Bold="true"
                Height="30" />
            <AlternatingRowStyle BackColor="honeydew" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnSelect" runat="server"
                            CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Applicant Id">
                    <ItemTemplate>
                        <asp:Label ID="lblappid" Text='<%#Eval("HK_Id")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last name">
                    <ItemTemplate>
                        <asp:Label ID="lbllname" Text='<%#Eval("HK_lastname")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="First name">
                    <ItemTemplate>
                        <asp:Label ID="lblfname" Text='<%#Eval("HK_firstname")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Application date">
                    <ItemTemplate>
                        <asp:Label ID="lblappdate" Text='<%#Eval("HK_dateregistered")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Application status">
                    <ItemTemplate>
                        <asp:Label ID="lblappstatus" Text='<%#Eval("HK_application_status")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <br />

</asp:Content>
