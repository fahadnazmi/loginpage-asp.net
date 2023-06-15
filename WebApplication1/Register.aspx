<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<appSettings>
    <add key="ValidationSettings:UnobtrusiveValidationMode" value="None" />
 </appSettings>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="styles2.css" rel="stylesheet"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'/>
</head>
<body>
             <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style13"></td>
                    <td class="auto-style9">
                        <strong><span class="auto-style11">Register New User</span></strong><br />
                    </td>
                    <td class="auto-style20">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29"><em>Full Name:</em></td>
                    <td class="auto-style9">
                        <asp:TextBox ID="Name" runat="server" Width="300px" autocomplete="off" placeholder="Full Name"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Name" ErrorMessage="Full Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29"><em>Email:</em></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="Email" runat="server" TextMode="Email" Width="300px" autocomplete="off" placeholder="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style21">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Email is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="You must enter valid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><em>Password:</em></td>
                    <td class="auto-style25">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="300px" placeholder="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style26">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29"><em>Confirm Password:</em></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="CnfPassword" runat="server" TextMode="Password" Width="300px" placeholder="Confirm Password"></asp:TextBox>
                    </td>
                    <td class="auto-style21">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CnfPassword" ErrorMessage="Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="CnfPassword" ErrorMessage="Both Passwords must be same." ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29"><em>Security Question:</em></td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="SecQues" runat="server" Width="345px">
                            <asp:ListItem Value="0" selected hidden>Choose Question</asp:ListItem>
                            <asp:ListItem Value="1">What city were you born in?</asp:ListItem>
                            <asp:ListItem Value="2">What is your oldest sibling’s middle name?</asp:ListItem>
                            <asp:ListItem Value="3">What was the first concert you attended?</asp:ListItem>
                            <asp:ListItem Value="4">What was the make and model of your first car?</asp:ListItem>
                            <asp:ListItem Value="5">In what city or town did your parents meet?</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style21">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="SecQues" ErrorMessage="Choosing Security Question is required" ForeColor="Red" InitialValue="Select Security Question"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style27"><em>Answer</em></td>
                    <td class="auto-style18">
                        <asp:TextBox ID="SecAns" runat="server" Width="300px" autocomplete="off" placeholder="Security Answer"></asp:TextBox>
                    </td>
                    <td class="auto-style22">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="SecAns" ErrorMessage="Security Answer is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <br />
                    </td>
                    <td class="auto-style6">
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="auto-style19" />
                        <input id="Reset1" type="reset" value="Reset" class="auto-style16" /></td>
                    <td class="auto-style21">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15"></td>
                    <td class="auto-style14">
                        <br />
                        Already have an account?&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                    </td>
                    <td class="auto-style23"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
