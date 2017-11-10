
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
<title>AddProductToOrder</title>
</head>
<body>
	<%
 	int flag = 0;
 	//String Orderid = request.getParameter("orderid");
	//String Prodid =  request.getParameter("prodid");
	String Orderid = session.getAttribute("orderid").toString();
	//String Prodid = session.getAttribute("productid").toString();
	//String Orderid = request.getParameter("orderid");
	String Prodid =  request.getParameter("productid");
    /* Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection
    ("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
    BaseConnection basecon = new BaseConnection();
    Connection con= basecon.getConnection();
    Statement st=con.createStatement();
    
    //Statement st1 = con.createStatement();    
    
	//String sql = "insert into jars_product (product_id, product_name, product_quantity, product_mrp) values("+Prodid+",'"+Prodname+"','"+Prodqnt+"','"+Prodmrp+"')";
	
	String sql1 = "insert into jars_product_purchase( order_id, product_id) values("+Orderid+","+Prodid+")";

	//String sql2= "insert into jars_order (cust_id) values("+customerid+")";


 	flag=st.executeUpdate(sql1);
 	//flag1=st1.executeUpdate(sql1);
    
//int flag2=st.executeUpdate(sql);

if(flag==1)

{

out.println("Added!");
//response.sendRedirect("CreateOrder.jsp");
}

else

{

out.println("Failed");

}

//response.sendRedirect("show.html");

%>

</body>
</html>