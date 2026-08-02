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
    public partial class Post_Job : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize the SqlConnection object
            conn = new SqlConnection(Consr);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Open the connection
                conn.Open();

                // SQL query to insert data into JOB table
                string sql = "INSERT INTO JOB (Job_Title, Job_Description) VALUES (@JT, @JD)";
                cmd = new SqlCommand(sql, conn);

                // Add the parameters and use TextBox.Text to get the actual input
                cmd.Parameters.AddWithValue("@JT", TextBox1.Text);
                cmd.Parameters.AddWithValue("@JD", TextBox2.Text);

                // Execute the query
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Handle exception (you can log it or display an error message)
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                // Ensure the connection is closed, even if an error occurs
                if (conn != null && conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}