using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class ManageRoutes : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // Bind GridView with Routes
        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT RouteID, Source, Destination, DistanceKM FROM Routes";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvRoutes.DataSource = dt;
                gvRoutes.DataBind();
            }
        }

        // Save or Update Route
        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfRouteId.Value))
                {
                    // Insert new route
                    cmd = new SqlCommand("INSERT INTO Routes (Source, Destination, DistanceKM) VALUES (@Source,@Destination,@Distance)", con);
                }
                else
                {
                    // Update existing route
                    cmd = new SqlCommand("UPDATE Routes SET Source=@Source, Destination=@Destination, DistanceKM=@Distance WHERE RouteID=@RouteID", con);
                    cmd.Parameters.AddWithValue("@RouteID", hfRouteId.Value);
                }

                cmd.Parameters.AddWithValue("@Source", txtSource.Text);
                cmd.Parameters.AddWithValue("@Destination", txtDestination.Text);
                cmd.Parameters.AddWithValue("@Distance", txtDistance.Text);

                cmd.ExecuteNonQuery();
                BindGrid();
                ClearForm();
            }
        }

        // Edit Route
        protected void gvRoutes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int routeId = Convert.ToInt32(gvRoutes.DataKeys[e.NewEditIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT RouteID, Source, Destination, DistanceKM FROM Routes WHERE RouteID=@RouteID", con);
                cmd.Parameters.AddWithValue("@RouteID", routeId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfRouteId.Value = dr["RouteID"].ToString();
                    txtSource.Text = dr["Source"].ToString();
                    txtDestination.Text = dr["Destination"].ToString();
                    txtDistance.Text = dr["DistanceKM"].ToString();
                }
            }
        }

        // Delete Route
        protected void gvRoutes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int routeId = Convert.ToInt32(gvRoutes.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Routes WHERE RouteID=@RouteID", con);
                cmd.Parameters.AddWithValue("@RouteID", routeId);
                cmd.ExecuteNonQuery();
                BindGrid();
            }
        }

        // Clear Form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        void ClearForm()
        {
            hfRouteId.Value = "";
            txtSource.Text = "";
            txtDestination.Text = "";
            txtDistance.Text = "";
        }
    }
}
