<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="DefaultCategoryPages.aspx.cs" Inherits="DefaultCategoryPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container  my-2" style="font-family: 'Quicksand', sans-serif;">
                                               <h5 style="font-size:large" runat="server" id="PageNameLbl" class="badge bg-primary"></h5>

        <div class="row d-flex justify-content-center">

            <asp:Repeater ID="SmartphonesRptr" runat="server">
                <ItemTemplate>
                       <div class="card mx-3 my-4 crd shadow p-3 mb-5 bg-body rounded" style="width: 18rem">
                         <a href="DefaultViewMore.aspx?PID=<%#Eval("ProductId")%>" style="text-decoration:none;color:black" >
  <img src="Img/ProductImg/<%#Eval("ProductId") %>/<%# Eval("ImageName")%><%# Eval("Extention") %>" class="card-img-top h-50 w-100" alt="<%#Eval("ImageName") %>">
  <div class="card-body ">
      <div class="position-relative start-0 " >
      <p class="card-text b-0"><%#Eval("BrandName") %></p>
    <h5 class="card-title"><%#Eval("ProductName") %></h5>
      
    <p><em><del class="text-danger">₹ <%#Eval("ProductPrice","{0:000,0}") %></del></em></p>
          <br />
          </div>
      <br />
      <div class="position-absolute bottom-0 start-0 mx-4">
          <h3  > ₹ <%#Eval("ProductSellingPrice","{0:000,0}") %></h3>
    <h4 class="badge bg-primary">Save ₹  <%#String.Format("{0}",Convert.ToInt64(Eval("ProductPrice"))-Convert.ToInt64(Eval("ProductSellingPrice")))%></h4>
          </div>
  </div>
                              </a>
  
                             
</div>





                       

                </ItemTemplate>
            </asp:Repeater>
                
           
        </div>
    </div>
</asp:Content>

