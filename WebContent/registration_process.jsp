<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file= "session.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>

<%@ include file="header.jsp" %>

<center>
<table width="900" height="120" border="0">
    <tr>
        <td width="251" height="96"> <!-- <img src="head.png" width="251" height="88" alt="Logo" /></td>//NO IMAGE -->
    </tr>
</table>

<%
 //       String m=null, mn=null;
String s=request.getParameter("userName");
String s1=request.getParameter("password");
String s2=request.getParameter("email");
String s3=request.getParameter("firstname");
String s4=request.getParameter("lastname");
//String s5=request.getParameter("loc_id");

PreparedStatement ps = con.prepareStatement("insert into User values (?,?,?,?,?,?,?,?,?)");

ps.setInt(1,0);
ps.setString(2,null);
ps.setString(3,s);
ps.setString(4,s1);
ps.setString(5,s2);
ps.setString(6,s3);
ps.setString(7,s4);
ps.setInt(8,0);
ps.setString(9, session.getId());
int addResult = ps.executeUpdate();
if (addResult!=0)
{
    out.println("Successfully registered");
}
%>
<br><hr>

<script>
function Redirect() { window.location="index.jsp";}
document.write("Redirecting you to the main page in just a few seconds.");
setTimeout('Redirect()', 5000);
</script>

<hr>
</body>
</html>
