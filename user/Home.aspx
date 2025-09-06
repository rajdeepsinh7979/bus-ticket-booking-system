<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.user.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Bus Ticket Booking</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background: #f4f7fb;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                        url('img/homeback.jpg') no-repeat center center;
            background-size: cover;
            height: 100vh;
            display: flex;
            
            align-items: center;
            text-align: center;
            color: #fff;
            flex-direction: column;
            padding: 20px;
        }
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.4);
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        /* Menu Buttons */
        .menu {
            text-align: center;
            margin: 20px 0;
        }
        .menu .aspNet-Button {
            margin: 6px;
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }
        .menu .aspNet-Button:hover {
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
            transform: scale(1.05);
        }

        /* Container */
        .container {
            width: 90%;
            max-width: 1200px;
            margin: auto;
            margin-top: -60px;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(255,126,95,0.15); /* Orange theme shadow */
        }

        /* Section Headings */
        .section {
            margin-top: 40px;
        }
        .section h3 {
            color: #ff7e5f; /* Orange theme heading */
            margin-bottom: 15px;
            font-size: 1.8rem;
        }
        .section p {
            line-height: 1.7;
            color: #555;
        }

        /* Features Grid */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background: #fff4f0; /* subtle orange background */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(255,126,95,0.1); /* orange shadow */
            text-align: center;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card img {
            width: 100%;
            height: 200px; /* fixed height for all cards */
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 15px;
        }
        .card h4 {
            color: #ff7e5f;
            margin-bottom: 10px;
        }
        .card p {
            color: #666;
        }

        /* Contact Section */
        .contact {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .contact div {
            flex: 1;
            background: #fff4f0; /* subtle orange background */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(255,126,95,0.1);
            text-align: center;
        }
        .contact div h4 {
            color: #ff7e5f;
            margin-bottom: 8px;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin: 40px 0 20px 0;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Hero Section -->
        <div class="hero">
            <h1>Welcome to Bus Ticket Booking</h1>
            <p>Book your bus tickets anytime, anywhere with ease</p>

            <!-- Menu Buttons -->
            <div class="menu">
                <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" CssClass="aspNet-Button" />
                <asp:Button ID="btnSearchBus" runat="server" Text="Search Bus" OnClick="btnSearchBus_Click" CssClass="aspNet-Button" />
                <asp:Button ID="btnMyBookings" runat="server" Text="My Bookings" OnClick="btnMyBookings_Click" CssClass="aspNet-Button" />
                <asp:Button ID="btnProfile" runat="server" Text="Profile" OnClick="btnProfile_Click" CssClass="aspNet-Button" />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="aspNet-Button" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="aspNet-Button" />
            </div>
        </div>

        <!-- Main Content -->
        <div class="container">
            <!-- About Us Section -->
            <div class="section">
                <h3>About Us</h3>
                <p>
                    Welcome to our Bus Ticket Booking System! We provide a seamless platform for users to search, 
                    book, and manage bus tickets with ease. Whether you’re traveling for business, leisure, or 
                    daily commute – we make your journey comfortable and convenient.
                </p>
            </div>

            <!-- Why Choose Us Section -->
            <div class="section">
                <h3>Why Choose Us?</h3>
                <div class="features">
                    <div class="card">
                        <img src="img/easybooking.jpg" alt="Easy Booking" />
                        <h4>Easy Booking</h4>
                        <p>Book tickets in just a few clicks with our user-friendly interface.</p>
                    </div>
                    <div class="card">
                        <img src="img/securepayment.png" alt="Secure Payments" />
                        <h4>Secure Payments</h4>
                        <p>Multiple payment options with encrypted transactions for your safety.</p>
                    </div>
                    <div class="card">
                        <img src="img/support.jpg" alt="24/7 Support" />
                        <h4>24/7 Support</h4>
                        <p>Our team is available round the clock to assist you anytime.</p>
                    </div>
                </div>
            </div>

            <!-- Contact Us Section -->
            <div class="section">
                <h3>Contact Us</h3>
                <div class="contact">
                    <div>
                        <h4>Email</h4>
                        <p>raj@bustickets.com</p>
                    </div>
                    <div>
                        <h4>Phone</h4>
                        <p>(02825) 220077</p>
                    </div>
                    <div>
                        <h4>Address</h4>
                        <p>Office No. 56, Saffron Square, Mandavi Street, Jawahar Chowk, India.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Bus Ticket Booking System. All rights reserved.
        </div>
    </form>
</body>
</html>
