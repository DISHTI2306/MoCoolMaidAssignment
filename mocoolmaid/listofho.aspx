<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="listofho.aspx.cs" Inherits="mocoolmaid.listofho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style type="text/css">
        .floater {
            width: 95%;
            float: left;
            padding: 5px;
            padding-left: 275px;
            margin: 5px;
        }

        h10 {
            font-family:'Gill Sans MT';
            font-size: 20px;
        }

        h11 {
            align-content: center;
            font-family:'Lucida Calligraphy';
            font-weight: bold;
            font-size: 40px;
            color:darkblue;
            padding-left: 550px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    
         <br/>
    <br/>

    <h11>List of HouseOwner: </h11>

    <div class="floater">
        <asp:GridView
            ID="GrdView1"
            AllowPaging="true"
            PageSize="3"
            ForeColor="Black"
            BackColor="Cornsilk"
            BorderColor="Navy"
            AlternatingRowStyle-BackColor="FloralWhite"
            AutoGenerateColumns="false"
            onPageIndexChanging="GrdView1_PageIndexChanging"
            runat="server">
            <Columns>

                <asp:ImageField DataImageUrlField="HO_imageurl" 
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="Profile Pic: " 
                    SortExpression="Poster" ControlStyle-Width="150"/>

                <asp:BoundField HeaderText="Last name: " DataField="HO_lastname" />

                <asp:BoundField HeaderText="First name: " DataField="HO_firstname" />

                <asp:HyperLinkField HeaderText="Email: " 
                    DataTextField="HO_email" DataNavigateUrlFields="HO_Id"
                    DataNavigateUrlFormatString="managejob.aspx?id={0}"/>

                <asp:TemplateField HeaderText="Phone Number: ">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HO_phonenumber") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HO_gender") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="DateBirth:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HO_DOB") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="Status: " DataField="HO_status" />

            </Columns>
        </asp:GridView>
    </div>


</asp:Content>
