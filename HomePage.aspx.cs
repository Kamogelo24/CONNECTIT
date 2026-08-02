using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConnectIT
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignInOrSignUp_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnSignInOrSignUp_Click1(object sender, EventArgs e)
        {

        }

        protected void btnSignInOrSignUp_Click2(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}