<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="WebApplication1.user.PaymentPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),url('img/seatbooking.jpeg') no-repeat center center; /* full background image */
            background-size: cover;
        }

        /* Container with image left + form right */
        .container {
            display: flex;
            width: 850px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }

        /* Left image section */
        .image-section {
            flex: 1;
            background: url('img/payment.png') no-repeat center center;
            background-size: cover;
        }

        /* Right form section */
        .form-section {
            flex: 1;
            background: rgba(0,0,0,0.7); /* semi-transparent dark overlay */
            padding: 40px 35px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #fff; /* white text */
        }

        h2 {
            text-align: center;
            color: #fff; /* white heading */
            margin-bottom: 25px;
            font-size: 28px;
        }

        .label {
            display: block;
            font-weight: bold;
            margin: 12px 0 6px 0;
            font-size: 14px;
            color: #fff; /* white labels */
        }

        .input-field {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            box-sizing: border-box;
            background: rgba(255,255,255,0.1); /* slight transparent input */
            color: #fff; /* input text white */
        }
        .input-field::placeholder {
            color: rgba(255,255,255,0.7); /* placeholder white with transparency */
        }
        .input-field:focus {
            border-color: #ff7e5f;
            box-shadow: 0 0 8px rgba(255,126,95,0.5);
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: #ff7e5f;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 12px;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background: #e76a50;
            transform: translateY(-2px);
        }

        .error {
            color: #ffbaba; /* lighter red for errors */
            font-size: 13px;
            margin-bottom: 8px;
            display: block;
        }

        .message-label {
            display: block;
            margin-top: 12px;
            font-weight: 500;
            color: #ffbaba;
            text-align: center;
        }

        .ticket-details {
            font-size: 15px;
            color: #fff;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="container">
            <!-- Left Image -->
            <div class="image-section"></div>

            <!-- Right Form -->
            <div class="form-section">
                <h2>Payment</h2>

                <asp:Label ID="lblTicketDetails" runat="server" CssClass="ticket-details"></asp:Label>

                <asp:Label ID="Label2" runat="server" Text="Card Holder Name" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtCardName" runat="server" CssClass="input-field" placeholder="Enter name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardName" CssClass="error" ErrorMessage="Please enter holder name"></asp:RequiredFieldValidator>

                <asp:Label ID="Label3" runat="server" Text="Card Number" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtCardNumber" runat="server" TextMode="Number" CssClass="input-field" placeholder="Enter card number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCardNumber" CssClass="error" ErrorMessage="Please enter card number"></asp:RequiredFieldValidator>

                <asp:Label ID="Label4" runat="server" Text="Expiry (MM/YY)" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtExpiry" runat="server" CssClass="input-field" placeholder="MM/YY"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtExpiry" CssClass="error" ErrorMessage="Please enter expiry"></asp:RequiredFieldValidator>

                <asp:Label ID="Label5" runat="server" Text="CVV" CssClass="label"></asp:Label>
                <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" CssClass="input-field" placeholder="Enter CVV"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCVV" CssClass="error" ErrorMessage="Please enter CVV"></asp:RequiredFieldValidator>

                <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn" OnClick="btnPay_Click" />

                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>