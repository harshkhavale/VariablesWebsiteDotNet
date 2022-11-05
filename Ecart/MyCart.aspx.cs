using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Reflection;

public partial class MyCart : System.Web.UI.Page
{
    DataTable dt0 = new DataTable();
    string pids;
    protected void Page_Load(object sender, EventArgs e)
    {
        usrcartlbl.InnerText = Session["username"].ToString() + "'s Cart";
        GetCartItems();
        
    }
   

    protected void RemoveItem_Click(object sender, EventArgs e)
    {
       
            Button btn = (Button)sender;
       
        
        

    }
    


    private void GetCartItems()
    {

        using (SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            Int64 TotalSellingPrice = 0;
            Int64 TotalPrice = 0;
            String usrnm = Session["username"].ToString();
            if(usrnm != null)
            {
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("EXEC BindCart @usrnm = '" + usrnm + "'", con1);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                {
                    sda.Fill(dt0);
                    CartItmRptr.DataSource = dt0;
                    CartItmRptr.DataBind();

                    string[] arr = new string[dt0.Rows.Count];
                    for (int i = 0; i < dt0.Rows.Count; i++)
                    {
                        Int64 PID = Convert.ToInt64(dt0.Rows[i]["ProductId"]);
                        arr[i] = PID.ToString();
                        TotalPrice += Convert.ToInt64(dt0.Rows[i]["ProductPrice"]);
                        TotalSellingPrice += Convert.ToInt64(dt0.Rows[i]["ProductSellingPrice"]);
                        pids += arr[i].ToString()+",";

                    }
                    ProductNumLbl.InnerText = dt0.Rows.Count.ToString();
                    TotalPricelbl.InnerText = " ₹ " + TotalPrice.ToString();
                    TotalSellingPricelbl.InnerText = " ₹ " + TotalSellingPrice.ToString();
                    


                }
                con1.Close();
            }
            


        }
    }

    protected void CartItmRptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        using (SqlConnection con5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            SqlCommand cmd5 = new SqlCommand("DELETE FROM UserCartTbl WHERE PId = '" + index + "'AND UserName='" + Session["username"] +"'", con5);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd5))
            {
                DataTable dt2 = new DataTable();
                sda.Fill(dt2);
                CartItmRptr.DataSource = dt2;
                CartItmRptr.DataBind();
                

            }

            Response.Redirect("~/MyCart.aspx");
        }

    }

    protected void CancelOrderBtn_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
    }





    protected void BuyAllBtn_Click(object sender, EventArgs e)
    {
        if(dt0.Rows.Count == 0)
        {
            cartstatus.InnerText = "EMPTY";
            CartItmRptr.DataSource = null;
            
        }
        else
        {
            Response.Redirect("~/PaymentPage.aspx?PID=all&BuyAll=true");

        }
    }
}