<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="PaymentPage.aspx.cs" Inherits="PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    


    <div class="container my-4 w-100 h-100 sticky-top" style="font-family: 'Quicksand', sans-serif;">

<div class="row my-3">
   <div class="col-4 position-fixed start-0">
                               <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-2 ">PAYMENT</h5>

    <div id="list-example" class="list-group">
      <a class="list-group-item list-group-item-action" href="#list-item-1">Enter Details</a>
      <a class="list-group-item list-group-item-action" href="#list-item-2">Select Payment Mode</a>
      <a class="list-group-item list-group-item-action" href="#list-item-3">Product-Summary</a>
      <a class="list-group-item list-group-item-action" href="#list-item-4">Proceed</a>
    </div>
  </div>
  <div class="col-8  position-absolute end-0" >
     
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
      
        <h4 id="list-item-1" class="my-4">Enter Details</h4>
      
      



            <div class="col-sm">
      <asp:Label ID="Label2" runat="server" Text="Enter Name"  class="form-label"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
          <asp:TextBox ID="CustName" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
              ControlToValidate="CustName" ErrorMessage="Check Cust Name" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>





           <div class="col-sm">
      <asp:Label ID="Label1" runat="server" Text="Enter Complete Address"  class="form-label"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
          <asp:TextBox ID="CustAddress" TextMode="MultiLine" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="CustAddress" ErrorMessage="Check Address" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>

           <div class="col-sm">
      <asp:Label ID="Label3" runat="server" Text="Enter PinCode"  class="form-label"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-2">
          <asp:TextBox ID="CustPincode" TextMode="Number" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
              ControlToValidate="CustPinCode" ErrorMessage="Check Pincode" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>



           <div class="col-sm">
      <asp:Label ID="Label4" runat="server" Text="Enter Mobile-Number"  class="form-label"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-3">
          <asp:TextBox ID="CustMono" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
              ControlToValidate="CustMono" ErrorMessage="Check Mobile-Number" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>

         <div class="col-sm">
      <asp:Label ID="Label5" runat="server" Text="Enter Email"  class="form-label"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-3">
          <asp:TextBox ID="CustEmail" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
              ControlToValidate="CustEmail" ErrorMessage="Check Email" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
          






     



      <h4 id="list-item-2" class="my-4">Select Payment Method</h4>
        
      <div class=" btn btn-lg my-4 mx-2 bg-danger text-light">
            <input class="form-check-input" type="checkbox" name="PaymentMode" ID="CashOnDeliveryRadio" runat="server" value="" aria-label="...">

                                   <label class="form-check-label" for="CashOnDeliveryRadio">Cash On Delivery</label>

</div>
        
         <div class=" btn btn-lg bg-danger mx-2 my-4 text-light">
                               <input class="form-check-input " type="checkbox" name="PaymentMode" ID="OnlinePaymentRadio" runat="server" value="" aria-label="...">

                                   <label class="form-check-label" for="CashOnPaymentRadio">Online Payment</label>



</div>
        <asp:Label ID="RadioLbl" runat="server" Text="" ForeColor="#FF3300"></asp:Label>
       
      <h4 id="list-item-3" class="my-4">Product-Summary</h4>
        <br />
      <div class="row">
                      <asp:Repeater ID="productrptr" runat="server">
                <ItemTemplate>
                    
                     <div class="card mx-3 mb-4" style="width: 15rem">
                       
  <img src="Img/ProductImg/<%#Eval("ProductId") %>/<%# Eval("Name")%><%# Eval("Extention") %>" class="card-img-top h-50" alt="<%#Eval("Name") %>">
  <div class="card-body ">
      <div class="position-relative start-0 " >

      <p class="card-text b-0 text-primary"><%#Eval("BrandName") %></p>
    <h5 class="card-title"><%#Eval("ProductName") %></h5>
      
          <br />
          </div>
      <br />
      <div class="position-absolute bottom-0 start-0 mx-4">
          <h3  > ₹ <%#Eval("ProductSellingPrice","{0:000,0}") %></h3>
    <h4 class="badge bg-primary">Discount ₹  <%#String.Format("{0}",Convert.ToInt64(Eval("ProductPrice"))-Convert.ToInt64(Eval("ProductSellingPrice")))%></h4>
          </div>
  </div>
                             
                             
</div>
                    <br />
                    <br />
                       

                </ItemTemplate>
            </asp:Repeater>
          


          <asp:Label ID="productname" Visible="false" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="sellingprice" Visible="false" runat="server" Text="Label"></asp:Label>


      </div>
      <h4 id="list-item-4">Proceed Payment</h4>
                                

        <div class="my-4 mx-4">
          <asp:Button ID="ProcessPayment"  OnClick="ProcessPayment_Click" class="btn btn-md btn-success my-4" runat="server" Text="Process Payment" />
           
            </div>


    </div>
  </div>
   
</div>
                <div id="num" class="hidden" runat="server"></div>

       
  
    
  

        <script>
           
            
        </script>

        </div>
    
        
   
</asp:Content>

