<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="WebApplication1.admin.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        /* Reset */
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }

        body {
            background: #f4f6f9;
            color: #333;
        }

        /* Header */
        .header {
            height: 60px;
            background: #007bff;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 25px;
            font-size: 20px;
            font-weight: 600;
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 1000;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 60px; bottom: 0; left: 0;
            width: 230px;
            background: #343a40;
            padding-top: 20px;
            overflow-y: auto;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #ddd;
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s ease;
        }
        .sidebar a:hover {
            background: #007bff;
            color: #fff;
            padding-left: 25px;
        }

        /* Content */
        .content {
            margin-left: 230px;
            padding: 80px 30px;
        }

        .content h2 {
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
            color: #222;
        }

        /* Cards Grid */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            text-align: center;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
        }

        .card h3 {
            font-size: 32px;
            margin-bottom: 8px;
            color: #007bff;
        }
        .card p {
            font-size: 16px;
            color: #555;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header -->
        <div class="header">
            <span>🚍 Admin Dashboard</span>
            <span>Bus Ticket Booking System</span>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="dashboard.aspx">📊 Dashboard</a>
            <a href="ManageBuses.aspx">🚌 Manage Buses</a>
            <a href="ManageRoutes.aspx">🛣 Manage Routes</a>
            <a href="ManageBookings.aspx">🎟 Manage Bookings</a>
            <a href="ManageUsers.aspx">👥 Manage Users</a>
            <a href="logout.aspx">🚪 Logout</a>
        </div>

        <!-- Content -->
        <div class="content">
            <h2>Welcome, Admin 👋</h2>

            <!-- Overview Cards -->
            <div class="cards">
                <div class="card">
                    <h3><asp:Label ID="lblUsers" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Users</p>
                </div>

                <div class="card">
                    <h3><asp:Label ID="lblBuses" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Buses</p>
                </div>

                <div class="card">
                    <h3><asp:Label ID="lblBookings" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Bookings</p>
                </div>

                <div class="card">
                    <h3>₹<asp:Label ID="lblRevenue" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Revenue</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>