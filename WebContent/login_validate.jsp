<%@ page language="java" import="java.io.*" import="java.sql.*" %>
<%

PreparedStatement pstmt;
Connection con;
ResultSet rs= null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("cosc");

  Statement st=con.createStatement();
%> 
<% 
boolean flag = false; 

String unameid = request.getParameter ("uid"); 
String pass = request.getParameter ("password"); 
%>

<% 

String sql = "SELECT name from register1 where id=? And password =?"; //CHANGE THIS TO CUSTOMERS ID TO USERID 

try {  
pstmt = con.prepareStatement (sql); 
pstmt.setString(1,unameid); 
pstmt.setString(2,pass); 
rs = pstmt.executeQuery(); 
if (rs.next ()) { 
out.println (rs.getString ("unameid")); 
flag = true; 
session.setAttribute("uname", rs.getString ("unameid")); 
} else { 
//request.setAttribute("err", "user name or password error!"); //DONT KNOW WHAT ERR IS

flag = false;
}

rs.close (); 
pstmt.close (); 
con.close ();

} catch (Exception e) { 
out.println (e); 
} 
%>


<% 

if (flag) { 

%>

<jsp:forward page="login_succeed.jsp" />

<%

} 
else { 
%>

<jsp:forward page="login_fail.jsp"/> 
<% 
} 
%>
</body>
</html>