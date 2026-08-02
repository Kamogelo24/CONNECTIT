<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_or_Recruit.aspx.cs" Inherits="ConnectIT.Post_or_Recruit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post or Recruit</title>
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

        .panel-container {
            width: 500px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            text-align: center;
        }

        .panel-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #45f3ff;
        }

        .panel-container .btn {
            padding: 15px 30px;
            font-size: 18px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
            transition: background-color 0.3s ease;
        }

        .panel-container .btn-recruit {
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
        }

        .panel-container .btn-recruit:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }

        .panel-container .btn-post {
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
        }

        .panel-container .btn-post:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel-container">
            <h2>Select Action</h2>
            <asp:Button ID="Button1" runat="server" Text="Recruit" CssClass="btn btn-recruit" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Post" CssClass="btn btn-post" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
