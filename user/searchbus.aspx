<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchbus.aspx.cs" Inherits="WebApplication1.user.searchbus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Bus - Bus Ticket Booking</title>
    <style>
        /* Body & Global Styles */
        body { 
            font-family:'Segoe UI', Tahoma, Geneva, Verdana,sans-serif; 
            margin:0; padding:0; 
            background:#f0f2f5; 
            color:#333; 
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), 
                        url('img/searchback.jpg') no-repeat center center; 
            background-size:cover;
            height:650px; 
            display:flex; 
            flex-direction:column; 
            justify-content:center; 
            align-items:center; 
            text-align:center; 
            color:#fff;
            padding:0 20px;
        }
        .hero h1 { font-size:3rem; font-weight:700; margin:0; text-shadow:2px 2px 8px rgba(0,0,0,0.7); }
        .hero p { font-size:1.3rem; margin-top:15px; text-shadow:1px 1px 5px rgba(0,0,0,0.7); }

        /* Search Box - Vertical Layout */
        .search-box {
            background:#fff; 
            width:90%; 
            max-width:500px; 
            margin:50px auto 40px auto; 
            padding:30px 25px; 
            border-radius:15px; 
            box-shadow:0 15px 30px rgba(0,0,0,0.15); 
            display:flex; 
            flex-direction:column; 
            gap:15px;
        }
        .search-box input[type=text], .search-box input[type=date] { 
            width:95%; 
            padding:12px; 
            border-radius:10px; 
            border:1px solid #ddd; 
            font-size:1rem; 
            transition:0.3s; 
        }
        .search-box input[type=text]:focus, .search-box input[type=date]:focus {
            border-color:#ff7e5f;
            box-shadow:0 0 8px rgba(255,126,95,0.4);
            outline:none;
        }
        .search-box .aspNet-Button { 
            width:100%; 
            padding:14px; 
            border:none; 
            border-radius:25px; 
            font-weight:bold; 
            background:linear-gradient(90deg, #ff7e5f, #feb47b); 
            color:#fff; 
            cursor:pointer; 
            transition:all 0.3s; 
        }
        .search-box .aspNet-Button:hover { 
            background:linear-gradient(90deg, #feb47b, #ff7e5f); 
            transform:scale(1.05); 
        }
        .lbl-message { 
            text-align:center; 
            color:red; 
            font-weight:bold; 
            margin-top:5px; 
        }

        /* Bus List - Vertical Cards */
        .bus-results { width:90%; max-width:700px; margin:50px auto; }
        .bus-card { 
            background:#fff; 
            border-radius:15px; 
            padding:20px; 
            box-shadow:0 8px 20px rgba(0,0,0,0.1); 
            margin-bottom:20px; 
            transition:transform 0.3s, box-shadow 0.3s; 
        }
        .bus-card:hover { 
            transform:translateY(-5px); 
            box-shadow:0 12px 25px rgba(0,0,0,0.15); 
        }
        .bus-card h4 { margin:0 0 10px 0; color:#ff7e5f; font-size:1.3rem; }
        .bus-card p { margin:3px 0; color:#555; font-size:0.95rem; }
        .highlight { font-weight:bold; color:#2575fc; }

        /* Responsive */
        @media (max-width:768px) { 
            .hero h1 { font-size:2.5rem; } 
            .hero p { font-size:1.1rem; } 
        }
    </style>
</head>
<body>
    <form id="form10" runat="server">
        <!-- Hero Section -->
        <div class="hero">
            <h1>Search Your Bus</h1>
            <p>Find your perfect bus and book tickets instantly!</p>
        </div>

        <!-- Search Section -->
        <div class="search-box">
            <asp:TextBox ID="txtsource" runat="server" placeholder="Enter Source"></asp:TextBox>
            <asp:TextBox ID="txtDestination" runat="server" placeholder="Enter Destination"></asp:TextBox>
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search Bus" OnClick="btnSearch_Click" CssClass="aspNet-Button" />
            <asp:Label ID="lblmsg" runat="server" CssClass="lbl-message"></asp:Label>
        </div>

        <!-- Bus Results -->
        <div class="bus-results">
            <h3 style="color:#ff7e5f; text-align:center; margin-bottom:20px;">Available Buses</h3>
            <asp:Repeater ID="rptAllBuses" runat="server">
                <ItemTemplate>
                    <div class="bus-card">
                        <h4><%# Eval("BusName") %> (<%# Eval("BusType") %>)</h4>
                        <p>Route: <%# Eval("Source") %> → <%# Eval("Destination") %></p>
                        <p>Date: <span class="highlight"><%# Eval("TravelDate", "{0:dd-MM-yyyy}") %></span></p>
                        <p>Time: <span class="highlight"><%# Eval("DepartureTime") %> - <%# Eval("ArrivalTime") %></span></p>
                        <p>Seats Available: <span class="highlight"><%# Eval("SeatsAvailable") %></span></p>
                        <p>Fare: ₹ <span class="highlight"><%# Eval("Fare") %></span></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>