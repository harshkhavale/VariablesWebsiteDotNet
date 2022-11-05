<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" mt-0 w-100 style="font-family: 'Quicksand', sans-serif;">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
   
    <div class="carousel-inner " style="max-height:90vh;font-family: 'Quicksand', sans-serif;">
     
      <div class="carousel-item active" >
          <img src="img/Advertisements/add4.png" class="w-100" />
 
          
          <div class="container "  >
          <div class="carousel-caption text-start text-dark" style="padding-bottom:20vh">
            <h1>VARIABLES.COM</h1>
            <p>shop with variables.com and get upto 13% off everyday </p>
            <p><a class="btn btn-sm btn-primary" href="ProductsShow.aspx">explore VARIABLES</a></p>
          </div>
        </div>
       
      </div>
      <div class="carousel-item" >
          <img src="img/Advertisements/add5.png" class="w-100" />

        <div class="container">
          <div class="carousel-caption text-start text-dark" style="padding-bottom:60vh">
            <h1>New boAt Watches</h1>
            <p>displays on hands for the bold</p>
          </div>
        </div>
      </div>
         <div class="carousel-item" >
          <img src="img/Advertisements/add6.png" class="w-100" />

        <div class="container">
          <div class="carousel-caption text-start text-dark" style="padding-bottom:35vh">
            <h1>lets get up to date!</h1>
            <p>be TECHHEADS of the future</p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
      </div>



       <div class="container my-4" style="font-family: 'Quicksand', sans-serif;">
                                                       <h5 style="font-size:large" class="badge bg-success my-2 ">NEW ARRIVAL'S</h5>
                                                                                    <a href="ProductsShow.aspx" class="text-center mx-4 link-primary">VIEW ALL </a>


<br />
                            <h5 class="badge bg-warning mb-0 ">NEW</h5>

        <div class="row d-flex justify-content-center">

            <asp:Repeater ID="productrptr" runat="server">
                <ItemTemplate>
                    
                     <div class="card mx-3 my-2 mb-4 crd shadow p-3 mb-5 bg-body rounded" style="width: 18rem">
                         <a href="ViewMore.aspx?PID=<%#Eval("ProductId")%>" style="text-decoration:none;color:black" >
  <img src="Img/ProductImg/<%#Eval("ProductId") %>/<%# Eval("Name")%><%# Eval("Extention") %>" class="card-img-top h-50" alt="<%#Eval("Name") %>">
  <div class="card-body ">
      <div class="position-relative start-0 " >
      <p class="card-text b-0 text-primary"><%#Eval("BrandName") %></p>
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
                    <br />
                    <br />
                       

                </ItemTemplate>
            </asp:Repeater>
                
           
        </div>
    </div>




 <div class="sticky-top"  style="font-family: 'Quicksand', sans-serif;z-index:4">
   <div class="bg-light w-100 row d-flex p-0 m-0 sticky-top" style="z-index:5" >
        <div class="col-6 p-0" >
           <div class=" d-flex justify-content-center carousel-item m-0">
               <div class="col-6" style="overflow:hidden" >
               <img src="img/Advertisements/boatwatchadd.jpg" class="w-100 addimg" />
                   </div>
                <div class="container col-6 d-flex justify-content-center" style="margin-top:10vh">
          <div class=" text-end  text-center">
        <h1 class="">boAt Wave Call Smart Watch</h1>
            <h4 class="">let it be !</h4>

              <br />
                   <a href="PaymentPage.aspx?PID=17" class="text-center mx-4 link-primary">Buy Now </a>
                   <a href="ViewMore.aspx?PID=17" class="text-center mx-4 link-primary"> ViewMore</a>

          </div>
        </div>
               </div>
          
       </div>
      


        <div class="col-6 p-0" style="background-color:black" >
           <div class=" d-flex justify-content-center carousel-item m-0">
            <div class="col-6" style="overflow:hidden"> 
                <img src="img/Advertisements/boatbudsadd.jpg" class="w-100 addimg" /></div>
                <div class="col-6 container d-flex justify-content-center" style="margin-top:10vh">
          <div class=" text-end  text-light text-center">
             <h1 class="">boAt Airdopes 141 </h1>
            <h4 class="">Music in blood</h4>

              <br />
                   <a href="PaymentPage.aspx?PID=16" class="text-center mx-4 link-primary">Buy Now </a>
                   <a href="ViewMore.aspx?PID=16" class="text-center mx-4 link-primary"> ViewMore</a>

          </div>
        </div>
               </div>
          
       </div>
      
   </div>
        </div>
    
    
         <div class="mb-0 d-flex  h-100 w-100 bg-light sticky-top justify-content-center p-0 m-0"  style="font-family: 'Quicksand', sans-serif;z-index:7">
            <div class="col-8 d-flex justify-content-center" style="background-color:black;overflow:hidden">
             <img src="img/Advertisements/iphone14proadd.jpg" class="addimg" />
                </div>
                <div class="container col-4 d-flex justify-content-center mb-0 pb-0" style="margin-top:35vh;margin-bottom:0vh;margin-left:3vw">
          <div class=" text-end bg-light text-dark text-center">
            <h1 class="">iphone 14 Pro Max</h1>
            <h4 class="">Go Beyond</h4>

              <br />
                    <a href="PaymentPage.aspx?PID=18" class="text-center mx-4 link-primary">Buy Now </a>
                   <a href="ViewMore.aspx?PID=18" class="text-center mx-4 link-primary"> ViewMore</a>

          </div>
        </div>
               </div>

    

         <div class="p-0  h-100 bg-light w-100 mt-0 d-flex justify-content-center sticky-top m-0 "  style="font-family: 'Quicksand', sans-serif;margin-top:0;padding-top:0;z-index:8">
             <div class="container col-4 d-flex justify-content-center" style="margin-top:35vh">
          <div class=" text-end  text-dark bg-light text-center">
            <h1 class="">ipad Pro</h1>
            <h4 class="">Creativity on your PALMS</h4>

              <br />
                    <a href="PaymentPage.aspx?PID=19" class="text-center mx-4 link-primary">Buy Now </a>
                   <a href="ViewMore.aspx?PID=19" class="text-center mx-4 link-primary"> ViewMore</a>

          </div>
        </div>
             
            <div class="col-8 d-flex justify-content-center" style="background-color:black;overflow:hidden">
                 <img src="img/Advertisements/appletabletadd.jpg" class="addimg"/> 

             </div>
                
               </div>        




</asp:Content>

