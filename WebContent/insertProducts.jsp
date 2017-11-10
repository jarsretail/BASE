<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="Style1.css">

<title>InsertProducts</title>

<SCRIPT language="javascript">

		function ViewOrder(id){
		    var f=document.form;
		    f.method="post";
		    f.action='Invoice.jsp?id='+id;
		    f.submit();
		}

		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var cell1 = row.insertCell(0);
			var element1 = document.createElement("input");
			element1.type = "checkbox";
			element1.name="chkbox[]";
			cell1.appendChild(element1);

			var cell2 = row.insertCell(1);
			cell2.innerHTML = (rowCount-1) + 1;

			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			
			var cell3 = row.insertCell(3);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			
			var cell3 = row.insertCell(4);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			
			var cell3 = row.insertCell(5);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);
			
			
		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;
			
			for(var i=0; i<rowCount; i++)
				{
					var cell2 = row.updateCell(1);
					cell2.innerHTML = i+1;
				}

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
					
				}


			}
			}catch(e) {
				alert(e);
			}
		}

		
	</SCRIPT>

</head>
<body>
<form action="AddProductsList.jsp" method="post" name="form"> 
<!-- <form action="Invoice.jsp" method="post" name="form"> -->
<%
       // String id = request.getParameter("id");
        //int i= 1;
		//int no = Integer.parseInt(id);
	%>
	<h1 class="header1">Add Products to Order</h1>
	
	
	
	<!-- <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" class="btn btn-success" />

	<INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" class="btn btn-danger" />

	<TABLE id="dataTable" width="350px" border="1"
			class="table table-hover table-striped table-bordered table-condensed">
		<tr>
			<th></th>
			<th>Sr.No</th>
			<th>ProductId</th>
			<th>ProductName</th>
			<th>ProductQuantity</th>
			<th>Product_mrp</th>
		</tr>
		<TR>
			<TD><INPUT type="checkbox" name="chk"/></TD>
			<TD>1</TD>
			<TD> <INPUT type="text" name="prodid"/> </TD>
			<TD> <INPUT type="text" name="prodname" /> </TD>
			<TD> <INPUT type="text" name="prodqnt"/> </TD>
			<TD> <INPUT type="text" name="prodmrp"/> </TD>
		</TR>
	</TABLE> -->
	
	
	<h1 class="header">Search Product</h1>
				<%String orderid = request.getParameter("id");
				//out.println("Order id:"+orderid);
				
				session.setAttribute("OrderId",orderid);
							 %>
				<h3>Order Id :<%=orderid %></h3>
				<table>
				<tr>
					<td>Search Product By Name :</td> 
					<td><input type="text" name="SearchName" /><br /></td>
				</tr>
				
				</table>
	
	 <INPUT type="submit" value="Submit" class="btn btn1" />
	<%-- <input type="button" name="delete" value="Submit"
					class="btn btn-info demo1"
					onclick="ViewOrder(<%=id%>);">
	 --%>
</form>	
</body>
</html>