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
    public partial class ChangePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Change"] != null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                conn.Open();

                string getID = "select Email from UserData where ID='" + Session["Change"].ToString() + "'";
                SqlCommand com = new SqlCommand(getID, conn);
                string emailid = com.ExecuteScalar().ToString();

                string getques = "select Question from Ques where ID = (select SecQues from UserData where ID='" + Session["Change"].ToString() + "')";
                SqlCommand com2 = new SqlCommand(getques, conn);
                string security = com2.ExecuteScalar().ToString();

                conn.Close();

                email_label.Text = emailid;
                ques_label.Text = security;
            }
            else
            {
                Response.Redirect("ForgotPass.aspx");
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPass.aspx");
        }

        protected void cnf_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string checkans = "select Ans from UserData where Email='" + email_label.Text + "'";
            SqlCommand anscom = new SqlCommand(checkans, conn);
            string reqans = anscom.ExecuteScalar().ToString().Replace(" ", "");
            conn.Close();

            string ans = secans.Text.Replace(" ", "");
            if(reqans == ans)
            {
                conn.Open();
                string pass = hashalgo(newpw.Text);
                string updatePass = "Update UserData set Password = '" + pass + "' where Email = '" + email_label.Text + "'";
                SqlCommand updatepw = new SqlCommand(updatePass, conn);
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.UpdateCommand = new SqlCommand(updatePass, conn);
                adapter.UpdateCommand.ExecuteNonQuery();

                conn.Close();

                Response.Write("Password has been changed successfully");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("Your answer does not match the Security Answer");
            }
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