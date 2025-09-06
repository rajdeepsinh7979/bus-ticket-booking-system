<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBusDetails.aspx.cs" Inherits="WebApplication1.user.ViewBusDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bus Details Page</title>
    <style>
        /* Base body */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            min-height: 100vh;
        }

        /* Container card */
        .container {
            width: 95%;
            max-width: 1000px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #2575fc;
            margin-bottom: 30px;
            font-size: 32px;
        }

        /* GridView styling */
        .gv-style {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            font-size: 16px;
        }

        .gv-style th {
            background: #2575fc;
            color: #fff;
            padding: 12px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }

        .gv-style td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        .gv-style tr:nth-child(even) {
            background: #f9f9f9;
        }

        .gv-style tr:hover {
            background: rgba(37,117,252,0.1);
        }

        /* Message label */
        .message-label {
            display: block;
            margin-bottom: 15px;
            font-weight: 500;
            color: red;
            text-align: center;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>All Bus Details</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <asp:GridView ID="gvBuses" runat="server" AutoGenerateColumns="False" CssClass="gv-style" CellPadding="6" BorderStyle="None">
                <Columns>
                    <asp:TemplateField HeaderText="Bus Name">
                        <ItemTemplate>
                            <%# Eval("BusName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <%# Eval("BusType") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Source">
                        <ItemTemplate>
                            <%# Eval("Source") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destination">
                        <ItemTemplate>
                            <%# Eval("Destination") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Departure">
                        <ItemTemplate>
                            <%# Eval("DepartureTime") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Arrival">
                        <ItemTemplate>
                            <%# Eval("ArrivalTime") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fare (₹)">
                        <ItemTemplate>
                            <%# Eval("Fare") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
