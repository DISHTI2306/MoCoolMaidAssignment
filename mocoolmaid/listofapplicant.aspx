<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="listofapplicant.aspx.cs" 
    Inherits="mocoolmaid.listofapplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .floater {

            width: fit-content;
            float: right;
            padding: 5px;
            margin-left: 75px;
            margin-right: 75px;
        }

        h10 {
            font-family:'Gill Sans MT';
            font-size: 20px;
        }

        h11 {
            align-content: center;
            font-family:'Lucida Calligraphy';
            font-weight: bold;
            color: black;
            font-size: 50px;
            padding-left: 475px;
            padding-bottom: 30px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

         <br/>
    <br/>

    <h11>List of Applicant: </h11>

    <div class="floater">
        
        <asp:GridView
            ID="GrdView1"
            AllowPaging="true"
            PageSize="3"
            ForeColor="Navy"
            BackColor="WhiteSmoke"
            AlternatingRowStyle-BackColor="White"
            BorderColor="#000066"
            AutoGenerateColumns="false"
            onPageIndexChanging="GrdView1_PageIndexChanging"
            runat="server">
            <Columns>

                <asp:ImageField DataImageUrlField="HK_imageurl" 
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="Profile Pic: " 
                    SortExpression="Poster" ControlStyle-Width="125"/>

                <asp:HyperLinkField HeaderText="Last name: " 
                    DataTextField="HK_lastname" DataNavigateUrlFields="HK_Id"
                    DataNavigateUrlFormatString="hkprofile.aspx?id={0}"/>

                <asp:BoundField HeaderText="First name: " DataField="HK_firstname" />

                 <asp:TemplateField HeaderText="Location: ">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("Loc_Name") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:HyperLinkField HeaderText="Email: " 
                    DataTextField="HK_email" DataNavigateUrlFields="HK_Id"
                    DataNavigateUrlFormatString="listofjoboffers.aspx?id={0}"/>

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

                 <asp:ImageField DataImageUrlField="HK_cv" 
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="CV: " 
                    SortExpression="CV" ControlStyle-Width="100"/>

                
                 <asp:ImageField DataImageUrlField="HK_certificate" 
                    DataImageUrlFormatString="~../img/{0}"
                    HeaderText="Certificate: " 
                    SortExpression="certificate" ControlStyle-Width="100"/>

                <asp:TemplateField HeaderText="Date registered:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HK_dateregistered") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status:">

                   <ItemTemplate>
                       <h10>
                           <i>
                               <%# Eval("HK_application_status") %>
                           </i>
                       </h10>
                   </ItemTemplate>

                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <br/>
    <br/>

</asp:Content>
