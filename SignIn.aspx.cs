using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class SignIn : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommand cmd;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string applicantFName = txtUsername.Text.Trim(); // Trim any extra spaces
            conn = new SqlConnection(Consr);

            try
            {
                conn.Open();

                string query = "SELECT * FROM APPLICANT WHERE Applicant_FName = @FName";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FName", applicantFName);

                reader = cmd.ExecuteReader();

                if (reader.HasRows && reader.Read())
                {
                    // Store applicant details in cookies
                    HttpCookie applicantCookie = new HttpCookie("ApplicantInfo");
                    applicantCookie["ApplicantID"] = reader["Applicant_ID"].ToString();
                    applicantCookie["ApplicantFName"] = reader["Applicant_FName"].ToString();
                    applicantCookie["ApplicantLName"] = reader["Applicant_LName"].ToString();
                    applicantCookie["ApplicantEmail"] = reader["Email_Address"].ToString();
                    applicantCookie["ApplicantPhone"] = reader["Phone_Num"].ToString();

                    // Set cookie to expire in 3 days
                    applicantCookie.Expires = DateTime.Now.AddDays(3);

                    // Add the cookie to the response
                    Response.Cookies.Add(applicantCookie);



                    // Redirect to another page where you want to display the data
                    Response.Redirect("user sign.aspx");
                }

            }

            finally
            {
                // Always close the reader and the connection
                if (reader != null) reader.Close();
                if (conn != null) conn.Close();
            }

        }
        
        
    }
}