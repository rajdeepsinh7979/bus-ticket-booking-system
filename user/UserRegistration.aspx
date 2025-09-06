<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="WebApplication1.user.UserRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration - Bus Ticket Booking</title>
    <style>
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

        .overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 140%;
            background: rgba(0,0,0,0.6);
            z-index: 0;
        }

        .register-card {
            position: relative;
            margin-top:250px;
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

        .input-field, .dropdown-field, textarea {
            width: 100%;
            padding: 14px 15px;
            margin: 10px 0;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .input-field:focus, .dropdown-field:focus, textarea:focus {
            border-color: #ff7e5f;
            box-shadow: 0 0 10px rgba(255,126,95,0.4);
            outline: none;
        }

        .btn {
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

        .btn:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
            transform: translateY(-2px);
        }

        .message-label {
            display: block;
            margin-bottom: 15px;
            font-weight: 500;
            color: red;
            text-align: center;
        }

        .login-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #ff7e5f;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .login-link:hover {
            color: #feb47b;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 500px) {
            .register-card {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <form id="form1" runat="server">
        <div class="register-card">
            <h2>User Registration</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field" placeholder="Full Name"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" placeholder="Phone"></asp:TextBox>

            <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-field">
                <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>

            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="input-field" placeholder="Address"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />

            <span>Already have an account? <a class="login-link" href="UserLogin.aspx">Login here</a></span>
        </div>
    </form>
</body>
</html>