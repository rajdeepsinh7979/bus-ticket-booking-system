using System;
using System.Web.UI;

namespace WebApplication1.user
{
    public partial class home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnSearchBus_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchbus.aspx");
        }

        protected void btnMyBookings_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
                Response.Redirect("MyBookings.aspx");
            else
                Response.Redirect("UserLogin.aspx"); // Require login
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
                Response.Redirect("ProfilePage.aspx");
            else
                Response.Redirect("UserLogin.aspx"); // Require login
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

    }
}
