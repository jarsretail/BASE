<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="BaseConnectLib.BaseConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateCustomer</title>

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
        String id = request.getParameter("id");
        
		int no = Integer.parseInt(id);
		/* Connection con=DriverManager.getConnection
		("jdbc:mysql://localhost:3305/avenjars","root","mysql");
	 */
		 BaseConnection basecon = new BaseConnection();
		 Connection con= basecon.getConnection();
		Statement st=con.createStatement();
	
		String sql = "select * from jars_customer where customer_id='" + id + "'";;
		
		ResultSet rs=st.executeQuery(sql); 
		//int id=0; 
		//if(rs.last()){ 
			//id=rs.getInt("order_id")+1; 
		//}
		while(rs.next())
		{

	%>
      
        <%
			/*String id = request.getParameter("id");
        
			int no = Integer.parseInt(id);
			int sumcount = 0;
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars", "root", "mysql");
				String query = "select * from jars_customer where id='" + id + "'";
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {*/
		%>   

		<div class="col-sm-9">
		
				<h1 class="header1">Delete Customer</h1>
				<form action="DeleteCustomer.jsp" method="post">
				<table>
				<tr>
					<td>Customer Id : </td>
					<td><input type="text" name="customerid" value=<%=rs.getInt(1) %>><br /></td>
				</tr>
				<tr>
					<td>Customer Name :</td>
					<td> <input type="text" name="customername" value=<%=rs.getString(2) %>><br /></td>
				</tr>		
				<tr>		
					<td>Customer Phone :</td>
					<td><input type="text" name="customerphone" value=<%=rs.getString(3) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer Email :</td>
					<td><input type="text" name="customeremail" value=<%=rs.getString(4) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer Flat No :</td>
					<td><input type="text" name="customerflatno" value=<%=rs.getString(5) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer Society :</td>
					<td><input type="text" name="customersociety" value=<%=rs.getString(6) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer Area :</td>
					<td><input type="text" name="customerarea" value=<%=rs.getString(7) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer City :</td>
					<td><input type="text" name="customercity" value=<%=rs.getString(8) %>><br /></td>
				</tr>		
				<tr>
					<td>Customer Pincode :</td>
					<td><input type="text" name="customerpincode" value=<%=rs.getString(9) %>><br /></td>
				</tr>		
				<tr>
					<td><input class="btn btn1" type="submit" value="Delete" /><br /></td>
				</tr>
					<%} %>	
						
				</table>
				</form>
	</div>
</div>
</body>
</html>