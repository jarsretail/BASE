<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CustomerInfo</title>

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

		<div class="col-sm-9">
				<h1 class="header1">Add Customer Info</h1>
				<form action="AddCustomer.jsp" method="post">
				<table>
				<tr>
					<td>Customer Id : </td>
					<td><input type="text" name="customerid" /><br /></td>
				</tr>
				<tr>
					<td>Customer Name :</td>
					<td> <input type="text" name="customername" /><br /></td>
				</tr>		
				<tr>		
					<td>Customer Phone :</td>
					<td><input type="text" name="customerphone" /><br /></td>
				</tr>		
				<tr>
					<td>Customer Email :</td>
					<td><input type="text" name="customeremail" /><br /></td>
				</tr>		
				<tr>
					<td>Customer Flat No :</td>
					<td><input type="text" name="customerflatno" /><br /></td>
				</tr>		
				<tr>
					<td>Customer Society :</td>
					<td><input type="text" name="customersociety" /><br /></td>
				</tr>		
				<tr>
					<td>Customer Area :</td>
					<td><input type="text" name="customerarea" /><br /></td>
				</tr>		
				<tr>
					<td>Customer City :</td>
					<td><input type="text" name="customercity" /><br /></td>
				</tr>		
				<tr>
					<td>Customer Pincode :</td>
					<td><input type="text" name="customerpincode" /><br /></td>
				</tr>		
				<tr>
					<td><input class="btn btn1" type="submit" value="Add Details" /><br /></td>
				</tr>
				<tr>
					<td><a href="CustomerList.jsp">List All Customers</a> <br /></td>
				</tr>		
				</table>
				</form>
	</div>
</div>
</body>
</html>