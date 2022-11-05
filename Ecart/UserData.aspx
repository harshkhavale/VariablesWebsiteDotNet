<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.master" AutoEventWireup="true" CodeFile="UserData.aspx.cs" Inherits="UserData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container my-4" style="font-family: 'Quicksand', sans-serif;">
                         <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" class="badge bg-success my-4 mx-2 "> USER DATA</h5>
         <br />
         <br />
        <asp:Repeater ID="RptrUserData" runat="server">

            <HeaderTemplate>
                 <table class="table">
  <thead>
    <tr>
      <th scope="col">UserID</th>
      <th scope="col">Name</th>
      <th scope="col">UserName</th>
              <th scope="col">Password</th>

              <th scope="col">Email</th>
                      <th scope="col" >Remove</th>


     
    </tr>
  </thead>
  <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                  <tr>
      <th scope="row"> <%#Eval("id") %> </th>
                                            <td><%#Eval("fullname") %></td>

      <td><%#Eval("username") %></td>
                      <td><%#Eval("password") %></td>
                                            <td><%#Eval("email") %></td>
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

