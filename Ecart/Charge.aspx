<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Charge.aspx.cs" Inherits="Charge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container position-absolute top-50 start-50 translate-middle my-4" style="font-family: 'Quicksand', sans-serif;>
        <div class="border border-primary rounded-4">
        <div  style="padding-left:20vw"  >
        <img class="bd-placeholder-img card-img-top w-25 h-25 my-4"  src="img/logo.png" role="img" preserveAspectRatio="xMidYMid slice" focusable="true"><rect width="100%" height="100%" fill="#868e96"></rect></img>

        <div class="card-body ">
          <h5 class="card-title">your order placed SUCCESSFULLY!</h5>
          <a class="card-text link-primary" href="UserHome.aspx">Go to HOME</a>
        </div>
      </div>
            </div>

    </div>
</asp:Content>

