<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="usersearch.aspx.cs" Inherits="mocoolmaid.usersearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .hk {
            border: 3px solid black;
            width: 250px;
        }

            .hk td {
                padding: 10px;
                text-align: center;
                background-color: ghostwhite;
                font-family: Cooper;
                color: navy;
            }

        a {
            color: black;
        }

        .hk a:hover {
            color: darkblue;
            text-decoration: none;
        }

        .content {
            float: left;
            margin: 20px;
            padding-left: 400px;
        }

        h10 {
            padding-left: 500px;
            font-size: 200%;
            color: mediumblue;
            font-family: 'Lucida Calligraphy';
        }

        #container {
            position:fixed; 
	        top:275px; 
	        left:0; 
        }

         #cntnr {
            position:fixed;
	        top:150px; 
	        right:0; 
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br/>
    <br/>

    <h10>Web Admin Search User: </h10>

    <br/>

     <div class="content">
         
        <div class="row">
            <!-- This DataList will be used to display list of name of each housekeeper -->
            <asp:DataList
                ID="dlstHousekeeper"
                DataKeyField="Loc_Id"
                GridLines="Horizontal"
                CssClass="hk"
                runat="server">
                <HeaderTemplate>Search Housekeeper by location: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHk"
                        Text='<%#Eval("Loc_Name") %>'
                        PostBackUrl='<%#Eval("Loc_Id","details.aspx?id={0}")%>'
                        CommandName="Select"
                        runat="server" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <div class="content">
        <div class="row">
            <!-- This DataList will be used to display list of name of each houseowner -->
            <asp:DataList
                ID="dlstHouseowner"
                DataKeyField="HO_Id"
                GridLines="Both"
                CssClass="hk"
                runat="server">
                <HeaderTemplate>Search Houseowner by last name: </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton
                        ID="lnkHO"
                        Text='<%#Eval("HO_lastname") %>'
                        PostBackUrl='<%#Eval("HO_Id","hodetails.aspx?id={0}")%>'
                        CommandName="Select"
                        runat="server" />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

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

    <div id="cntnr">
            <aside class="outer col-sm-2 offset-sm-1">
                        <div class="ads d-none d-xl-block">

                            <asp:AdRotator
                                ID="AdRotator2"
                                AdvertisementFile="~/App_Data/ad.xml"
                                runat="server" />

                        </div>
                    </aside>
        </div>


</asp:Content>
