<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBookings.aspx.cs" Inherits="WebApplication1.admin.ManageBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Bookings</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; }
        .container { width: 75%; margin: auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 2px 6px gray; }
        h2 { text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; }
        input, select { width: 100%; padding: 8px; }
        .btn { background: #007bff; color: white; border: none; padding: 8px 15px; margin-right: 5px; border-radius: 5px; cursor: pointer; }
        .btn-danger { background: #dc3545; }
        .table { width: 100%; margin-top: 15px; border-collapse: collapse; }
        .table th, .table td { padding: 8px; border: 1px solid #ccc; text-align: center; }
        .dashboard-btn {
    display: inline-block;
    margin-bottom: 20px;
    background: #17a2b8; 
    color: #fff; 
    padding: 10px 20px; 
    border-radius: 5px; 
    text-decoration: none;
    font-weight: bold;
}
.dashboard-btn:hover { background: #138496; }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Bookings</h2>
            <a href="dashboard.aspx" class="dashboard-btn">Go to Dashboard</a>
            <asp:HiddenField ID="hfBookingId" runat="server" />

            <div class="form-group">
                <label>User:</label>
                <asp:DropDownList ID="ddlUser" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Schedule:</label>
                <asp:DropDownList ID="ddlSchedule" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Seat Number:</label>
                <asp:TextBox ID="txtSeatNumber" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Booking Date:</label>
                <asp:TextBox ID="txtBookingDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Confirmed" Value="Confirmed"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnSave" runat="server" CssClass="btn" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-danger" Text="Clear" OnClick="btnClear_Click" />

            <hr />

            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID"
                OnRowEditing="gvBookings_RowEditing" OnRowDeleting="gvBookings_RowDeleting"
                CssClass="table" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                    <asp:BoundField DataField="UserID" HeaderText="User ID" />
                    <asp:BoundField DataField="ScheduleID" HeaderText="Schedule ID" />
                    <asp:BoundField DataField="SeatNumber" HeaderText="Seat Number" />
                    <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
