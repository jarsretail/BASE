<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>

<%@page import="java.sql.Connection" %>

<%@page import="BaseConnectLib.BaseConnection" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="Style1.css">
  
  <script type="text/javascript">
    function fnSum()
    {
        var num1 = parseInt(document.getElementById("qnt").value);
        var num2 = parseInt(document.getElementById("prc").value);
        var total = num1 * num2;
        document.getElementById("amt").value = total;
    }
    </script>

</head>


<body>
<h1>Order Details</h1>

<%
	        	String id = request.getParameter("id");
				//out.println(id);
				Connection con = null;
				//String url = "jdbc:mysql://localhost:3305/";
				//String db = "test";
				//String driver = "com.mysql.jdbc.Driver";
				//String userName = "root";
				//String password = "root";
				//String cid= session.getAttribute("CustId").toString();
				int sumcount = 0;
				Statement st;
				
				//Statement st1;
				try {
					/* Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3305/avenjars","root","mysql"); */
					BaseConnection basecon = new BaseConnection();
					con= basecon.getConnection();
					//String query = "select * from jars_customer";
					//String query = "select customer_id, customer_name, order_id, customer_phone, customer_email, order_date, customer_flat_no, customer_society, customer_area, customer_city, customer_pincode from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id where order_id ="+id;
					String query = "select jars_order.order_id, cust_id, customer_name, customer_phone, customer_email, customer_flat_no, customer_society, customer_area, customer_city, customer_pincode, order_date, jars_product_purchase.product_id, product_name, product_quantity, product_mrp from jars_customer join jars_order ON jars_customer.customer_id = jars_order.cust_id join jars_product_purchase ON jars_order.order_id = jars_product_purchase.order_id join jars_product ON jars_product_purchase.product_id = jars_product.product_id where jars_order.order_id = "+id;
					//String query1 = "select order_id, jars_product_purchase.product_id, product_name, product_quantity, product_mrp from jars_product join jars_product_purchase on jars_product.product_id = jars_product_purchase.product_id where order_id ="+id;
					
					st = con.createStatement();
					//st1=con.createStatement();
					
					ResultSet rs = st.executeQuery(query);
					
					//ResultSet rs1 = st.executeQuery(query1);
			%>
			<%-- <%if(rs.last())
				{%>
				
				<div class="col-sm-3">
<img src="jars.jpg" width="320" heigth="320"/>
</div>
<div class="col-sm-9">
<table class="table table-bordered">
				<tr>
      				<td>Order No : </td>
					<td><%=rs.getString(3) %><br /></td>
				</tr>
				 <tr>
				     <td>Date :</td>
				     <td><%=rs.getString(6) %><br /></td>
				 </tr>
				<tr>
					<td>Customer Name :</td>
					<td><%=rs.getString(2) %><br /></td>
				</tr>		
				<tr>		
					<td>Customer Phone :</td>
					<td><%=rs.getString(4) %><br /></td>
				</tr>		
				<tr>
					<td>Customer Email :</td>
					<td><%=rs.getString(5) %><br /></td>
				</tr>	
				<tr>
				    <td>Address :</td>
				    <td><%=rs.getString(7) %>-<%=rs.getString(8) %>,<%=rs.getString(9) %>,<%=rs.getString(10) %>,<%=rs.getString(11) %><br /></td>
				 </tr>
				
</table>

<%} %> --%>
		<%
				while (rs.next()) {
					
			%> 
			
		<%if(rs.last())
				{%>
				
				<div class="col-sm-3">
<img src="jars.jpg" width="320" heigth="320"/>
</div>
<div class="col-sm-9">
<table class="table table-bordered">
				<tr>
      				<td>Order No : </td>
					<td><%=rs.getString(1) %><br /></td>
				</tr>
				 <tr>
				     <td>Date :</td>
				     <td><%=rs.getString(11) %><br /></td>
				 </tr>
				<tr>
					<td>Customer Name :</td>
					<td><%=rs.getString(3) %><br /></td>
				</tr>		
				<tr>		
					<td>Customer Phone :</td>
					<td><%=rs.getString(4) %><br /></td>
				</tr>		
				<tr>
					<td>Customer Email :</td>
					<td><%=rs.getString(5) %><br /></td>
				</tr>	
				<tr>
				    <td>Address :</td>
				    <td><%=rs.getString(6) %>-<%=rs.getString(7) %>,<%=rs.getString(8) %>,<%=rs.getString(9) %>,<%=rs.getString(10) %><br /></td>
				 </tr>
				
</table>
</div>
<%} %>  
  

<table class="table table-bordered">	
	       
				       
  <tr>
    <th>Sr.No</th>
    <th>Product Name </th> 
    <th>Pack Size</th>
    <th>Quantity</th>
    <th>Price/unit/Kg</th>
    <th>Amount</th>
  </tr>
   <%for(int i=1;i<=rs.getRow();i++)
	  {%>  
	 
  <tr>
  	<td><%=i %></td>
  	<td><%=rs.getString(13) %></td>
  	<td><input type="text" name="size" ></td>
  	<td><input id="qnt" type="text" name="size" oninput="fnSum()"></td>
  	<td><input id="prc" type="text" name="size" value=<%=rs.getString(15) %>></td>
  	<td><input id="amt" type="text" name="size" ></td>
  </tr>
  
   <%-- <%
  int srno=0;
				while (rs.next()) {
					srno++;
			%>
			<tr>
  	<td>srno</td>
  	<td><%=rs.getString(13) %></td>
  	<td><input type="text" name="size" ></td>
  	<td><input id="qnt" type="text" name="size" oninput="fnSum()"></td>
  	<td><input id="prc" type="text" name="size" value=<%=rs.getString(15) %>></td>
  	<td><input id="amt" type="text" name="size" ></td>
  </tr> --%>
 
 <%-- <%
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

for(int i=0; i<Pid.length; i++){
Prodid=Pid[i];
Prodname=Pname[i];
Prodqnt=Pqnt[i];
Prodmrp=Pmrp[i];   
%> 
<tr>
<td><%=Prodname %></td>
<td><%=Prodqnt %></td>
<td><%=Prodmrp %></td>
<td><%=Integer.parseInt(Prodqnt)*Integer.parseInt(Prodmrp)%></td>
</tr>

<% } %>
		 --%>
		 
  <%}
				
	  }
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
  
</table>

</body>
</html>
