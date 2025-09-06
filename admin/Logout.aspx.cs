using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session variables
            Session.Clear();

            // End current session
            Session.Abandon();

            // Redirect to user login page
            Response.Redirect("../user/UserLogin.aspx");
        }
    }
}