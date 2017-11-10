<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="BaseConnectLib.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OrderInfo</title>
</head>
<body>
<%

String orderid=request.getParameter("orderid");

String custid=request.getParameter("custid");
//String custid=cid;

String orderdate=request.getParameter("orderdate");

String ordertime=request.getParameter("ordertime");

String ordersource=request.getParameter("ordersource");

String orderstatus = request.getParameter("orderstatus");

/* Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
BaseConnection basecon = new BaseConnection();
Connection con= basecon.getConnection();

Statement st=con.createStatement();

String sql = "insert into jars_order (order_id, cust_id, order_date, order_time, order_source, order_status) values("+orderid+","+custid+",'"+orderdate+"','"+ordertime+"','"+ordersource+"','"+orderstatus+"')";

int flag=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");
response.sendRedirect("CustomerOrderInfo.jsp");

}

else

{

out.println("Failed");

}

//response.sendRedirect("show.html");

%>
	
	

</body>
</html>