<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="updatehoprofile.aspx.cs" 
    Inherits="mocoolmaid.updatehoprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>
        #container {
            width: 50%;
            margin: 0 auto;
            background-color:steelblue;
            color: white;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: Cooper;
        }

        .hii {
            padding-left: 250px;
        }

        legend {
            color: hotpink;
            padding: 20px;
            padding-left: 125px;
            text-align: left;
            font-size: 150%;
            font-family: 'Lucida Handwriting';
        }

        .h {
            padding-left: 275px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />

    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

    <div id="container">
        <div class="form-horizontal">
            <fieldset>
                <legend>Houseowner Profile Details</legend>
                <div class="hii">
                    <asp:Repeater
                        ID="rptimg" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="ImageButton1" runat="server" Width="193px" Height="195px"
                                ImageUrl='<%# Eval("HO_imageurl", "~../img/{0}")%>' />

                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <br/>
                <br/>

                <div class="form-group row justify-content-center">
                    <asp:Label ID="lblFname" runat="server" Text="First Name:"
                        AssociatedControlID="txtFname"></asp:Label>
                    <div class="col-md-7">
                        <asp:TextBox ID="txtFname" runat="server"
                            CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqFname"
                            Display="Dynamic"
                            ControlToValidate="txtFname" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <br/>

                <div class="form-group row justify-content-center">
                <asp:Label ID="lblLname" runat="server" Text="Last Name : "
                    AssociatedControlID="txtLname"></asp:Label>
                <div class="col-md-7">
                    <asp:TextBox ID="txtLname" runat="server"
                        CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqLname"
                        ControlToValidate="txtLname" 
                        Display="Dynamic"
                        runat="server"
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                </div>
                    </div>

                <br/>

                <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhophone"
                    >Phone Num : </asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="txthophone"
                        CssClass="form-control" />
                    <asp:CompareValidator ID="CompareValidator3"
                        ControlToValidate="txthophone"
                        Type="Integer"
                        Display="Dynamic"
                        Operator="DataTypeCheck"
                        ForeColor="Red"
                        runat="server"
                        ErrorMessage="Incorrect data type"></asp:CompareValidator>
                </div>
                    </div>

                <br/>

                <div class="form-group row justify-content-center">
                <asp:Label ID="lblEmail" runat="server" Text="Email Add : "
                    AssociatedControlID="txtEmail"></asp:Label>
                    <div class="col-md-7">
                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqEmail"
                    Display="Dynamic"
                    ControlToValidate="txtEmail" runat="server"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" 
                    ErrorMessage="Not Valid">
                </asp:RegularExpressionValidator>
                 </div>
                    </div>

                <div class="form-group row justify-content-center">
                <asp:Label ID="lblhkpassword" runat="server" Text="Password : "
                    AssociatedControlID="txthopassword"></asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="txthopassword"
                        TextMode="Password"
                        CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="reqPassword"
                        ControlToValidate="txthopassword" runat="server"
                        Display="Dynamic"
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                </div>
                </div>

            </fieldset>
            </div>

            <br />
            <fieldset>
                <div class="h">
                <div class="col-md-5">
                <asp:Button ID="btnSubmit" runat="server"
                    Text="Update Profile" OnClick="btnSubmit_Click"
                    CssClass="btn btn-outline-warning btn-block" />
                    </div>
                    </div>
            </fieldset>
        </div>

</asp:Content>
