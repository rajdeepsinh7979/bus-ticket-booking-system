<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="WebApplication1.user.BookTicket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Booking Page</title>
    <style>
        /* Body with better gradient */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
            url('img/seatbooking.jpeg') no-repeat center center;
background-size: cover;
        }

        /* Card style */
        .card {
            width: 600px;
            background: rgba(0,0,0,0.6);
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.25);
        }

        /* Header */
        h2 {
            color: #ff5e62; /* dark shade from gradient */
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            letter-spacing: 0.5px;
        }

        /* Info label */
        .info-label {
            display: block;
            margin-bottom: 20px;
            font-size: 16px;
            padding: 14px;
            border-left: 5px solid #ff5e62;
            border-right:5px solid #ff5e62;
            background: #fff0f0; /* soft background matching gradient */
            border-radius: 8px;
            color: #7a1f1f; /* darker text for readability */
        }

        /* Label */
        .label {
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 14px;
            color: #fff;
        }

        /* Input field */
        .input-field {
            width: 100%;
            padding: 14px 16px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-color: #ff5e62;
            box-shadow: 0 0 8px rgba(255,94,98,0.3);
            outline: none;
        }

        /* Seat hint */
        .seat-hint {
            font-size: 13px;
            color: #555;
            margin-bottom: 20px;
        }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 14px;
            background: #ff5e62;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background: #e14f53;
            transform: translateY(-2px);
        }

        /* Message label */
        .message-label {
            display: block;
            margin-top: 20px;
            font-weight: 500;
            text-align: center;
            color: #b71c1c;
        }

        /* Seat preview */
        .seat-preview {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
            justify-content: center;
        }
        .seat-box {
            width: 45px;
            height: 45px;
            border-radius: 8px;
            background: #ffe0e0; /* soft seat color */
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 15px;
            font-weight: bold;
            color: #ff5e62;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .seat-box:hover {
            background: #ff5e62;
            color: white;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>Book Your Ticket</h2>

            <!-- Bus Details -->
            <asp:Label ID="lblBusDetails" runat="server" CssClass="info-label"></asp:Label>

            <!-- Seat Preview -->
            <div class="seat-preview">
                <div class="seat-box">1</div>
                <div class="seat-box">2</div>
                <div class="seat-box">3</div>
                <div class="seat-box">4</div>
                <div class="seat-box">5</div>
                <div class="seat-box">6</div>
                <div class="seat-box">7</div>
            </div>

            <!-- Seat Number -->
            <asp:Label ID="lblSeat" runat="server" CssClass="label" Text="Enter Seat Number:"></asp:Label>
            <asp:TextBox ID="txtSeat" runat="server" TextMode="Number" CssClass="input-field"></asp:TextBox>
            <span class="seat-hint" style="color:white;">Example: Enter seat number (e.g., 12)</span>

            <!-- Confirm Booking Button -->
            <asp:Button ID="btnBookTicket" runat="server" Text="Confirm Booking" CssClass="btn" OnClick="btnBookTicket_Click" />

            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
        </div>
    </form>
</body>
</html>

