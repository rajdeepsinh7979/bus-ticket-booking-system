<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="WebApplication1.user.MyBookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Bookings - Bus Tickets</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7fb;
            color: #333;
        }

        .hero {
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
                        url('img/busback.jpg') no-repeat center center;
            background-size: cover;
            height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #ff7e5f;
        }

        .hero h1 { font-size: 3rem; font-weight: 700; }
        .hero p { font-size: 1.2rem; margin-top: 10px; opacity: 0.9; }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: -100px auto 50px auto;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            color: #ff7e5f;
            font-weight: bold;
            margin-top:100px;
            margin-bottom: 30px;
        }

        /* Ticket Card */
        .booking-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 900px;
            height: 200px;
            padding: 0 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .booking-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.15);
        }

        /* Left content */
        .booking-info {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            flex: 1;
            height: 100%;
        }

        .booking-info h3 {
            margin: 0;
            font-size: 18px;
            color: #ff7e5f;
            font-weight: bold;
        }

        .booking-info p {
            margin: 0;
            font-size: 13px;
            color: #555;
        }

        .fare {
            font-weight: bold;
            color: #ff7e5f;
        }

        .status {
            font-weight: bold;
            color: green;
        }

        /* Right button */
        .booking-action {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .booking-action .btn {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        .booking-action .btn:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
            transform: scale(1.05);
        }

        .message-label {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
            display: block;
        }

        @media (max-width: 900px) {
            .booking-card {
                width: 100%;
                flex-direction: column;
                height: auto;
                padding: 10px 15px;
            }
            .booking-action {
                margin-top: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="hero">
        <div>
            <h1>My Bookings</h1>
            <p>All your bus tickets in one place</p>
        </div>
    </div>

    <div class="container">
        <h2 class="section-title">Your Tickets</h2>

        <form id="form1" runat="server">
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <asp:GridView ID="gvMyBookings" runat="server" AutoGenerateColumns="False"
                CssClass="gv" CellPadding="0" BorderStyle="None" GridLines="None"
                OnRowCommand="gvMyBookings_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="booking-card">
                                <div class="booking-info">
                                    <h3><%# Eval("BusName") %></h3>
                                    <p><b>From:</b> <%# Eval("Source") %> → <b>To:</b> <%# Eval("Destination") %></p>
                                    <p><b>Seat:</b> <%# Eval("SeatNumber") %></p>
                                    <p class="fare">Fare: ₹ <%# Eval("Fare") %></p>
                                    <p class="status">Status: <%# Eval("Status") %></p>
                                </div>
                                <div class="booking-action">
                                    <asp:Button ID="btnView" runat="server" Text="View / Print Ticket"
                                        CommandName="ViewTicket" CommandArgument='<%# Eval("BookingID") %>'
                                        CssClass="btn" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>