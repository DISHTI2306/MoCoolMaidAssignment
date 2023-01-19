<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="removejoboffers.aspx.cs"
    Inherits="mocoolmaid.removejoboffers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style>
        
        h10 {
            padding-left: 600px;
            font-size: 180%;
            color: Navy;
            font-weight:bolder;
            font-family: 'Lucida Calligraphy';
        }

        .tbldiv {
            width: 90%;
            padding-left: 140px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

  <div class="row">
        <div class="col-lg-12">
            <h10>Remove job Offers: </h10>
        </div>

      <br />
    <br />

    </div>
    <div class="tbldiv">
        <asp:GridView ID="gvs2" 
            OnPreRender="gvs2_PreRender" 
            CssClass="table table-striped table-bordered"
            runat="server" AutoGenerateColumns="false" PageSize="2">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Job Title" />
                <asp:BoundField DataField="Description" HeaderText="Job Description" />
				<asp:BoundField DataField="Salary" HeaderText="Remuneration" />
                <asp:BoundField DataField="Date_posted" HeaderText="Date registered" />
                <asp:BoundField DataField="Deadline" HeaderText="Deadline date" />
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <%-- Assign the Movie_Id to the link button Command Argument --%>
                        <asp:LinkButton CssClass="btn btn-outline-info"
                            OnClick="Unnamed_Click"
                            commandArgument='<%# Eval("Job_Id") %>'
                            runat="server"
                            ToolTip="Remove Job"><span class="fas fa-trash"></span></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
