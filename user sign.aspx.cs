using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Reflection.Emit;

namespace ConnectIT
{
    public partial class user_sign : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommand cmd;
        DataSet ds;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the applicant details from the cookie
            string selectedJobName = Session["SelectedJobName"] as string;
            HttpCookie _userinfo = Request.Cookies["user"];
            HttpCookie applicantCookie = Request.Cookies["ApplicantInfo"];
            if (applicantCookie != null)
            {
                ListBox1.Items.Add("Applicant ID: " + applicantCookie["ApplicantID"]);
                ListBox1.Items.Add("First Name: " + applicantCookie["ApplicantFName"]);
                ListBox1.Items.Add("Last Name: " + applicantCookie["ApplicantLName"]);
                ListBox1.Items.Add("Email: " + applicantCookie["ApplicantEmail"]);
                ListBox1.Items.Add("Phone: " + applicantCookie["ApplicantPhone"]);
            }
            else
            {
                ListBox1.Items.Add("Applicant information not found. Please log in again.");
            }

            if (!string.IsNullOrEmpty(selectedJobName))
            {
                ListBox1.Items.Add("Selected Job: " + selectedJobName);
               
                
            }
            else
            {
                Label4.Text = "No job selected.";
            }
            if (_userinfo != null)
            {
                ListBox1.Items.Add("Quilification: " + _userinfo["Qualification"]);
                ListBox1.Items.Add("Exprience: " +  _userinfo["Experience"]);
                
            }
        }


            protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie applicantCookie = Request.Cookies["ApplicantInfo"];
            if (applicantCookie != null)
            {
                int applicantId = Convert.ToInt32(applicantCookie["ApplicantID"]);
                string selectedJobId = Session["SelectedJobID"] as string;

                if (!string.IsNullOrEmpty(selectedJobId))
                {
                    using (SqlConnection conn = new SqlConnection(Consr))
                    {
                        try
                        {
                            conn.Open();

                            // Query to get the application status from the APPLICATION table
                            string sqlQuery = "SELECT AcceptReject_Application FROM APPLICATION WHERE Applicant_ID = @Applicants_ID AND Job_ID = @Job_ID";
                            using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                            {
                                cmd.Parameters.AddWithValue("@Applicants_ID", applicantId);
                                cmd.Parameters.AddWithValue("@Job_ID", selectedJobId);

                                // Execute the query and get the status
                                string applicationStatus = cmd.ExecuteScalar() as string;

                                if (!string.IsNullOrEmpty(applicationStatus))
                                {
                                    Label2.Text = $"Your application status for the selected job is: {applicationStatus}";
                                }
                                else
                                {
                                    Label2.Text = "No application found for the selected job.";
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Label2.Text = "Error: " + ex.Message;
                        }
                    }
                }
                else
                {
                    Label2.Text = "Selected job information is missing.";
                }
            }
            else
            {
                Label2.Text = "Applicant information is missing. Please log in again.";
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.Text = "Application saved";

        }

        protected void ButtonSaveChanges_Click(object sender, EventArgs e)
        {
            string applicantFName = TextBoxFName.Text.Trim();
            string applicantLName = TextBoxLName.Text.Trim();
            string applicantEmail = TextBoxEmail.Text.Trim();
            string applicantPhone = TextBoxPhone.Text.Trim();

            // Get the Applicant ID from the cookie
            HttpCookie applicantCookie = Request.Cookies["ApplicantInfo"];
            string applicantID = applicantCookie["ApplicantID"];

            string updateQuery = "UPDATE APPLICANT SET Applicant_FName = @FName, Applicant_LName = @LName, Email_Address = @Email, Phone_Num = @Phone WHERE Applicant_ID = @ID";

            using (SqlConnection conn = new SqlConnection(Consr))
            {
                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@FName", applicantFName);
                    cmd.Parameters.AddWithValue("@LName", applicantLName);
                    cmd.Parameters.AddWithValue("@Email", applicantEmail);
                    cmd.Parameters.AddWithValue("@Phone", applicantPhone);
                    cmd.Parameters.AddWithValue("@ID", applicantID);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        // Optionally update the cookie if you want to refresh the data
                        applicantCookie["ApplicantFName"] = applicantFName;
                        applicantCookie["ApplicantLName"] = applicantLName;
                        applicantCookie["ApplicantEmail"] = applicantEmail;
                        applicantCookie["ApplicantPhone"] = applicantPhone;
                        applicantCookie.Expires = DateTime.Now.AddDays(3);
                        Response.Cookies.Add(applicantCookie);

                        // Refresh the page to show updated info
                        Response.Redirect("user sign.aspx");
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception as needed
                        Label2.Text = $"An error occurred: {ex.Message}";
                    }
                }
            }
        }
    }
}