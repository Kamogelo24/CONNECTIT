<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminstrator_page.aspx.cs" Inherits="ConnectIT.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Panel ID="Panel1" runat="server" GroupingText="Administrator page" Height="367px" Width="416px">
            <br />
            Applicants details:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Height="31px" Text="Delete" Width="124px" />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
