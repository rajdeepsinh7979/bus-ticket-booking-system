using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1.user
{
    public partial class BookTicket : Page
    {
        // Get connection string from Web.config
        private string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string scheduleID = Request.QueryString["sid"];

                if (!string.IsNullOrEmpty(scheduleID))
                {
                    ShowBusDetails(scheduleID);
                }
                else
                {
                    lblMessage.Text = "No schedule selected!";
                    btnBookTicket.Enabled = false;
                }
            }
        }

        private void ShowBusDetails(string scheduleID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT b.BusName, b.BusType, s.DepartureTime, s.ArrivalTime, s.Fare\r\nFROM Schedules s\r\nINNER JOIN Buses b ON s.BusID = b.BusID\r\nWHERE s.ScheduleID = @sid";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Convert ScheduleID to int if DB column is int
                        int scheduleIdInt = int.Parse(scheduleID);
                        cmd.Parameters.AddWithValue("@sid", scheduleIdInt);

                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblBusDetails.Text = $"<b>Bus:</b> {dr["BusName"]} | <b>Type:</b> {dr["BusType"]} | " +
                                                     $"<b>Departure:</b> {dr["DepartureTime"]} | <b>Arrival:</b> {dr["ArrivalTime"]} | " +
                                                     $"<b>Fare:</b> ₹{dr["Fare"]}";
                            }
                            else
                            {
                                lblMessage.Text = "Bus details not found!";
                                btnBookTicket.Enabled = false;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading bus details: " + ex.Message;
            }
        }

        protected void btnBookTicket_Click(object sender, EventArgs e)
        {
            string scheduleID = Request.QueryString["sid"];
            int seatNumber;

            if (!int.TryParse(txtSeat.Text.Trim(), out seatNumber))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter a valid seat number!";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Insert booking and return the inserted BookingID
                    string insertQuery = @"
                INSERT INTO Bookings (UserID, ScheduleID, SeatNumber, BookingDate, Status)
                OUTPUT INSERTED.BookingID
                VALUES (@uid, @sid, @seat, @bdate, @status)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@uid", 1); // demo user
                        cmd.Parameters.AddWithValue("@sid", int.Parse(scheduleID));
                        cmd.Parameters.AddWithValue("@seat", seatNumber);
                        cmd.Parameters.AddWithValue("@bdate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@status", "Confirmed");

                        con.Open();
                        int bookingID = (int)cmd.ExecuteScalar(); // get inserted BookingID

                        // Redirect to Booking Confirmation page
                        Response.Redirect("PaymentPage.aspx?bid=" + bookingID);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error booking ticket: " + ex.Message;
            }
        }

    }
}