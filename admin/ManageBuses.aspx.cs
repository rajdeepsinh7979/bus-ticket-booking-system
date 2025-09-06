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
    public partial class ManageBuses : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["busdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Buses", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBuses.DataSource = dt;
                gvBuses.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hfBusId.Value))
                {
                    // Insert new bus
                    cmd = new SqlCommand("INSERT INTO Buses (BusName, BusType, TotalSeats, BusNumber) VALUES (@BusName, @BusType, @Seats, @BusNumber)", con);
                }
                else
                {
                    // Update existing bus
                    cmd = new SqlCommand("UPDATE Buses SET BusName=@BusName, BusType=@BusType, TotalSeats=@Seats, BusNumber=@BusNumber WHERE BusId=@BusId", con);
                    cmd.Parameters.AddWithValue("@BusId", hfBusId.Value);
                }

                cmd.Parameters.AddWithValue("@BusName", txtBusName.Text);
                cmd.Parameters.AddWithValue("@BusType", ddlBusType.SelectedValue);
                cmd.Parameters.AddWithValue("@Seats", txtSeats.Text);
                cmd.Parameters.AddWithValue("@BusNumber", txtBusNumber.Text);

                cmd.ExecuteNonQuery();
                BindGrid();
                ClearForm();
            }
        }

        protected void gvBuses_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int busId = Convert.ToInt32(gvBuses.DataKeys[e.NewEditIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Buses WHERE BusId=@BusId", con);
                cmd.Parameters.AddWithValue("@BusId", busId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfBusId.Value = dr["BusId"].ToString();
                    txtBusName.Text = dr["BusName"].ToString();
                    ddlBusType.SelectedValue = dr["BusType"].ToString();
                    txtSeats.Text = dr["TotalSeats"].ToString();
                    txtBusNumber.Text = dr["BusNumber"].ToString();
                }
            }
        }

        protected void gvBuses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int busId = Convert.ToInt32(gvBuses.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Buses WHERE BusId=@BusId", con);
                cmd.Parameters.AddWithValue("@BusId", busId);
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
            hfBusId.Value = "";
            txtBusName.Text = "";
            ddlBusType.SelectedIndex = 0;
            txtSeats.Text = "";
            txtBusNumber.Text = "";
        }
    }
}