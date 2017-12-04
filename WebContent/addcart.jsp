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


 String sql = "select id ID, total Total from `Order` where user_id = ? and cart = 1";
 String sql2 = "Insert into `Order` values (0, ?, NOW(), ?, 1)";
 String sql3 = "select price from Product where id = ?";
// Add new product selected
// Get product information
String id = request.getParameter("product_id");

PreparedStatement ps;
ResultSet rs;

connect();
//SELECTING PRICE OF PRODUCT FOR UPDATING TOTAL
ps = con.prepareStatement(sql3);
ps.setString(1, id);
rs = ps.executeQuery();

//SQL 3 getting the price 
if(rs.next()){
double prodPrice = rs.getDouble(1);

//IF USER ID = 0 IT IS NOT LOGGED IN AND THUS CANT ADD TO CART
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
	
	
}else{//IF USER IS INDEED LOGGED IN
//SELECTING ID AND TOTAL FROM ORDER?
ps = con.prepareStatement(sql);
ps.setInt(1, user_id);
rs = ps.executeQuery();

if(rs.next()){
	int orderId = rs.getInt(1);
	double total = rs.getDouble(2);// added total for the variable thingy probably dont need it 
//	ps.setDouble(2, total+prodPrice);

			//ELSE IF THERE IS NO ORDER ONE WILL BE CREATED
}else{
	ps = con.prepareStatement(sql2);
	ps.setInt(1, user_id);
	ps.setDouble(2, prodPrice);
	
	ps.executeUpdate();
	


}
//this sekects the TOTAL
ps = con.prepareStatement(sql);
ps.setInt(1, user_id);
rs = ps.executeQuery();




}}

%>
<script type="text/javascript">
function Redirect()
{
    window.location="showcart.jsp";
}

setTimeout('Redirect()', 1000);
</script>