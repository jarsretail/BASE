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
<title>Search Customer</title>
</head>
<body>

	<%
	 
	String Custid = null;
	String SearchMobile=request.getParameter("SearchMobile");
	
	String SearchName = request.getParameter("SearchName");
	
	/* Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection
	("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
	BaseConnection basecon = new BaseConnection();
	Connection con= basecon.getConnection();

	Statement st=con.createStatement();

	// Search Customer by mobile number
	String sql="select customer_id from jars_customer where customer_phone='"+SearchMobile+"' OR customer_name='"+SearchName+"'";
	st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	while(rs.next())
	{
		Custid=rs.getString(1);
	}
	
	if(Custid == null)
	{
		out.print("Customer Not Found");
		response.sendRedirect("Customer.jsp");
	}
	else
	{
		out.print("Found id:");
		out.print(Custid);
		response.sendRedirect("OrderNew.jsp");
	}
	
	session.setAttribute("CustId", Custid);
	%>

</body>
</html>