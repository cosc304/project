<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order List</title>
</head>
<body>

<h1>Order List</h1>
<table border="1">
<%
// Useful code for formatting currency values:
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection

// Write query to retrieve all order headers
connect();
PreparedStatement pstmt1 = con.prepareStatement(
	"SELECT O.id AS order_id,U.id AS user_id,U.firstname,U.lastname,O.total FROM `Order` O, User U WHERE "+
	"O.user_id = U.id"
);
PreparedStatement pstmt2 = con.prepareStatement(
	"SELECT P.id AS product_id, quantity, P.price FROM OrderProduct OP, Product P WHERE "+
	"OP.product_id = P.id AND OP.order_id = ?"
);
ResultSet rs1 = pstmt1.executeQuery();
ResultSet rs2;
ResultSetMetaData rsmd1 = rs1.getMetaData();
ResultSetMetaData rsmd2;
int columnCount1 = rsmd1.getColumnCount();
int columnCount2;
//Print headers
out.println("<thead><tr>");
for(int i = 1; i <= columnCount1; i++) {
	out.println("<th>"+rsmd1.getColumnLabel(i)+"</th>");
}
out.println("</tr></thead>");
out.println("<tbody>");
//Print order info
while(rs1.next()) {
	int oid = rs1.getInt(1);
	out.println("<tr><td>"+oid+"</td><td>"+rs1.getInt(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getString(4)+"</td><td>"+currFormat.format(rs1.getDouble(5))+"</td></tr>");
	//Print products
	pstmt2.setInt(1, oid);
	rs2 = pstmt2.executeQuery();
	rsmd2 = rs2.getMetaData();
	columnCount2 = rsmd2.getColumnCount();
	out.println("<tr align=\"right\"><td colspan=\"4\"><table border=\"1\"><thead><tr>");
	for(int i = 1; i <= columnCount2; i++) {
		out.println("<th>"+rsmd2.getColumnLabel(i)+"</th>");
	}
	out.println("</td></tr></thead><tbody>");
	while(rs2.next()) {
		out.println("<tr><td>"+rs2.getInt(1)+"</td><td>"+rs2.getInt(2)+"</td><td>"+currFormat.format(Double.parseDouble(rs2.getString(3)))+"</td></tr>");
	}
	out.println("</tbody></table></tr>");
}
out.println("</tbody>");
disconnect();
%>
</table>
</body>
</html>
