<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" AutoEventWireup="true"
    CodeBehind="details.aspx.cs" Inherits="mocoolmaid.details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .column {
            float: left;
            margin: 20px;
            padding-left: 400px;
        }

        h10 {
            color: darkblue;
            padding-left: 150px;
            text-align: left;
            font-size: 200%;
            font-family: Cooper;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />

    <div class="column">

        <h10>Housekeeper details</h10>

        <!-- This DataList will be used to display details of housekeeper depending on
which location is selected from the previous page -->
        <asp:DataList
            ID="dlstHkDetails"
            RepeatColumns="1"
            runat="server">
            <ItemTemplate>
                <div class="card bg-danger text-white h-50"
                    style="width: 600px; float: left; margin: 30px;">
                    <asp:Image runat="server" ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}")%>'
                        ID="Image1" CssClass="card-img-top mx-auto" Width="190px" Height="200px" />
                    <div class="card-body h">
                        <h2 class="card-title"><%# Eval("HK_lastname")%></h2>
						<h2 class="card-title"><%# Eval("HK_firstname")%></h2>
						<h2 class="card-title"><%# Eval("HK_phonenumber")%></h2>
						<h2 class="card-title"><%# Eval("HK_email")%></h2>
                        <p class="card-text text-dark">
                            Skill:<%#Eval("HK_skill") %>
                        </p>
						<p class="card-text text-dark">
                            Work Experience:<%#Eval("HK_experience") %>
                        </p>
                        <p class="card-text">
                            <span><strong>Date Registered:<br />
                            </strong></span>
                            <span class="text-dark">
                                <%# Eval("HK_dateregistered")%>
                            </span>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>
