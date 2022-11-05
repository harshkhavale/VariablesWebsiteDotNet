using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

public partial class UserAccount : System.Web.UI.Page
{
    DataTable dt50 = new DataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            BindUser();
            BindPurchase();
        }

    }
    private void BindPurchase()
    {
        using (SqlConnection con5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            SqlCommand cmd5 = new SqlCommand("SELECT DISTINCT * FROM ProductsDeliveryTbl P\r\ninner join ProductDataTbl PD on PD.ProductId=P.ProductID\r\ninner join BrandNameTbl B on PD.ProductBrandId=B.Id\r\nCROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.ProductId ORDER BY I.PId DESC)I\r\nWHERE UserName='" + Session["username"] + "'", con5);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd5))
            {
                DataTable dt2 = new DataTable();
                sda.Fill(dt2);
                if (dt2.Rows.Count != 0)
                {
                    H1.Visible = true;

                    Purchased.Disabled = false;
                    PurchaseRptr.DataSource = dt2;
                    PurchaseRptr.DataBind();
                }
                else
                {
                    msg2.Text = "EMPTY";
                    Purchased.Disabled = true;

                    H1.Visible = false;
                    PurchaseRptr.DataSource = null;

                }
            }
            con5.Close();
        }

    }
    private void BindUser()
    {

        using (SqlConnection con7 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            SqlCommand cmd5 = new SqlCommand("SELECT * FROM UserData WHERE username='" + Session["username"] +"'", con7);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd5))
            {
               
                sda.Fill(dt50);
               

            }
            if(dt50.Rows.Count != 0)
            {
                UserNameLbl.Text = dt50.Rows[0][0].ToString();
                FullNameLbl.Text = dt50.Rows[0][3].ToString();
                EmailLbl.Text = dt50.Rows[0][4].ToString();
                MobileNo.Text = dt50.Rows[0][7].ToString();
                PassLbl.Text = dt50.Rows[0][1].ToString();
                
            }
            else
            {
                Response.Redirect("~/SignInPage.aspx");
            }


            con7.Close(); 
        }
    }
    protected void CancelOrderBtn_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
    }

    protected void PurchaseRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        using (SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            SqlCommand cmd5 = new SqlCommand("DELETE FROM ProductsDeliveryTbl WHERE ProductID = '" + index + "'AND UserName='" + Session["username"] + "'", con3);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd5))
            {
                DataTable dt2 = new DataTable();
                sda.Fill(dt2);
                PurchaseRptr.DataSource = dt2;
                PurchaseRptr.DataBind();

            }

            Response.Redirect("~/UserAccount.aspx");
            con3.Close();
        }
    }


    protected void ChangePasswordBtn_Click(object sender, EventArgs e)
    {
         if (oldpassword.Text == PassLbl.Text )
            {
                if (newpassword.Text == confirmpassword.Text)
                {

                    using (SqlConnection con5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                    con5.Open();
                        SqlCommand cmd5 = new SqlCommand("UPDATE UserData SET password='" + newpassword.Text + "',confirmpassword='" + confirmpassword.Text + "' where username='" + Session["username"].ToString() + "'", con5);
                        cmd5.ExecuteNonQuery();


                        con5.Close();

                    }
                    newpassword.Text = String.Empty;
                    confirmpassword.Text = String.Empty;
                }
                else
                {
                    msg.Text = "new password and confirm password are not same";

                    newpassword.Focus();
                }
            }
         else
         {
                msg.Text = "wrong password 1";
                oldpassword.Focus();
         }
        
        
    }
}