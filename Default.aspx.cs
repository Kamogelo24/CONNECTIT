using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     
        

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("USER.aspx");
        }

        protected void Administrator_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrator.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Post or Recruit.aspx");
        }
    }
}