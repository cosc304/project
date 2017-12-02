<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
	<%@ include file="session.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
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
    margin-left: 170px;
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
	<hr />
	<p>
		<%@ page language="java"%>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.sql.DriverManager.*"%>
		<%
			String pid = request.getParameter("product");
			PreparedStatement ps;
			ResultSet rs1 = null;
			connect();
			Statement st = con.createStatement();
			ps = con.prepareStatement("SELECT product.id, product.name, product.price from product where product= ?");
			ps.setString(1, pid);
			rs1 = ps.executeQuery();
			while (rs1.next()) {
		%>
		<%=rs1.getString(1)%>
			<%=rs1.getString(4)%>
      <%=rs1.getString(2)%>
		</p>
		<%
			}
			ps = con.prepareStatement("select image from product where product.id=?");
			ps.setString(1, pid);
			rs1 = ps.executeQuery();
			while (rs1.next()) {
		%>
	</p>
	<table width="997" height="399" border="0">
		<tr>
			<td width="358" class="center1"><img src=<%=rs1.getString(7)%>
				width="200" height="300" alt=hname /></td>
			<%
				}
				ps = con.prepareStatement("select product.id, product.name, product.price, product.description from product where product.id=?");
				ps.setString(1, pid);
				rs1 = ps.executeQuery();
				while (rs1.next()) {
			%>
			<td width="623" class="center1"><table width="466" height="200"
					border="0">
					<tr>
						<td width="179" class="center1">Product Id :</td>
						<td width="277" class="normal"><%=rs1.getString(1)%></td>
					</tr>
					<tr>
						<td class="center1">Product Name:</td>
						<td><%=rs1.getString(4)%></td>
					</tr>
					<tr>
						<td class="center1">Price :</td>
						<td><%=rs1.getString(2)%></td>
					</tr>
					<tr>
						<td class="center1">Description :</td>
						<td><%=rs1.getString(6)%></td>
					</tr>
					<%
						}
					%>
				</table>
				<p>
					<form action="addcart.jsp">
						<input type="hidden" name="name" value=<%=pid%>> <input
							type="image" src="addCartButton.png" name="buy"
							value="add">
					</form>
				</p></td>
		</tr>
	</table>
	
	<%
		rs.close();
		disconnect();
	%>
		</section>
		
	
	
	<footer>Copyright &copy; Legitimate Computer Goods.com</footer>

</div>
</body>
</html>
