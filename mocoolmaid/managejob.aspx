<%@ Page Title="" Language="C#" MasterPageFile="~/mocoolmaid.Master"
    AutoEventWireup="true" CodeBehind="managejob.aspx.cs" Inherits="mocoolmaid.managejob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .darshi {
            width: 70%;
            margin: 0 auto;
            background-color: lightblue;
            color: Navy;
            padding: 10px;
            text-align: left;
            font-size: 130%;
            font-family: Cooper;
        }

        h7 {
            padding-left: 650px;
            font-size: 200%;
            color: deeppink;
            font-weight: bold;
            font-family: 'Lucida Calligraphy';
        }

        .man {
            padding-left: 440px;
        }

        .wm {
            padding-right: 150px;
        }
    </style>


    <script type="text/javascript">
        function validateDate() {
            var Date_posted = $("txtdatep").val();
            var Deadline = $("txtdeadline").val();
            if (Date_posted != '' && Deadline != '') {
                if (Date.parse(Date_posted) > Date.parse(Deadline)) {
                    $("txtdeadline").val('');
                    alert("Date registered should not be greater than deadline date");
                }
            }
            return false;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <br />
    <br />

    <h7>Manage Job</h7>

    <div class="darshi">
        <div class="form-horizontal">

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select
a Category</asp:Label>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlcat" runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select
a Location</asp:Label>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlloc" runat="server"
                        CssClass="form-control" >
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-2 col-form-label"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtJobId" Visible="false"
                        CssClass="form-control" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lbljobtitle"
                    CssClass="col-md-2 col-form-label">Job
title </asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtjobtitle"
                        CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvjobtitle" runat="server" Text="*"
                        ControlToValidate="txtjobtitle" ForeColor="Red" ValidationGroup="vgAdd" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lbldesc"
                    CssClass="col-md-2 col-form-label">Description</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtdesc" TextMode="Multiline"
                        CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvdesc" runat="server" Text="*"
                        ControlToValidate="txtdesc" ForeColor="Red" ValidationGroup="vgAdd" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lblsalary"
                    CssClass="col-md-2 col-form-label">Salary</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtsalary"
                        CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvsalary" runat="server" Text="*"
                        ControlToValidate="txtsalary" ForeColor="Red" ValidationGroup="vgAdd" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lbldatep"
                    CssClass="col-md-2 col-form-label">Date Posted </asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtdatep" runat="server"
                        CssClass="form-control" />
                    <asp:CustomValidator ID="CustomValidator2"
                        runat="server"
                        ControlToValidate="txtdatep"
                        ForeColor="Yellow"
                        Display="Dynamic"
                        ClientValidationFunction="validatedate"
                        ErrorMessage="Date should be less than deadline date">
                    </asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="rfvdatep" runat="server" Text="*"
                        ControlToValidate="txtdatep" ForeColor="Red" ValidationGroup="vgAdd" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="lbldeadline"
                    CssClass="col-md-2 col-form-label">Deadline Date </asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtdeadline" runat="server"
                        CssClass="form-control" />
                    <asp:CompareValidator ID="CompareValidator1"
                        runat="server"
                        ForeColor="Red"
                        ControlToValidate="txtdeadline"
                        ControlToCompare="txtdatep"
                        Type="String"
                        Operator="GreaterThan"
                        Display="Dynamic"
                        ErrorMessage="Date is not greater than date registered">
                    </asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvdeadline" runat="server" Text="*"
                        ControlToValidate="txtdeadline" ForeColor="Red" ValidationGroup="vgAdd" />
                </div>
            </div>

            <div class="form-group row justify-content-center">
                <asp:Label runat="server" ID="chkstat"
                    CssClass="col-md-2 col-form-label">Status</asp:Label>
                <div class="col-md-8">
                    <div class="form-check-inline">
                        <asp:CheckBox runat="server" ID="chkstatus"
                            Text="vacant"
                            CssClass="form-check-input" />
                    </div>
                </div>
            </div>

            <div class="wm">
                <div class="form-group row justify-content-center">
                    <div class="offset-md-2 col-md-4">
                        <asp:Button runat="server" ID="btnPostjob"
                            OnClick="btnPostjob_Click"
                            Text="Post Job" ValidationGroup="vgAdd"
                            CssClass="btn btn-block btn-outline-primary" />
                        <asp:Button runat="server" ID="btnupdate"
                            OnClick="btnupdate_Click"
                            Text="Update Job" ValidationGroup="vgAdd"
                            Visible="false" CssClass="btn btn-block btn-outline-primary" />
                        <asp:Button runat="server" ID="btndelete"
                            OnClick="btndelete_Click"
                            Text="Delete Job" ValidationGroup="vgAdd"
                            OnClientClick="return confirm('Are you are you wanna delete?')"
                            Visible="false" CssClass="btn btn-block btn-outline-primary" />
                        <asp:Button runat="server" ID="btncancel" Text="Cancel"
                            OnClick="btncancel_Click" ValidationGroup="vgAdd"
                            Visible="false" CssClass="btn btn-block btn-outline-primary" />
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <hr />

    <div class="man">
        <asp:GridView ID="gvs" DataKeyNames="Job_Id"
            AutoGenerateColumns="false"
            OnSelectedIndexChanged="gvs_SelectedIndexChanged"
            ClientIDMode="Static" Width="700" runat="server">
            <HeaderStyle BackColor="Navy" ForeColor="White" Font-Bold="true"
                Height="30" />
            <AlternatingRowStyle BackColor="lightblue" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnSelect" runat="server"
                            CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Title">
                    <ItemTemplate>
                        <!-- display the job title -->
                        <asp:Label ID="lbljobtitle" Text='<%#Eval("Title")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Job Description">
                    <ItemTemplate>
                        <!-- display the job title -->
                        <asp:Label ID="lbldesc" Text='<%#Eval("Description")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

    <br />

</asp:Content>
