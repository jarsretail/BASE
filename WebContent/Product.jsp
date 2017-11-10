<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="BaseConnectLib.BaseConnection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Info</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
        
  <link rel="stylesheet" type="text/css" href="Style1.css">

        
</head>
<body>
<nav class="navbar nav1 navbar-default">
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
        
        <%
				/* Connection con=DriverManager.getConnection
				("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
				BaseConnection basecon = new BaseConnection();
				Connection con= basecon.getConnection();
			
				Statement st=con.createStatement();
			
				String sql = "select product_id from jars_product";
				
				ResultSet rs=st.executeQuery(sql); 
				int id=1; 
				if(rs.last()){ 
					id=rs.getInt("product_id")+1; 
		}

	%>
        <div class="col-sm-9">  
				<h1 class="header1">Add Product Info</h1>
				
				<form action="AddProduct.jsp" method="post">
				<table>
					<tr>
						<td>Product Id :</td>
						<td> <input type="text" name="productid" value='<%=id%>'/><br /></td>
					</tr>	
					<tr>
						<td>Product Name :</td>
						<td> <input type="text" name="productname" /><br /></td>
					</tr>	
					<tr>
						<td>Product Quantity :</td>
						<td><input type="text" name="productquantity" /><br /></td>
					</tr>	
					<tr>
						<td>Product mrp :</td>
						<td><input type="text" name="productmrp" /><br /></td>
					</tr>
					<tr>
						<td>Product SP :</td>
						<td><input type="text" name="productsp" /><br /></td>
					</tr>
					<tr>
						<td>Product PP :</td>
						<td><input type="text" name="productpp" /><br /></td>
					</tr>
					<tr>			
						<td><input class="btn btn1" type="submit" value="Add Details" /><br /></td>
					</tr>
					<tr>
						<td><a href="ProductsList.jsp">List All Products</a> <br /></td>
					</tr>
				</table>
				</form>
			</div>
			</div>
</body>
</html>