<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="listofjoboffers.aspx.cs" 
    Inherits="mocoolmaid.listofjoboffers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        .content {
            width: 90%;
            margin: 0 auto;
            background-color:mintcream;
            color: navy;
            padding: 10px;
            padding-top: 20px;
            text-align: left;
            font-size: 100%;
            font-family: 'Papyrus', fantasy;
        }

        .job {
            text-align: center;
        }

            .job th, .job td {
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
            background-color:moccasin;
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
                ID="rptJob"
                runat="server">
                <HeaderTemplate>
                    <table class="job">
                        <tr>
                            <th>Job Title</th>
                            <th>Description</th>
                            <th>Salary</th>
                            <th>Date Registered</th>
                            <th>Deadline Date</th>
                            <th>Status</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="item">
                        <td><%#Eval("Title") %></td>
                        <td><%#Eval("Description") %></td>
                        <td><%#Eval("Salary","{0:c}") %></td>
                        <td><%#Eval("Date_posted") %></td>
                        <td><%#Eval("Deadline") %></td>
                        <td><%#Eval("Job_status") %></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="alternating">
                        <td><%#Eval("Title") %></td>
                        <td><%#Eval("Description") %></td>
                        <td><%#Eval("Salary","{0:c}") %></td>
                        <td><%#Eval("Date_posted") %></td>
                        <td><%#Eval("Deadline") %></td>
                        <td><%#Eval("Job_status") %></td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
        </div>

     <br/>
    <br/>
    <br/>
    <br/>



</asp:Content>
