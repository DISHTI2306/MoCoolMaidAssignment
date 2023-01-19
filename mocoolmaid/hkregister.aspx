<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="hkregister.aspx.cs"
    Inherits="mocoolmaid.hkregister" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .accordionContent, .accordionHeaderSelected {
            width: 60%;
            margin: 0 auto;
            background-color: Navy;
            /*border: 3px solid deeppink;*/
            color: deeppink;
            padding: 10px;
            text-align: left;
            font-size: 100%;
            font-family: Cooper;
        }

        .accordionHeader {
            color: darkblue;
            padding: 15px;
            text-align: center;
            font-weight: bold;
            font-size: 150%;
            font-family: 'Papyrus', fantasy;
        }

        .comb {
            padding-left: 30px;
            margin-right: 25px;
        }

        h9 {
            color: deeppink;
            padding-left: 570px;
            text-align: center;
            font-weight: bold;
            font-size: 150%;
            font-family: Cooper;
        }

        .hh {
            padding-left: 226px;
        }

        .mygod {
            padding-right: 100px;
        }

        #containers {
            position:fixed; 
	        top:300px; 
	        left:0; 
        }

    </style>

    <script type="text/javascript">
        function validatePassword(source, args) {
            if (args.value.length >= 7 && args.value.length <= 12)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <asp:ValidationSummary ID="ValidationSummary1"
        HeaderText="There are errors in the following fields:"
        DisplayMode="BulletList"
        ShowMessageBox="true"
        ShowSummary="true"
        ForeColor="#000099"
        runat="server" />

    <br />

    <h9>Housekeeper registration form: </h9>

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
                    <asp:Label runat="server" ID="lblhklname"
                        CssClass="col-md-3 col-form-label">Last name</asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txthklname"
                            CssClass="form-control" />

                        <asp:RequiredFieldValidator ID="reqlastname"
                            ControlToValidate="txthklname"
                            Display="Dynamic"
                            Text="Last name is mandatory"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            runat="server"
                            ErrorMessage="Last Name is mandatory!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label runat="server" ID="lblhkfname"
                        CssClass="col-md-3 col-form-label">First name</asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txthkfname"
                            CssClass="form-control" />

                        <asp:RequiredFieldValidator ID="reqfirstname"
                            ControlToValidate="txthkfname"
                            Display="Dynamic"
                            Text="First name is mandatory"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            runat="server"
                            ErrorMessage="First Name is mandatory!"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label runat="server" ID="lblhkphone"
                        CssClass="col-md-3 col-form-label">Phone Number</asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txthkphone"
                            CssClass="form-control" />

                        <asp:CompareValidator ID="CompareValidator3"
                            ControlToValidate="txthkphone"
                            Type="Integer"
                            Display="Dynamic"
                            Operator="DataTypeCheck"
                            ForeColor="Red"
                            runat="server"
                            ErrorMessage="Incorrect data type"></asp:CompareValidator>

                        <asp:RequiredFieldValidator ID="reqphone"
                            ControlToValidate="txthkphone"
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
                        <asp:TextBox runat="server" ID="txthkmobile"
                            CssClass="form-control" />

                        <asp:RequiredFieldValidator ID="reqmobile"
                            ControlToValidate="txthkmobile"
                            Display="Dynamic"
                            ForeColor="Red"
                            runat="server"
                            ErrorMessage="Mobile number is mandatory!"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator2"
                            ControlToValidate="txthkmobile"
                            Type="Integer"
                            Display="Dynamic"
                            Operator="DataTypeCheck"
                            ForeColor="Red"
                            runat="server"
                            ErrorMessage="Incorrect data type"></asp:CompareValidator>

                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label runat="server" ID="lblhkemail"
                        CssClass="col-md-3 col-form-label">Email</asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txthkemail"
                            CssClass="form-control" />

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="txthkemail"
                            Display="Dynamic"
                            ForeColor="Red"
                            ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                            ErrorMessage="Wrong Format"></asp:RegularExpressionValidator>

                        <asp:RequiredFieldValidator ID="reqemail"
                            ControlToValidate="txthkemail"
                            Display="Dynamic"
                            ForeColor="Red"
                            runat="server"
                            ErrorMessage="Email is mandatory!"></asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label runat="server" ID="lblhkgender"
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
                    <asp:Label runat="server" ID="lblhkdob" CssClass="col-md-3 col-form-label"
                        AssociatedControlID="txthkdob"> 
                    Date Of Birth</asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txthkdob"
                            TextMode="Date"
                            CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="reqhkDob" runat="server"
                            Display="Dynamic"
                            ForeColor="Red"
                            ErrorMessage="DateBirth is mandatory" ControlToValidate="txthkdob">
                        </asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvDob"
                            runat="server"
                            Text="Out of range"
                            ForeColor="#ff3300"
                            Display="Dynamic"
                            ControlToValidate="txthkdob"
                            ErrorMessage="You should be 18 to 60 years old!"></asp:RangeValidator>

                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label ID="Label1" runat="server"
                        CssClass="col-md-3 col-form-label"
                        Text="Location"
                        AssociatedControlID="ddlLocation"></asp:Label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlLocation" class="comb" runat="server"
                            CssClass="form-control" />
                    </div>
                </div>

                <div class="form-group row justify-content-center">
                    <asp:Label runat="server" ID="lblhkfile"
                        CssClass="col-md-3 col-form-label">Upload Picture</asp:Label>
                    <div class="col-md-4">
                        <asp:FileUpload ID="FileUpload1" runat="server"
                            CssClass="form-control" />
                    </div>
                </div>
           </Content>
       </ajaxToolkit:AccordionPane>

       <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
        <Header>Professional Details</Header>
           <Content>
               <div class="form-group row justify-content-center">
                        <asp:Label runat="server" ID="lblhkskill"
                            CssClass="col-md-3 col-form-label">Skill</asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" TextMode="Multiline" ID="txthkskill"
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="reqskill"
                                ControlToValidate="txthkskill" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ErrorMessage="Skill is mandatory."></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group row justify-content-center">
                        <asp:Label runat="server" ID="lblhkcv"
                            CssClass="col-md-3 col-form-label">Upload cv</asp:Label>
                        <div class="col-md-4">
                            <asp:FileUpload ID="FileUpload2" runat="server"
                                CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center">
                        <asp:Label runat="server" ID="lblhkcertificate"
                            CssClass="col-md-3 col-form-label">Upload certificate</asp:Label>
                        <div class="col-md-4">
                            <asp:FileUpload ID="FileUpload3" runat="server"
                                CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group row justify-content-center">
                        <asp:Label runat="server"
                            CssClass="col-md-3 col-form-label">Work Experience
                <span id="msg" class="badge-danger" runat="server"></span>
                        </asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txthkwork"
                                TextMode="Multiline"
                                OnTextChanged="txthkwork_TextChanged"
                                CssClass="form-control" />

                            <asp:RequiredFieldValidator ID="reqwork"
                                ControlToValidate="txthkwork" runat="server"
                                Display="Dynamic"
                                ForeColor="Red"
                                ErrorMessage="Experience is mandatory."></asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="form-group row justify-content-center">
                        <asp:Label runat="server"
                            CssClass="col-md-3 col-form-label">Are you covid-vaccinated?</asp:Label>
                        <div class="col-md-4">
                            <div class="form-check-inline">
                                <asp:CheckBox runat="server" ID="chk1"
                                    OnCheckedChanged="chk1_CheckedChanged"
                                    CssClass="form-check-input" />
                                <asp:Label runat="server"
                                    CssClass="form-check-label">Yes</asp:Label>
                                <asp:Image ID="imgok" runat="server" />
                            </div>
                            <div class="form-check-inline">
                                <asp:CheckBox runat="server" ID="chk2"
                                    CssClass="form-check-input" />
                                <asp:Label runat="server"
                                    CssClass="form-check-label">No</asp:Label>
                            </div>
                        </div>
                    </div>
           </Content>
       </ajaxToolkit:AccordionPane>

       <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
           <Header>Login Details</Header>
           <Content>
            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblhkuname"
                    CssClass="col-md-3 col-form-label">Username</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox ID="txthkuname" runat="server"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="reqhkUsername"
                        ControlToValidate="txthkuname" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Username is mandatory"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="reghkUsername"
                        ControlToValidate="txthkuname"
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
                    <asp:TextBox runat="server" ID="txthkpassword"
                        TextMode="Password"
                        CssClass="form-control" />

                    <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" 
                        TargetControlID="txthkpassword"
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
                        ControlToValidate="txthkpassword"
                        ForeColor="Yellow"
                        Display="Dynamic"
                        ClientValidationFunction="validatePassword"
                        ErrorMessage="Password should be 7 to 12 characters">
                    </asp:CustomValidator>

                    <asp:RequiredFieldValidator ID="reqpassword"
                        ControlToValidate="txthkpassword" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-3 col-form-label"> Confirm Password</asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txthkconfirm"
                        TextMode="Password"
                        CssClass="form-control" />

                    <asp:CompareValidator ID="CompareValidator1"
                        runat="server"
                        ForeColor="Red"
                        ControlToValidate="txthkconfirm"
                        ControlToCompare="txthkpassword"
                        Type="String"
                        Operator="Equal"
                        Display="Dynamic"
                        ErrorMessage="Password do not match!"></asp:CompareValidator>

                    <asp:RequiredFieldValidator ID="reqconfirm"
                        ControlToValidate="txthkconfirm" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="form-group row justify-content-center">
               <asp:Label runat="server"
                    CssClass="col-md-3 col-form-label"> Date registered </asp:Label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txtdatereg"
                        CssClass="form-control" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="txtdatereg" runat="server"
                        Display="Dynamic"
                        ForeColor="red"
                        ErrorMessage="Registration date is required"></asp:RequiredFieldValidator>
            </div>
        </div>

          <div class="hh">

            <table>
                <tr>
                    <td>Verification Code : 
                    </td>
                    <td>
                        <asp:Image ID="Image2" runat="server" Height="55px" ImageUrl="~/Captcha.aspx" Width="186px" />
                        <br />
                        <asp:Label runat="server" ID="lblCaptchaMessage"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td>Enter Verifaction Code : 
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtVerificationCode"></asp:TextBox>
                    </td>
                </tr>
            </table>

        </div>

        <br />

       <div class="mygod">
        <div class="form-group row justify-content-center">
            <div class="offset-md-1 col-md-3">
                <asp:Button runat="server" ID="btnregister"
                    Text="Register" OnClick="btnregister_Click"
                    CssClass="btn btn-block btn-outline-success" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <div class="offset-md-1 col-md-3">
                <asp:Button runat="server" ID="linkreset"
                    Text="Reset" OnClick="linkreset_Click"
                    OnClientClick="return confirm('are you sure you want to clear the form?')"
                    CssClass="btn btn-block btn-outline-danger" />
            </div>
        </div>

        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>
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
