<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
      <link rel="stylesheet" type="text/css" href="Style1.css">
  
<title>CurrentOrderList</title>

<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='orderedit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='delete.jsp?id='+id;
    f.submit();
}
function addProducts(id){
    var f=document.form;
    f.method="post";
    f.action='insertProducts.jsp?id='+id;
    f.submit();
}

</script>

<style type="text/css">
th {
	text-align: center;
}

td {
	text-align: center;
}

.demo1 { 
color: #333;
    text-shadow: 0px 1px 0px rgba(255,255,255,.5); /* 50% white from bottom */
}
</style>

</head>
<body>

<body>
	<br>
	<form method="post" name="form">
	<h1 class="header1">Current-Orders</h1>
		<table border="1"
			class="table table-hover table-striped table-bordered table-condensed">
			<tr class="info">
				<th>CustID</th>
				<th>Name</th>
				<th>OrderID</th>
				<th>Contact No</th>
				<th>OrderStatus</th>
				<th>Add Products</th>
				<th>Edit</th>
				<th>Delete</th>
				<th>View </th>
			</tr>
			<%
				Connection con = null;
				//String url = "jdbc:mysql://localhost:3305/";
				//String db = "test";
				//String driver = "com.mysql.jdbc.Driver";
				//String userName = "root";
				//String password = "root";

				int sumcount = 0;
				Statement st;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql");
					//String query = "select * from jars_customer";
					String query = "select customer_id, customer_name, order_id, customer_phone, order_status from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id where order_status <> 'completed'";
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><input type="button" name="addprod" value="Add Products"
					class="btn btn-primary demo1" onclick="addProducts(<%=rs.getString(3)%>);"></td>
				
				<td><input type="button" name="edit" value="Edit"
					class="btn btn-danger demo1" onclick="editRecord(<%=rs.getString(3)%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					class="btn btn-success demo1"
					onclick="deleteRecord(<%=rs.getString(1)%>);"></td>
				<td><input type="button" name="view" value="View"
					class="btn btn-info demo1"
					onclick="viewRecord(<%=rs.getString(1)%>);"></td>	
				
			</tr>
			<%
				}
			%>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</form>
	
</body>
</html>