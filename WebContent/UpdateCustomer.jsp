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
 
String customerid=request.getParameter("customerid");

String customername=request.getParameter("customername");

String customerphone=request.getParameter("customerphone");

String customeremail=request.getParameter("customeremail");

String customerflatno=request.getParameter("customerflatno");

String customersociety=request.getParameter("customersociety");

String customerarea=request.getParameter("customerarea");

String customercity=request.getParameter("customercity");

String customerpincode=request.getParameter("customerpincode");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3305/avenjars","root","mysql");

Statement st=con.createStatement();

String sql = "update jars_customer set customer_name='"+customername+"', customer_phone='"+customerphone+"', customer_email='"+customeremail+"',customer_flat_no = '"+customerflatno+"', customer_society = '"+customersociety+"', customer_area = '"+customerarea+"', customer_city = '"+customercity+"',customer_pincode = '"+customerpincode+"' where customer_id ="+customerid;

//String sql2= "insert into jars_order (cust_id) values("+customerid+")";


int flag=st.executeUpdate(sql);
//int flag2=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");
response.sendRedirect("CustomerList.jsp");


}

else

{

out.println("Failed");

}

//response.sendRedirect("show.html");

%>
	

</body>
</html>