using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace ConnectIT
{
    public partial class Admin_Report : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid(); // Bind data only on the first page load
                Applicatin(); // Load application data
                job(); // Load job data into GridView3
            }

            DateTime time = DateTime.Now;
            Label2.Text = "AS OF " + time.ToLongDateString();
        }

        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(Consr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM APPLICANT";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adapter.Fill(ds, "SourceTable");

                            // Bind data to GridView1
                            GridView1.DataSource = ds.Tables["SourceTable"];
                            GridView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message;
                }
            }
        }

        public void Applicatin()
        {
            using (SqlConnection conn = new SqlConnection(Consr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM APPLICATION";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adapter.Fill(ds, "SourceTable");

                            // Bind data to GridView2
                            GridView2.DataSource = ds.Tables["SourceTable"];
                            GridView2.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message;
                }
            }
        }

        public void job()
        {
            using (SqlConnection conn = new SqlConnection(Consr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM JOB"; // Fetch data from JOB table
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            adapter.Fill(ds, "JobTable");

                            // Bind data to GridView3
                            GridView3.DataSource = ds.Tables["JobTable"];
                            GridView3.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message;
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int applicantId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(Consr))
            {
                conn.Open();

                // Delete related records from APPLICATION table first
                string deleteApplicationsSql = "DELETE FROM APPLICATION WHERE Applicant_ID = @ID";
                using (SqlCommand cmd = new SqlCommand(deleteApplicationsSql, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", applicantId);
                    cmd.ExecuteNonQuery();
                }

                // Delete the applicant from APPLICANT table
                string deleteApplicantSql = "DELETE FROM APPLICANT WHERE Applicant_ID = @ID";
                using (SqlCommand cmd = new SqlCommand(deleteApplicantSql, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", applicantId);
                    cmd.ExecuteNonQuery();
                }
            }

            // Rebind the grid to reflect changes immediately
            BindGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int applicantId;
            if (int.TryParse(TextBox1.Text.Trim(), out applicantId))
            {
                using (SqlConnection conn = new SqlConnection(Consr))
                {
                    conn.Open();

                    // Delete related records from APPLICATION table first
                    string deleteApplicationsSql = "DELETE FROM APPLICATION WHERE Applicant_ID = @ID";
                    using (SqlCommand cmd = new SqlCommand(deleteApplicationsSql, conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", applicantId);
                        cmd.ExecuteNonQuery();
                    }

                    // Delete the applicant from APPLICANT table
                    string deleteApplicantSql = "DELETE FROM APPLICANT WHERE Applicant_ID = @ID";
                    using (SqlCommand cmd = new SqlCommand(deleteApplicantSql, conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", applicantId);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Label4.Text = "Applicant deleted successfully!";
                            Label4.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            Label4.Text = "Applicant not found.";
                            Label4.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }

                // Rebind the grid to reflect changes immediately
                BindGrid();
            }
            else
            {
                Label4.Text = "Please enter a valid Applicant ID.";
                Label4.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("users.aspx");
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Handle any selection change events for GridView3 here
        }
    }
}
