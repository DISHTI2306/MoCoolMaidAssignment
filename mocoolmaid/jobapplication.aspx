<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="jobapplication.aspx.cs"
    Inherits="mocoolmaid.jobapplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

        h7 {
            padding-left: 50px;
            font-size: 250%;
            color:darkred;
            font-weight: bolder;
            font-family: Cooper;
        }

        .hey {
            padding-left: 150px;
        }

        h10 {
            padding-left: 110px;
            font-size: 150%;
            color:darkred;
            font-weight: bold;
            padding-bottom: 20px;
            font-family: Cooper;
        }

        #container {
            padding-left: 1200px;
            padding-bottom: 20px;
            font-family: Cooper;
            font-size: 20px;
            color: mediumblue;
        }

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

      <div id="container">
        <asp:Label ID="lblServerTime" runat="server" />
      </div>

        <div class="container">
        <div class="row form-group" runat="server">
            <div class="col-sm-6 " style="float: left">
                <h7>List of Jobs: </h7>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--Trigger the TextChanged event--%>
                    <asp:DropDownList ID="ddlCategory" runat="server"
                        OnSelectedIndexChanged="TextBox1_TextChanged"
                        CssClass="formcontrol" AutoPostBack="true">
                    </asp:DropDownList>&nbsp;
                </div>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--generate text changed event--%>
                    <asp:TextBox ID="TextBox1"
                        OnTextChanged="TextBox1_TextChanged"
                        runat="server" AutoPostBack="true"
                        CssClass="form-control" Placeholder="Search..." />
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i></span>
                </div>
            </div>

        </div>
        <%-- START AJAX CONTROL --%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"
            UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <hr />
                <asp:ListView
                    ID="lvJob" OnPagePropertiesChanging="lvJob_PagePropertiesChanging"
                    runat="server" ItemPlaceholderID="itemPlaceholder"
                    DataKeyNames="job_id">
                    <ItemTemplate>
                        <div class="card bg-warning text-white h-100" style="width: 500px; float: left; margin: 8px;">
                            <div class="card-body">
                                <h10 class="card-title"><%# Eval("Title")%></h10>
                                <p class="card-text">
                                    <asp:HyperLink runat="server"
                                        NavigateUrl='<%# Eval("job_id","~/listofjoboffers.aspx")%>'>
                         <%# Eval("Description").ToString() %>
                                    </asp:HyperLink>
                                </p>
                                <p class="card-text">
                                    <span><strong>Salary:</strong></span><%# Eval("Salary","{0:c}")%>
                                </p>
                                <%--Eval job_id as the commandargument--%>
                                <div class="hey">
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    OnClick="LinkButton1_Click"
                                    Text="Apply job"
                                    CommandName="btnApply" CssClass="btn btn-success" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholder" class="categoryContainer"
                            runat="server">
                        </div>
                        <hr style="clear: both" />
                        <div class="text-right">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link"
                                        ShowNextPageButton="false" ShowFirstPageButton="true" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Link"
                                        ShowPreviousPageButton="false" ShowLastPageButton="true" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="TextBox1"
                    EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlcategory"
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>

    <br />

</asp:Content>
