<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBuses.aspx.cs" Inherits="WebApplication1.admin.ManageBuses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Buses</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f2f5; margin: 0; }
        .container { width: 90%; max-width: 1000px; margin: 40px auto; padding: 20px; }

        h2 { text-align: center; color: #333; margin-bottom: 20px; }

        /* Dashboard Button */
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

        /* Form section */
        .form-section {
            background: #fff; 
            padding: 25px 30px; 
            margin-bottom: 30px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.15); 
            border-radius: 8px;
        }
        .form-section label { font-weight: bold; margin-top: 10px; display: block; color: #555; }
        .form-section input, .form-section select {
            margin: 5px 0 15px 0; 
            padding: 10px; 
            width: 100%; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            font-size: 14px;
        }

        /* Buttons */
        .btn {
            background: #007bff; 
            color: #fff; 
            border: none; 
            padding: 10px 20px; 
            cursor: pointer; 
            border-radius: 5px; 
            font-size: 14px; 
            margin-right: 10px;
        }
        .btn:hover { background: #0056b3; }

        /* GridView styles */
        .grid {
            background: #fff; 
            padding: 20px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.15); 
            border-radius: 8px;
        }
        .grid table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .grid th, .grid td {
            padding: 12px; 
            text-align: left; 
            border-bottom: 1px solid #ddd;
        }
        .grid th { background: #007bff; color: #fff; font-weight: 600; }
        .grid tr:nth-child(even) { background: #f9f9f9; }
        .grid tr:hover { background: #f1f1f1; }

        /* Custom Edit/Delete Buttons */
        .edit-btn { background: #28a745; color: #fff; padding: 6px 12px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .edit-btn:hover { background: #218838; }
        .delete-btn { background: #dc3545; color: #fff; padding: 6px 12px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .delete-btn:hover { background: #c82333; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Buses</h2>

            <!-- Dashboard Button -->
            <a href="dashboard.aspx" class="dashboard-btn">Go to Dashboard</a>

            <!-- Add/Edit Bus Form -->
            <div class="form-section">
                <asp:HiddenField ID="hfBusId" runat="server" />

                <label>Bus Name</label>
                <asp:TextBox ID="txtBusName" runat="server" CssClass="form-control"></asp:TextBox>

                <label>Bus Type</label>
                <asp:DropDownList ID="ddlBusType" runat="server" CssClass="form-control">
                    <asp:ListItem>AC</asp:ListItem>
                    <asp:ListItem>Non-AC</asp:ListItem>
                    <asp:ListItem>Sleeper</asp:ListItem>
                    <asp:ListItem>Seater</asp:ListItem>
                </asp:DropDownList>

                <label>Total Seats</label>
                <asp:TextBox ID="txtSeats" runat="server" CssClass="form-control"></asp:TextBox>

                <label>Bus Number</label>
                <asp:TextBox ID="txtBusNumber" runat="server" CssClass="form-control"></asp:TextBox>

                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" OnClick="btnSave_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn" OnClick="btnClear_Click" />
            </div>

            <!-- GridView for Buses -->
            <div class="grid">
                <asp:GridView ID="gvBuses" runat="server" AutoGenerateColumns="False" DataKeyNames="BusId"
                    OnRowEditing="gvBuses_RowEditing" OnRowDeleting="gvBuses_RowDeleting"
                    CssClass="table" GridLines="None" AlternatingRowStyle-BackColor="#f9f9f9">
                    <Columns>
                        <asp:BoundField DataField="BusId" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="BusName" HeaderText="Bus Name" />
                        <asp:BoundField DataField="BusType" HeaderText="Type" />
                        <asp:BoundField DataField="TotalSeats" HeaderText="Seats" />
                        <asp:BoundField DataField="BusNumber" HeaderText="Bus Number" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="edit-btn">Edit</asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="delete-btn" OnClientClick="return confirm('Are you sure you want to delete this bus?');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
