using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.user
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text.Trim();

            if (fullName == "" || email == "" || password == "" || phone == "" || gender == "" || address == "")
            {
                lblMessage.Text = "Please fill all the fields!";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if email already exists
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@Email", con);
                checkCmd.Parameters.AddWithValue("@Email", email);
                

                if ((int)checkCmd.ExecuteScalar() > 0)
                {
                    lblMessage.Text = "Email already registered!";
                    return;
                }

                // Insert new user
                SqlCommand cmd = new SqlCommand("INSERT INTO Users (FullName, Email, Password, Phone, Gender, Address, Role) VALUES (@FullName, @Email, @Password, @Phone, @Gender, @Address, @Role)", con);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // For real apps, encrypt password
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Role", "User");

                cmd.ExecuteNonQuery();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Registration successful! You can now login.";
            }
        }
    }
}