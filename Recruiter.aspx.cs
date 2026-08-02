using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class Recruiter : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommand cmd;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApplicantData();
                LoadApplicationData();
            }
        }

        private void LoadApplicantData()
        {
            conn = new SqlConnection(Consr);
            cmd = new SqlCommand("SELECT * FROM APPLICANT", conn);
            adapter = new SqlDataAdapter(cmd);
            ds = new DataSet();

            try
            {
                conn.Open();
                adapter.Fill(ds, "ApplicantTable");
                GridView1.DataSource = ds;
                GridView1.DataMember = "ApplicantTable";
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Label6.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        private void LoadApplicationData()
        {
            conn = new SqlConnection(Consr);
            cmd = new SqlCommand("SELECT * FROM APPLICATION", conn);
            adapter = new SqlDataAdapter(cmd);
            ds = new DataSet();

            try
            {
                conn.Open();
                adapter.Fill(ds, "ApplicationTable");
                GridView2.DataSource = ds;
                GridView2.DataMember = "ApplicationTable";
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Label6.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string searchTerm = TextBox2.Text.Trim();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                conn = new SqlConnection(Consr);

                try
                {
                    conn.Open();

                    // Search query using LIKE for both first and last name
                    string sqlQuery = "SELECT * FROM APPLICANT WHERE Applicant_FName LIKE @SearchTerm OR Applicant_LName LIKE @SearchTerm;";

                    using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");

                        DataTable dt = new DataTable();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dt);
                        }

                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        if (dt.Rows.Count == 0)
                        {
                            Label6.Text = "No applicants found.";
                        }
                        else
                        {
                            Label6.Text = "";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label6.Text = "Error: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                Label6.Text = "Please enter a name to search.";
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept" || e.CommandName == "Reject")
            {
                // Existing code for updating application status
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                int index = row.RowIndex;

                string applicantId = GridView2.DataKeys[index].Value.ToString();

                UpdateApplicationStatus(applicantId, e.CommandName == "Accept" ? "Accepted" : "Rejected");

                LoadApplicationData();
            }
        }

        private void UpdateApplicationStatus(string applicantId, string status)
        {
            conn = new SqlConnection(Consr);
            cmd = new SqlCommand("UPDATE APPLICATION SET AcceptReject_Application = @Status WHERE Applicant_ID = @ApplicantID", conn);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@ApplicantID", applicantId);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                Label6.Text = "Application status updated successfully.";
            }
            catch (Exception ex)
            {
                Label6.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string selectedDate = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            string location = TextBox1.Text;
            int applicationID;

            // Assuming that you have some logic to get the Application_ID. 
            // For demonstration, let's assume you have the Application_ID stored in a session.
            if (int.TryParse(Session["Application_ID"]?.ToString(), out applicationID) && !string.IsNullOrEmpty(location))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO INTERVIEW (Application_ID, Interview_Date, Location) VALUES (@Application_ID, @Interview_Date, @Location)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Application_ID", applicationID);
                        cmd.Parameters.AddWithValue("@Interview_Date", selectedDate);
                        cmd.Parameters.AddWithValue("@Location", location);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            Label6.Text = "Interview scheduled successfully.";
                            Label6.ForeColor = System.Drawing.Color.Green;
                        }
                        catch (Exception ex)
                        {
                            Label6.Text = "Error: " + ex.Message;
                            Label6.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            else
            {
                Label6.Text = "Please select a valid date, location, and ensure Application ID is available.";
                Label6.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            string selectedDate = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            string location = TextBox1.Text;
            int applicationID;

            // Assuming that you have some logic to get the Application_ID. 
            // For demonstration, let's assume you have the Application_ID stored in a session.
            if (int.TryParse(Session["Application_ID"]?.ToString(), out applicationID) && !string.IsNullOrEmpty(location))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO INTERVIEW (Application_ID, Interview_Date, Location) VALUES (@Application_ID, @Interview_Date, @Location)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Application_ID", applicationID);
                        cmd.Parameters.AddWithValue("@Interview_Date", selectedDate);
                        cmd.Parameters.AddWithValue("@Location", location);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            Label6.Text = "Interview scheduled successfully.";
                            Label6.ForeColor = System.Drawing.Color.Green;
                        }
                        catch (Exception ex)
                        {
                            Label6.Text = "Error: " + ex.Message;
                            Label6.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            else
            {
                Label6.Text = "Please select a valid date, location, and ensure Application ID is available.";
                Label6.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            HttpCookie _userinfo = Request.Cookies["user"];
            if (_userinfo != null)
            {
                ListBox1.Items.Add("Qualification: " + _userinfo["Qualification"]);
                ListBox1.Items.Add("Exprience: " + _userinfo["Experience"]);
                ListBox1.Items.Add("Qualification Type:" + _userinfo["Qualification Type"]);

            }
        }
    }
}
