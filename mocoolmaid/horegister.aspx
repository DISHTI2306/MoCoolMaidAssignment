<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master" 
    AutoEventWireup="true" CodeBehind="horegister.aspx.cs" 
    Inherits="mocoolmaid.horegister" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function validatePassword(source, args) {
            if (args.value.length >= 7 && args.value.length <= 12)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    </script>

    <style>
        h9{
            padding-left: 510px;
            font-size: 200%;
            color: black;
            font-weight: bold;
            font-family:Cooper;
       }

        .accordionHeader {
            font-size: 150%;
            color: darkblue;
            text-align:center;
            font-weight: bold;
            font-family: 'Sitka Display';
            margin-left: 450px;
            margin-right: 450px;
            padding-bottom: 20px;
        }

        .mom {
            padding-right: 73px;
        }

        .accordionContent, .accordionHeaderSelected {
            width: 60%;
            margin: 0 auto;
            background-color: mediumturquoise;
            color: Black;
            padding: 10px;
            text-align:left;
            font-size: 130%;
            font-family: Cooper;
        }

        #container {
            padding-left: 175px;
        }

        #containers {
            position:fixed; 
	        top:300px; 
	        left:0; 
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />

    <h9>Houseowner registration form: </h9>

    <br />
    <br />

    <ajaxToolkit:Accordion ID="MyAccordion" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent" FadeTransitions="false" FramesPerSecond="40" 
            TransitionDuration="250" AutoSize="None" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
       
    <Panes>

        <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
            <Header>Personal Information</Header>
            <Content>
       <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblholname"
                    CssClass="col-md-3 col-form-label">Last name</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txtholname"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="reqlastname"
                        ControlToValidate="txtholname"
                        Display="Dynamic"
                        Text="Last name is mandatory"
                        ForeColor="Red"
                        SetFocusOnError="true"
                        runat="server"
                        ErrorMessage="Last Name is mandatory!"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhofname"
                    CssClass="col-md-3 col-form-label">First name</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthofname"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="reqfirstname"
                        ControlToValidate="txthofname"
                        Display="Dynamic"
                        Text="First name is mandatory"
                        ForeColor="Red"
                        SetFocusOnError="true"
                        runat="server"
                        ErrorMessage="First Name is mandatory!"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhophone"
                    CssClass="col-md-3 col-form-label">Phone Number</asp:Label>
                <div class="col-md-4">
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

                    <asp:RequiredFieldValidator ID="reqphone"
                        ControlToValidate="txthophone"
                        Display="Dynamic"
                        ForeColor="Red"
                        runat="server"
                        ErrorMessage="Phone number is mandatory!"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-3 col-form-label">Mobile Number</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthomobile"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="reqmobile"
                        ControlToValidate="txthomobile"
                        Display="Dynamic"
                        ForeColor="Red"
                        runat="server"
                        ErrorMessage="Mobile number is mandatory!"></asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="CompareValidator2"
                        ControlToValidate="txthomobile"
                        Type="Integer"
                        Display="Dynamic"
                        Operator="DataTypeCheck"
                        ForeColor="Red"
                        runat="server"
                        ErrorMessage="Incorrect data type"></asp:CompareValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhoemail"
                    CssClass="col-md-3 col-form-label">Email</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthoemail"
                        CssClass="form-control" />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server"
                        ControlToValidate="txthoemail"
                        Display="Dynamic"
                        ForeColor="Red"
                        ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                        ErrorMessage="Wrong Format"></asp:RegularExpressionValidator>

                    <asp:RequiredFieldValidator ID="reqemail"
                        ControlToValidate="txthoemail"
                        Display="Dynamic"
                        ForeColor="Red"
                        runat="server"
                        ErrorMessage="Email is mandatory!"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhogender"
                    CssClass="col-md-3 col-form-label">Gender </asp:Label>
                <div class="col-md-4">
                    <div class="form-check-inline">
                        <asp:RadioButton runat="server" GroupName="sex"
                            ID="radM"
                            CssClass="form-check-input" />
                        <asp:Label runat="server"
                            CssClass="form-check-label">M</asp:Label>
                    </div>
                    <div class="form-check-inline">
                        <asp:RadioButton runat="server" GroupName="sex"
                            ID="radF"
                            CssClass="form-check-input" />
                        <asp:Label runat="server"
                            CssClass="form-check-label">F</asp:Label>
                    </div>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhodob" CssClass="col-md-3 col-form-label"
                    AssociatedControlID="txthodob"> 
                    Date Of Birth</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthodob"
                        TextMode="Date"
                        CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="reqhoDob" runat="server"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="DateBirth is mandatory" ControlToValidate="txthodob">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group row justify-content-center">
               <asp:Label ID="Label1" runat="server" Text="Location"
                AssociatedControlID="ddlLoc"
                   CssClass="col-md-3 col-form-label"></asp:Label>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlLoc" runat="server"  
                       CssClass ="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqloc" 
                            ControlToValidate="ddlLoc"
                            Display="Dynamic"
                            ForeColor="Red"
                            runat="server"
                            ErrorMessage="Location is mandatory"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhofile"
                    CssClass="col-md-3 col-form-label">Upload Picture</asp:Label>
                <div class="col-md-4">
                    <asp:FileUpload ID="FileUpload1" runat="server"
                        CssClass="form-control" />
                </div>
            </div>

            </Content>
        </ajaxToolkit:AccordionPane>

        <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
            <Header>Login Information</Header>
            <Content>
                <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhouname"
                    CssClass="col-md-3 col-form-label">Username</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox ID="txthouname" runat="server"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="reqhoUsername"
                        ControlToValidate="txthouname" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Username is mandatory"></asp:RequiredFieldValidator>
             
                    <asp:RegularExpressionValidator ID="reghoUsername"
                        ControlToValidate="txthouname"
                        Display="Dynamic"
                        ValidationExpression="^[a-zA-Z]{5,}$" runat="server"
                        ErrorMessage="Username must be minimum 5 characters">
                    </asp:RegularExpressionValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-3 col-form-label">Password</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthopassword"
                        TextMode="Password"
                        CssClass="form-control" />

                    <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" 
                        TargetControlID="txthopassword"
                            DisplayPosition="RightSide"
                            StrengthIndicatorType="Text"
                            PreferredPasswordLength="10"
                            PrefixText="Strength:"
                            HelpStatusLabelID="TextBox1_HelpLabel"
                            TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent"
                            StrengthStyles="TextIndicator_TextBox1_Strength1;TextIndicator_TextBox1_Strength2;TextIndicator_TextBox1_Strength3;TextIndicator_TextBox1_Strength4;TextIndicator_TextBox1_Strength5"
                            MinimumNumericCharacters="0"
                            MinimumSymbolCharacters="0"
                            RequiresUpperAndLowerCaseCharacters="false" />

                    <asp:CustomValidator ID="CustomValidator2"
                        runat="server"
                        ControlToValidate="txthopassword"
                        ForeColor="Yellow"
                        Display="Dynamic"
                        ClientValidationFunction="validatePassword"
                        ErrorMessage="Password should be 7 to 12 characters">
                    </asp:CustomValidator>

                    <asp:RequiredFieldValidator ID="reqpassword"
                        ControlToValidate="txthopassword" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-3 col-form-label"> Confirm Password</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthoconfirm"
                        TextMode="Password"
                        CssClass="form-control" />

                    <asp:CompareValidator ID="CompareValidator1"
                        runat="server"
                        ForeColor="Red"
                        ControlToValidate="txthoconfirm"
                        ControlToCompare="txthopassword"
                        Type="String"
                        Operator="Equal"
                        Display="Dynamic"
                        ErrorMessage="Password do not match!"></asp:CompareValidator>

                    <asp:RequiredFieldValidator ID="reqconfirm"
                        ControlToValidate="txthoconfirm" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>

                </div>
            </div>

        <br />

        <div id="container">
        <table>
                  <tr>  
            <td>Verification Code  
            </td>  
            <td>  
               <asp:Image ID="Image2" runat="server" Height="55px" ImageUrl="~/Captcha.aspx" Width="186px" />  
                <br />  
                <asp:Label runat="server" ID="lblCaptchaMessage"></asp:Label>  
          
            </td>  
        </tr>  
        <tr>  
            <td>Enter Verification Code  
            </td>  
            <td>  
                <asp:TextBox runat="server" ID="txtVerificationCode"></asp:TextBox>  
            </td>  
        </tr>  
        </table> 
            </div>

        <br />

        <div class="mom">
             <div class="form-group row justify-content-center">
            <div class="offset-md-1 col-md-3">
                <asp:Button runat="server" ID="btnregister"
                    Text="Register" OnClick="btnregister_Click"
                    CssClass="btn btn-block btn-outline-primary" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <div class="offset-md-1 col-md-3">
                <asp:Button runat="server" ID="linkreset" 
                    Text="Reset"  OnClick="linkreset_Click"
                    OnClientClick="return confirm('are you sure you want to clear the form?')"
                    CssClass="btn btn-block btn-outline-success" />
            </div>
        </div>

            </div>

        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

            </Content>
        </ajaxToolkit:AccordionPane>


    </Panes>

    </ajaxToolkit:Accordion>

     <div id="containers">
            <aside class="outer col-sm-2 offset-sm-1">
                        <div class="ads d-none d-xl-block">

                            <asp:AdRotator
                                ID="AdRotator1"
                                AdvertisementFile="~/App_Data/ad3.xml"
                                runat="server" />

                        </div>
                    </aside>
        </div>

</asp:Content>
