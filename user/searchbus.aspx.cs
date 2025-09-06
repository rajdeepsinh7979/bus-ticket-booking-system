using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1.user
{
    public partial class searchbus : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["UserID"] != null)
                {
                    BindAllBuses(); // Show all buses at the bottom on page load
                    
                }
                else
                {
                    Response.Redirect("UserLogin.aspx");
                }
               
            }
            
                
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string source = txtsource.Text.Trim();
            string destination = txtDestination.Text.Trim();
            string date = txtDate.Text.Trim();

            if (string.IsNullOrEmpty(source) || string.IsNullOrEmpty(destination) || string.IsNullOrEmpty(date))
            {
                lblmsg.Text = "⚠ Please fill all fields!";
                return;
            }

            // Redirect to AvailableBuses.aspx with query parameters
            string url = $"AvailableBuses.aspx?src={Server.UrlEncode(source)}&dest={Server.UrlEncode(destination)}&date={Server.UrlEncode(date)}";
            Response.Redirect(url);
        }

        private void BindAllBuses()
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                string query = @"
                    SELECT 
                        b.BusName, b.BusType, r.Source, r.Destination,
                        s.DateOfJourney AS TravelDate, s.DepartureTime, s.ArrivalTime,
                        s.Fare, 
                        (b.TotalSeats - ISNULL((SELECT COUNT(*) FROM Bookings bk WHERE bk.ScheduleID = s.ScheduleID), 0)) AS SeatsAvailable
                    FROM Schedules s
                    INNER JOIN Buses b ON s.BusID = b.BusID
                    INNER JOIN Routes r ON s.RouteID = r.RouteID
                    ORDER BY s.DateOfJourney, s.DepartureTime";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                    lblmsg.Text = "No buses available.";

                rptAllBuses.DataSource = dt;
                rptAllBuses.DataBind();
            }
        }
    }
}
