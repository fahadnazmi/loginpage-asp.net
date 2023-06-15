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
    public partial class Register : System.Web.UI.Page
    {
        int temp = 0;                    
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                conn.Open();
                string checkemail = "select count(*) from UserData where Email='" + Email.Text + "'";
                SqlCommand com = new SqlCommand(checkemail, conn); ;

                temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Email already exists");
                    
                }
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(temp == 0)
            {
                try
                {
                    Guid newGUID = Guid.NewGuid();
                    string pass = hashalgo(Password.Text);

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    conn.Open();
                    string insertQuery = "INSERT INTO UserData (ID, Name, Email, Password, SecQues, Ans) values (@id, @name, @email, @password, @secques, @ans)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@id", newGUID.ToString());
                    com.Parameters.AddWithValue("@name", Name.Text);
                    com.Parameters.AddWithValue("@email", Email.Text);
                    com.Parameters.AddWithValue("@password", pass);
                    com.Parameters.AddWithValue("@secques", int.Parse(SecQues.SelectedValue ));
                    com.Parameters.AddWithValue("@ans", SecAns.Text);

                    com.ExecuteNonQuery();

                    conn.Close();

                    Response.Write("Registration Successful");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.ToString());
                    //Response.Write("Error");
                }
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
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