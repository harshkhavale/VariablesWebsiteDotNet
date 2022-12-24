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
       username.Focus();

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
       
        
            if (isFormvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    String email = Request.QueryString["email"];
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO UserData(username,password,confirmpassword,fullname,email,usertype,mobileno) VALUES('" + username.Text + "','" + password.Text + "','" + confirmpassword.Text + "','" + fullname.Text + "','" + email + "','user','"+mobileno.Text+"')", con);

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

        


        void clr()
        {
            username.Text = String.Empty;
            password.Text = String.Empty;
            confirmpassword.Text = String.Empty;
            fullname.Text = String.Empty;
           
            mobileno.Text = String.Empty ;

        }

       








    }
    


   
    

}