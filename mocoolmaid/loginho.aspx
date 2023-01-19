<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="loginho.aspx.cs" Inherits="mocoolmaid.loginho" %>

<%@ Register TagPrefix="user" TagName="login" Src="~/logincrtl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
        .hi {
            width: 50%;
            margin: 0 auto;
            background-color: lemonchiffon;
            color: darkblue;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: 'Lucida Handwriting';
        }

        legend {
            color: darkblue;
            padding: 15px;
            text-align: center;
            font-weight: bold;
            font-size: 180%;
            font-family: 'Papyrus', fantasy;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br/>
    <br/>
    <br/>
    <br/>
        <div id="container">
            <div id="leftSide">
                <div class="hi">
                    <fieldset>
                        <legend>HouseOwner Login</legend>
                        <div class="form">

                            <user:login ID="uchologin" runat="server" />

                            <br />
                            <br />
                            <asp:Button ID="btnLogin1" runat="server" OnClick="btnLogin1_Click"
                                CssClass="btn btn-outline-primary" Text="Log in" />
                        </div>
                    </fieldset>
                    <fieldset>
                        <asp:Label ID="lblmsg1" runat="server" Text=""></asp:Label><br />
                        <asp:Button ID="btnRegister1" runat="server"
                            PostBackUrl="horegister.aspx" Text="Don’t have an account yet? Join now"
                            CausesValidation="false" CssClass="btn btn-outline-warning" /><br />
                    </fieldset>
                </div>
            </div>
        </div>

    <br/>
    <br/>
    <br/>
    <br/>

</asp:Content>
