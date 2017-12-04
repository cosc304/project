<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
</head>
<body>

<%
// Get the current list of products
	String id = request.getParameter("id");
	
	String sql = "Select P.name, P.category, P.price from Product P, OrderProduct OP where P.id = OP.product_id and OP.order_id = ?";
	
	String sqlOrder = "Select O.id from `Order` O where user_id = ? order by `time` desc limit 1";
	
	String sql2 = "Select total from Order where user_id = ?";// this needs to be fixed
	
	
	String sql3 = "Select id from User where session_id != ?";
	int currentOrderId = 0;
	PreparedStatement ps;
	ResultSet rs;

	connect();
	//grabbing order_id from Order 
	ps = con.prepareStatement(sqlOrder);
	ps.setInt(1 , user_id);
	rs = ps.executeQuery();
	if(rs.next())
		currentOrderId = rs.getInt(1);//the most recent order will be shown
	
	
	//getting the user ID 
//	ps = con.prepareStatement(sql3);
//	ps.setInt(1, 0);
//	rs = ps.executeQuery();
//	rs.next();
//	int userId = rs.getInt(1);
	
	
	ps = con.prepareStatement(sql);
	ps.setInt(1, currentOrderId);
	rs = ps.executeQuery();
	
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table border=\"solid red 1px\"><tr><th>Product Name</th><th>Category</th><th>Price</th>");
	
	while(rs.next()){
	
		out.print("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2)+ "</td><td>"+ rs.getDouble(3) +"</td></tr>");
	
	}
	//ps = con.prepareStatement(sql2);
	//ps.setInt(1, 1);
	//rs = ps.executeQuery();
	//rs.next();
	//out.println("<tr><td colspan=\"3\">Total Cost: " + rs.getDouble(1) + "</tr></td></table>");
	//double total =0;
	
%>
<h2><a href="products.jsp">Continue Shopping</a></h2>
</body>
</html>
