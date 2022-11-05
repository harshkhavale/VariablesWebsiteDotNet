using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class ViewMore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        reviewlbl.InnerText = "";

        BindProductImgRptr();
        BindProductDetails();
        BindReview();
    }
    private void BindProductImgRptr()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con1.Open();
            using (SqlCommand cmd1 = new SqlCommand("SELECT * FROM ProductImgTbl WHERE PID= '"+PID+"'", con1))
            {
                cmd1.CommandType = CommandType.Text;
                using (SqlDataAdapter sda1 = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    ImgRptr.DataSource = dt1;
                    ImgRptr.DataBind();
                }
            }
        }
    }
    private void BindProductDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con2.Open();
            using (SqlCommand cmd2 = new SqlCommand("SELECT * FROM ProductDataTbl WHERE ProductId= '" + PID + "'", con2))
            {
                cmd2.CommandType = CommandType.Text;
                using (SqlDataAdapter sda2 = new SqlDataAdapter(cmd2))
                {
                    DataTable dt2 = new DataTable();
                    sda2.Fill(dt2);
                    ProductDetailsRptr.DataSource = dt2;
                    ProductDetailsRptr.DataBind();
                }
            }
        }
    }
    protected String GetActiveImgClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";

        }
    }
    private void BindReview()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con2.Open();
            using (SqlCommand cmd2 = new SqlCommand("SELECT DISTINCT * FROM ReviewTbl WHERE ProductID= '" + PID + "'", con2))
            {
                cmd2.CommandType = CommandType.Text;
                using (SqlDataAdapter sda2 = new SqlDataAdapter(cmd2))
                {
                    DataTable dt2 = new DataTable();
                    sda2.Fill(dt2);
                    if (dt2.Rows.Count != 0)
                    {
                        ReviewRptr.DataSource = dt2;
                        ReviewRptr.DataBind();
                    }
                    else
                    {
                        ReviewRptr.DataSource = null;
                        reviewlbl.InnerText = "no review's yet";
                    }

                }
            }
        }
    }


    protected void AddToCartBtn_Click1(object sender, EventArgs e)
    {
        AddToCart();
        Response.Write("<script>alert('Added to Cart')</script>");




    }
    private void AddToCart()
    {

        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con5.Open();
            SqlCommand cmd5 = new SqlCommand("INSERT INTO UserCartTbl VALUES('" + PID + "' ,GETDATE(), '" + Session["username"].ToString() + "')", con5);
            cmd5.ExecuteNonQuery();
            con5.Close();
            var master = Master as User;
            if(master != null)
            {
                master.BindCartNumber();
            }
            
        }
    }

    protected void BuyNowBtn_Click(object sender, EventArgs e)
    {
        String PID = Request.QueryString["PID"].ToString();
        Response.Redirect("~/PaymentPage.aspx?PID="+PID);
    }

    

    protected void SubmitReview_Click1(object sender, EventArgs e)
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con7 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con7.Open();
            SqlCommand cmd5 = new SqlCommand("INSERT INTO ReviewTbl VALUES('" + PID + "', '" + Session["username"].ToString() + "' ,GETDATE(),'"+ReviewTextBox.Text+"')", con7);
            cmd5.ExecuteNonQuery();
            con7.Close();
           

        }
        ReviewTextBox.Text = String.Empty;
        Response.Write("<script>alert('Review submitted successfully! Thanks for your contribution.')</script>");
        String PID2 = Request.QueryString["PID"].ToString();
        Response.Redirect("~/ViewMore.aspx?PID=" + PID2);

        BindReview();
        
        

    }
}