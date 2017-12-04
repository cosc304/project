<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%!
public String user_session_id;
public int    users_with_session_id;
public int    user_id;
public double total;
public String user_username;
public String user_email;
public String user_firstname;
public String user_lastname;
%>

<%
user_session_id = null;
users_with_session_id = 0;
user_id = 0;
user_username = null;
user_email = null;
user_firstname = null;
user_lastname = null;
user_session_id = session.getId();
connect();
PreparedStatement session_pstmt = con.prepareStatement(
	"SELECT id,username,email,firstname,lastname FROM User WHERE session_id = ?"
);
session_pstmt.setString(1, user_session_id);
ResultSet session_rs = session_pstmt.executeQuery();
users_with_session_id = 0;
while(session_rs.next()) {
	users_with_session_id++;
	user_id = session_rs.getInt(1);
	user_username = session_rs.getString(2);
	user_email = session_rs.getString(3);
	user_firstname = session_rs.getString(4);
	user_lastname = session_rs.getString(5);
}
disconnect();
%>
