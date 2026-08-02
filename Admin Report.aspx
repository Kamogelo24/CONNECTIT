<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Report.aspx.cs" Inherits="ConnectIT.Admin_Report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Report</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #0f0c29;
            background: -webkit-linear-gradient(to right, #24243e, #302b63, #0f0c29);
            background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        .box {
            position: relative;
            width: 1000px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            text-align: center;
            color: white;
        }

        .box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #45f3ff;
            text-align: center;
        }

        .box .btn {
            width: 200px;
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .box .btn:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }

        .box label {
            color: white;
            font-size: 16px;
            margin-top: 20px;
            display: inline-block;
        }

        .box input[type="text"] {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            margin: 20px 0;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
            width: 300px;
        }

        .box .links {
            color: #fff;
            margin-top: 20px;
        }

        .box .links a {
            color: #8f8f8f;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
            margin: 0 10px;
        }

        .box .links a:hover {
            color: #45f3ff;
        }

        .box .gridview-panel {
            margin: 20px 0;
            padding: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Admin Report</h2>
            <asp:Panel ID="Panel1" runat="server" GroupingText="Report">
                <asp:Label ID="Label2" runat="server" Text="Current date"></asp:Label>
                <br /><br />

                <asp:Panel ID="Panel2" runat="server" GroupingText="Applicants" CssClass="gridview-panel">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" DataKeyNames="Applicant_ID" OnRowDeleting="GridView1_RowDeleting"></asp:GridView>
                </asp:Panel>

                <asp:Panel ID="Panel4" runat="server" GroupingText="Applicants Jobs" CssClass="gridview-panel">
                    <asp:GridView ID="GridView3" runat="server" OnSelectedIndexChanged="GridView3_SelectedIndexChanged"></asp:GridView>
                </asp:Panel>

                <asp:Panel ID="Panel3" runat="server" GroupingText="Applicants Status" CssClass="gridview-panel">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="True" DataKeyNames="Applicant_ID" OnRowDeleting="GridView1_RowDeleting"></asp:GridView>
                </asp:Panel>

                <asp:Label ID="Label3" runat="server" Text="Enter Applicant ID to delete:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Delete Applicant" CssClass="btn" OnClick="Button2_Click" />
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </asp:Panel>

            <div class="links">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Administrator.aspx">Back</asp:HyperLink>
                <asp:Button ID="Button3" runat="server" Height="53px" Text="Summary Report" CssClass="btn" OnClick="Button3_Click" />
            </div>
        </div>
    </form>
</body>
</html>