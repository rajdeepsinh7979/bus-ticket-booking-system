<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="WebApplication1.user.UserLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login - Bus Ticket Booking</title>
    <style>
        /* Full page background with overlay */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            
            background-size: cover;
        }

        /* Overlay for contrast */
        .overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            z-index: 0;
        }

        /* Login card */
        .login-card {
            position: relative;
            z-index: 1;
            background: rgba(255,255,255,0.95);
            border-radius: 15px;
            width: 400px;
            padding: 50px 40px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            font-size: 28px;
            color: #ff7e5f;
            margin-bottom: 25px;
        }

        /* Input fields */
        .login-card input[type=text], 
        .login-card input[type=password], 
        .login-card .aspNet-TextBox {
            width: 100%;
            padding: 14px 15px;
            margin: 12px 0;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .login-card input:focus, .login-card .aspNet-TextBox:focus {
            border-color: #ff7e5f;
            box-shadow: 0 0 10px rgba(255,126,95,0.4);
            outline: none;
        }

        /* Login button */
        .login-card .btn {
            width: 100%;
            padding: 14px;
            margin-top: 20px;
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .login-card .btn:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
            transform: translateY(-2px);
        }

        /* Register link */
        .register-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #ff7e5f;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .register-link:hover {
            color: #feb47b;
        }

        /* Message label */
        #lblMessage {
            color: red;
            margin-bottom: 15px;
            font-weight: 500;
            display: block;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px);}
            100% { opacity: 1; transform: translateY(0);}
        }

        /* Responsive */
        @media screen and (max-width: 500px) {
            .login-card {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <form id="form1" runat="server">
        <div class="login-card">
            <h2>User Login</h2>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>

            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="aspNet-TextBox"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="aspNet-TextBox"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

            <a class="register-link" href="UserRegistration.aspx">New User? Register here</a>
        </div>
    </form>
</body>
</html>