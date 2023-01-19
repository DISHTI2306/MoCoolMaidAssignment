<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="listofuser.aspx.cs" Inherits="mocoolmaid.listofuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .float {
            width: 100%;
            float: left;
            padding: 5px;
            padding-left: 275px;
        }

        .floater {
            width: 84%;
            float: left;
            padding: 5px;
            padding-left: 275px;
            
        }

        h10 {
            font-family: 'Gill Sans MT';
            font-size: 20px;
        }

        h11 {
            align-content: center;
            font-family: 'Lucida Calligraphy';
            font-size: 25px;
            color: darkblue;
            padding-left: 650px;
            padding-top: 60px;
            padding-bottom: 60px;
        }

        h12 {
            align-content: center;
            font-family: Cooper;
            font-weight: bold;
            font-size: 40px;
            color: black;
            padding-left: 600px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <h12>List of Users: </h12>

    <br />
    <br />

    <h11>List of HouseOwner: </h11>

        <div class="float">
            <asp:GridView
                ID="GrdView1"
                ForeColor="Black"
                BorderColor="Navy"
                BackColor="Orange"
                AlternatingRowStyle-BackColor="WhiteSmoke"
                AutoGenerateColumns="false"
                OnPageIndexChanging="GrdView1_PageIndexChanging"
                runat="server">
                <Columns>

                    <asp:ImageField DataImageUrlField="HO_imageurl"
                        DataImageUrlFormatString="~../img/{0}"
                        HeaderText="Profile Pic: "
                        SortExpression="Poster" ControlStyle-Width="100" />

                    <asp:BoundField HeaderText="Last name: " DataField="HO_lastname" />

                    <asp:BoundField HeaderText="First name: " DataField="HO_firstname" />

                    <asp:HyperLinkField HeaderText="Email: "
                        DataTextField="HO_email" DataNavigateUrlFields="HO_Id"
                        DataNavigateUrlFormatString="managejob.aspx?id={0}" />

                    <asp:TemplateField HeaderText="Phone Number: ">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HO_phonenumber") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender:">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HO_gender") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DateBirth:">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HO_DOB") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Status: " DataField="HO_status" />

                </Columns>
            </asp:GridView>
        </div>

    <br />
    <hr />
    <br />

    <h11>List of HouseKeeper: </h11>

    <br />

        <div class="floater">

            <asp:GridView ID="Gridview2"
                AllowPaging="true"
                PageSize="2"
                ForeColor="Black"
                BorderColor="Navy"
                BackColor="Orange"
                AlternatingRowStyle-BackColor="WhiteSmoke"
                AutoGenerateColumns="false"
                OnPageIndexChanging="Gridview2_PageIndexChanging"
                runat="server">
                <Columns>

                    <asp:ImageField DataImageUrlField="HK_imageurl"
                        DataImageUrlFormatString="~../img/{0}"
                        HeaderText="Profile Pic: "
                        SortExpression="Poster" ControlStyle-Width="150" />

                    <asp:BoundField HeaderText="Last name: " DataField="HK_lastname" />

                    <asp:BoundField HeaderText="First name: " DataField="HK_firstname" />

                    <asp:HyperLinkField HeaderText="Email: "
                        DataTextField="HK_email" DataNavigateUrlFields="HK_Id"
                        DataNavigateUrlFormatString="hkprofile.aspx?id={0}" />

                    <asp:BoundField HeaderText="Gender: " DataField="HK_gender" />

                    <asp:TemplateField HeaderText="Phone Number: ">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HK_phonenumber") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Experience:">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HK_experience") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status:">

                        <ItemTemplate>
                            <h10>
                                <i>
                                    <%# Eval("HK_status") %>
                                </i>
                            </h10>
                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>


</asp:Content>
