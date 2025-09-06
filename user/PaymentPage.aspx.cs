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
    public partial class PaymentPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string bookingID = Request.QueryString["bid"];
                if (!string.IsNullOrEmpty(bookingID))
                {
                    ShowTicketDetails(bookingID);
                }
                else
                {
                    lblMessage.Text = "No booking selected!";
                    btnPay.Enabled = false;
                }
            }
        }

        private void ShowTicketDetails(string bookingID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT
    b.ScheduleID,
    b.SeatNumber,
    b.Status,
    bu.BusName,
    s.Fare
FROM Bookings b
INNER JOIN Schedules s ON b.ScheduleID = s.ScheduleID
INNER JOIN Buses bu ON s.BusID = bu.BusID
WHERE b.BookingID = @bid;
";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@bid", bookingID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTicketDetails.Text = $"Bus: {dr["BusName"]} | Seat: {dr["SeatNumber"]} | Fare: ₹{dr["Fare"]} | Status: {dr["Status"]}";
                }
                else
                {
                    lblMessage.Text = "Booking details not found!";
                    btnPay.Enabled = false;
                }
                con.Close();
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            string bookingID = Request.QueryString["bid"];

            // In real scenario, here you would integrate a payment gateway
            // For now, we just update the booking status to "Paid"

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Bookings SET Status='Paid' WHERE BookingID=@bid";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@bid", bookingID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Payment successful! Your ticket is confirmed.";
            }
            Response.Redirect("BookingConfirmation.aspx?bid=" + bookingID);
        }
    }
}