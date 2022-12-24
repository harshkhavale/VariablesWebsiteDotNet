<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container " style="font-size:large;font-family: 'Quicksand', sans-serif;">
                                  <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 ">CATEGORY</h5>

        &nbsp;<div class="d-flex justify-content-center" >
   
      <asp:Label ID="Label2" runat="server" Text="Add Category" class="mx-3"
          Visible="True"></asp:Label>
            
     
            <br />
            
     
&nbsp;<div class="col-4 mx-3">
          <asp:TextBox ID="AddCategoryTextBox" class="form-control" runat="server" 
              Visible="True"></asp:TextBox>
                 
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
              ControlToValidate="AddCategoryTextBox" ErrorMessage="Category cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
              <div>
        <asp:Button ID="AddCategoryBtn" CssClass="btn btn-primary mx-3" runat="server" 
                      Text="Add Category" OnClick="AddCategoryBtn_Click" />
                  <br />
                  <br />
                  <asp:Label ID="Notification" runat="server"></asp:Label>
            </div>
   
  </div>
        </div>

      <div class="container " style="font-size:large;font-family: 'Quicksand', sans-serif;">
       <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-warning text-dark my-4 ">ALL CATEGORY'S</h5>
        <br />
          <asp:Repeater ID="RepeaterBrands" runat="server">

            <HeaderTemplate>
                 <table class="table">
  <thead>
    <tr class="text-light">
      <th scope="col">ID's</th>
      <th scope="col">Categories</th>
      <th scope="col">Edit</th>

     
    </tr>
  </thead>
  <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                  <tr class="text-light">
      <th scope="row"> <%#Eval("CategoryId") %> </th>
      <td><%#Eval("CategoryName") %></td>
      <td><p class="btn btn-danger btn-sm">remove</p></td>

     
    </tr>
   
            </ItemTemplate>
            <FooterTemplate>
                 </tbody>
</table>
            </FooterTemplate>
        </asp:Repeater>
        

       
  
  
 
    </div>


</asp:Content>

