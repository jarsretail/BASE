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
<title>ProductsRatesInfo</title>
</head>
<body>
	<%
 
String productid=request.getParameter("productid");

String partnerid=request.getParameter("partnerid");

String rates=request.getParameter("rates");

String ratedate=request.getParameter("ratedate");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3306/avenjars","root","root");

Statement st=con.createStatement();

String sql = "insert into jars_products_rates ( rates, rate_date) values('"+rates+"','"+ratedate+"')";

int flag=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");

}

else

{

out.println("Failed");

}

//response.sendRedirect("show.html");

%>

</body>
</html>