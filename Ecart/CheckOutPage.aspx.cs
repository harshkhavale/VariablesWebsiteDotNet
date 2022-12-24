using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Razorpay.Api;
using System.Net.Mail;
using System.Net;



public partial class CheckOutPage : System.Web.UI.Page
{
    public string orderId;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"]==null)
        {
            Response.Redirect("~/SignInPage.aspx");
        }
        if (!IsPostBack)
        {

            UserIdLbl.InnerText = Session["username"].ToString();
            CustAddressLbl.InnerText = Request.QueryString["CustAddress"].ToString();
            CustNameLbl.InnerText = Request.QueryString["CustName"].ToString();
            CustMonoLbl.InnerText = Request.QueryString["CustMono"].ToString();
            CustPincodeLbl.InnerText = Request.QueryString["CustPincode"].ToString();
            Email.InnerText = Request.QueryString["CustEmail"].ToString();








            BindProductRptr();
            SellProduct();


           
        }
        

        Dictionary<string, object> input = new Dictionary<string, object>();
        input.Add("amount", 100); // this amount should be same as transaction amount
        input.Add("currency", "INR");
        input.Add("receipt", "12121");
        input.Add("payment_capture", 1);
        string key = "rzp_test_ilcuZJqoFxPDxu";
        string secret = "6Gc8tLUFLgm28SqA1pXNYe7M";

        RazorpayClient client = new RazorpayClient(key, secret);

        Razorpay.Api.Order order = client.Order.Create(input);
        orderId = order["id"].ToString();

    }
    private void BindProductRptr()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            if (Request.QueryString["BuyAll"] == "true")
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM UserCartTbl P \r\njoin ProductDataTbl PD on P.PId = PD.ProductId\r\njoin BrandNameTbl B on B.Id = PD.ProductBrandId\r\nCROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.PId ORDER BY I.PId DESC)I\r\nwhere P.UserName = '" + Session["username"].ToString() + "'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        productname.Text = dt.Rows[0][5].ToString();
                        sellingprice.Text = dt.Rows[0][7].ToString();

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
                        productrptr.DataSource = dt;
                        productrptr.DataBind();
                    }
                }

            }
           
        }
    }
    private void SellProduct()
    {
        String UserName = Session["username"].ToString();
        String CustomerName = Request.QueryString["CustName"].ToString();
        String CustomerAddress = Request.QueryString["CustAddress"].ToString();
        String CustomerPincode = Request.QueryString["CustPincode"].ToString();
        String CustomerMono = Request.QueryString["CustMono"].ToString();
        String CustomerEmail = Request.QueryString["CustEmail"].ToString();
       
        if (Request.QueryString["BuyAll"] == "true")
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                int PID;
               
                con.Open();
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM UserCartTbl where UserName='" + Session["username"] + "'", con);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd3))
                {
                    DataTable dt9 = new DataTable();
                    sda.Fill(dt9);
                    for (int i = 0; i < dt9.Rows.Count; i++)
                    {
                        PID = Convert.ToInt32(dt9.Rows[i][1]);



                        SqlCommand cmd = new SqlCommand("INSERT INTO ProductsDeliveryTbl VALUES('" + PID + "',GETDATE(),'" + UserName + "','" + CustomerAddress + "','" + CustomerPincode + "','" + CustomerMono + "','" + CustomerName + "','Online')", con);
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd1 = new SqlCommand("delete from UserCartTbl where PId = '" + PID + "'", con);
                        cmd1.ExecuteNonQuery();
                        String EmailBody = "Hi , " + UserName + " ,<br/><br/>your Order has been SUCCESSFULLY approved for shipping<br/>Product Name : " + productname.Text + "<br/>Price : " + sellingprice.Text + "<br/>To Address<br/>" + CustomerAddress + " " + CustomerPincode + "<br/>To cancel order kindely login to Website<br/>Thank You!";

                        SendMail(CustomerEmail, UserName, EmailBody);
                    }
                    con.Close();

                }




                
            }

        }
        else
        {
            String ProductName = Request.QueryString["ProductName"].ToString();
            String SellingPrice = Request.QueryString["Price"].ToString();

            int PID = Convert.ToInt32(Request.QueryString["PID"]);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO ProductsDeliveryTbl VALUES('" + PID + "',GETDATE(),'" + UserName + "','" + CustomerAddress + "','" + CustomerPincode + "','" + CustomerMono + "','" + CustomerName + "','Online')", con);
                cmd.ExecuteNonQuery();
                SqlCommand cmd1 = new SqlCommand("delete from UserCartTbl where PId = '" + PID + "'", con);
                cmd1.ExecuteNonQuery();
                String EmailBody = "Hi , " + UserName + " ,<br/><br/>your Order has been SUCCESSFULLY approved for shipping<br/>Product Name : " + ProductName + "<br/>Price : " + SellingPrice + "<br/>To Address<br/>" + CustomerAddress + " " + CustomerPincode + "<br/>To cancel order kindely login to Website<br/>Thank You!";

                SendMail(CustomerEmail, UserName, EmailBody);
                con.Close();

            }
        }
        
    }
    private void SendMail(String Email, String UserName, String EmailBody)
    {
        // email send process -
        String ToEmailAddress = Email;
        String Username = UserName;
        MailMessage PassRecMail = new MailMessage("variables.pvt.lmt@gmail.com", ToEmailAddress);
        PassRecMail.Body = EmailBody;
        PassRecMail.IsBodyHtml = true;
        PassRecMail.Subject = "Order Approved!";

        using (SmtpClient client = new SmtpClient())
        {
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("variables.pvt.lmt@gmail.com", "fukuybeacaxmzhoe");
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(PassRecMail);

        }

    }

}