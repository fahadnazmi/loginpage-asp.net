<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="WebApplication1.UserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Page</title>
    <link href="styles5.css" rel="stylesheet"/>
</head>
<body style="height: 341px">

    <form id="form1" runat="server">
        <asp:Label ID="Label_welcome" runat="server" Text="Welcome "></asp:Label>
        <p>
            <asp:Button ID="logout" runat="server" OnClick="logout_Click1" Text="Log Out" />
        </p>
    </form>

    </body>
</html>
