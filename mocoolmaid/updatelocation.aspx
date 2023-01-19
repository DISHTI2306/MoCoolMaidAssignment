<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="updatelocation.aspx.cs"
    Inherits="mocoolmaid.updatelocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .mii {
            width: 60%;
            margin: 0 auto;
            background-color: white;
            color: black;
            padding: 10px;
            padding-left: 275px;
            text-align: left;
            font-size: 110%;
            font-family: 'Courier New';
        }

        h10 {
            font-size: 140%;
            font-family: 'Lucida Calligraphy';
            padding-left: 600px;
            padding-bottom: 30px;
        }

        #container {
            position:fixed; 
	        top:275px; 
	        left:0; 
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <h10>Add/Update Location</h10>
    <hr/>

     <div class="mii">
         <asp:Label ID="lblMsg" runat="server" Text=" " CssClass="text-success"></asp:Label>
         <table>
             <tr>
                 <td>
                     <asp:Label ID="lbllocid" runat="server" Text="Location ID: "></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtLocationId" runat="server" CssClass="form-control"
                         Enabled="false" />
                 </td>
             </tr>

             <tr>
                 <td>
                     <asp:Label ID="lblstreet" runat="server" Text="Street: "></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtstreet" runat="server" CssClass="form-control">
                     </asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvstreet" runat="server" Text="*"
                         ControlToValidate="txtstreet" ForeColor="Red" ValidationGroup="vgAdd" />
                 </td>
             </tr>

             <tr>
                 <td>
                     <asp:Label ID="lbllname" runat="server" Text="District: "></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtLocName" runat="server" CssClass="form-control">
                     </asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvLocationName" runat="server" Text="*"
                         ControlToValidate="txtLocName" ForeColor="Red" ValidationGroup="vgAdd" />
                 </td>
             </tr>

             <tr>
                 <td colspan="2">
                     <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click"
                         Text="Insert" ValidationGroup="vgAdd" CssClass="btn btn-outline-primary" />
                     <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
                         Text="Update" ValidationGroup="vgAdd" CssClass="btn btn-outline-warning" />
                     <asp:Button ID="btnDelete" runat="server"
                         CssClass="btn btn-outline-danger" OnClick="btnDelete_Click"
                         OnClientClick="return confirm('Are you sure you want to delete this record?')"
                         Text="Delete" ValidationGroup="vgAdd" />
                     <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click"
                         Text="Cancel" CausesValidation="false" CssClass="btn btn-outline-success" />
                 </td>
             </tr>
         </table>
         <br />
         <!-- set the primary for the category table as the DataKeynames-->
         <asp:GridView ID="gvs" DataKeyNames="Loc_Id"
             AllowPaging="true"
             PageSize="5"
             OnPageIndexChanging="gvs_PageIndexChanging"
             OnSelectedIndexChanged="gvs_SelectedIndexChanged"
             AutoGenerateColumns="false"
             Width="500" runat="server">
             <HeaderStyle BackColor="#9a9a9a" ForeColor="White" Font-Bold="true" Height="30" />
             <AlternatingRowStyle BackColor="cyan" />
             <RowStyle BackColor="SteelBlue" />
             <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="First"
                 LastPageText="Last" NextPageText="Next" PreviousPageText="Prev"
                 Position="TopAndBottom" />
             <PagerStyle HorizontalAlign="Right" />
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:LinkButton ID="lbtnSelect" runat="server"
                             CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Street">
                     <ItemTemplate>
                         <!-- display the street-->
                         <asp:Label ID="lblstreet" Text='<%#Eval("Loc_Street")%>'
                             runat="server" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="District">
                     <ItemTemplate>
                         <!-- display the district -->
                         <asp:Label ID="lblCatName" Text='<%#Eval("Loc_Name")%>'
                             runat="server" />
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
         </asp:GridView>

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
