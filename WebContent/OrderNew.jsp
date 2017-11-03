
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
        
  <link rel="stylesheet" type="text/css" href="Style1.css">

 <!-- <script type="text/javascript">
        $(function () {
            $('#txtDate').datepicker({
                dateFormat: "dd/MM/yy",
                changeMonth: true,
                changeYear: true
            });
        });
    </script> -->
    
    <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
	<%
	String cid="";
	if(session!=null)
		 cid = session.getAttribute("CustId").toString();
	 %>
	 
	 <%!
		   /* public int generateRandomNumber()
	 		{
		        Random random = new Random();
		        //long fraction = (long) ((end - start + 1 ) * random.nextDouble());
		        int randomnum = random.nextInt(1);
		        //return ((int)(fraction + start));
		        return randomnum;
		    }*/
	  %>



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
		Connection con=DriverManager.getConnection
		("jdbc:mysql://localhost:3305/avenjars","root","mysql");
	
		Statement st=con.createStatement();
	
		String sql = "select order_id from jars_order";
		
		ResultSet rs=st.executeQuery(sql); 
		int id=0; 
		if(rs.last()){ 
			id=rs.getInt("order_id")+1; 
		}

	%>
	<div class="col-sm-9">
	<h1 class="header1">Add Order Info</h1>
	<form action="AddOrder.jsp" method="post">
	<table>
	<tr>
	<td>Order Id : </td>
	<td><input type="text" name="orderid" value='<%=id%>' /><br /></td>
	</tr>
	<tr>
	<td>Customer Id : </td>
	<td><input type="text" name="custid" value='<%=cid%>'/></td>
	<td><a href="SearchCustomer.html">Search Customer</a><br /></td>
	
	</tr>
	<tr>
	<td>Order Date :</td>
	<td><input id="date" type="date" name="orderdate" data-date="" data-date-format="YYYY MM DD" /><br /></td>
	</tr>
	<tr>
	<td>Order Time :</td>
	<td><input type="text" name="ordertime" /><br /></td>
	</tr>
	<tr>
	<!--Order Source :<input type="text" name="ordersource" /><br />-->
	<td>Order Source :</td>
	<td> <select name="ordersource">
					  <option>----Select Option---------</option>
					  <option value="custapp">CustomerApp</option>
					  <option value="whatsapp">WhatsApp</option>
					  <option value="call">Mobile Call</option>
					  <option value="mail">Web Mail</option>
			</select>
					<br/>
	</td>
	</tr>	
	<tr>
	<td>Order Status :</td>
	<td> <select name="orderstatus">
					  <option>----Select Option---------</option>
					  <option value="neworder">New</option>
					  <option value="processing">Processing</option>
					  <option value="delivered">Delivered</option>
					  <option value="completed">Completed</option>
			</select>
					<br/>
	</td>
	</tr>			
	<tr>
	<td><input class="btn btn1" type="submit" value="Add Details" /><br /></td>
	</tr>
	</table>
	</form>
	</div>
</div>
</body>
</html>