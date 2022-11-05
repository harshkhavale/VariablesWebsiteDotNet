<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserAccount.aspx.cs" Inherits="UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container " style="font-family: 'Quicksand', sans-serif;">
        <div class="d-flex justify-content-center my-4">
         <svg xmlns="http://www.w3.org/2000/svg" width="150" height="150" fill="currentColor" class="bi bi-person-circle my-2 mx-3" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg>


        </div>
            <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" id="usrcartlbl" runat="server" class="my-4 badge bg-warning ">USER</h5>

       






       


      <div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        User Info
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
             <div>


             <div class="col-sm d-flex my-2">
      <asp:Label ID="Label2" runat="server" Text="Full Name"  class="form-label mx-2"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
         
    <asp:Label ID="FullNameLbl" runat="server" Text=""  class="form-label mx-2"
          Visible="True"></asp:Label>
&nbsp;
      </div>
   
  </div>

                <div class="col-sm d-flex my-2">
      <asp:Label ID="Label1" runat="server" Text="User Name"  class="form-label mx-2"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
           <asp:Label ID="UserNameLbl" runat="server" Text=""  class="form-label mx-2"
          Visible="True"></asp:Label>
      </div>
   
  </div>

                <div class="col-sm d-flex my-2">
      <asp:Label ID="Label3" runat="server" Text="Email"  class="form-label mx-2"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
           <asp:Label ID="EmailLbl" runat="server" Text=""  class="form-label mx-2"
          Visible="True"></asp:Label>
      </div>
   
  </div>
                  <div class="col-sm d-flex my-2">
      <asp:Label ID="Label7" runat="server" Text="Mobile No."  class="form-label mx-2"
          Visible="True"></asp:Label>
             <br />
      
&nbsp;<div class="col-4">
           <asp:Label ID="MobileNo" runat="server" Text=""  class="form-label mx-2"
          Visible="True"></asp:Label>
      </div>
   
  </div>
            <div class="col-sm d-flex">     
      <asp:Label ID="PassLbl" runat="server" Text="" class="form-label"
          Visible="False"></asp:Label>
             </div>
      
&nbsp;
  
             
        </div>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Change Password
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
            <div>
            <div class="col-sm d-flex my-2">
      <asp:Label ID="Label4" runat="server" Text="Current Password"  class="form-label col-2"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-4">
          <asp:TextBox ID="oldpassword"  TextMode="Password"  class="form-control mx-3" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
              ControlToValidate="oldpassword" ErrorMessage="password cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
            <div class="col-sm d-flex my-2">
      <asp:Label ID="Label5" runat="server" Text="New Password"  class="form-label col-2"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-4">
          <asp:TextBox ID="newpassword" TextMode="Password" class="form-control mx-3" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
              ControlToValidate="newpassword" ErrorMessage="password cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
                 <div class="col-sm d-flex my-2">
      <asp:Label ID="Label6" runat="server" Text="Confirm Password"  class="form-label col-2"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-4">
          <asp:TextBox ID="confirmpassword" TextMode="Password" class="form-control mx-3" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
              ControlToValidate="confirmpassword" ErrorMessage="password cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
           <asp:Button ID="ChangePasswordBtn" OnClick="ChangePasswordBtn_Click" UseSubmitBehavior="False" class="btn btn-md btn-primary my-4" runat="server" Text="change password" 
                        />
                <asp:Label ID="msg" runat="server" CssClass="text-danger" Text=""></asp:Label>
              </div>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Orders
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">

          <div class="col-10 container " id="Purchased" runat="server" style="font-family: 'Quicksand', sans-serif;">
      <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;"  id="H1" runat="server" class="my-4 badge text-dark bg-warning mx-4">ORDERED PRODUCT'S</h5>

             <asp:Repeater ID="PurchaseRptr" OnItemCommand="PurchaseRptr_ItemCommand" runat="server">
                 <ItemTemplate>

                             <div class="row d-flex border rounded  flex-md-row mb-4 shadow-sm h-md-250 " style="display:flex">

                                 <div class="col-auto d-none d-lg-block mx-3 my-3">
          <img class="bd-placeholder-img" style="width:20vw" src="Img/ProductImg/<%#Eval("ProductId") %>/<%# Eval("Name")%><%# Eval("Extention") %>" alt="<%#Eval("Name") %>"/>          

        </div>
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary"><%#Eval("BrandName") %></strong>
          <h3 class="mb-0"><%#Eval("ProductName") %></h3>
          <h6 class="mb-1 text-muted text-danger" style="text-decoration:line-through;color:red">₹ <%#Eval("ProductPrice") %></h6>
                      <h3 class="mb-0 " > ₹ <%#Eval("ProductSellingPrice") %></h3>
            <br />
            <h5>TO</h5>
            <h3 class="d-inline-block mb-2 text-primary"><%#Eval("CustomerName") %></h3>
          <h3 class="mb-0"><%#Eval("CustomerAddress") %>  ,  <%#Eval("CustomerPincode") %></h3>
                      <h3 class="mb-0 " > Payment Mode : <%#Eval("PaymentType") %></h3>

            <br />
            <br />
            <div class="d-flex justify-content-center">
                <asp:Button ID="CancelOrderBtn" runat="server" OnClick="CancelOrderBtn_Click" CssClass="btn btn-danger btn-sm rounded-1 mx-4"  CommandArgument='<%# Eval("ProductId") %>' Text="cancel order" UseSubmitBehavior="False" CausesValidation="false"/>
                </div>
        </div>
       
      </div>
                                                         

                     
                 </ItemTemplate>
             </asp:Repeater>
                              <asp:Label ID="msg2" runat="server" CssClass="text-danger" Text=""></asp:Label>

             
             </div>


      </div>
    </div>
  </div>
</div>





        
    </div>
</asp:Content>

