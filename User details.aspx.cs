using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class User_details : System.Web.UI.Page
    {
        string Consr = "Data Source=DESKTOP-T80R8LV;Initial Catalog=connectIT_users;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        SqlConnection conn;
        SqlDataAdapter adapter;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    conn = new SqlConnection(Consr);
                    conn.Open();

                    string dl = "SELECT Job_ID, Job_Title FROM JOB";
                    cmd = new SqlCommand(dl, conn);

                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        ListItem item = new ListItem(rdr["Job_Title"].ToString(), rdr["Job_ID"].ToString());
                        DropDownList1.Items.Add(item);
                    }
                    rdr.Close();
                }
                catch (Exception ex)
                {
                    Label12.Text = "Error: " + ex.Message;
                }
                finally
                {
                    if (conn != null && conn.State == System.Data.ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text.Trim();
            string surname = TextBox2.Text.Trim();
            string phoneNo = TextBox3.Text.Trim();
            string email = TextBox4.Text.Trim();
            string selectedJobId = DropDownList1.SelectedValue;
            string selectedJobName = DropDownList1.SelectedItem.Text;
            Session["SelectedJobID"] = selectedJobId;
            Session["SelectedJobName"] = selectedJobName;

            List<string> certifications = new List<string>();

            // Loop through all request form keys to find dynamically added certifications
            foreach (string key in Request.Form.Keys)
            {
                if (key.StartsWith("textCert"))
                {
                    certifications.Add(Request.Form[key]);
                }
            }

            using (SqlConnection conn = new SqlConnection(Consr))
            {
                try
                {
                    conn.Open();

                    // Insert applicant information
                    string sqlInsertApplicant = "INSERT INTO APPLICANT (Applicant_FName, Applicant_LName, Email_Address, Phone_Num) " +
                                                "VALUES (@FName, @LName, @Email, @PhoneNo);" +
                                                "SELECT SCOPE_IDENTITY();";

                    int applicantId;
                    using (SqlCommand cmd = new SqlCommand(sqlInsertApplicant, conn))
                    {
                        cmd.Parameters.AddWithValue("@FName", name);
                        cmd.Parameters.AddWithValue("@LName", surname);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@PhoneNo", phoneNo);

                        applicantId = Convert.ToInt32(cmd.ExecuteScalar());

                        // Store applicant information in a cookie
                        HttpCookie applicantCookie = new HttpCookie("ApplicantInfo");
                        applicantCookie["ApplicantID"] = applicantId.ToString();
                        applicantCookie["ApplicantFName"] = name;
                        applicantCookie["ApplicantLName"] = surname;
                        applicantCookie["ApplicantEmail"] = email;
                        applicantCookie["ApplicantPhone"] = phoneNo;
                        applicantCookie.Expires = DateTime.Now.AddHours(1);
                        Response.Cookies.Add(applicantCookie);
                    }

                    // Insert certifications
                    foreach (var cert in certifications)
                    {
                        string sqlInsertCertification = "INSERT INTO CERTIFICATION (Applicant_ID, Certification) VALUES (@Applicant_ID, @Certification)";
                        using (SqlCommand cmd = new SqlCommand(sqlInsertCertification, conn))
                        {
                            cmd.Parameters.AddWithValue("@Applicant_ID", applicantId);
                            cmd.Parameters.AddWithValue("@Certification", cert);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Insert job application
                    string sqlInsertApplication = "INSERT INTO APPLICATION (Applicant_ID, Job_ID, Application_Date, AcceptReject_Application) " +
                                                  "VALUES (@Applicant_ID, @Job_ID, @Application_Date, @AcceptReject_Application);";

                    using (SqlCommand cmd = new SqlCommand(sqlInsertApplication, conn))
                    {
                        cmd.Parameters.AddWithValue("@Applicant_ID", applicantId);
                        cmd.Parameters.AddWithValue("@Job_ID", selectedJobId);
                        cmd.Parameters.AddWithValue("@Application_Date", DateTime.Now);
                        cmd.Parameters.AddWithValue("@AcceptReject_Application", "Pending");

                        cmd.ExecuteNonQuery();
                    }

                    // Show success message
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Application submitted successfully!');", true);
                }
                catch (Exception ex)
                {
                    Label12.Text = "Error: " + ex.Message;
                }
                finally
                {
                    conn.Close();
                }

                // Create and add cookie for user details
                HttpCookie _userinfo = new HttpCookie("user");
                _userinfo["Firstname"] = TextBox1.Text;
                _userinfo["Surname"] = TextBox2.Text;
                _userinfo["PhoneNumber"] = TextBox3.Text;
                _userinfo["Email"] = TextBox4.Text;
                _userinfo["Jobs"] = DropDownList1.SelectedItem.Text;
                _userinfo["Qualification"] = DropDownList2.SelectedItem.Text;
                _userinfo["Qualification Type"] = TextBox5.Text;
                _userinfo["Experience"] = TextArea1.Value;

                Response.Cookies.Add(_userinfo);
                _userinfo.Expires = DateTime.Now.AddDays(1500);

                // Redirect after processing
                Response.Redirect("user sign.aspx");
            }
        }
    }
}