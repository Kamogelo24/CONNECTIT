<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_Job.aspx.cs" Inherits="ConnectIT.Post_Job" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Job</title>
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
            color: white;
        }

        .post-job-box {
            width: 500px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            text-align: center;
        }

        .post-job-box h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #45f3ff;
        }

        .post-job-box label {
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
            color: #fff;
            text-align: left;
        }

        .post-job-box input[type="text"] {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
            width: 100%;
        }

        .post-job-box .btn {
            padding: 10px;
            font-size: 16px;
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .post-job-box .btn:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="post-job-box">
            <h2>Post Job</h2>
            <asp:Label ID="Label1" runat="server" Text="Job Title:" AssociatedControlID="TextBox1"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Job Description:" AssociatedControlID="TextBox2"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Post" CssClass="btn" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
