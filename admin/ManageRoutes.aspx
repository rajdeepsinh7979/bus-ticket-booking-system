<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRoutes.aspx.cs" Inherits="WebApplication1.admin.ManageRoutes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Manage Routes</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f2f5; margin: 0; }
        .container { width: 90%; max-width: 800px; margin: 40px auto; padding: 20px; }
        h2 { text-align: center; color: #333; margin-bottom: 20px; }

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

        .form-section {
            background: #fff; 
            padding: 25px 30px; 
            margin-bottom: 30px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.15); 
            border-radius: 8px;
        }
        .form-section label { font-weight: bold; margin-top: 10px; display: block; color: #555; }
        .form-section input { margin: 5px 0 15px 0; padding: 10px; width: 100%; border: 1px solid #ccc; border-radius: 5px; font-size: 14px; }

        .btn {
            background: #007bff; color: #fff; border: none; padding: 10px 20px; cursor: pointer; border-radius: 5px; font-size: 14px; margin-right: 10px;
        }
        .btn:hover { background: #0056b3; }

        .grid {
            background: #fff; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.15); border-radius: 8px;
        }
        .grid table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .grid th, .grid td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        .grid th { background: #007bff; color: #fff; font-weight: 600; }
        .grid tr:nth-child(even) { background: #f9f9f9; }
        .grid tr:hover { background: #f1f1f1; }

        .edit-btn { background: #28a745; color: #fff; padding: 6px 12px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .edit-btn:hover { background: #218838; }
        .delete-btn { background: #dc3545; color: #fff; padding: 6px 12px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .delete-btn:hover { background: #c82333; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Routes</h2>

            <!-- Dashboard Button -->
            <a href="dashboard.aspx" class="dashboard-btn">Go to Dashboard</a>

            <!-- Add/Edit Route Form -->
            <div class="form-section">
                <asp:HiddenField ID="hfRouteId" runat="server" />

                <label>Source</label>
                <asp:TextBox ID="txtSource" runat="server" CssClass="form-control"></asp:TextBox>

                <label>Destination</label>
                <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control"></asp:TextBox>

                <label>Distance (KM)</label>
                <asp:TextBox ID="txtDistance" runat="server" CssClass="form-control"></asp:TextBox>

                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" OnClick="btnSave_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn" OnClick="btnClear_Click" />
            </div>

            <!-- GridView for Routes -->
            <div class="grid">
                <asp:GridView ID="gvRoutes" runat="server" AutoGenerateColumns="False" DataKeyNames="RouteID"
    OnRowEditing="gvRoutes_RowEditing" OnRowDeleting="gvRoutes_RowDeleting" AlternatingRowStyle-BackColor="#f9f9f9">
    <Columns>
        <asp:BoundField DataField="RouteID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="Source" HeaderText="Source" />
        <asp:BoundField DataField="Destination" HeaderText="Destination" />
        <asp:BoundField DataField="DistanceKM" HeaderText="Distance (KM)" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="edit-btn">Edit</asp:LinkButton>
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="delete-btn" OnClientClick="return confirm('Are you sure you want to delete this route?');">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
