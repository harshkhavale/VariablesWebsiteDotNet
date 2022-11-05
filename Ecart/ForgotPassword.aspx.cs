using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//for sql 
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
//for mail sending
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void recoverySend_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM UserData where email = @email", con);
            cmd.Parameters.AddWithValue("@email", recoveryEmail.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][6]);
                SqlCommand cmd2 = new SqlCommand("INSERT INTO ForgotPassword(id,uid,RequestDateTime) VALUES('" + myGUID + "','" + Uid + "',GETDATE())", con);
                cmd2.ExecuteNonQuery();


                // email send process -
                String ToEmailAddress = dt.Rows[0][4].ToString();
                String Username = dt.Rows[0][0].ToString();
                String EmailBody = "Hi , " + Username + " ,<br/><br/>Click the link below to reset your Password<br/>http://localhost:50798/RecoverPassword.aspx?id=" + myGUID;
                MailMessage PassRecMail = new MailMessage("variables.pvt.lmt@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("variables.pvt.lmt@gmail.com", "wjzetlselrriunzq");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(PassRecMail);

                }



                Response.Write("<script>alert('your password reset link is sended to your gmail kindly check !')</script>");

                MsgLabel.Text = "your password reset link is sended to your gmail kindly check !";
                recoveryEmail.Text = String.Empty;


            }
            else
            {
                MsgLabel.ForeColor = System.Drawing.Color.Red;
                Response.Write("<script>alert('oops this email does not exist')</script>");

                MsgLabel.Text = "oops this email does not exist";
                MsgLabel.ForeColor = System.Drawing.Color.Green;
                recoveryEmail.Focus();

            }
        }





    }

}