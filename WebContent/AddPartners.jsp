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
<title>PartnersInfo</title>
</head>
<body>
	<%
 
String partnerid=request.getParameter("partnerid");

String partnername=request.getParameter("partnername");

String partnerphone=request.getParameter("partnerphone");

String partneremail=request.getParameter("partneremail");

String partnerarea=request.getParameter("partnerarea");

String partnerpincode=request.getParameter("partnerpincode");


/* Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
BaseConnection basecon = new BaseConnection();
Connection con= basecon.getConnection();

Statement st=con.createStatement();

String sql = "insert into jars_source_partners ( partner_id, partner_name, partner_phone, partner_email, partner_area, partner_pincode) values("+partnerid+",'"+partnername+"','"+partnerphone+"','"+partneremail+"','"+partnerarea+"','"+partnerpincode+"')";

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