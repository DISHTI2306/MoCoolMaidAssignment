<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="hosearch.aspx.cs"
    Inherits="mocoolmaid.hosearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .id {
            padding-left: 500px;
            font-family: Cooper;
            font-size: 18px;
            text-align: center;
        }

        .ho {
            border: 3px solid black;
            width: 300px;
        }

            .ho td {
                padding: 10px;
                text-align: center;
                background-color: ghostwhite;
                font-family: Cooper;
                color: Navy;
            }

        a {
            color: black;
        }

        .ho a:hover {
            color: orangered;
            text-decoration: none;
        }

        .content {
            float: left;
            margin: 20px;
            padding-left: 400px;
        }

        h10 {
            padding-left: 600px;
            font-size: 200%;
            color: midnightblue;
            font-family: 'Lucida Console';
        }

        h7 {
            font-size: 130%;
            color: darkblue;
            font-family: Cooper;
        }

        #container {
            position: fixed;
            top: 350px;
            left: 0;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <h10>Search Houseowner: </h10>

    <br />

    <div class="form-group row justify-content-center">
        <h7>By HO Last name : </h7>
        <div class="col-md-5">
            <asp:TextBox ID="txtholname"
                OnTextChanged="txtholname_TextChanged"
                AutoPostBack="true"
                CssClass="form-control"
                runat="server"></asp:TextBox>
        </div>
    </div>

    <br />

    <div class="form-group row justify-content-center">
        <h7>By Houseowner Id: </h7>
        <div class="col-md-5">
            <asp:TextBox ID="txthoid"
                OnTextChanged="txthoid_TextChanged"
                AutoPostBack="true"
                CssClass="form-control"
                runat="server"></asp:TextBox>
        </div>
    </div>

    <br />

    <div class="content">
        <div class="row">
            <!-- This DataList will be used to display list of location of each houseowner -->
            <asp:DataList
                ID="dlstHkloc"
                DataKeyField="Loc_Id"
                GridLines="Horizontal"
                CssClass="ho"
                runat="server">
                <HeaderTemplate>By location: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHkloc"
                        Text='<%#Eval("Loc_Street") %>'
                        PostBackUrl='<%#Eval("Loc_Id","hodetails.aspx?id={0}")%>'
                        CommandName="Select"
                        runat="server" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

   <div class="content">
        <div class="row">
            <!-- This DataList will be used to display category of each houseowner -->
            <asp:DataList
                ID="dlstHOcategory"
                DataKeyField="Category_Id"
                GridLines="Both"
                CssClass="ho"
                runat="server">
                <HeaderTemplate>By Category: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHO"
                        Text='<%#Eval("Category_Name") %>'
                        PostBackUrl='<%#Eval("Category_Id","hodetails.aspx?id={0}")%>'
                        CommandName="Select"
                        runat="server" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DataList
                ID="dlstHO"
                runat="server">
                <ItemTemplate>
                    <div class="id">
                        <div class="card bg-primary text-white h-100"
                            style="width: 500px; float: left; margin: 60px;">
                            <asp:Image runat="server" ImageUrl='<%# Eval("HO_imageurl", "~../img/{0}")%>'
                                ID="Image1" CssClass="card-img-top mx-auto" Width="150px" Height="150px" />
                            <div class="card-body h">

                                <h9>
                                    <%#Eval("HO_lastname")%></h9>
                                <h9>
                                    <%#Eval("HO_firstname")%></h9>
                                <br />
                                Phone number: <%#Eval("HO_phonenumber") %>
                                <br />
                                Email: <%#Eval("HO_email") %>
                                <br />
                            </div>
                        </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtholname"
                EventName="TextChanged" />
            <asp:AsyncPostBackTrigger ControlID="txthoid"
                EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>

    <div id="container">
        <aside class="outer col-sm-2 offset-sm-1">
            <div class="ads d-none d-xl-block">

                <asp:AdRotator
                    ID="AdRotator1"
                    AdvertisementFile="~/App_Data/ads.xml"
                    runat="server" />

            </div>
        </aside>
    </div>

</asp:Content>
