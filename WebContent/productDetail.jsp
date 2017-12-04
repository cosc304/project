<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.text.NumberFormat" %>
<%@ include file="session.jsp" %>
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

section img {
	max-height: 128px;
}
</style>
</head>
<body>

<div class="container">

<%@ include file="header.jsp" %>

	<section>

		<%
		String pid = request.getParameter("pid");
		NumberFormat currFormat = NumberFormat.getCurrencyInstance();
		PreparedStatement ps;
		ResultSet rs;
		ResultSetMetaData rsmd;
		//currFormat.format(rs.getBytes(3))
		connect();

		ps = con.prepareStatement("SELECT id Id, name Name, price Price, description Description, category Category FROM Product WHERE id=?");
		ps.setString(1,pid);
		rs = ps.executeQuery();
		rsmd = rs.getMetaData();
		if(rs.next()) {
		%>

			<img src="/image?pid=<%=rs.getInt(1)%>" />
			<table border ="red solid 1px">
			<thead><tr><th><%=rsmd.getColumnLabel(1)%></th><th><%=rsmd.getColumnLabel(2)%></th><th><%=rsmd.getColumnLabel(3)%></th><th><%=rsmd.getColumnLabel(4)%></th></tr></thead>
			<tbody><tr><td><%=rs.getInt(1)%>          </td><td><%=rs.getString(2)%>       </td><td><%=rs.getString(3)%>       </td><td><%=rs.getString(4)%>       </td></tr></tbody>
			</table>

			<form action="addcart.jsp" method="post">
			<button name="pid" value="<%=rs.getInt(1)%>" type="submit">Add to cart</button>
			</form>

		<%
		}
		%>

	</section>

	<footer>Copyright &copy; LegitimateComputerGoods.com</footer>

</div>

</body>
</html>
