<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style>
.right {
    text-align: right;
}
</style>
</head>

<body>
<header>

<a href="index.jsp">Home</a> |
<%
if(user_id == 0) {
%>
<a href="login.jsp" class = "mainRight">Login</a>
<%} else {%>
<a href="logout.jsp" class = "mainRight"><%out.print(user_username);%></a>
<%}%>
</header>
<center>
<table width="900" height="120" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
  </tr>
</table>
<hr />
<br />
Welcome <%=user_username%>,

<script type="text/javascript">
function Redirect()
{
    window.location="index.jsp";
}
document.write("Redirecting you to the main page in just a few seconds.");
setTimeout('Redirect()', 5000);
</script>

</body>
</html>
