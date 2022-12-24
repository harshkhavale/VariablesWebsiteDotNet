<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="PreSignUp.aspx.cs" Inherits="PreSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="container"  style="font-family: 'Quicksand', sans-serif;">

              <br />
              <div class="row">
                   <p class="my-2 mx-2 link-warning" ID="show" runat="server"></p>

              <div class="col-7" id="content" runat="server" style="margin-top:15vh">

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

      </div>


                      
   
  </div>
                                    

                      </div>




                  <div id="maincontent" runat="server">

                      <div class="d-flex justify-content-around mx-4">
                 <div class="d-flex col-sm">
      <asp:Label ID="Label7" runat="server" Text="Enter OTP"  class="form-label col-3"
          Visible="True"></asp:Label>
             
      
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="OTP" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
              ControlToValidate="OTP" ErrorMessage="Check OTP" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
    
             
      </div>
   
  </div>

                </div>

       <asp:Button ID="submit" class="btn btn-sm btn-primary my-4 mx-4" runat="server" Text="submit" UseSubmitBehavior="false" OnClick="submit_Click" CausesValidation="False" />


                 
  



               
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserData]"></asp:SqlDataSource>
                        <br />
              <br />
                       
                            <br />



                  </div>
                  <asp:HyperLink ID="HaveAccount" CssClass="mx-4" runat="server" 
                      NavigateUrl="~/SignInPage.aspx">Allready Have an Acoount</asp:HyperLink>
                            <br />
                  </div>
              <div class="col-5 d-flex justify-content-center">
        <div class="container my-4" style="font-family: 'Quicksand', sans-serif">

         
        <div  style="padding-left:3vw;" class="text-center mt-4 pt-4 my-4 p-4" >
        <img class="bd-placeholder-img card-img-top w-100 my-4"  src="img/variableWhiteLogo.png" role="img" focusable="true"></></img>

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

