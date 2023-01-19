<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="mocoolmaid.login" %>

<%@ Register TagPrefix="user" TagName="login" Src="~/logincrtl.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
        .hi {
            width: 50%;
            margin: 0 auto;
            background-color: mintcream;
            color: darkblue;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: 'Georgia', serif;
        }

        legend {
            color: deeppink;
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
                        <legend>Housekeeper Login</legend>
                        <div class="form">

                            <user:login ID="uchklogin" runat="server" />

                            <br />
                            <br />
                            <asp:Button ID="btnLogin" runat="server"
                                OnClick="btnLogin_Click"
                                CssClass="btn btn-outline-primary" Text="Log in" />
                        </div>
                    </fieldset>
                    <fieldset>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />
                        <asp:Button ID="btnRegister" runat="server"
                            PostBackUrl="hkregister.aspx" Text="Don’t have an account yet? Join now"
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
