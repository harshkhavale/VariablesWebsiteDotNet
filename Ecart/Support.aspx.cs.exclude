using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Support : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SuggestionsTextBox.Focus();
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into SuggestionTbl values('" + SuggestionsTextBox.Text + "','" + Session["username"] +"')", con);
            cmd.ExecuteNonQuery();
            
            SuggestionsTextBox.Text = String.Empty;
            con.Close();
        }
    }
}