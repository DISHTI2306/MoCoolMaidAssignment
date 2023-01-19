<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="listofhk.aspx.cs" Inherits="mocoolmaid.listofhk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 <style type="text/css">
        .floater {
            width: 90%;
            float: left;
            padding: 5px;
            padding-left: 190px;
            margin: 5px;
        }

        h10 {
            font-family:'Gill Sans MT';
            font-size: 20px;
        }

     h11 {
         align-content: center;
         font-family: 'Lucida Calligraphy';
         font-weight: bold;
         font-size: 40px;
         color: darkblue;
         padding-left: 500px;
     }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

       <br/>
    <br/>
    <br/>

    <h11>List of HouseKeeper: </h11>

    <div class="floater">
        
        <asp:GridView
            ID="GrdView1"
            AllowPaging="true"
            PageSize="3"
            ForeColor="#660033"
            BackColor="AliceBlue"
            AlternatingRowStyle-BackColor="White"
            BorderColor="Navy"
            AutoGenerateColumns="false"
            onPageIndexChanging="GrdView1_PageIndexChanging"
            runat="server">
            <Columns>

                <asp:ImageField DataImageUrlField="HK_imageurl" 
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="Profile Pic: " 
                    SortExpression="Poster" ControlStyle-Width="150"/>

                <asp:BoundField HeaderText="Last name: " DataField="HK_lastname" />

                <asp:BoundField HeaderText="First name: " DataField="HK_firstname" />

                <asp:HyperLinkField HeaderText="Email: " 
                    DataTextField="HK_email" DataNavigateUrlFields="HK_Id"
                    DataNavigateUrlFormatString="hkprofile.aspx?id={0}"/>

                <asp:BoundField HeaderText="Gender: " DataField="HK_gender" />

                <asp:TemplateField HeaderText="Phone Number: ">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HK_phonenumber") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>


                <asp:TemplateField HeaderText="Experience:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HK_experience") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HK_status") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

 

</asp:Content>
