<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="hodetails.aspx.cs" Inherits="mocoolmaid.hodetails" %>

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

        <h10>Houseowner details</h10>

        <!-- This DataList will be used to display details of housekeeper depending on
which location is selected from the previous page -->
        <asp:DataList
            ID="dlstHODetails"
            RepeatColumns="1"
            runat="server">
            <ItemTemplate>
                <div class="card bg-warning text-white h-50"
                    style="width: 600px; float: left; margin: 30px;">
                    <asp:Image runat="server" ImageUrl='<%# Eval("HO_imageurl", "~../img/{0}")%>'
                        ID="Image1" CssClass="card-img-top mx-auto" Width="190px" Height="200px" />
                    <div class="card-body h">
                        <h2 class="card-title"><%# Eval("HO_lastname")%></h2>
                        <h2 class="card-title"><%# Eval("HO_firstname")%></h2>
                        <h2 class="card-title"><%# Eval("HO_phonenumber")%></h2>
                        <h2 class="card-title"><%# Eval("HO_email")%></h2>
                        <p class="card-text">
                            <span><strong>Status:<br />
                            </strong></span>
                            <span class="text-dark">
                                <%# Eval("HO_status")%>
                            </span>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>


</asp:Content>
