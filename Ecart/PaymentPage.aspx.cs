using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;

public partial class PaymentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            RadioLbl.Visible = false;
            
            BindProductRptr();
        }
       
    }

    protected void ProcessPayment_Click(object sender, EventArgs e)
    {
        String UserName = Session["username"].ToString();
        String CustomerName = CustName.Text;
        String CustomerAddress = CustAddress.Text;
        String CustomerPincode = CustPincode.Text;
        String CustomerMono = CustMono.Text;
        String CustomerEmail = CustEmail.Text;
        String ProductName = productname.Text;
        String SellingPrice = sellingprice.Text;
        if (Request.QueryString["PID"]=="all")
        {
            if (OnlinePaymentRadio.Checked == true)
            {
                
                Response.Redirect("~/CheckOutPage.aspx?PID=All&CustName=" + CustomerName + "&CustAddress=" + CustomerAddress + "&CustPincode=" + CustomerPincode + "&CustMono=" + CustomerMono + "&CustEmail=" + CustomerEmail + "&BuyAll=true&ProductName=CART&Price=0");

            }
            if (CashOnDeliveryRadio.Checked == true)
            {
                RadioLbl.Visible = false;

                int PID;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    con.Open();
                    SqlCommand cmd3 = new SqlCommand("SELECT * FROM UserCartTbl where UserName='" + Session["username"] + "'", con);
                    using(SqlDataAdapter sda = new SqlDataAdapter(cmd3))
                    {
                        DataTable dt9 = new DataTable();
                        sda.Fill(dt9);
                        for(int i = 0; i < dt9.Rows.Count; i++)
                        {
                            PID = Convert.ToInt32(dt9.Rows[i][1]);

                            SqlCommand cmd = new SqlCommand("INSERT INTO ProductsDeliveryTbl VALUES('" + PID + "',GETDATE(),'" + UserName + "','" + CustomerAddress + "','" + CustomerPincode + "','" + CustomerMono + "','" + CustomerName + "','COD')", con);
                            cmd.ExecuteNonQuery();
                            SqlCommand cmd1 = new SqlCommand("delete from UserCartTbl where PId = '" + PID + "'", con);
                            cmd1.ExecuteNonQuery();
                            String EmailBody = "Hi , " + UserName + " ,<br/><br/>your Order has been SUCCESSFULLY approved for shipping<br/>Product Name : " + ProductName + "<br/>Price : " + SellingPrice + "<br/>To Address<br/>" + CustomerAddress + " " + CustomerPincode + "<br/>To cancel order kindely login to Website<br/>Thank You!";

                            SendMail(CustomerEmail, UserName, EmailBody);

                        }
                        Response.Write("<script>alert('Cart Purchased')</script>");

                        con.Close();

                    }




                    clr();
                }
                Response.Redirect("~/MyCart.aspx");

            }

        }
        else
        {
            if (OnlinePaymentRadio.Checked == true && CashOnDeliveryRadio.Checked == true || OnlinePaymentRadio.Checked == false && CashOnDeliveryRadio.Checked == false)
            {
                Response.Write("<script>alert('Please Choose Only one option from Payment method')</script>");


            }
            else
            {
               

                if (OnlinePaymentRadio.Checked == true)
                {
                    String PID = Request.QueryString["PID"].ToString();

                    Response.Redirect("~/CheckOutPage.aspx?PID=" + PID + "&CustName=" + CustomerName + "&CustAddress=" + CustomerAddress + "&CustPincode=" + CustomerPincode + "&CustMono=" + CustomerMono + "&CustEmail=" + CustomerEmail + "&ProductName=" + ProductName + "&Price=" + SellingPrice + "");

                }
                if (CashOnDeliveryRadio.Checked == true)
                {
                    RadioLbl.Visible = false;

                    int PID = Convert.ToInt32(Request.QueryString["PID"]);

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO ProductsDeliveryTbl VALUES('" + PID + "',GETDATE(),'" + UserName + "','" + CustomerAddress + "','" + CustomerPincode + "','" + CustomerMono + "','" + CustomerName + "','COD')", con);
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd1 = new SqlCommand("delete from UserCartTbl where PId = '" + PID + "'", con);
                        cmd1.ExecuteNonQuery();
                        con.Close();
                        String EmailBody = "Hi , " + UserName + " ,<br/><br/>your Order has been SUCCESSFULLY approved for shipping<br/>Product Name : " + ProductName + "<br/>Price : " + SellingPrice + "<br/>To Address<br/>" + CustomerAddress + " " + CustomerPincode + "<br/>To cancel order kindely login to Website<br/>Thank You!";

                        SendMail(CustomerEmail, UserName, EmailBody);

                        clr();
                    }
                    Response.Write("<script>alert('Product Purchased')</script>");

                    Response.Redirect("~/MyCart.aspx");

                }

            }
        }

       
    }
    private void BindProductRptr()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            if (Request.QueryString["BuyAll"] == "true")
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM UserCartTbl P \r\njoin ProductDataTbl PD on P.PId = PD.ProductId\r\njoin BrandNameTbl B on B.Id = PD.ProductBrandId\r\nCROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.PId ORDER BY I.PId DESC)I\r\nwhere P.UserName = '" + Session["username"].ToString() +"'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        
                            productname.Text = dt.Rows[0][1].ToString();
                            sellingprice.Text = dt.Rows[0][3].ToString();

                            productrptr.DataSource = dt;
                            productrptr.DataBind();
                        


                    }
                }
            }
            else
            {
                int PID = Convert.ToInt32(Request.QueryString["PID"]);

                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM ProductDataTbl P join BrandNameTbl B on B.Id=P.ProductBrandId CROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.ProductId ORDER BY I.PId DESC)I Where P.ProductId = '" + PID + "'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        productname.Text = dt.Rows[0][1].ToString();
                        sellingprice.Text = dt.Rows[0][3].ToString();

                        productrptr.DataSource = dt;
                        productrptr.DataBind();
                    }
                }

            }
        }
    }
    private void clr()
    {
        CustAddress.Text = String.Empty;
        CustMono.Text = String.Empty;
        CustName.Text = String.Empty;
        CustPincode.Text = String.Empty;
        

    }
    private void SendMail(String Email,String UserName,String EmailBody)
    {
        // email send process -
        String ToEmailAddress = Email;
        String Username = UserName ;
        MailMessage PassRecMail = new MailMessage("variables.pvt.lmt@gmail.com", ToEmailAddress);
        PassRecMail.Body = EmailBody;
        PassRecMail.IsBodyHtml = true;
        PassRecMail.Subject = "Order Approved!";

        try {
            using (SmtpClient client = new SmtpClient())
            {
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("variables.pvt.lmt@gmail.com", "ehokofsqgllxkcsq");
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(PassRecMail);

            }
        }
        catch {
            Response.Write("<script>alert('Product Purchased but email failed')</script>");


        }


    }
}