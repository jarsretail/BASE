
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
<title>AddProductList</title>
</head>
<body>
	<%
 	String Prodid="";
 	String Prodname="";
 	String Prodqnt="";
 	String Prodmrp="";
 	int flag = 0;

 	String Orderid = request.getParameter("orderid");

	String Pid[] = request.getParameterValues("prodid");  
	//out.println(Pid[0]);
    String Pname[] = request.getParameterValues("prodname");  
    String Pqnt[] = request.getParameterValues("prodqnt"); 
    String Pmrp[] =  request.getParameterValues("prodmrp");
    
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection
    ("jdbc:mysql://localhost:3305/avenjars","root","mysql");
    Statement st=con.createStatement();
    
    //Statement st1 = con.createStatement();
    
    for(int i=0; i<Pid.length; i++){
        Prodid=Pid[i];
        Prodname=Pname[i];
        Prodqnt=Pqnt[i];
        Prodmrp=Pmrp[i];     
 
	String sql = "insert into jars_product (product_id, product_name, product_quantity, product_mrp) values("+Prodid+",'"+Prodname+"','"+Prodqnt+"','"+Prodmrp+"')";
	
	//String sql1 = "insert into jars_product_purchase( order_id, product_id) values("+Orderid+","+Prodid+")";

	//String sql2= "insert into jars_order (cust_id) values("+customerid+")";


 	flag=st.executeUpdate(sql);
 	//flag1=st1.executeUpdate(sql1);
    }
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
<p>Prod added: <%=Pid.length %></p>
</body>
</html>