<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DtD XHtML 1.0 transitional//EN" "http://www.w3.org/tR/xhtml1/DtD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>Login Failed</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
<header>

<a href="main.jsp">Home</a> |
<style>
.mainRight {

}
</style>

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
<p><strong>Username or Password Incorrect!</strong> Click <a href="register.jsp"><strong>here</strong></a> to register if you do not have an account.</p>

<form action="loginconf.jsp" method="post">
  <p>&nbsp;</p>
  <table width="1">
  <tr>
<td colspan="2" class="italics"> User Login </td>
</tr>
<tr>
<td> Username: </td>
<td> <input type="text" name="uid"> </td>
</tr>
<tr>
<td> Password: </td>
<td> <input type="password" name="password"> </td>
</tr>
<tr>
<td> <input type="submit" value="Log In"> </td>
<td><input type="reset" value="Clear"> </td>
</tr>
</table>

</Form>

</Center></p>
</body>
</html>
