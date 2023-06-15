<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="WebApplication1.ChangePass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link href="styles4.css" rel="stylesheet"/>
</head>
<body style="height: 379px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Change Password<br />
            <br />
            </strong>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3">Email:</td>
                    <td class="auto-style7">
                        <asp:Label ID="email_label" runat="server" CssClass="auto-style9"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Security Question:</td>
                    <td class="auto-style8">
                        <asp:Label ID="ques_label" runat="server" CssClass="auto-style9"></asp:Label>
                    </td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style5">Security Answer:</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="secans" runat="server" Width="300px" autocomplete="off"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="secans" CssClass="auto-style9" ErrorMessage="Security Answer is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">New Password:</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="newpw" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style11">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpw" CssClass="auto-style9" ErrorMessage="Enter New Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Confirm Password:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="cnfpw" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cnfpw" CssClass="auto-style9" ErrorMessage="Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpw" ControlToValidate="cnfpw" CssClass="auto-style9" ErrorMessage="Passwords do not match" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Button ID="cnf" runat="server" OnClick="cnf_Click" Text="Confirm" Width="100px" />
&nbsp;
                        <asp:Button ID="back" runat="server" CausesValidation="False" OnClick="back_Click" Text="Back" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
    <p>
&nbsp;</p>
</body>
</html>
