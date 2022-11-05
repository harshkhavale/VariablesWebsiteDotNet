<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



         <div class="col-10 container" style="font-family: 'Quicksand', sans-serif;">
         <h5 style="font-size:large;font-family: 'Quicksand', sans-serif;" id="usrcartlbl" runat="server" class="my-4 badge bg-success ">SHOPPING CART</h5>

             <asp:Repeater ID="CartItmRptr" OnItemCommand="CartItmRptr_ItemCommand" runat="server">
                 <ItemTemplate>
                                                     <a href="ViewMore.aspx?PID=<%#Eval("ProductId")%>" style="text-decoration:none;color:black;display:contents">

                             <div class="row d-flex border rounded  flex-md-row mb-4 shadow-sm h-md-250 " style="display:flex">

                                 <div class="col-auto d-none d-lg-block mx-3 my-3">
          <img class="bd-placeholder-img" style="width:20vw" src="Img/ProductImg/<%#Eval("ProductId") %>/<%# Eval("ImageName")%><%# Eval("Extention") %>" alt="<%#Eval("ImageName") %>"/>          

        </div>
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary"><%#Eval("BrandName") %></strong>
          <h3 class="mb-0"><%#Eval("ProductName") %></h3>
          <h6 class="mb-1 text-muted text-danger" style="text-decoration:line-through;color:red">₹ <%#Eval("ProductPrice") %></h6>
                      <h3 class="mb-0 " > ₹ <%#Eval("ProductSellingPrice") %></h3>

            <br />
            <br />
            <div class="d-flex justify-content-center">
             <a href="PaymentPage.aspx?PID=<%#Eval("ProductId")%>&BuyAll=false" class="btn btn-primary btn-sm rounded-1 mx-4">Buy Now</a>
                <asp:Button ID="RemoveItemBtn" runat="server" CssClass="btn btn-danger btn-sm rounded-1 mx-4" OnClick="RemoveItem_Click" CommandArgument='<%# Eval("ProductId") %>' Text="Remove" UseSubmitBehavior="False" />

                </div>
        </div>
       
      </div>
                                                         </a>

                     
                 </ItemTemplate>
             </asp:Repeater>
             <h4 id="cartstatus" runat="server" class="text-danger"> </h4>
             
             </div>
                        


    <div class="col-2 h-100 position-fixed mx-2 top-0 end-0" style="font-family: 'Quicksand', sans-serif;margin-top:15vh;">
        <div class="card mb-4 rounded-3 shadow-sm border-warning h-75">
          <div class="card-header py-3 text-bg-warning border-warning">
            <h4 class="my-0 fw-normal">SubTotal<br />(<span runat="server" id="ProductNumLbl">(0)</span> PRODUCTS)</h4>
          </div>
          <div class="card-body h-50">
                                       <h4 class="link-primary">Cart Total</h4>
              <p id="pid" runat="server"></p>
            <h1 class="card-title pricing-card-title"><small class=" fw-light">            <h1 class="card-title pricing-card-title" id="TotalSellingPricelbl" runat="server">PRICE<small class="text-muted fw-light">/mo</small></h1>
</small></h1>
                            <h4  style="text-decoration:line-through;color:red" id="TotalPricelbl" runat="server">mrp</h4>
          <asp:Button ID="BuyAllBtn" runat="server" class="w-100 btn btn-lg btn-warning" OnClick="BuyAllBtn_Click" Text="BUY ALL" UseSubmitBehavior="False" />
          </div>
        </div>
      </div>

    




        

</asp:Content>

