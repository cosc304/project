<%@ page import="java.util.HashMap" %>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
//HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

//if (productList == null)
//{	// No products currently in list.  Create a list.
	//productList = new HashMap<String, ArrayList<Object>>();
//}


 String sql = "select id ID, total Total from Order where user_id = ? and cart = 1";
 String sql2 = "Insert into Order values (0, ?, NOW(), ?, 1)";
 String sql3 = "select price from Product where id = ?";
// Add new product selected
// Get product information
String id = request.getParameter("product_id");

PreparedStatement ps;
ResultSet rs;

connect();

ps = con.prepareStatement(sql3);
rs = ps.executeQuery();
ps.setString(1, id);
double prodPrice = rs.getInt(1);

if(user_id ==0){
	out.print("You have to be logged in to add to your cart!");
	%>
	<script type="text/javascript">
function Redirect()
{
    window.location="login.jsp";
}
document.write("Redirecting you to the login page in just a few seconds.");
setTimeout('Redirect()', 3000);
</script>
	<%
}
ps = con.prepareStatement(sql);
rs = ps.executeQuery();

ps.setInt(1, user_id);

if(rs.next()){
	int orderId = rs.getInt(1);
	double total = rs.getDouble(2);
	ps.setDouble(2, total+prodPrice);
	
}else{
	ps = con.prepareStatement(sql2);
	ps.executeUpdate();
	
	ps.setInt(2, user_id);
	ps.setDouble(4, prodPrice);

}




%>
<jsp:forward page="showcart.jsp" />