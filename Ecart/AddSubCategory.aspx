<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container my-4" style="font-size:large;font-family: 'Quicksand', sans-serif;">
    <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 ">SUB-CATEGORY</h5>

        <div class="d-flex my-3 justify-content-start mx-4">
      <asp:Label CssClass="mx-4" ID="Label5" runat="server" Text="select CategoryID" 
          Visible="True"></asp:Label>
             &nbsp;
            
&nbsp;<div class="col-4">
    <asp:DropDownList ID="CategoryIdDDL" CssClass="form-control" runat="server" >
                 </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select a category" ControlToValidate="CategoryIdDDL"></asp:RequiredFieldValidator>

      </div>
             </div>
       

        &nbsp;<div class="d-flex justify-content-start" >
   
      &nbsp;
            
            
  
      <asp:Label ID="Label3" CssClass="mx-4" runat="server" Text="Add Sub-Category" 
          Visible="True"></asp:Label>
            
     
&nbsp;<div class="col-4 mx-4">
          <asp:TextBox ID="AddSubCategoryTextBox" class="form-control " runat="server" 
              Visible="True"></asp:TextBox>
                 
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
              ControlToValidate="AddSubCategoryTextBox" ErrorMessage="sub-Category cant be empty" 
              ForeColor="#FF3300"></asp:RequiredFieldValidator>
      </div>
              <div>
        <asp:Button ID="AddSubCatBtn" CssClass="btn btn-primary mx-4" runat="server" 
                      Text="Add Sub-Category" OnClick="AddSubCatBtn_Click" />
                  <br />
                  <br />
                  <asp:Label ID="Notification" runat="server"></asp:Label>
            </div>
   
  </div>
        </div>

     <div class="container my-2 " style="font-size:large;font-family: 'Quicksand', sans-serif;">
             <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge text-dark bg-warning my-4 ">All SUB-CATEGORY'S</h5>

        <asp:Repeater ID="RepeaterBrands" runat="server">

            <HeaderTemplate>
                 <table class="table">
  <thead>
    <tr>
      <th scope="col">ID's</th>
      <th scope="col">Category</th>
      <th scope="col">Sub-Category</th>
      <th scope="col">Edit</th>

     
    </tr>
  </thead>
  <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                  <tr>
      <th scope="row"> <%#Eval("SubCatId") %> </th>
      <td><%#Eval("CategoryName") %></td>
      <td><%#Eval("SubCategory") %></td>
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

