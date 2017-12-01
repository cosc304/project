<%@ page language="java" import="java.io.*" import="java.sql.*" %>
<%
String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_kvankes";
String uid = "kvankes";
String pw = "37845138";

PreparedStatement pstmt;
Connection con;
ResultSet rst= null;

//get connection

try{
Class.forName("com.mysql.jdbc.Driver");

}catch(java.lang.ClassNotFoundException e) {
	System.err.println("ClassNotFoundException: " +e);
}
con=DriverManager.getConnection(url, uid, pw); // need information for the server

  
%> 
<% 
boolean flag = false; //true if login is valid

String unameid = request.getParameter ("uid"); 
String pass = request.getParameter ("password"); 

%>

<% 

String sql = "SELECT username from User where username=? And password =?"; //CHANGE THIS TO CUSTOMERS ID TO USERID 
String sql2 = "Update User set session_id = ? where session_id= ?";
String sql3 = "Select sesion_id from User where username = ?";


try {  
pstmt = con.prepareStatement (sql); 
pstmt.setString(1,unameid); 
pstmt.setString(2,pass); 
rst = pstmt.executeQuery(); 


if (rst.next ()) { //checks to see if the credentials given match a row in the database
out.println (rst.getString ("username")); 
flag = true; 

//to get the username so i can set the session_id to the user

pstmt = con.prepareStatement (sql3); 
 
pstmt.setString(1, unameid);

rst = pstmt.executeQuery(); 
int sessionid = rst.getInt(1);



//using session id i got from previous query is useed to update session id in the user table
session.setAttribute("uname", rst.getString ("unameid")); 
pstmt = con.prepareStatement (sql2); 
pstmt.setInt(2, sessionid); 
pstmt.setInt(1, session.request.getSession.getId());//session
rst = pstmt.executeQuery(); 
} else { 
//request.setAttribute("err", "user name or password error!"); //DONT KNOW WHAT ERR IS

flag = false;
}

rst.close (); 
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