<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User details.aspx.cs" Inherits="ConnectIT.User_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details Panel</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to the CSS file -->
    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 79%;
            max-width: 1000px;
            padding: 40px;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            left: 0px;
            top: 0px;
        }
        .inputBox span {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .back-link {
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h2>User Details Panel</h2>
            <div class="inputBox">
                <span>First Names:</span>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="inputBox">
                <span>Surname:</span>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="inputBox">
                <span>Contact Number:</span>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="inputBox">
                <span>Email:</span>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid Email" Font-Italic="True" Font-Size="Smaller" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="inputBox">
                <span>Open jobs:</span>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="inputBox">
                <span>CV upload:</span>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>
            <div class="inputBox">
                <span>LinkedIn username:</span>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Save" CssClass="btn" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Next" CssClass="btn" />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/users.aspx" CssClass="back-link">Back</asp:HyperLink>
        </div>
    </form>
</body>
</html>
