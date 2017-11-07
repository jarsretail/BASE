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
<title>ProductPurchaseInfo</title>
</head>
<body>
	<%
 
		String orderid=request.getParameter("orderid");

		String productid=request.getParameter("productid");
		
		Class.forName("com.mysql.jdbc.Driver");

		Connection con=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/avenjars","root","root");

		Statement st=con.createStatement();

		String sql = "insert into jars_product_purchase ( order_id, product_id) values("+orderid+","+productid+")";

		int flag=st.executeUpdate(sql);
		//int flag2=st.executeUpdate(sql);

		if(flag==1)

		{

		out.println("Added!");

		}

		else

		{

		out.println("Failed");

		}

	%>
	</form>
</body>
</html>