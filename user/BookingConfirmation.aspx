<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="WebApplication1.user.BookingConfirmation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Confirmation</title>
    <style>
        /* Body with background image and overlay */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('img/bookingbg.jpeg') no-repeat center center;
            background-size: cover;
        }

        /* Overlay for contrast */
        .overlay {
            background: rgba(0, 0, 0, 0.6);
            width: 100%;
            min-height: 100vh;
            padding: 50px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Ticket card */
        .ticket-card {
            width: 650px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            padding: 30px 40px;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #ff7e5f; /* warm gradient color */
            font-size: 32px;
            margin-bottom: 30px;
        }

        /* Message label */
        .message-label {
            display: block;
            margin-bottom: 15px;
            font-weight: 500;
            color: red;
            text-align: center;
        }

        /* Ticket details section */
        .ticket-details {
            border: 2px dashed #ff7e5f;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
            font-size: 16px;
            color: #333;
            line-height: 1.6;
            background: #fff8f5;
        }

        .ticket-details h3 {
            margin-top: 0;
            color: #ff7e5f;
            font-size: 20px;
        }

        /* Table inside ticket details */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table, th, td {
            border: 1px solid #ff7e5f;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            color: #333;
        }

        th {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #fff2ef;
        }

        /* Buttons */
        .btn {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px 5px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
            transform: translateY(-2px);
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="overlay">
        <form id="form1" runat="server">
            <div class="ticket-card">
                <h2>Booking Confirmation</h2>

                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

                <!-- Ticket details -->
                <div class="ticket-details">
                    <h3>Ticket Details</h3>
                    <asp:Label ID="lblTicketDetails" runat="server"></asp:Label>
                </div>

                <!-- Buttons -->
                <asp:Button ID="btnPrint" runat="server" Text="Print Ticket" CssClass="btn" OnClientClick="window.print();return false;" />
                <asp:Button ID="btnDownload" runat="server" Text="Download Ticket" CssClass="btn" OnClick="btnDownload_Click" />
                <asp:Button ID="btnHome" runat="server" Text="Back to Home" CssClass="btn" PostBackUrl="~/user/Home.aspx" OnClick="btnHome_Click" />
            </div>
        </form>
    </div>
</body>
</html>