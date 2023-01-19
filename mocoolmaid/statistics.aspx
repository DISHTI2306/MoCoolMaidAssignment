<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="statistics.aspx.cs"
    Inherits="mocoolmaid.statistics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .hell {
            border: 3px solid darkblue;
            margin-right: 800px;
            margin-left: 200px;
        }

        h10 {
            padding-left: 550px;
            font-size: 250%;
            color: Navy;
            font-weight: bolder;
            font-family: Cooper;
        }

        .man {
            font-size: 120%;
            color: orangered;
            font-weight: bold;
            font-family: 'Lucida Console';
        }

         #container {
            position: fixed; 
	        top:350px; 
	        right:0; 
            margin-right: 200px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />

    <h10>Statistic by Category: </h10>

    <br />
    <br />

    <div class="man">

        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select
a Category: </asp:Label>
            <div class="col-md-7">
                <asp:DropDownList ID="ddlCategory"
                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"
                    AutoPostBack="true"
                    runat="server">
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="hell">
        <ajaxToolkit:PieChart ID="PieChart1"
            ChartWidth="500" ChartHeight="500" runat="server">
        </ajaxToolkit:PieChart>
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


    <br />
    <br />

</asp:Content>
