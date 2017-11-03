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
  
  
<title>Customer-Order Info</title>

<script language="javascript">
/*function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
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
function addProducts(id){
    var f=document.form;
    f.method="post";
    f.action='ViewOrder.jsp?id='+id;
    f.submit();
}*/

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
	<form method="post" name="form">
	
			<%
	        	String id = request.getParameter("id");

				Connection con = null;
				//String url = "jdbc:mysql://localhost:3305/";
				//String db = "test";
				//String driver = "com.mysql.jdbc.Driver";
				//String userName = "root";
				//String password = "root";
				//String cid= session.getAttribute("CustId").toString();
				int sumcount = 0;
				Statement st;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql");
					//String query = "select * from jars_customer";
					String query = "select customer_id, customer_name, order_id, customer_phone, customer_email, order_date, customer_flat_no, customer_society, customer_area, customer_city, customer_pincode from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id where order_id ="+id;
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<%
				while (rs.next()) {
			%>
			<h3 class="header1">Order Details</h3>
			Order Id : <%=rs.getString(3) %> <br>
			Order Date :<%=rs.getString(6) %><br>
			Customer Name : <%=rs.getString(2) %><br>
			Email : <%=rs.getString(5) %><br>
			Contact Number : <%=rs.getString(4) %><br>
			Address : <%=rs.getString(7) %>-<%=rs.getString(8)%>,<%=rs.getString(9) %>,<%=rs.getString(10) %>,<%=rs.getString(11) %>		
			
			<%
				}
			%>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			
			
		
	</form>

</body>
</html>