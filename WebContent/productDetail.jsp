<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.util.Base64" %>
<%@ include file="session.jsp" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
<head>
<style>
div.container {
	width: 100%;
	height: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: white;
	background-color: red;
	clear: left;
	text-align: center;
}

section {
	margin-left: 160px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
}
</style>
</head>
<body>

<div class="container">

<%@ include file="header.jsp" %>

	<section>
	
		<table width="992" height="179" border="1">
		<%
		String category = request.getParameter("product_id");
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		PreparedStatement ps;
		ResultSet rs;
		ResultSetMetaData rsmd;
    //currFormat.format(rs.getBytes(3))
		connect();
		
		ps = con.prepareStatement("select id Id, name Name, price Price, description Description, category Category from Product");
		rs = ps.executeQuery();
		rsmd = rs.getMetaData();
		rs.next();
		%>
		
		<table border ="red solid 1px">
		<tr><td>Product Id</td><td>Product Name</td><td>Price</td><td>Category</td> </tr>
		<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td> </tr>
		</table>
		
		<form action="addcart.jsp" method="post">
		<a href="addcart.jsp">Add to cart</a>
		</form>
		
		
	
	</section>

	<footer>Copyright &copy; CP.com</footer>

</div>
<% %>
</body>
</html>
