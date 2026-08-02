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
    public partial class Recruiter_sign_up : System.Web.UI.Page
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
            string recruiterFName = txtUsername.Text.Trim(); // Trim any extra spaces
            conn = new SqlConnection(Consr);

            try
            {
                conn.Open();

                string query = "SELECT * FROM RECRUITER WHERE Recruiter_FName = @FName";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FName", recruiterFName);

                reader = cmd.ExecuteReader();

                if (reader.HasRows && reader.Read())
                {
                    
                    Response.Redirect("Recruiter.aspx");
                    
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