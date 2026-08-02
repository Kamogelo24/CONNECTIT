using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ConnectIT
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReport();
            }
        }

        private void LoadReport()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        APPLICATION.Application_ID, 
                        (APPLICANT.Applicant_FName + ' ' + APPLICANT.Applicant_LName) AS ApplicantName, 
                        JOB.Job_Title AS JobTitle, 
                        APPLICATION.Application_Date, 
                        APPLICATION.AcceptReject_Application 
                    FROM 
                        APPLICATION 
                        INNER JOIN APPLICANT ON APPLICATION.Applicants_ID = APPLICANT.Applicant_ID 
                        INNER JOIN JOB ON APPLICATION.Job_ID = JOB.Job_ID";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();  // Corrected spelling of DataTable
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}
