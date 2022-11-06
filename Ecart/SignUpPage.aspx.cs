using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class SignUpPage : System.Web.UI.Page
{
    string otp;
    protected void Page_Load(object sender, EventArgs e)
    {
        email.Focus();

    }
    private Boolean isFormvalid()
    {
        if (username.Text.Length < 8)
        {
            Response.Write("<script>alert('UserName must be atleast 8 characters long')</script>");
            username.Focus();
            return false;
        }
        else if (password.Text.Length < 8)
        {
            Response.Write("<script>alert('Password must be atleast 8 characters long')</script>");
            password.Focus();
            return false;
        }
        else if (confirmpassword.Text != password.Text)
        {
            Response.Write("<script>alert('Password and confirm password are not same')</script>");
            confirmpassword.Focus();
            return false;

        }
        else if (!(fullname.Text.Contains(" ")))
        {
            Response.Write("<script>alert('Enter full name in proper order')</script>");
            fullname.Focus();
            return false;

        }
        else if (!(email.Text.Contains('@')))
        {
            Response.Write("<script>alert('Email should contain @')</script>");
            email.Focus();
            return false;
        }
        else if (mobileno.Text.Length > 10 || mobileno.Text.Length < 10)
        {
            Response.Write("<script>alert('Enter 10 digit number')</script>");
            mobileno.Focus();
            return false;
        }
        else
        {

            return true;
        }

    }

    protected void SubmitBtn_Click(object sender, EventArgs e)

    {
        if(OTP.Text == Request.Cookies["OTP"].Value)
        {
            if (isFormvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO UserData(username,password,confirmpassword,fullname,email,usertype,mobileno) VALUES('" + username.Text + "','" + password.Text + "','" + confirmpassword.Text + "','" + fullname.Text + "','" + email.Text + "','user','"+mobileno.Text+"')", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Session["username"] = username.Text;
                    Response.Redirect("~/UserHome.aspx");

                }
                clr();
                


               
            }
            else
            {
                Response.Write("<script>alert('Check your SignUp details again')</script>");

            }

        }
        else
        {
            Response.Write("<script>alert('OTP is not correct')</script>");

        }


        void clr()
        {
            username.Text = String.Empty;
            password.Text = String.Empty;
            confirmpassword.Text = String.Empty;
            fullname.Text = String.Empty;
            email.Text = String.Empty;
            otpstatus.Text = String.Empty ;
            mobileno.Text = String.Empty ;
            OTP.Text = String.Empty ;   

        }

       








    }
    private string GetOTP(int iOTPLength ) {
    string[] saAllowedCharacters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };


             string sOTP = String.Empty;  
  
             string sTempChars = String.Empty;  
  
             Random rand = new Random();  
  
             for (int i = 0; i < iOTPLength; i++)  
             {  
  
                 int p = rand.Next(0, saAllowedCharacters.Length);  
  
                sTempChars = saAllowedCharacters[rand.Next(0, saAllowedCharacters.Length)];  
  
                 sOTP += sTempChars;  
  
             }  
  
        return sOTP;  
  
    }


    protected void SendOtpBtn_Click(object sender, EventArgs e)
    {

        if(email.Text.Contains('@'))
        {
            string otp = GetOTP(4);
            Response.Cookies["OTP"].Value = otp;

            String EmailBody = "Hi,USER ,<br/><br/>Your OTP is " + otp + ".To open a new Variables Account!";

            SendMail(email.Text, EmailBody);
            Response.Write("<script>alert('OTP sended to your Email')</script>");
            maincontent.Visible = true;

        }
        else
        {
            Response.Write("<script>alert('Check your Email')</script>");


        }


    }

    private void SendMail(String Email, String EmailBody)
    {
        // email send process -
        String ToEmailAddress = Email;
        MailMessage PassRecMail = new MailMessage("YourEmailAddress", ToEmailAddress);
        PassRecMail.Body = EmailBody;
        PassRecMail.IsBodyHtml = true;
        PassRecMail.Subject = "OTP";

        using (SmtpClient client = new SmtpClient())
        {
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("YourEmailAddress", "GmailAppCode");
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(PassRecMail);

        }

    }

}
