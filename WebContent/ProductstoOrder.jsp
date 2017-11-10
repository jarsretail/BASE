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
<title>ProductstoOrder</title>
</head>
<body>

 <form action="AddProductToOrder.jsp" method="post" name="form">
<!-- <form action="Invoice.jsp" method="post" name="form"> -->
<%
        String id = request.getParameter("id");
        int i= 1;
		//int no = Integer.parseInt(id);
	%>
	<h1 class="header1">Add Products to Order</h1>
	
	
	<%
		String prodid=session.getAttribute("ProdId").toString();
	//out.println(prodid);
	String orderid=session.getAttribute("OrderId").toString();
	//out.println(orderid);
				Connection con = null;
				
				Statement st;
				try {
					/* Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
					BaseConnection basecon = new BaseConnection();
					con= basecon.getConnection();
					String query = "select * from jars_product where product_id = "+id;
					//String query = "select customer_id, customer_name, order_id, customer_phone, order_status from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id where order_status = 'completed'";
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
			%>
			<h3>Order Id :<%=orderid%></h3>	
			<%
				while (rs.next()) {
			%>
			
				<!-- <form action="AddProduct.jsp" method="post"> -->
				<table>
					<tr>
						<td>Product Id :</td>
						<td> <input type="text" name="productid" value=<%=rs.getString(1)%>><br /></td>
					</tr>	
					<tr>
						<td>Product Name :</td>
						<td> <input type="text" name="productname" value=<%=rs.getString(2) %>><br /></td>
					</tr>	
					<tr>
						<td>Product Quantity :</td>
						<td><input type="text" name="productquantity" value=<%=rs.getString(3) %>><br /></td>
					</tr>	
					<%-- <tr>
						<td>Product mrp :</td>
						<td><input type="text" name="productmrp" value=<%=rs.getString(4) %>><br /></td>
					</tr>
					<tr>
						<td>Product SP :</td>
						<td><input type="text" name="productsp" value=<%=rs.getString(5) %>><br /></td>
					</tr>
					<tr>
						<td>Product PP :</td>
						<td><input type="text" name="productpp" value=<%=rs.getString(6) %>><br /></td>
					</tr> --%>
					
					<tr>			
						<td><input class="btn btn1" type="submit" value="Add Product to Order" /><br /></td>
					</tr>
				</table>
				<%}
			
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				session.setAttribute("productid", prodid);
				session.setAttribute("orderid", orderid);
				%>
	</form>

</body>
</html>