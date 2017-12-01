<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Log in</title>
<style>
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%@ include file="header.jsp" %>

<center>
<form margin="auto" action="login_validate.jsp" method="post">
<table width="900" height="120" border="0" border-color = "green">
  <tr>
    <td width="240" height="85"><img src="a gsfda.jpg" width="251" height="88" alt="Logo" /></td>
  </tr>
</table>
<hr />

  <table width="1">
  <tr>
<td colspan="2" class="italics"> User Login </td>
</tr>
<tr>
<td> Username: </td>
<td> <input type="text" name="usrnm"> </td>
</tr>
<tr>
<td> Password: </td>
<td> <input type="password" name="pswrd"> </td>
</tr>
<tr>
<td> <input type="submit" value="Log In"> </td>
<td><input type="reset" value="Clear"> </td>
</tr>
</table>

</form>

</center>
</body>
</html>
