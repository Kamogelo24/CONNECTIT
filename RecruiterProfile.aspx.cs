using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class RecruiterProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtUpdate_Click(object sender, EventArgs e)
        {
            
        }

        protected void txtLName_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnViewApplications_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewApplication.aspx");
        }
    }
}