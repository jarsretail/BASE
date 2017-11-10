<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="BaseConnectLib.BaseConnection" %>

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
  
<title>Product List</title>

<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='prodedit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='proddelete.jsp?id='+id;
    f.submit();
}
function addRecord(){
    var f=document.form;
    f.method="post";
    f.action='Product.jsp';
    f.submit();
}
function ViewRecord(id){
    var f=document.form;
    f.method="post";
    f.action='CustomerWiseOrderList.jsp?id='+id;
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


</style>

</head>
<body>

<body>
	<br>
	<form method="post" name="form">
	<h1 class="header1">List Of All Products</h1>
		<table border="1"
			class="table table-hover table-striped table-bordered table-condensed">
			<tr class="info">
				<th>Sr No</th>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Product Quantity</th>
				<th>Product MRP</th>
				<th>Product SP</th>
				<th>Product PP</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
				Connection con = null;
				String prodid = null;
				int sumcount = 0;
				int srno = 0;
				Statement st;
				try {
					/* Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
					BaseConnection basecon = new BaseConnection();
					con= basecon.getConnection();
					//String query = "select * from jars_customer";
					String query = "select * from jars_product";
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<%
				while (rs.next()) {
					prodid = rs.getString(1);
					srno++;
			%>
			<tr>
				<td><%=srno %></td>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				
				<td><input type="button" name="edit" value="Edit"
					class="btn btn-danger demo1" onclick="editRecord(<%=rs.getString(1)%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					class="btn btn-success demo1"
					onclick="deleteRecord(<%=rs.getString(1)%>);"></td>
			</tr>
			<%
				}
			%>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				}
				session.setAttribute("ProdId",prodid);
			
			%>
		</table>
	</form>
	<div align="center">
	<input type="button" class="btn btn1" value="Add Product" onclick="addRecord()"></div>

</body>
</html>