using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            BindProductRptr();
        }
    }
    private void BindProductRptr()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT Top 4* FROM ProductDataTbl P join BrandNameTbl B on B.Id=P.ProductBrandId CROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.ProductId ORDER BY I.PId DESC)I ORDER BY P.ProductId DESC", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
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