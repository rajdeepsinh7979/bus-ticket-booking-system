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
    public partial class MyBookings : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    LoadMyBookings();
                }
                else
                {
                    Response.Redirect("UserLogin.aspx");
                }
            }
        }

        private void LoadMyBookings()
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT
    b.BookingID,
    b.SeatNumber,
    b.Status,
    bu.BusName,
    r.Source,
    r.Destination,
    s.Fare
FROM Bookings b
INNER JOIN Schedules s ON b.ScheduleID = s.ScheduleID
INNER JOIN Buses bu ON s.BusID = bu.BusID
INNER JOIN Routes r ON s.RouteID = r.RouteID
WHERE b.UserID = @uid 

";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@uid", userID);

                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvMyBookings.DataSource = dt;
                    gvMyBookings.DataBind();
                }
                else
                {
                    lblMessage.Text = "You have no bookings.";
                }
            }
        }

        protected void gvMyBookings_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewTicket")
            {
                string bookingID = e.CommandArgument.ToString();
                Response.Redirect("BookingConfirmation.aspx?bid=" + bookingID);
            }
        }
    }
}