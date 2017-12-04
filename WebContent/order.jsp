<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map,java.math.BigDecimal"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>CP Order Processing</title>
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
		<%@ include file="header.jsp"%>
		<section>
			<%@ include file="session.jsp"%>
			<%
				// Get customer id
				String custId = request.getParameter("customerId");
				// Get password
				String password = request.getParameter("password");
				// Get address info
				String address = request.getParameter("address");
				String postalcode = request.getParameter("postalcode");
				String city = request.getParameter("city");
				String province = request.getParameter("province");
				String country = request.getParameter("country");
				// Get shopping cart
				@SuppressWarnings({ "unchecked" })
				HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session
						.getAttribute("productList");

				try {
					if (custId == null || custId.equals(""))
						out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
					else if (productList == null)
						out.println("<h1>Your shopping cart is empty!</h1>");
					else {
						// Check if customer id is a number
						int num = -1;
						try {
							num = Integer.parseInt(custId);
						} catch (Exception e) {
							out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
							return;
						}

						// Get database connection
						connect();

						String sql = "SELECT id, username, password FROM User WHERE id = ?";

						con = DriverManager.getConnection(url, uid, pw);
						PreparedStatement pst = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						ResultSet rst = pstmt.executeQuery();
						int orderId = 0;
						String custName = "";

						if (!rst.next()) {
							out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
						} else {
							custName = rst.getString(2);
							String dbpassword = rst.getString(3);

							// make sure the password on the database is the same as the one the user entered
							if (!dbpassword.equals(password)) {
								out.println("The password you entered was not correct.  Please go back and try again.<br>");
								return;
							}

							// Enter order information into database
							sql = "INSERT INTO Orders (id, total) VALUES(?, 0);";

							// Retrieve auto-generated key for orderId
							pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
							pstmt.setInt(1, num);
							pstmt.executeUpdate();
							ResultSet keys = pst.getGeneratedKeys();
							keys.next();
							orderId = keys.getInt(1);

							out.println("<h1>Your Order Summary</h1>");
							out.println(
									"<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Subtotal</th></tr>");

							double total = 0;
							Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
							NumberFormat currFormat = NumberFormat.getCurrencyInstance();

							while (iterator.hasNext()) {
								Map.Entry<String, ArrayList<Object>> entry = iterator.next();
								ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
								String productId = (String) product.get(0);
								out.print("<tr><td>" + productId + "</td>");
								out.print("<td>" + product.get(1) + "</td>");
								out.print("<td align=\"center\">" + product.get(3) + "</td>");
								String price = (String) product.get(2);
								double pr = Double.parseDouble(price);
								int qty = ((Integer) product.get(3)).intValue();
								out.print("<td align=\"right\">" + currFormat.format(pr) + "</td>");
								out.print("<td align=\"right\">" + currFormat.format(pr * qty) + "</td></tr>");
								out.println("</tr>");
								total = total + pr * qty;

								sql = "INSERT INTO OrderedProduct VALUES(?, ?, ?)";
								pst = con.prepareStatement(sql);
								pst.setInt(1, orderId);
								pst.setInt(2, Integer.parseInt(productId));
								pst.setInt(3, qty);
								pst.executeUpdate();
							}
							out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
									+ "<td aling=\"right\">" + currFormat.format(total) + "</td></tr>");
							out.println("</table>");

							// Update order total
							sql = "UPDATE Orders SET total=? WHERE 'Order'.id=?";
							pst = con.prepareStatement(sql);
							pst.setDouble(1, total);
							pst.setInt(2, orderId);
							pst.executeUpdate();

							out.println("<h1>Order completed.  Will be shipped soon...</h1>");
							out.println("<h1>Your order reference number is: " + orderId + "</h1>");
							out.println("<h1>Shipping to customer: " + custId + " Name: " + custName + "</h1>");
							out.println("<h1>Address:" + address+postalcode+city+province+country+"</h1>");
							// Clear session variables (cart)
							session.setAttribute("productList", null);
						}
					}
				} catch (SQLException ex) {
					out.println(ex);
				} finally {
					try {
						if (con != null)
							con.close();
					} catch (SQLException ex) {
						out.println(ex);
					}
				}
			%>


		</section>

		<footer>Copyright &copy; Legitimate Computer Goods.com</footer>

	</div>
</body>
</html>

