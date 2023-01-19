<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="ratehk.aspx.cs" Inherits="mocoolmaid.ratehk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">
        .content {
            width: 800px;
            border: solid 3px Navy;
            background-color: cornsilk;
            margin: auto;
        }

        .hk {
            margin: 20px 10px;
            padding: 10px;
            border: dashed 2px Navy;
            background-color: white;
            overflow: hidden;
        }

        .box1 {
            float: left;
            max-width: 500px;
            margin-right: 50px;
            text-align: justify;
            min-height: 300px;
        }

        .box2 {
            margin-bottom: 2px;
            text-align: center;
        }

        h9 {
            font-size: 180%;
            color: Navy;
            font-weight: bolder;
            font-family: Cooper;
        }

        h10 {
            font-size: 100%;
            color: orangered;
            font-weight: bold;
            font-family: 'Lucida Console';
        }

        h11 {
            font-size: 200%;
            color: Navy;
            padding-left: 580px;
            font-weight: bolder;
            font-family: Cooper;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

       <!--
 Redirect to rating.aspx with a querystring for the HK ID and
Store the HK ID in the command argument
 -->

    <br />

    <h11>Housekeeper Rating: </h11>

    <br />

    <div class="row">
        <div class="content">
            <asp:Repeater
                ID="rptHk"
                runat="server">
                <ItemTemplate>
                    <div class="hk">
                        <div class="box1">
                            <asp:Image ID="imgposter" ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}") %>'
                                ControlStyle-Width="150" Height="150"
                                CssClass="img-fluid" runat="server" /> <br />
                            <h9><%#Eval("HK_lastname") %></h9>
                            <h9><%#Eval("HK_firstname") %></h9> <br />
                            <h10>Email: </h10> <%# Eval("HK_email") %> <br />
                            <h10>Skill: </h10> <%# Eval("HK_skill") %> <br />
                            <h10>Experience: </h10> <%# Eval("HK_experience") %> <br />
                            <h10>Date applied: </h10> <%# Eval("HK_dateregistered") %> <br />

                            <br />
                        </div>
                        <div>
                            
                            <div class="box2">
                                <asp:LinkButton ID="lnkhkdetails" runat="server" Text="Rate Housekeeper"
                                    PostBackUrl='<%# Eval("HK_Id", "rating.aspx?id={0}") %>'
                                    CommandArgument='<%# Eval("HK_Id") %>'
                                    CommandName="btnRate"
                                    CssClass="btn btn-info"></asp:LinkButton>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
