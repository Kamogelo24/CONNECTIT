<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recruiter_create.aspx.cs" Inherits="ConnectIT.Recruiter_create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Recruiter</title>
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
            width: 600px;
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

        .panel-container label {
            font-size: 16px;
            display: block;
            margin: 10px 0;
            color: #fff;
            text-align: left;
        }

        .panel-container input[type="text"] {
            padding: 10px;
            font-size: 16px;
            color: #fff;
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            width: calc(100% - 20px);
            margin-bottom: 10px;
        }

        .panel-container .btn {
            padding: 10px;
            font-size: 16px;
            background: linear-gradient(60deg,transparent,#45f3ff,#45f3ff);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .panel-container .btn:hover {
            background-color: linear-gradient(90deg,#45f3ff,#d9138a);
        }

        .panel-container .error {
            color: red;
            font-size: smaller;
            font-style: italic;
        }

        .panel-container .back-link {
            display: block;
            margin-top: 20px;
            color: #8f8f8f;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .panel-container .back-link:hover {
            color: #45f3ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel-container">
            <h2>Create Recruiter</h2>
            <asp:Label ID="Label1" runat="server" Text="First Name:" AssociatedControlID="TextBox1"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
            
            <asp:Label ID="Label2" runat="server" Text="Last Name:" AssociatedControlID="TextBox2"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
            
            <asp:Label ID="Label3" runat="server" Text="Contact Number:" AssociatedControlID="TextBox3"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExValidatorPhone" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid Phone Number" CssClass="error" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
            
            <asp:Label ID="Label4" runat="server" Text="Email:" AssociatedControlID="TextBox4"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExValidatorEmail" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid Email Format" CssClass="error" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"></asp:RegularExpressionValidator>
            
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn" OnClick="Button1_Click" />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recruiters.aspx" CssClass="back-link">Back</asp:HyperLink>
        </div>
    </form>
</body>
</html>
