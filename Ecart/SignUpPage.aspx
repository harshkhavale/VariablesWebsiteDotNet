<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="SignUpPage.aspx.cs" Inherits="SignUpPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

          <div class="container"  style="font-family: 'Quicksand', sans-serif;">
      <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-2 ">CREATE ACCOUNT</h5>
<br />
              <br />
              <div class="row">
              <div class="col-7 " id="content" runat="server">
                  <div id="precontent" runat="server">
                 <div class="d-flex col-sm p-4 ">

      <asp:Label ID="Label5" runat="server" Text="Email"  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-6 mx-4">
          <asp:TextBox ID="email" class="form-control "  runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
              ControlToValidate="email" ErrorMessage="Check Email" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>

         <asp:Button ID="SendOtpBtn" class="btn btn-sm btn-warning my-4 mx-4" runat="server" Text="Send OTP" UseSubmitBehavior="false" OnClick="SendOtpBtn_Click" CausesValidation="False" />
   
    
    <asp:Label ID="otpstat" runat="server" Text=""  class="form-label text-success "
          Visible="True"></asp:Label>

      </div>


                      
   
  </div>
                                    

                      </div>















                  <div id="maincontent" runat="server">
                      <div class="d-flex justify-content-around mx-4">
                 <div class="d-flex col-sm">
      <asp:Label ID="Label7" runat="server" Text="Enter OTP"  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-2 mx-4">
          <asp:TextBox ID="OTP" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
              ControlToValidate="OTP" ErrorMessage="Check OTP" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
    
              <asp:Label ID="otpstatus" runat="server" Text=""  class="form-label text-danger"
          Visible="True"></asp:Label>
      </div>
   
  </div>

                </div>
                    <div class="d-flex mx-4 justify-content-around">
                 <div class="col-sm d-flex">
      <asp:Label ID="Label1" runat="server" Text="UserName"  class="form-label col-3"
          Visible="True"></asp:Label>
             
     
&nbsp;<div class="col-6 mx-4">
          <asp:TextBox ID="username" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
              ControlToValidate="username" ErrorMessage="Check UserName" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
                </div>

              <div class="mx-4 d-flex justify-content-around">
                 <div class="col-sm d-flex">
      <asp:Label ID="Label2" runat="server" Text="Password"  class="form-label col-3"
          Visible="True"></asp:Label>
           
     
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="password" TextMode="Password" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="password" ErrorMessage="Check Password" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>

                </div>
                           

                  
                           <div class="d-flex mx-4 justify-content-around">
                 <div class="col-sm d-flex">
      <asp:Label ID="Label3" runat="server" Text="Confirm Password"  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="confirmpassword" TextMode="Password" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
              ControlToValidate="confirmpassword" ErrorMessage="Password and Confirm-Password are not same" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>

                </div>



                 <div class="mx-4 d-flex justify-content-around">
                 <div class="col-sm d-flex">
      <asp:Label ID="Label6" runat="server" Text="Mobile No."  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-6 mx-4">
          <asp:TextBox ID="mobileno" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
              ControlToValidate="mobileno" ErrorMessage="Check MobileNUmber" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
                </div>

              
              <div class=" mx-4 d-flex justify-content-around">
                 <div class="col-sm d-flex">
      <asp:Label ID="Label4" runat="server" Text="FullName"  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-6 mx-4">
          <asp:TextBox ID="fullname" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
              ControlToValidate="fullname" ErrorMessage="Check fullname" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>

                </div>
                        


              <div class="mx-2">
               <div class="d-flex  mx-4">
                  

                </div>
              
            
             




                  </div>







                  <asp:Button ID="SubmitBtn" class="btn btn-primary my-4 mx-4" runat="server" Text="Create Account" OnClick="SubmitBtn_Click" />
               <asp:HyperLink ID="HaveAccount" CssClass="mx-4" runat="server" 
                      NavigateUrl="~/SignInPage.aspx">Allready Have an Acoount</asp:HyperLink>
                            <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserData]"></asp:SqlDataSource>
                        <br />
              <br />
                       
                            <br />



                  </div>
                  </div>
              <div class="col-5 d-flex justify-content-center">
        <div class="container my-4" style="font-family: 'Quicksand', sans-serif">

         
        <div  style="padding-left:3vw" class="text-center my-4 p-4" >
        <img class="bd-placeholder-img card-img-top w-100  my-4"  src="img/logo.png" role="img" focusable="true"></></img>

        <div class="card-body">
          <h5 class="card-title text-primary ">VARIABLES !</h5>
            <p class="text-muted my-2">NOTE : Check your GMAIL's 2 step verification in done.</p>
        </div>
      </div>
            

    </div>


        
              </div>
                  </div>

             

            
              
               
               


        </div>
</asp:Content>

