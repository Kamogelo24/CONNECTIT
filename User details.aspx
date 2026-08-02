<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_details.aspx.cs" Inherits="ConnectIT.User_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Details</title>
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
            width: 800px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            color: white;
            text-align: center;
        }

        .box h2 {
            margin: 0 0 20px;
            padding: 0;
            color: #45f3ff;
        }

        .box .input, .box select, .box textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            margin-bottom: 20px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .box .btn {
            width: 150px;
            background: linear-gradient(60deg, transparent, #45f3ff, #45f3ff);
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
            background-color: linear-gradient(90deg, #45f3ff, #d9138a);
        }

        .box label {
            color: white;
            font-size: 16px;
            display: block;
            margin-bottom: 10px;
            text-align: left;
        }

        .dynamicTextBox {
            display: block;
            margin: 10px 0;
            color: white;
            background: transparent;
            border: none;
            border-bottom: 1px solid #fff;
            width: 100%;
            outline: none;
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
    <script type="text/javascript">
        var certCount = 1;

        function addCertification() {
            certCount++;
            var container = document.getElementById('certContainer');
            var newTextBox = document.createElement('input');
            newTextBox.type = 'text';
            newTextBox.name = 'textCert' + certCount;
            newTextBox.id = 'textCert' + certCount;
            newTextBox.className = 'dynamicTextBox';
            container.appendChild(newTextBox);
            container.appendChild(document.createElement('br'));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>User Details</h2>
            <asp:Label ID="Label1" runat="server" Text="First Names: " CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:Label ID="Label5" runat="server" Text="Surname:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:Label ID="Label3" runat="server" Text="Contact Number:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:Label ID="Label4" runat="server" Text="Email:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="input"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid Email" Font-Italic="True" Font-Size="Smaller" ForeColor="Red" ValidationExpression="\w+([-+.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required field" Font-Italic="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:Label ID="Label2" runat="server" Text="Select Job:" CssClass="label"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input"></asp:DropDownList>

            <asp:Label ID="Label13" runat="server" Text="Highest Qualification:" CssClass="label"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="input">
                <asp:ListItem>Matric</asp:ListItem>
                <asp:ListItem>Higher Certificate</asp:ListItem>
                <asp:ListItem>Diploma</asp:ListItem>
                <asp:ListItem>Advanced Diploma</asp:ListItem>
                <asp:ListItem>Bachelor&#39;s Degree</asp:ListItem>
                <asp:ListItem>Honours</asp:ListItem>
                <asp:ListItem>Masters</asp:ListItem>
                <asp:ListItem>PHD</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="Label14" runat="server" Text="Qualification:" CssClass="label"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" Width="330px" CssClass="input"></asp:TextBox>

            <asp:Label ID="Label15" runat="server" Text="Experience:" CssClass="label"></asp:Label>
            <textarea id="TextArea1" runat="server" class="input" name="S1"></textarea>

            <asp:Label ID="Label11" runat="server" Text="Additional Certifications:" CssClass="label"></asp:Label>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClientClick="addCertification(); return false;" CssClass="btn" />
            <div id="certContainer"></div>

            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit Applicant Details" CssClass="btn" />
            <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
