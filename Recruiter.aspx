<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recruiter.aspx.cs" Inherits="ConnectIT.Recruiter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recruiter Panel</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to the CSS file -->
    <style type="text/css">
        .auto-style1 {
            position: relative;
            margin-bottom: 30px;
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Recruiter Panel</h2>
            <div class="auto-style1">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                <span>Search User_Name</span>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Search User_Name" CssClass="btn btn-search" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label5" runat="server">Applicant Information</asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view">
            </asp:GridView>
            <br />
            <asp:Label ID="Label4" runat="server">Applicants Applications</asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Applicant_ID" OnRowCommand="GridView2_RowCommand" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="Applicant_ID" HeaderText="Applicant ID" />
                    <asp:BoundField DataField="Job_ID" HeaderText="Job ID" />
                    <asp:BoundField DataField="Application_Date" HeaderText="Application Date" />
                    <asp:BoundField DataField="AcceptReject_Application" HeaderText="Status" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CssClass="btn btn-accept" />
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CssClass="btn btn-reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="267px" Width="780px"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="View Applicaton" />
            <br />
            <asp:Label ID="Label6" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Schedule the Interview Date"></asp:Label>
            <br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Location"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Set up an interview" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Post or Recruit.aspx" CssClass="back-link">Back</asp:HyperLink>
        </div>
    </form>
</body>
</html>
