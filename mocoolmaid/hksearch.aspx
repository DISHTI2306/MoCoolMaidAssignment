<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="hksearch.aspx.cs" Inherits="mocoolmaid.hksearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .id {
        padding-left: 500px;
    }

    .hk {
            border: 3px solid cornsilk;
            width: 250px;
        }

            .hk td {
                padding: 10px;
                text-align: center;
                background-color: deepskyblue;
                font-family: Cooper;
                color: Navy;
            }

        a {
            color: white;
        }

        .hk a:hover {
            color: black;
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
            color: mediumblue;
            font-family: 'Lucida Calligraphy';
        }

        h7 {
            font-size: 130%;
            color: darkblue;
            font-family: Cooper;
        }

         #container {
            position:fixed; 
	        top:275px; 
	        left:0; 
        }

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <h10>Search Housekeeper: </h10>

        <br />
    <br />

     <div class="form-group row justify-content-center">
                <h7>By Last name: </h7>
                <div class="col-md-5">
                    <asp:TextBox ID="txtlname"
            OnTextChanged="txtlname_TextChanged"
            AutoPostBack="true"
            CssClass="form-control"
            runat="server"></asp:TextBox>
                </div>
            </div>

        <br />

       <div class="content">
        <div class="row">
            <!-- This DataList will be used to display list of location of each housekeeper -->
            <asp:DataList
                ID="dlstHkloc"
                DataKeyField="Loc_Id"
                GridLines="Horizontal"
                CssClass="hk"
                runat="server">
                <HeaderTemplate>By location: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHkloc"
                        Text='<%#Eval("Loc_Name") %>'
                        PostBackUrl='<%#Eval("Loc_Id","details.aspx?id={0}")%>'
                        CommandName="Select"
                        runat="server" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <br />

    <div class="content">
        <div class="row">
            <!-- This DataList will be used to display category of each hk -->
            <asp:DataList
                ID="dlstHKCategory"
                DataKeyField="Category_Id"
                GridLines="Both"
                CssClass="hk"
                runat="server">
                <HeaderTemplate>By category: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHO"
                        Text='<%#Eval("Category_Name") %>'
                        PostBackUrl='<%#Eval("Category_Id","details.aspx?id={0}")%>'
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
                ID="dlstHK"
                runat="server">
                <ItemTemplate>
                    <div class="id">
                        <div class="card bg-primary text-white h-100"
                            style="width: 500px; float: left; margin: 30px;">
                            <asp:Image runat="server" ImageUrl='<%# Eval("HK_imageurl", "~../img/{0}")%>'
                                ID="Image1" CssClass="card-img-top mx-auto" Width="190px" Height="200px" />
                            <div class="card-body h">

                                <h9>
                                    <%#Eval("HK_lastname")%></h9>
                                <br />
                                <h9>
                                    <%#Eval("HK_firstname")%></h9>
                                <br />
                                Phone number: <%#Eval("HK_phonenumber") %>
                                <br />
                                Email: <%#Eval("HK_email") %>
                                <br />
                                Skill: <%#Eval("HK_skill") %>
                                <br />
                                Work experience: <%#Eval("HK_experience") %>
                                <br />
                            </div>
                        </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtlname"
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
