<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.util.Base64" %>
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
</style>
</head>
<body>

<div class="container">

<%@ include file="header.jsp" %>

	<section>
		<p>
		<table width="992" height="179" border="1">
		<%
		String category = request.getParameter("category");

		PreparedStatement ps;
		ResultSet rs;
		ResultSetMetaData rsmd;

		connect();
		if(category == null) {
			ps = con.prepareStatement("select id Id, name Name, price Price, image Image, category Category from Product");
		} else {
			ps = con.prepareStatement("select id Id, name Name, price Price, image Image, category Category from Product where category=?");
			ps.setString(1, category);
		}
		rs = ps.executeQuery();
		rsmd = rs.getMetaData();
		%>
		<thead>
			<%
			if(user_admin) {
			%>
			<form action="productUpdate.jsp" method="post" enctype="multipart/form-data">
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
				<th><%=rsmd.getColumnLabel(5)%></th>
				<th><%=rsmd.getColumnLabel(2)%></th>
				<th><%=rsmd.getColumnLabel(3)%></th>
				<th><%=rsmd.getColumnLabel(4)%></th>
			</tr>
		</thead>
		<tbody>
		<%
		while(rs.next()) {
			byte[] imgData = rs.getBytes(4);
			String imgDataBase64;
			if(imgData != null) {
				imgDataBase64 = Base64.getEncoder().encodeToString(imgData);
				imgData = null;
			} else {
				imgDataBase64 = "";
			}
		%>
			<tr id="pid_<%=rs.getInt(1)%>">
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getDouble(3)%></td>
				<td width="185" class="center1">
					<form action="productDetail.jsp">
						<input name="product_id" type="image" value="<%=rs.getInt(1)%>" src="data:image/jpg;base64,<%=imgDataBase64%>" width="73" height="105">
					</form>
				</td>
				<%
				if(user_admin) {
				%>
				<td>
					<input class="edit" type="button" name="edit_<%=rs.getInt(1)%>" value="Edit" />
				</td>
				<%
				}
				%>
			</tr>
		<%
		}
		disconnect();
		%>
		</tbody>
		</table>
		</p>
	</section>

	<footer>Copyright &copy; Legitimate Computer Goods.com</footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%if(user_admin) {%>
<script>
$('.edit').click(function(){
	var row = $(this).parent().parent();

	$('#edit_row td:nth-child(1) input').val(parseInt($('td:nth-child(1)', row).text()));
	$('#edit_row td:nth-child(2) input').val($('td:nth-child(2)', row).text());
	$('#edit_row td:nth-child(3) input').val($('td:nth-child(3)', row).text());
	$('#edit_row td:nth-child(4) input').val(parseFloat($('td:nth-child(4)', row).text()));
});
</script>
<%}%>

</body>
</html>
