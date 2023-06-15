using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class UserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["New"] != null)
            {
                Label_welcome.Text += Session["New"].ToString(); 
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void logout_Click1(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}