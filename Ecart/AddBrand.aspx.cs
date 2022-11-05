using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddDropDowns : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddBrandName.Focus();

        if (!IsPostBack) {
            BindBrandRepeater();
        }
       
           
        
    }

    protected void AddBrandNameBtn_Click(object sender, EventArgs e)
    {
      
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into BrandNameTbl(BrandName) VALUES('" + AddBrandName.Text + "')", con);
                cmd.ExecuteNonQuery();
                AddBrandName.Text = String.Empty;
                AddBrandName.Focus();
                con.Close();
                Response.Redirect("~/AddBrand.aspx");
                Response.Write("<script>alert('Brand Added succefully')</script>");

        }


    }
    private void BindBrandRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM BrandNameTbl", con))
            {
                using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    RepeaterBrands.DataSource = dt;
                    RepeaterBrands.DataBind();
                }


            }
        }

    }
}