<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="appliedjob.aspx.cs"
    Inherits="mocoolmaid.appliedjob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .floater {
            width: 95%;
            float: left;
            padding: 5px;
            padding-left: 180px;
            padding-right: 140px;
            margin: 5px;
        }

        h10 {
            font-family: Cooper;
            font-size: 15px;
            color: darkblue;
        }

        h11 {
            align-content: center;
            font-family: 'Footlight MT';
            font-weight: bolder;
            font-size: 40px;
            color: darkblue;
            padding-left: 600px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <h11>List of Applied Jobs: </h11>

    <div class="floater">

        <asp:GridView
            ID="GrdView1"
            ForeColor="#003300"
            BackColor="#ff0066"
            AlternatingRowStyle-BackColor="White"
            BorderColor="Navy"
            AutoGenerateColumns="false"
            runat="server">
            <Columns>

                <asp:ImageField DataImageUrlField="HK_imageurl"
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="Profile Pic: "
                    SortExpression="Poster" ControlStyle-Width="100" />

                <asp:TemplateField HeaderText="Last name: ">

                    <ItemTemplate>
                        <h10>
                            <i>
                                <%# Eval("HK_lastname") %>
                            </i>
                        </h10>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="First name: ">

                    <ItemTemplate>
                        <h10>
                            <i>
                                <%# Eval("HK_firstname") %>
                            </i>
                        </h10>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:HyperLinkField HeaderText="Email: "
                    DataTextField="HK_email" DataNavigateUrlFields="HK_Id"
                    DataNavigateUrlFormatString="hkprofile.aspx?id={0}" />

                <asp:TemplateField HeaderText="Title: ">

                    <ItemTemplate>
                        <h10>
                            <i>
                                <%# Eval("Title") %>
                            </i>
                        </h10>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description: ">

                    <ItemTemplate>
                        <h10>
                            <i>
                                <%# Eval("Description") %>
                            </i>
                        </h10>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date Applied: ">

                    <ItemTemplate>
                        <h10>
                            <i>
                                <%# Eval("Date_Applied") %>
                            </i>
                        </h10>
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <br />

</asp:Content>
