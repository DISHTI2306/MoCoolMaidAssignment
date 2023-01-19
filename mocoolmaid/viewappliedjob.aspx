<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="viewappliedjob.aspx.cs"
    Inherits="mocoolmaid.viewappliedjob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .content {
            width: 90%;
            margin: 0 auto;
            background-color: mintcream;
            color: navy;
            padding: 10px;
            padding-top: 20px;
            text-align: left;
            font-size: 100%;
            font-family: 'Papyrus', fantasy;
        }

        .jobapplied {
            text-align: center;
        }

            .jobapplied th, .jobapplied td {
                padding: 22px;
                border-bottom: 2px solid white;
                margin-left: 20px;
            }

        .item {
            text-align: justify;
            background-color: beige;
        }

        .alternating {
            text-align: justify;
            background-color: moccasin;
        }

        .hey {
            padding-top: 60px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="hey">
        <div class="row">
            <div class="content">
                <asp:Repeater
                    ID="rptJobApplied"
                    runat="server">
                    <HeaderTemplate>
                        <table class="jobapplied">
                            <tr>
                                <th>Last Name</th>
                                <th>First Name</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Date Applied</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="item">
                            <td><%#Eval("HK_lastname") %></td>
                            <td><%#Eval("HK_firstname") %></td>
                            <td><%#Eval("Title") %></td>
                            <td><%#Eval("Description") %></td>
                            <td><%#Eval("Date_Applied") %></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alternating">
                            <td><%#Eval("HK_lastname") %></td>
                            <td><%#Eval("HK_firstname") %></td>
                            <td><%#Eval("Title") %></td>
                            <td><%#Eval("Description") %></td>
                            <td><%#Eval("Date_Applied") %></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <br />

</asp:Content>
