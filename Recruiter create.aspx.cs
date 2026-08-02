using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class Recruiter_create : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string firstName = TextBox1.Text.Trim();
            string lastName = TextBox2.Text.Trim();
            string phoneNo = TextBox3.Text.Trim();
            string email = TextBox4.Text.Trim();

            conn = new SqlConnection(Consr);

            using (SqlConnection conn = new SqlConnection(Consr))
            {
                try
                {
                    conn.Open();

                    // Insert into RECRUITER table using the corrected column names
                    string sqlQuery = "INSERT INTO RECRUITER (Recruiter_FName, Recruiter_LName, Email_Address, Phone_Num) " +
                                      "VALUES (@FName, @LName, @Email, @PhoneNo);";

                    using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@FName", firstName);
                        cmd.Parameters.AddWithValue("@LName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@PhoneNo", phoneNo);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        try
                        {
                            // Your logic to process the form or submit data

                            // Show a success message
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Recruiter created successfully!');", true);
                        }
                        catch (Exception ex)
                        {
                            // Show an error message
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", $"alert('Error: {ex.Message}');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label5.Text = "Error: " + ex.Message;
                }

                Response.Redirect("Recruiters.aspx");
            }
        }
    }
}
    
