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
    public partial class ProfilePage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    LoadUserProfile();
                }
                else
                {
                    Response.Redirect("UserLogin.aspx");
                }
            }
        }

        private void LoadUserProfile()
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT FullName, Email, Phone, Gender, Address FROM Users WHERE UserID=@uid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uid", userID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtFullName.Text = dr["FullName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhone.Text = dr["Phone"].ToString();
                    ddlGender.SelectedValue = dr["Gender"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                }
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["UserID"]);
            string fullName = txtFullName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text.Trim();

            if (fullName == "" || phone == "" || gender == "" || address == "")
            {
                lblMessage.Text = "Please fill all fields!";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Users SET FullName=@FullName, Phone=@Phone, Gender=@Gender, Address=@Address WHERE UserID=@uid";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@uid", userID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Profile updated successfully!";
            }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}