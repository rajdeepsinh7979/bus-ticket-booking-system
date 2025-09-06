using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1.user
{
    public partial class BookingConfirmation : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string bookingID = Request.QueryString["bid"];
                if (!string.IsNullOrEmpty(bookingID))
                {
                    ShowBookingDetails(bookingID);
                }
                else
                {
                    lblMessage.Text = "No booking selected!";
                }
            }
        }

        private void ShowBookingDetails(string bookingID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
    SELECT u.FullName, b.SeatNumber, b.Status, 
           bu.BusName, bu.BusType, 
           r.Source, r.Destination, 
           s.DepartureTime, s.ArrivalTime, s.Fare
    FROM Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID
    INNER JOIN Schedules s ON b.ScheduleID = s.ScheduleID
    INNER JOIN Buses bu ON s.BusID = bu.BusID
    INNER JOIN Routes r ON s.RouteID = r.RouteID
    WHERE b.BookingID = @bid";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@bid", int.Parse(bookingID));

                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblTicketDetails.Text = $@"
                        <h3>Booking Details for {dr["FullName"]}</h3>
                        <table border='1' cellpadding='5'>
                            <tr><th>Bus Name</th><td>{dr["BusName"]}</td></tr>
                            <tr><th>Bus Type</th><td>{dr["BusType"]}</td></tr>
                            <tr><th>Source</th><td>{dr["Source"]}</td></tr>
                            <tr><th>Destination</th><td>{dr["Destination"]}</td></tr>
                            <tr><th>Departure</th><td>{dr["DepartureTime"]}</td></tr>
                            <tr><th>Arrival</th><td>{dr["ArrivalTime"]}</td></tr>
                            <tr><th>Seat Number</th><td>{dr["SeatNumber"]}</td></tr>
                            <tr><th>Fare</th><td>₹{dr["Fare"]}</td></tr>
                            <tr><th>Status</th><td>{dr["Status"]}</td></tr>
                        </table>";
                            }
                            else
                            {
                                lblMessage.Text = "Booking details not found!";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error fetching booking details: " + ex.Message;
            }
        }
        protected void btnDownload_Click(object sender, EventArgs e)
        {
            string bookingID = Request.QueryString["bid"];
            if (string.IsNullOrEmpty(bookingID))
            {
                lblMessage.Text = "No booking selected!";
                return;
            }

            // Prepare the ticket content
            string ticketContent = lblTicketDetails.Text;

            // Set the response to download
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", $"attachment;filename=Ticket_{bookingID}.html");
            Response.Charset = "";
            Response.ContentType = "application/octet-stream";
            Response.Output.Write(ticketContent);
            Response.Flush();
            Response.End();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}