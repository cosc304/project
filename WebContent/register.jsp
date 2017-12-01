<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
</head>

<body>
 <header>

  
   <a href="main.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) { 
			%>
      <a href="login.jsp">Login</a>
       <%} else {
				%>
       <a href="logout.jsp"><%out.print(session.getAttribute("uname"));  %></a> <a href="logout.jsp">Logout</a><% //showing user name if user logged in%>
        <%}%>
 </header>
 <center> 
<table width="900" height="120" border="0" border-color = "green">
  <tr>
    <td width="240" height="85"><img src="head.png" width="251" height="88" alt="Logo" /></td><%//NO IMAGE %>
  </tr>
</table>
   <strong><em>Register here</em></strong>
   <form action="registration_process.jsp"><table><b>
            <tr><td>User Name   </td><td><input type="text" name="userName"></td></tr>
            <tr><td>Password   </td><td><input type="password" name="password"></td></tr>
            <tr><td>Email      </td><td><input type="email" name="email"></td></tr>
            <tr><td>First Name </td><td><input type="text" name="firstname"></td></tr>
            <tr><td>Last Name  </td><td><input type="text" name="lastname"></td></tr>
            <tr><td>Location id</td><td><input type="text" name="loc_id"></td></tr>
                
                
                <br>
                </b></table><br />
     <input type="submit" value="Register" />
                    </form>
            <br><hr>
           Are You Already Registered? To Login Click<a href="login.jsp"> Here</a>
                <hr>
                
    </center>
</body>
</html>