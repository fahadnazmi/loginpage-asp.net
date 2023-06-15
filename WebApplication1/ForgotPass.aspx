<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="WebApplication1.ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body style="height: 366px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>Forgot Password?</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">Enter Email ID:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="email_forgot" runat="server" Width="300px" autocomplete="off"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="email_validator" runat="server" ControlToValidate="email_forgot" ErrorMessage="Email ID is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="forgot_button" runat="server" OnClick="forgot_button_Click" Text="Continue" />
                    <asp:Button ID="back" runat="server" CausesValidation="False" OnClick="back_Click" Text="Back" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
