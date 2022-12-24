﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddDropDowns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container" style="font-size:large;font-family: 'Quicksand', sans-serif;">
           <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 ">BRANDS</h5>

        &nbsp;<div class="d-flex justify-content-center" >
   
      &nbsp;
            <br />
   
      <asp:Label ID="Label1" runat="server" Text="Add Brand" 
          Visible="True"></asp:Label>
            
     
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="AddBrandName" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>
                 
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="AddBrandName" ErrorMessage="BrandName cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
              <div>
        <asp:Button ID="AddBrandNameBtn" CssClass="btn btn-primary" runat="server" 
                      Text="Add Brand" OnClick="AddBrandNameBtn_Click" EnableViewState="False" />
                  <br />
                  <br />
                  <asp:Label ID="Notification" runat="server"></asp:Label>
                  <br />
            </div>
   
  </div>
        



    </div>

    <div class="container my-2 " style="font-size:large;font-family: 'Quicksand', sans-serif;">
        <h2 class="my-4 btn btn-warning">ALL BRANDS</h2>
        <br />
        <asp:Repeater ID="RepeaterBrands" runat="server">

            <HeaderTemplate>
                 <table class="table">
  <thead>
    <tr class="text-light">
      <th scope="col">ID's</th>
      <th scope="col">BrandName's</th>
      <th scope="col">Edit</th>

     
    </tr>
  </thead>
  <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                  <tr class="text-light">
      <th scope="row"> <%#Eval("Id") %> </th>
      <td><%#Eval("BrandName") %></td>
      <td ><p class="btn btn-danger btn-sm">remove</p></td>

     
    </tr>
   
            </ItemTemplate>
            <FooterTemplate>
                 </tbody>
</table>
            </FooterTemplate>
        </asp:Repeater>
        

       
  
  
 
    </div>

</asp:Content>

