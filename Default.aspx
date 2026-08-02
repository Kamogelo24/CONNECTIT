<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ConnectIT.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>HOME PAGE</h2>
            <p>Welcome to ConnectIT panel.</p>
            <asp:Button ID="Administrator" runat="server" Text="Administrator" CssClass="btn" OnClick="Administrator_Click" />
            <asp:Button ID="Button2" runat="server" Text="Applicant" CssClass="btn" OnClick="Button2_Click1" />
            <asp:Button ID="Button4" runat="server" Text="Recruiter" CssClass="btn" OnClick="Button4_Click" />
            <asp:Button ID="Button3" runat="server" Text="TnC's" CssClass="btn" />
        </div>
    </form>
</body>
</html>
