using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class JobApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            /*/ Connection string - Replace with your actual connection string
            string connectionString = @"Data Source=FAITH;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False";


            string query = "SELECT Job_ID, Job_Title, Job_Description FROM JOB";
            


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewJobs.DataSource = dt;
                    GridViewJobs.DataBind();
                }
            }*/
        }

        protected void GridViewJobs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           /* if (e.CommandName == "Apply")
            {
                int jobId = Convert.ToInt32(e.CommandArgument);

                // Code to handle application logic for the selected job (e.g., inserting into APPLICATION table)
                ApplyForJob(jobId);
            }*/
        }

        private void ApplyForJob(int jobId)
        {
            /*/ Assuming you have the applicant's ID available, either from session or other means
            int applicantId = 1; // Replace with the actual Applicant ID
            string connectionString = "Data Source=FAITH;Initial Catalog=YourDatabaseName;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO APPLICATION (Applicant_ID, Job_ID, Application_Date, AcceptReject_Application) VALUES (@Applicant_ID, @Job_ID, @Application_Date, @AcceptReject_Application)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Applicant_ID", applicantId);
                    cmd.Parameters.AddWithValue("@Job_ID", jobId);
                    cmd.Parameters.AddWithValue("@Application_Date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@AcceptReject_Application", "Pending");

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Provide feedback to the user (e.g., redirect or display a message)
            Response.Write("<script>alert('Application submitted successfully!');</script>");*/
        }
    }
}
