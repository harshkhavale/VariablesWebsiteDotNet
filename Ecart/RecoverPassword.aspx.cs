using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class RecoverPassword : System.Web.UI.Page
{
    String GUIDvalue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        NewPasswordText.Focus();
        
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            GUIDvalue = Request.QueryString["id"];
            if (GUIDvalue != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM ForgotPassword WHERE id=@id", con);
                cmd.Parameters.AddWithValue("@id", GUIDvalue);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);

                }
                else
                {
                    Response.Write("<script>alert('Your Password Reset link is expired or Invalid')</script>");



                }

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }


        }
        if (!IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                lblNewPassword.Visible = true;
                lblConfirmPassword.Visible = true;
                NewPasswordText.Visible = true;
                ConfirmPasswordTxt.Visible = true;
                ResetPasswordBtn.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Your Password Reset link is expired or Invalid')</script>");

            }
        }

    }
    protected void ResetPasswordBtn_Click(object sender, EventArgs e)
    {
        using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con2.Open();
            SqlCommand cmd2 = new SqlCommand("UPDATE UserData SET password=@psw,confirmpassword=@psw WHERE id=@id", con2);
            cmd2.Parameters.AddWithValue("@id", Uid);
            cmd2.Parameters.AddWithValue("@psw", NewPasswordText.Text);

            cmd2.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand("DELETE FROM ForgotPassword WHERE uid='" + Uid + "'", con2);
            cmd3.ExecuteNonQuery();
            Response.Write("<script>alert('SuccessFully Changed your password')</script>");

            Response.Redirect("~/SignInPage.aspx");
        }
    }
}