<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="WebApplication1.user.ProfilePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>My Profile</title>
    <style>
        /* Base body */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7fb;
        }

        /* Container */
        .profile-container {
            max-width: 1000px;
            margin: 50px auto;
            background: #fff;
            border-radius: 15px;
            display: flex;
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        /* Left-side profile avatar */
        .profile-left {
    width: 35%;
    background: linear-gradient(180deg, #ff7e5f, #feb47b); /* changed from blue/purple */
    color: #fff;
    padding: 40px 20px;
    text-align: center;
}

        .profile-left img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 4px solid #fff;
            margin-bottom: 20px;
            object-fit: cover;
        }

        .profile-left h2 {
            margin: 0;
            font-size: 24px;
        }

        .profile-left p {
            margin-top: 5px;
            font-size: 14px;
            color: #e0e0ff;
        }

        /* Right-side form */
        .profile-right {
            width: 65%;
            padding: 40px 30px;
        }

        .profile-right h3 {
    font-size: 22px;
    margin-bottom: 20px;
    color: #ff7e5f; /* heading color matches the menu gradient */
}
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 18px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group .input-field,
        .form-group .dropdown-field,
        .form-group textarea {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: all 0.3s ease;
            width: 100%;
        }

        .input-field:focus,
.dropdown-field:focus,
textarea:focus {
    border-color: #ff7e5f; /* change blue focus to menu gradient color */
    box-shadow: 0 0 8px rgba(255,126,95,0.3); /* subtle orange shadow */
    outline: none;
}


        /* Update button */
        .btn {
    padding: 12px;
    background: linear-gradient(90deg, #ff7e5f, #feb47b); /* button color same as menu buttons */
    color: #fff;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
    width: 100%;
    transition: all 0.3s ease;
}

.btn:hover {
    background: linear-gradient(90deg, #feb47b, #ff7e5f); /* hover gradient reversed */
    transform: translateY(-2px);
}
        .btn1 {
    padding: 12px;
    background: linear-gradient(90deg, #ff7e5f, #feb47b); /* button color same as menu buttons */
    color: #fff;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
    margin-left:150px;
    width: 20%;
    transition: all 0.3s ease;
}

.btn1:hover {
    background: linear-gradient(90deg, #feb47b, #ff7e5f); /* hover gradient reversed */
    transform: translateY(-2px);
}

        /* Message label */
        .message-label {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .profile-container {
                flex-direction: column;
            }
            .profile-left, .profile-right {
                width: 100%;
            }
            .profile-left {
                padding: 30px 20px;
            }
            .profile-right {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" CssClass="btn1" OnClick="btn1_Click" Text="Back to menu" />
        <div class="profile-container">
            
            <!-- Left-side avatar -->
            <div class="profile-left">
                <img src="img/user.jpg" alt="User Avatar" />
                <h2><asp:Label ID="lblFullNameLeft" runat="server" Text="User Name"></asp:Label></h2>
                <p><asp:Label ID="lblEmailLeft" runat="server" Text="user@example.com"></asp:Label></p>
            </div>

            <!-- Right-side form -->
            <div class="profile-right">
                <h3>Profile Information</h3>

                <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

                <div class="form-group">
                    <label for="txtFullName">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field" placeholder="Full Name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Email" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" placeholder="Phone"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ddlGender">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-field">
                        <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="input-field" placeholder="Address"></asp:TextBox>
                </div>

                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>
</body>
</html>