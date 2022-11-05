using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddCategoryTextBox.Focus();
        if (!IsPostBack)
        {
            BindCatRepeater();
        }

    }

    protected void AddCategoryBtn_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into CatTbl(CategoryName) values('" + AddCategoryTextBox.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Category added successfully!')</script>");
            AddCategoryTextBox.Text = String.Empty;
            AddCategoryTextBox.Focus();
            con.Close();
            Response.Redirect("~/AddCategory.aspx");
        }
    }

    private void BindCatRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM CatTbl", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
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