using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgot_button_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string checkemail = "select count(*) from UserData where Email='" + email_forgot.Text + "'";
            SqlCommand com = new SqlCommand(checkemail, conn);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();

            if (temp == 1)
            {
                conn.Open();
                string getID = "select ID from UserData where Email='" + email_forgot.Text + "'";
                SqlCommand id = new SqlCommand(getID, conn);
                string userid = id.ExecuteScalar().ToString();

                conn.Close();

                if (userid!=null)
                {
                    Session["Change"] = userid;
                    Response.Redirect("ChangePass.aspx");
                }
                else
                {
                    Response.Write("User does not exist, enter valid email.");
                }
            }
            else
            {
                Response.Write("User does not exist");
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}