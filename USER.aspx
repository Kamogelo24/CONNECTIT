<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER.aspx.cs" Inherits="ConnectIT.USER" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Authentication</title>
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
            width: 500px;
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
            background: linear-gradient(60deg, transparent, #45f3ff, #45f3ff);
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
            background-color: linear-gradient(90deg, #45f3ff, #d9138a);
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

        .box a {
            color: #45f3ff;
            text-decoration: none;
            font-size: 16px;
        }

        .box a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>User Authentication</h2>
            <asp:Panel ID="Panel1" runat="server" GroupingText="User authentication">
                <asp:Label ID="Label1" runat="server" Text="Applicant username:" CssClass="label"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input-text"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Sign in" CssClass="btn" OnClick="Button1_Click" />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Create an Account" CssClass="btn" OnClick="Button2_Click1" />
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn">Back</asp:HyperLink>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
