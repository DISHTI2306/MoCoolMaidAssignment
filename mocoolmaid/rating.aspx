<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="rating.aspx.cs" Inherits="mocoolmaid.rating" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        body {
           background-color: ghostwhite;
        }

        .blankstar {
            width: 16px;
            height: 16px;
        }

        .waitingstar {
            width: 16px;
            height: 16px;
        }

        .shiningstar {
            width: 16px;
            height: 16px;
        }

        #container {
            padding-left: 400px;
        }

        .mo {
            padding-left: 200px;
        }

        .card-body {
            font-size: 130%;
            color: navy;
            font-weight: bold;
            font-family: Cooper;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <div id="container">

        <div class="card bg-success text-white h-100" style="width: 600px; float: left; margin: 30px;">

            <div class="mo">
                <asp:Image runat="server" ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}")%>'
                    ID="Image1" CssClass="card-img-top" Width="190px" Height="200px" />
            </div>

            <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true" 
                StarCssClass="fas fa-star" 
                WaitingStarCssClass="far fa-star" FilledStarCssClass="fas fa-star"
                EmptyStarCssClass="far fa-star" OnChanged="Rating1_Changed" OnClick="Rating1_Click">
            </ajaxToolkit:Rating>

            <br />
            <asp:Label ID="lblRatingStatus" runat="server" Text="sfsdf"></asp:Label>
            <div class="card-body">
                <h5 class="card-title">
                    <asp:Label runat="server" Text='<%# ("HK_lastname")%>' ID="lbllname" />
                    <asp:Label runat="server" Text='<%# ("HK_firstname")%>' ID="lblfname" />
                </h5>

                <p class="card-text">
                    <span><strong>Email:<br />
                    </strong></span>
                    <asp:Label runat="server" Text='<%# ("HK_email")%>' ID="lblemail" />
                </p>
            </div>
        </div>
    </div>

</asp:Content>
