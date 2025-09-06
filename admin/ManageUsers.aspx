<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WebApplication1.admin.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; }
        .container { width: 60%; margin: auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 2px 6px gray; }
        h2 { text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; }
        input, select { width: 100%; padding: 8px; }
        .btn { background: #007bff; color: white; border: none; padding: 8px 15px; margin-right: 5px; border-radius: 5px; cursor: pointer; }
        .btn-danger { background: #dc3545; }
        .btn-secondary { background: #6c757d; }
        .table { width: 100%; margin-top: 15px; border-collapse: collapse; }
        .table th, .table td { padding: 8px; border: 1px solid #ccc; text-align: center; }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Users</h2>

            <asp:HiddenField ID="hfUserId" runat="server" />

            <div class="form-group">
                <label>Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Phone:</label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Gender:</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label>Address:</label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </div>

           

            <asp:Button ID="btnSave" runat="server" CssClass="btn" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-danger" Text="Clear" OnClick="btnClear_Click" />
            <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" Text="Back to Dashboard" OnClick="btnBack_Click" />

            <hr />

            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID"
                OnRowEditing="gvUsers_RowEditing" OnRowDeleting="gvUsers_RowDeleting"
                CssClass="table" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="User ID" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
