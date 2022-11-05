using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ProductsShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRptr();
        }
    }
    
    protected void logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
        Session["username"] = null;
    }
    private void BindProductRptr()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("BindAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    productrptr.DataSource = dt;
                    productrptr.DataBind();
                }
            }
        }
    }


    
    

    
}