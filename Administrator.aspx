<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="ConnectIT.Administrator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator Authentication</title>
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
            width: 600px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            text-align: center;
        }

        .box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #45f3ff;
            text-align: center;
        }

        .box .btn {
            width: 150px;
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-bottom: 20px;
        }

        .box .btn:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }

        .box label {
            color: white;
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
        }

        .box input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .box .links {
            color: #fff;
        }

        .box .links a {
            color: #8f8f8f;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .box .links a:hover {
            color: #45f3ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Administrator Authentication</h2>
            <asp:Label ID="Label1" runat="server" Text="Administrator username:"></asp:Label>
            <asp:TextBox ID="txtadmini" runat="server" CssClass="input"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Authenticate" CssClass="btn" OnClick="Button1_Click" />
            <div class="links">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Back</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
