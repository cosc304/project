<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager.*" %>
<div class="container">

<%@ include file="header.jsp" %>

<section>
<hr />
<p>Search Results:</p>
<p>
<%
       PreparedStatement ps;
        Connection con;
        ResultSet rs= null,rs1=null,rs2=null;
       Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://cosc304.ok.ubc.ca/db_kvankes", "kvankes", "37845138");

         Statement st=con.createStatement();
%>
<%
boolean flag = false;
String search = request.getParameter ("search");
%>
<%
String pid=null;
search="%"+search+"%";
try {
ps = con.prepareStatement ("SELECT product.id, product.name, product.price from product where name like ?");
ps.setString (1,search);
rs = ps.executeQuery ();
if (rs.next ()) {
    flag = true;
%>
	<p><table width="992" height="179" border="0">
  <%do
		 {%>
         <tr>
    <td width="185" height="173" class="center1">
    <% pid=rs.getString(1);
	ps=con.prepareStatement("select image from product where product.id=?");
		 ps.setString(1,pid);
		 rs1=ps.executeQuery();
		 while(rs1.next())
		 {
			 %>
    <table width="120" height="133" border="0" align="center">
              <tr>
                <td><form action="productDetail.jsp">
<input type="hidden" name="product" value=<%=rs1.getString(1)%>>
<input name="buy" type="image" value="Image" src=<%=rs1.getString(7)%> width="73" height="105">
</form></td>
              </tr>
              <%}%>
      </table>
            <%
            ps=con.prepareStatement("select product.id, product.name, product.price from product where product.id=?");
		 ps.setString(1,pid);
		 rs2=ps.executeQuery();
		 while(rs2.next())
		 {%>


                </td>
                <td width="791"><p><%=rs2.getString(1)%> <%=rs2.getString(4)%></p>
		   <p>$ <%=rs2.getString(2)%></p><%}%></td></tr><%}while(rs.next());%>
</table>

<%} else {
%>
<jsp:forward page="searchfail.jsp"/>
 <%
}
} catch (Exception e) {
out.println (e);
} %>
</p>
</section>
</div>
</body>
</html>
