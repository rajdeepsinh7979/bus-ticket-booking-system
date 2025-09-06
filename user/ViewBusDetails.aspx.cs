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
    public partial class ViewBusDetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBusDetails();
            }
        }

        private void LoadBusDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT b.BusName, b.BusType, r.Source, r.Destination, \r\n       s.DepartureTime, s.ArrivalTime, s.Fare\r\nFROM Schedules s\r\nINNER JOIN Buses b ON s.BusID = b.BusID\r\nINNER JOIN Routes r ON s.RouteID = r.RouteID\r\n";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvBuses.DataSource = dt;
                    gvBuses.DataBind();
                }
                else
                {
                    lblMessage.Text = "No buses available.";
                }
            }
        }
    }
}