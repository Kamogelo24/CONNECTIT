<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuControl.ascx.cs" Inherits="ConnectIT.MenuControl" %>

<div class="menu-container">
    <ul class="menu">
        <li><asp:HyperLink ID="HyperLinkHome" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLinkPostOrRecruit" runat="server" NavigateUrl="~/Post_or_Recruit.aspx">Post or Recruit</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLinkRecruiterDetails" runat="server" NavigateUrl="~/RecruiterDetails.aspx">Recruiter Details</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLinkRecruiterSignIn" runat="server" NavigateUrl="~/RecruiterSignIn.aspx">Recruiter Sign In</asp:HyperLink></li>
    </ul>
</div>

<style>
    .menu-container {
        background: #333;
        padding: 10px;
    }

    .menu {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
    }

    .menu li {
        margin: 0 15px;
    }

    .menu a {
        color: #fff;
        text-decoration: none;
        font-size: 16px;
    }

    .menu a:hover {
        text-decoration: underline;
    }
</style>
