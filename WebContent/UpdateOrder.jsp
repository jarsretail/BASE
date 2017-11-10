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
<title>UpdateOrder</title>
</head>
<body>

	<%
	String orderid = session.getAttribute("OrderID").toString();
/*  
String orderid=request.getParameter("orderid");

String customerid=request.getParameter("custid");

String orderdate=request.getParameter("orderdate");

String oredrtime=request.getParameter("ordertime");

String ordersource=request.getParameter("ordersource"); */

String orderstatus=request.getParameter("orderstatus");


/* Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
BaseConnection basecon = new BaseConnection();
Connection con= basecon.getConnection();

Statement st=con.createStatement();

String sql = "update jars_order set order_status='"+orderstatus+"' where order_id = "+orderid;

//String sql2= "insert into jars_order (cust_id) values("+customerid+")";


int flag=st.executeUpdate(sql);
//int flag2=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");
response.sendRedirect("CurrentOrdersList.jsp");


}

else

{

out.println("Failed");

}

//response.sendRedirect("show.html");

%>
	

</body>
</html>