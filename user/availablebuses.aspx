<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availablebuses.aspx.cs" Inherits="WebApplication1.user.availablebuses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Buses</title>
    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background: #f4f7fb; margin: 0; padding: 0; 
        }

        /* Header Banner */
        .header { 
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: white; padding: 30px; text-align: center; 
        }
        .header h1 { margin: 0; font-size: 2.2rem; }

        /* Container */
        .container { 
            width: 95%; max-width: 1200px; 
            margin: 40px auto 40px auto; 
            background: #fff; padding: 30px; 
            border-radius: 15px; 
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        }

        /* Info & Error Labels */
        .info { font-weight: bold; color: #0078D7; display: block; margin-bottom: 15px; }
        .error { color: red; font-weight: bold; margin-top: 15px; display: block; }

        /* GridView Styling */
        .bus-grid {
            width: 100%; 
            border-collapse: separate;
            border-spacing: 0 20px; /* gap between rows */
        }
        .bus-grid th { 
            display: none; /* Hide default headers */
        }
        .bus-grid td {
            background: #fafafa;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            padding: 20px;
            vertical-align: middle;
        }

        /* Each row styled like a card */
        .bus-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }
        .bus-info { flex: 1; }
        .bus-info h3 { margin: 0; color: #333; font-size: 1.2rem; }
        .bus-info p { margin: 6px 0; color: #666; }

        .fare { font-size: 1.1rem; font-weight: bold; color: #0078D7; }

        /* Book Button */
        .btn { 
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            color: white; border: none; padding: 10px 20px;
            border-radius: 25px; cursor: pointer; font-weight: bold;
            transition: 0.3s; font-size: 0.95rem;
        }
        .btn:hover { 
            background: linear-gradient(90deg, #2575fc, #6a11cb); 
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <h1>Available Buses</h1>
            <p>Choose your preferred bus and book your seat instantly</p>
        </div>

        <!-- Container -->
        <div class="container">
            <!-- Info about search -->
            <asp:Label ID="lblInfo" runat="server" CssClass="info"></asp:Label>

            <!-- GridView as Card View -->
            <asp:GridView ID="gvBuses" runat="server" AutoGenerateColumns="False"
                CssClass="bus-grid" CellPadding="0" BorderStyle="None" GridLines="None"
                Width="100%" OnRowCommand="gvBuses_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="bus-card">
                                <div class="bus-info">
                                    <h3><%# Eval("BusName") %> - <%# Eval("BusType") %></h3>
                                    <p><b>Departure:</b> <%# Eval("DepartureTime") %></p>
                                    <p><b>Arrival:</b> <%# Eval("ArrivalTime") %></p>
                                    <p class="fare">Fare: ₹ <%# Eval("Fare") %></p>
                                </div>
                                <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="btn"
                                    CommandName="Book" CommandArgument='<%# Eval("ScheduleID") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Error / No result message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>
</body>
</html>
