<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="viewstats.aspx.cs" Inherits="mocoolmaid.viewstats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h10 {
            padding-left: 650px;
            font-size: 200%;
            color: navy;
            font-weight: bold;
            font-family: Cooper;
        }

        #container {
            position:fixed; 
	        top:275px; 
	        left:0; 
            margin-left: 100px;
        }

        .column {
            padding-left: 625px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <h10>View Statistics</h10>

    <br />
    <br />

        <div class="column">
            <div class="col-xl-4 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Number of Houseowner: </div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hyho"
                            runat="server" CssClass="small
text-white stretched-link"></asp:HyperLink>
                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Number of Housekeeper: </div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hyhk"
                            runat="server" CssClass="small
text-white stretched-link"></asp:HyperLink>
                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Number of Category: </div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hycategory"
                            runat="server" CssClass="small
text-white stretched-link"></asp:HyperLink>

                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Number Of available job: </div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hyjob"
                            runat="server" CssClass="small
text-white stretched-link"></asp:HyperLink>

                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
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

</asp:Content>
