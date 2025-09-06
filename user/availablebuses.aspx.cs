using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.user
{
    public partial class availablebuses : System.Web.UI.Page
    {
        // Direct connection string (avoiding ConfigurationManager issues)

        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string source = Request.QueryString["src"];
                string destination = Request.QueryString["dest"];
                string date = Request.QueryString["date"];

                if (!string.IsNullOrEmpty(source) && !string.IsNullOrEmpty(destination) && !string.IsNullOrEmpty(date))
                {
                    lblInfo.Text = $"Showing buses from <b>{source}</b> to <b>{destination}</b> on <b>{date}</b>";

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"
    SELECT s.ScheduleID, b.BusName, b.BusType, 
           s.DepartureTime, s.ArrivalTime, s.Fare
    FROM Schedules s
    INNER JOIN Buses b ON s.BusID = b.BusID
    INNER JOIN Routes r ON s.RouteID = r.RouteID
    WHERE r.Source = @src 
      AND r.Destination = @dest 
      AND s.DateOfJourney = @date";


                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@src", source);
                        cmd.Parameters.AddWithValue("@dest", destination);
                        cmd.Parameters.AddWithValue("@date",date);


                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvBuses.DataSource = dt;
                            gvBuses.DataBind();
                        }
                        else
                        {
                            lblMessage.Text = "No buses found for the selected route.";
                        }
                    }
                }
                else
                {
                    lblMessage.Text = "No search details found.";
                }
            }
        }

        protected void gvBuses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                string scheduleID = e.CommandArgument.ToString();
                Response.Redirect("BookTicket.aspx?sid=" + scheduleID);
            }
        }
    }
}
