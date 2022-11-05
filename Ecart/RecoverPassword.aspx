<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container my-4" style="font-size:large;font-family: 'Quicksand', sans-serif;">
                        <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-2 "> SIGN IN</h5>

                           <br />
                           <asp:Label ID="Notification" runat="server"></asp:Label>
                           <br />
                           <br />
                        
  <div class="mb-3 " >
    <label for="exampleInputPassword1" class="form-label">
      <asp:Label ID="lblNewPassword" runat="server" Text="New Password" 
          Visible="False"></asp:Label>
      </label>
&nbsp;<div class="col-4">
          <asp:TextBox ID="NewPasswordText" class="form-control" runat="server" 
              Visible="False"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="NewPasswordText" ErrorMessage="Password cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
   
  </div>
  <div class="mb-3 ">
    <label for="exampleInputPassword2" class="form-label">
      <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" 
          Visible="False"></asp:Label>
      </label>
&nbsp;<div class="col-4">
           <asp:TextBox ID="ConfirmPasswordTxt" class="form-control" runat="server" 
               Visible="False"></asp:TextBox>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
               ControlToCompare="NewPasswordText" ControlToValidate="ConfirmPasswordTxt" 
               ErrorMessage="Confirm password is not same" ForeColor="#FF3300"></asp:CompareValidator>
      </div>
  </div>
  <div class="mb-3 form-check">
    &nbsp;<br />
      <br />
  </div>

                           <asp:Button ID="ResetPasswordBtn" runat="server" class="btn btn-primary" 
                               Text="Reset Password" OnClick="ResetPasswordBtn_Click" Visible="False" />

                       </div>
              

</asp:Content>

