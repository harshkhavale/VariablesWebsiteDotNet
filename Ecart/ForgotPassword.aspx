<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

              <div class="container my-4 center text-center"  style="font-size:large;font-family: 'Quicksand', sans-serif;">
                        <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 "> FORGOT PASSWORD </h5>

        
            <div class="container">
                <h3>Enter your email Address below and the recovery link will be send to your email.Thank you!</h3>
                 <div class="mb-3 my-4 container ">
                     <div class="">
                <label for="exampleInputEmail1" class="form-label">Email address </label>
                         </div>
                     <div class="">
                  &nbsp;                <asp:TextBox ID="recoveryEmail" CssClass="form-control text-center" runat="server"></asp:TextBox>
                         </div>
&nbsp;<br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="recoveryEmail" ErrorMessage="Wrong Email check again!" 
                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                  <br />
                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
              </div>



               
                <br />
                <asp:Button ID="recoverySend" class="btn btn-primary" runat="server" OnClick="recoverySend_Click" 
                    Text="Send E-mail" />


                <br />
                <br />
                <asp:Label ID="MsgLabel" runat="server" ForeColor="#00CC00"></asp:Label>


            </div>

        </div>
    
</asp:Content>

