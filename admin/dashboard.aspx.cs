using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardStats();
            }
        }

        void LoadDashboardStats()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Total Users
                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM users", con);
                lblUsers.Text = cmd1.ExecuteScalar().ToString();

                // Total Buses
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM buses", con);
                lblBuses.Text = cmd2.ExecuteScalar().ToString();

                // Total Bookings
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM Bookings", con);
                lblBookings.Text = cmd3.ExecuteScalar().ToString();

                // Total Revenue
                SqlCommand cmd4 = new SqlCommand(@"
    SELECT ISNULL(SUM(s.Fare * x.BookingCount), 0) AS TotalRevenue
    FROM Schedules s
    INNER JOIN (
        SELECT ScheduleId, COUNT(*) AS BookingCount
        FROM Bookings
        GROUP BY ScheduleId
    ) x ON s.ScheduleId = x.ScheduleId;", con);

                lblRevenue.Text = cmd4.ExecuteScalar().ToString();

            }
        }
    }
}