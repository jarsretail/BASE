<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SearchProduct</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
  <link rel="stylesheet" type="text/css" href="CommonStyle.css">

<style>
        .header
        {
            color: #F49A1F;
        }
        .btn
        {
            background-color: #F49A1F;
            color: white;
        }
            .li2:hover
            {
                background-color: aquamarine;
                background-color: #F49A1F;
                list-style-type: circle;
                
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
                border-top-right-radius: 20px;
                border-bottom-right-radius: 20px;
                
            }
            
            .nav1
            {
                background-color: #F49A1F;
                
            }
        
    </style>

</head>
<body>
<!--  <form action="SearchedProducts.jsp" method="post">
 -->
 <form action="SearchedProductList.jsp" method="post">
<!--  <form action="CustomerList.jsp" method="post">
 --> <nav class="navbar nav1 navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand title" href="#" style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;JARS</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="Home.jsp">Home</a></li>
                    <li><a href="aboutus.html">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                             
                </ul>
            </div>
        </nav>
        
              
       <div class="rows" style="width=25%;">
       <div class="col-sm-3">
               
                    <ul>
                        <li class="list-group-item li2" id="1"><a href="CreateOrder.jsp">New Order</a></li>
                        <li class="list-group-item li2" id="2"><a href="Customer.jsp">New Customer</a></li>
                        <li class="list-group-item li2" id="3"><a href="Product.jsp">New Product</a></li>
                        <li class="list-group-item li2" id="4"><a href="OrderSource.jsp">New Order Source</a></li>
                        <hr>
                        <li class="list-group-item li2" id="5"><a href="#">Current Order</a></li>
                        <li class="list-group-item li2" id="5"><a href="#">Completed Orders</a></li>
                    </ul>
                    
        </div>    
        <div class="col-sm-9">
				<h1 class="header">Search Product</h1>
				<%String orderid = request.getParameter("id");
				out.println("Order id:"+orderid);
				
				session.setAttribute("OrderId",orderid);
							 %>
				
				<table>
				<tr>
					<td>Search Product By Name :</td> 
					<td><input type="text" name="SearchName" /><br /></td>
				</tr>
				<tr>
					<td>Search Product By Product Id :</td>
					<td> <input type="text" name="SearchId" /><br /></td>
				</tr>
				<tr>
				<td>
					<input class="btn" type="submit" value="Search" /><br />
				</td>
				</tr>
				</table>
				</form>
		</div>
</div>
</body>
</html>