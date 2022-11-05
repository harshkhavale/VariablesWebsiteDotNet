<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.master" AutoEventWireup="true" CodeFile="ProductsDelivery.aspx.cs" Inherits="ProductsDelivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


         <div class="container my-4" style="font-family: 'Quicksand', sans-serif;">
                         <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 mx-2 ">PENDING DELIVERY'S</h5>
         <br />
         <br />
        <asp:Repeater ID="RptrUserData" runat="server">

            <HeaderTemplate>
                 <table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">ProductId</th>
      <th scope="col">DateTime</th>
              <th scope="col">UserName</th>

              <th scope="col">Address</th>
                      <th scope="col" >PinCode</th>
                              <th scope="col" >Contact</th>
                      <th scope="col" >Name</th>
                              <th scope="col" >PayMent Mode</th>
                                      <th scope="col" >Remove</th>






     
    </tr>
  </thead>
  <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                  <tr>
      <th scope="row"> <%#Eval("ID") %> </th>
                                            <td><%#Eval("ProductID") %></td>

      <td><%#Eval("DateTime") %></td>
                      <td><%#Eval("UserName") %></td>
                                            <td><%#Eval("CustomerAddress") %></td>
                                                                  <td><%#Eval("CustomerPincode") %></td>
                                                                  <td><%#Eval("CustomerMono") %></td>

                                                                  <td><%#Eval("CustomerName") %></td>
                                                                  <td><%#Eval("PaymentType") %></td>



                      <td > <asp:Button ID="RemoveUser" runat="server" class="btn btn-danger btn-sm" Text="Remove" /></td>
      

     
    </tr>
   
            </ItemTemplate>
            <FooterTemplate>
                 </tbody>
</table>
            </FooterTemplate>
        </asp:Repeater>
        

       
  
  
 
    </div>

</asp:Content>

