<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="styles.css" rel="stylesheet"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
            <form id="form1" runat="server">
        <div class="auto-style11">
            <strong>Login</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style10">Email:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="email" runat="server" autocomplete="off" placeholder="Email" >
                    </asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="Please enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Password:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style5">
                    <asp:Button ID="login_button" runat="server" OnClick="login_button_Click" Text="Login" />
                    <asp:Button ID="forgotpass" runat="server" CssClass="auto-style6" Text="Forgot Password?" CausesValidation="False" OnClick="forgotpass_Click" />
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style5">
                    <br />
                    <div class="auto-style12">
                     Dont have an account? 
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                    </div>
                </td>
                <td class="auto-style9"></td>
            </tr>
        </table>
    </form>
</body>
</html>
