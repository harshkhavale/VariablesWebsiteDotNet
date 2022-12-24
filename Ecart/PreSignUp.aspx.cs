using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PreSignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        email.Focus();
        maincontent.Visible = false;
      
    }

    protected void SendOtpBtn_Click(object sender, EventArgs e)
    {
        if (email.Text.Contains('@'))
        {
            string otp = GetOTP(4);
            Response.Cookies["OTP"].Value = otp;

            String EmailBody = "Hi,USER ,<br/><br/>Your OTP is " + otp + ".To open a new Variables Account!";

            SendMail(email.Text, EmailBody);
            Response.Write("<script>alert('OTP sended to '"+email.Text+"')</script>");
            precontent.Visible = false;
            maincontent.Visible = true;
            show.InnerText= "OTP has sended to '" + email.Text + "'";

        }
        else
        {
            Response.Write("<script>alert('Check your Email')</script>");


        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (OTP.Text == Request.Cookies["OTP"].Value)
        {
            Response.Redirect("/SignUpPage.aspx?email="+email.Text+"");
        }
        else
        {
            Response.Write("<script>alert('Wrong OPT entered')</script>");
            maincontent.Visible = true;

        }

    }
    private string GetOTP(int iOTPLength)
    {
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
    private void SendMail(String Email, String EmailBody)
    {
        // email send process -
        String ToEmailAddress = Email;
        MailMessage PassRecMail = new MailMessage("variables.pvt.lmt@gmail.com", ToEmailAddress);
        PassRecMail.Body = EmailBody;
        PassRecMail.IsBodyHtml = true;
        PassRecMail.Subject = "OTP";

        using (SmtpClient client = new SmtpClient())
        {
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("variables.pvt.lmt@gmail.com", "fukuybeacaxmzhoe");
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(PassRecMail);

        }

    }
}