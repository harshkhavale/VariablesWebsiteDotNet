<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container my-4" style="font-size:large;font-family: 'Quicksand', sans-serif;">
    <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 ">SUPPORT</h5>
        <br /><br />
     <asp:Label ID="Label3" CssClass="mx-4" runat="server" Text="suggestions" 
          Visible="True"></asp:Label>
        <br />
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="SuggestionsTextBox" Rows="5" Columns="30" TextMode="MultiLine" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="Give some suggestions" ControlToValidate="SuggestionsTextBox"></asp:RequiredFieldValidator>
     <br />
    <br />
        <asp:Button ID="submit" CssClass="btn btn-primary btn-sm" OnClick="submit_Click" runat="server" Text="SUBMIT" />
       
    </div>
        </div>
</asp:Content>

