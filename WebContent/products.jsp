<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
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

table {
	width: 100%;
}

table input {
	width: 100%;
}

table img {
	max-height: 64px;
	width: auto;
}
</style>
</head>
<body>

<div class="container">

<%@ include file="header.jsp" %>

	<section>
		<p>
		<table border="1">
		<%
		PreparedStatement ps;
		ResultSet rs;
		ResultSetMetaData rsmd;

		String sql= "select id Id, category Category, name Name, price Price, image Image from Product WHERE 1=1";
		String id = request.getParameter("id");
		if (id != null) {
			sql += " AND id=?";
		}
		String category = request.getParameter("category");
		if (category != null) {
			sql += " AND category=?";
		}
		String name = request.getParameter("name");
		if (name != null) {
			sql += " AND name LIKE CONCAT('%',?,'%')";
		}
		String price = request.getParameter("price");
		String price_compare = request.getParameter("price_compare");
		if (price != null) {
			if(price_compare != null) {
				switch(price_compare) {
					case "eq":
						sql += " AND price=?";
						break;
					case "ge":
						sql += " AND price>=?";
						break;
					case "le":
						sql += " AND price<=?";
						break;
					case "gt":
						sql += " AND price>?";
						break;
					case "lt":
						sql += " AND price<?";
						break;
				}
			}
			else {
				sql += " AND price=?";
			}
		}
		int idx = 1;
		connect();
		ps = con.prepareStatement(sql);
		if (id != null) {
			ps.setString(idx, id);
			idx++;
		}
		if (category != null) {
			ps.setString(idx, category);
			idx++;
		}
		if (name != null) {
			ps.setString(idx, name);
			idx++;
		}
		if (price != null) {
			ps.setString(idx, price);
			idx++;
		}
		rs = ps.executeQuery();
		rsmd = rs.getMetaData();
		%>
		<thead>
			<%
			if(user_admin) {
			%>
			<form action="productUpdate" method="post" enctype="multipart/form-data">
				<tr id="edit_row">
					<td><input name="product_id" type="number" /></td>
					<td><input name="category" type="text" /></td>
					<td><input name="name" type="text" /></td>
					<td><input name="price" type="number" step="0.01" /></td>
					<td><input name="image" type="file" /></td>
					<td><input name="submit" type="submit" /></td>
				</tr>
			</form>
			<%
			}
			%>
			<tr>
				<th><%=rsmd.getColumnLabel(1)%></th>
				<th><%=rsmd.getColumnLabel(2)%></th>
				<th><%=rsmd.getColumnLabel(3)%></th>
				<th><%=rsmd.getColumnLabel(4)%></th>
				<th><%=rsmd.getColumnLabel(5)%></th>
			</tr>
		</thead>
		<tbody>
		<%
		while(rs.next()) {
		%>
			<tr id="pid_<%=rs.getInt(1)%>">
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getDouble(4)%></td>
				<td class="center1">
					<a href="/productDetail.jsp?pid=<%=rs.getInt(1)%>">
						<img src="/image?pid=<%=rs.getInt(1)%>" />
					</a>
				</td>
			</tr>
		<%
		}
		disconnect();
		%>
		</tbody>
		</table>
		</p>
	</section>

	<footer>Copyright &copy; LegitimateComputerGoods.com</footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%if(user_admin) {%>
<script>
$(document).ready(function(){
	$('.edit').click(function(){
		var row = $(this).parent().parent();

		$('#edit_row td:nth-child(1) input').val(   parseInt($('td:nth-child(1)', row).text()));
		$('#edit_row td:nth-child(2) input').val(            $('td:nth-child(2)', row).text());
		$('#edit_row td:nth-child(3) input').val(            $('td:nth-child(3)', row).text());
		$('#edit_row td:nth-child(4) input').val(parseFloat( $('td:nth-child(4)', row).text()));
	});
});
</script>
<%}%>

</body>
</html>
