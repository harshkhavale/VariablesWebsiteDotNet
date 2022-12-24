using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"]== null)
        {
            Response.Redirect("~/SignInPage.aspx");
        }
        else
        {
            BindCartNumber();

        }


    }
    protected void logout_Click(object sender, EventArgs e)
    {
                Session["username"] = null;

        Response.Redirect("~/Default.aspx");
    }


    public void BindCartNumber()
    {
        String usrnm = Session["username"].ToString();
        int TotalCartProducts = 0;
        if (usrnm != null)
        {
            using(SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("EXEC BindCart @usrnm = '" + usrnm + "'", con1);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    TotalCartProducts = dt.Rows.Count;
                    ProductCountlbl.InnerText = TotalCartProducts.ToString();
                    


                }

            }
        }
                   

                   
            
        
        
    }   
        

               
        
}
