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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["New"] = null;
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                conn.Open();

                string checkemail = "select count(*) from UserData where Email='" + email.Text + "'";
                SqlCommand com = new SqlCommand(checkemail, conn);

                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();

                if (temp == 1)
                {
                    conn.Open();
                    string checkpass = "select password from UserData where Email='" + email.Text + "'";
                    SqlCommand passcom = new SqlCommand(checkpass, conn);

                    string pw = passcom.ExecuteScalar().ToString().Replace(" ", "");
                    string pw1 = hashalgo(password.Text);

                    if(pw == pw1)
                    {
                        Session["New"] = email.Text;
                        Response.Write("Login Successful");
                        Response.Redirect("UserPage.aspx");
                    }
                    else
                    {
                        Response.Write("Email or Password is Not Correct");
                    }
                }
                else
                {
                        Response.Write("User does not exist");
                }
        }
        protected void forgotpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPass.aspx");
        }

        protected string hashalgo(string sSourceData)
        {
            byte[] tmpSource;
            byte[] tmpHash;

            tmpSource = ASCIIEncoding.ASCII.GetBytes(sSourceData);
            tmpHash = new MD5CryptoServiceProvider().ComputeHash(tmpSource);

            return ByteArrayToString(tmpHash);
        }

        static string ByteArrayToString(byte[] arrInput)
        {
            int i;
            StringBuilder sOutput = new StringBuilder(arrInput.Length);
            for (i = 0; i < arrInput.Length - 1; i++)
            {
                sOutput.Append(arrInput[i].ToString("X2"));
            }
            return sOutput.ToString();
        }
    }
}