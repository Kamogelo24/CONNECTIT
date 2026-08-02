<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="ConnectIT.Report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .report-container {
            width: 90%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="report-container">
            <h1>Applications Report</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Application_ID" HeaderText="Application ID" />
                    <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" />
                    <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                    <asp:BoundField DataField="Application_Date" HeaderText="Application Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="AcceptReject_Application" HeaderText="Status" />
                </Columns>
            </asp:GridView>
            <asp:HyperLink ID="btnBack" runat="server" NavigateUrl="~/Default.aspx" CssClass="btn-back">Back to Home</asp:HyperLink>
        </div>
    </form>
</body>
</html>
