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
<title>Insert title here</title>
</head>
<body>
<%
 
String username=request.getParameter("username");

String password=request.getParameter("password");

String firstname=request.getParameter("firstname");

String lastname=request.getParameter("lastname");

String address=request.getParameter("address");

String pincode=request.getParameter("pincode");

String phonenumber=request.getParameter("phonenumber");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql");

Statement st=con.createStatement();

//String sql="insert into info
//(username,password,firstname,lastname,address,pincode,phonenumber)

//values('"+username+"','"+password+"','"+firstname+"','"+lastname+"','"+address+"','"+pincode+"','"+phonenumber+"')";


String sql = "insert into info (username,password,firstname,lastname,address,pincode,phonenumber) values("+username+
		",'"+password+"','"+firstname+"','"+lastname+"','"+address+"','"+pincode+"','"+phonenumber+"')";


int flag=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");

}

else

{

out.println("Failed");

}

response.sendRedirect("show.html");

%>
	

</body>
</html>