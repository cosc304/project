<%@ page language="java" charset=UTF-8"  import="java.sql.*" " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
<header>
   <a href="index.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) { 
			%>
      <a href="login.jsp">Login</a>
       <%} else {
				%>
       <a href="logout.jsp"><%out.print(session.getAttribute("uname"));  %> | </a> <a href="logout.jsp">Logout</a><% //showing user name if user logged in%>
        <%}%>
 </header>
 <center> 
<table width="900" height="120" border="0" border-color = "green">
  <tr>
    <td width="240" height="85"><img src="head.png" width="251" height="88" alt="Logo" /></td><%//NO IMAGE %>
  </tr>
</table>
<hr />
<% session.setAttribute("uname", null);
 if(session.getAttribute("uname") != null) {
	session.invalidate();
	out.println("You have successfully logged out.");
	%>
    <script type="text/javascript">
function Redirect()
{
    window.location="index.jsp";
}
document.write("Redirecting you to the main page in just a few seconds.");
setTimeout('Redirect()', 5000);
</script>
<%
}
else
{%>
You're already Logged out. 
Click <a href="index.jsp">here</a> to go to the home page.
<%}%>
</body>
</html>