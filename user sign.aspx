<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_sign.aspx.cs" Inherits="ConnectIT.user_sign" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Sign</title>
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

        .box .update-panel {
            position: fixed;
            right: -300px;
            top: 0;
            width: 300px;
            height: 100%;
            background-color: white;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
            transition: right 0.3s ease;
            z-index: 1000;
            padding: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        #updatePanel:target {
            right: 0;
        }

        .box .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            text-decoration: none;
            font-size: 20px;
            color: black;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 999;
        }

        #updatePanel:target ~ .overlay {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>User Sign</h2>
            <asp:Panel ID="Panel1" runat="server" GroupingText="User details">
                <asp:Label ID="Label3" runat="server" Text="Here's your information"></asp:Label>
                <br />
                <asp:ListBox ID="ListBox1" runat="server" Height="132px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="608px"></asp:ListBox>
                <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp;<br />
            </asp:Panel>

            <div id="updatePanel" class="update-panel">
                <a href="#" class="close-btn">&times;</a>
                <h4>Update Applicant Information</h4>
                <asp:TextBox ID="TextBoxFName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                <asp:TextBox ID="TextBoxLName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                <asp:Button ID="ButtonSaveChanges" runat="server" Text="Save Changes" CssClass="btn" OnClick="ButtonSaveChanges_Click" />
            </div>

                <a href="#updatePanel" id="updateButton" class="btn">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="Button1" runat="server" Text="Confirm" CssClass="btn" OnClick="Button1_Click" />
            <br />
            <br />
            <br />

            <div class="overlay"></div>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/users.aspx" CssClass="btn">Status check</asp:HyperLink>
        </div>
    </form>
</body>
</html>
