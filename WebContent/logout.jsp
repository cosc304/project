<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {
    text-align: right;
}
</style>
</head>

<body>

<%@ include file="header.jsp" %>

 <center>
<table width="900" height="120" border="0" border-color = "green">
  <tr>
    <td width="240" height="85"><img src="head.png" width="251" height="88" alt="Logo" /></td>
  </tr>
</table>
<hr />
<%
if(user_id != 0) {
    session.invalidate();
    session = request.getSession();
    out.println("You have successfully logged out.");
} else {
%>
You're already Logged out.
Click <a href="index.jsp">here</a> to go to the home page.
<%%>
<%
}
%>

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
