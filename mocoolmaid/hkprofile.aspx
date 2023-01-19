<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="hkprofile.aspx.cs" Inherits="mocoolmaid.hkprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .column1 {
            border: 0px solid #4B2543;
            width: 400px;
            float: left;
        }

            .column1 td {
                padding: 10px;
            }

            .column1 tr {
                border-bottom: 3px dashed Navy;
                border-collapse: collapse;
            }

        .column2 {
            width: 200px;
            float: left;
        }

        #container {
            width: 45%;
            margin: 0 auto;
            padding: 10px;
            text-align: left;
            font-size: 120%;
            font-family:Cooper;
            color: crimson;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br/>

    <div id="container">

    <h1>Click Image to view HK profile</h1>
    <div class="column1">
        <!-- 
Add the imageurl field and set path to images folder: ~/images/{0}
Add the user_id field and set redirect path to viewusers.aspx?ID={0}
-->
        <asp:DataList
            ID="dlsthk"
            RepeatColumns="2"
            RepeatDirection="Horizontal"
            runat="server">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server"
                    Width="120" Height="120"
                    ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}") %>'
                    PostBackUrl='<%# Eval("HK_Id","hkprofile.aspx?ID={0}") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </div>

    <div class="column2">
            <asp:DataList
                ID="dlsthkdetails"
                Visible="false"
                runat="server">
                <ItemTemplate>
                    <div class="card border-primary">
                        <div class="card-header text-center fa-3x bg-dark text-white ">
                            <!-- Eval the image -->
                            <asp:Image runat="server"
                                ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}") %>' ID="Image1" 
                                CssClass="card-imgtop" AlternateText="Card image" 
                                Width="60px" Height="60px" />
                            <br />
                            <!-- Eval the first name -->
                            <%# Eval("HK_firstname") %>
                            <!-- Eval the last name -->
                            <%# Eval("HK_lastname") %>
                        </div>
                        <!-- Eval the email, gender, experience and status -->
                        <div class="card-body"><b>Gender: </b><%# Eval("HK_gender") %></div>
                        <div class="card-body"><b>Email: </b><%# Eval("HK_email") %></div>
                        <div class="card-body"><b>Experience: </b><%# Eval("HK_experience") %></div>
                        <div class="card-body"><b>Skills: </b><%# Eval("HK_skill") %></div>

                        <div class="card-footer bg-info">
                            <b>Account Status: </b> <%# Eval("HK_status") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        </div>

</asp:Content>
