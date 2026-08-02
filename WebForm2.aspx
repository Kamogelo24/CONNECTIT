<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuExample.aspx.cs" Inherits="YourNamespace.MenuExample" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Example</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- ASP.NET Menu Control -->
            <asp:Menu ID="MainMenu" runat="server" Orientation="Horizontal" OnMenuItemClick="MainMenu_MenuItemClick">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem Text="Products" Value="Products">
                        <asp:MenuItem Text="Category 1" Value="Category1"></asp:MenuItem>
                        <asp:MenuItem Text="Category 2" Value="Category2"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Services" Value="Services">
                        <asp:MenuItem Text="Consulting" Value="Consulting"></asp:MenuItem>
                        <asp:MenuItem Text="Support" Value="Support"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Contact" Value="Contact"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
    </form>
</body>
</html>
