using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.user
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter both email and password.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, FullName, Role FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // For real apps, hash/encrypt password

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // Set session variables
                    Session["UserID"] = dr["UserID"];
                    Session["FullName"] = dr["FullName"];
                    Session["Role"] = dr["Role"];
                    string role = Session["Role"].ToString();
                    if (role == "User")
                    {

                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Response.Redirect("../admin/dashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password!";
                }
                con.Close();
            }
        }
    }
}