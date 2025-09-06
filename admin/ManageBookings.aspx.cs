using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
                LoadSchedules();
                BindGrid();
            }
        }

        void LoadUsers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT UserID, FullName FROM Users", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlUser.DataSource = dt;
                ddlUser.DataTextField = "FullName";
                ddlUser.DataValueField = "UserID";
                ddlUser.DataBind();
                ddlUser.Items.Insert(0, new ListItem("--Select User--", ""));
            }
        }

        void LoadSchedules()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT ScheduleID FROM Schedules", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlSchedule.DataSource = dt;
                ddlSchedule.DataTextField = "ScheduleID";
                ddlSchedule.DataValueField = "ScheduleID";
                ddlSchedule.DataBind();
                ddlSchedule.Items.Insert(0, new ListItem("--Select Schedule--", ""));
            }
        }

        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT BookingID, UserID, ScheduleID, SeatNumber, BookingDate, Status FROM Bookings", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfBookingId.Value))
                {
                    cmd = new SqlCommand("INSERT INTO Bookings (UserID, ScheduleID, SeatNumber, BookingDate, Status) VALUES (@UserID, @ScheduleID, @SeatNumber, @BookingDate, @Status)", con);
                }
                else
                {
                    cmd = new SqlCommand("UPDATE Bookings SET UserID=@UserID, ScheduleID=@ScheduleID, SeatNumber=@SeatNumber, BookingDate=@BookingDate, Status=@Status WHERE BookingID=@BookingID", con);
                    cmd.Parameters.AddWithValue("@BookingID", hfBookingId.Value);
                }

                cmd.Parameters.AddWithValue("@UserID", ddlUser.SelectedValue);
                cmd.Parameters.AddWithValue("@ScheduleID", ddlSchedule.SelectedValue);
                cmd.Parameters.AddWithValue("@SeatNumber", txtSeatNumber.Text);
                cmd.Parameters.AddWithValue("@BookingDate", txtBookingDate.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                cmd.ExecuteNonQuery();
                BindGrid();
                ClearForm();
            }
        }

        protected void gvBookings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.NewEditIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Bookings WHERE BookingID=@BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfBookingId.Value = dr["BookingID"].ToString();
                    ddlUser.SelectedValue = dr["UserID"].ToString();
                    ddlSchedule.SelectedValue = dr["ScheduleID"].ToString();
                    txtSeatNumber.Text = dr["SeatNumber"].ToString();
                    txtBookingDate.Text = Convert.ToDateTime(dr["BookingDate"]).ToString("yyyy-MM-dd");
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                }
            }
        }

        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Bookings WHERE BookingID=@BookingID", con);
                cmd.Parameters.AddWithValue("@BookingID", bookingId);
                cmd.ExecuteNonQuery();
                BindGrid();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        void ClearForm()
        {
            hfBookingId.Value = "";
            ddlUser.SelectedIndex = 0;
            ddlSchedule.SelectedIndex = 0;
            txtSeatNumber.Text = "";
            txtBookingDate.Text = "";
            ddlStatus.SelectedIndex = 0;
        }
    }
}