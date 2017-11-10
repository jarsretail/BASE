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
<title>AddOrderProducts</title>
</head>
<body>
	<%
 
	/* /* String orderid=session.getAttribute("OrderId").toString();
	out.println("Order id:"+orderid);
	/* String prodid=session.getAttribute("ProdId").toString();
	out.println("Product id:"+orderid); */
	/* String prodid= request.getParameter("id");
	out.println("Product id:"+prodid);

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql");

Statement st=con.createStatement();

//String sql = "insert into jars_customer (customer_id, customer_name, customer_phone, customer_email, customer_flat_no, customer_society, customer_area, customer_city, customer_pincode) values("+customerid+",'"+customername+"','"+customerphone+"','"+customeremail+"','"+customerflatno+"','"+customersociety+"','"+customerarea+"','"+customercity+"','"+customerpincode+"')";

//String sql2= "insert into jars_order (cust_id) values("+customerid+")";
String sql = "insert into jars_product_purchase(order_id, product_id) values ("+orderid+","+prodid+")";


int flag=st.executeUpdate(sql);
//int flag2=st.executeUpdate(sql);

 if(flag==1)

{

out.println("Added!");
//response.sendRedirect("CustomerList.jsp");
}

else

{

out.println("Failed");

}  
 */
//response.sendRedirect("show.html");
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
		/* Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
		BaseConnection basecon = new BaseConnection();
		con= basecon.getConnection();
		String query = "select * from jars_product where product_id = "+id;
		//String query = "select order_id, cust_id, customer_name, order_date from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id where cust_id ="+id;
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{
 
%>

Product Id:<%=rs.getString(1) %>
Product Name :<%=rs.getString(2) %>
 <%}
	} catch (Exception e) {
					e.printStackTrace();
				}%> 
 
</body>
</html>