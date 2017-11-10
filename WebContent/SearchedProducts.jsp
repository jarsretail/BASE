<%@page import="com.mysql.fabric.Response"%>
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
<title>Searched Products</title>
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='custedit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    f.method="post";
    f.action='custdelete.jsp?id='+id;
    f.submit();
}
function addRecord(id){
    var f=document.form;
    f.method="post";
    //f.action='AddProductToOrder.jsp?id='+id;
    f.action='ProductstoOrder.jsp?id='+id;
    f.submit();
}
function ViewRecord(id){
    var f=document.form;
    f.method="post";
    f.action='insertProducts.jsp?id='+id;
    f.submit();
}
</script>


</head>

<body>
<!-- <form action="ProductstoOrder.jsp" method="post"> -->
<table border="1"
			class="table table-hover table-striped table-bordered table-condensed">
			<tr class="info">
				<th>ProductID</th>
				<th>ProductName</th>
				<th>product_quantity</th>
				<th>product_mrp</th>
				<th>product_sp</th>
				<th>product_pp</th>
				<th>Add to Order</th>
			</tr>
	<%
	String orderid=session.getAttribute("OrderId").toString();
	out.println("Order id:"+orderid);
	 
	String Prodid = null;
	String SearchProdName=request.getParameter("SearchName");
	
	String SearchId = request.getParameter("SearchId");
	
	/* Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection
	("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
	BaseConnection basecon = new BaseConnection();
	Connection con= basecon.getConnection();


	Statement st=con.createStatement();

	// Search Customer by mobile number
	String sql="select * from jars_product where product_name like '%"+ SearchProdName +"%'";
	st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	while(rs.next())
	{
		Prodid=rs.getString(1);
		//out.println(Prodid);
	%>	
		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		
		
	    <td><input type="button" name="Add" value="Add to Order"
			class="btn btn-info demo1"
			onclick="addRecord(<%=rs.getInt(1)%>);"></td> 
		<!-- <td><input type="submit" name="Add" value="Add to Order"
			class="btn btn-info demo1"></td>  -->
	</tr>
	<%
	}
	
	if(Prodid == null)
	{
		out.print("Prod Not Found");
		response.sendRedirect("Product.jsp");
	}
	else
	{
		//out.print("Found id:");
		//out.print(Prodid);
		//response.sendRedirect("OrderNew.jsp");
	}
	
	session.setAttribute("ProdId", Prodid);
	session.setAttribute("OrderId", orderid);
	%>
</table>
</body>
</html>