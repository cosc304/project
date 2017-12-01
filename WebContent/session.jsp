<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%!
public String user_session_id;
public int    users_with_session_id;
public int    user_id;
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
PreparedStatement pstmt = con.prepareStatement(
	"SELECT id,username,email,firstname,lastname FROM User WHERE session_id = ?"
);
pstmt.setString(1, user_session_id);
ResultSet rs = pstmt.executeQuery();
users_with_session_id = 0;
while(rs.next()) {
	users_with_session_id++;
	user_id = rs.getInt(1);
	user_username = rs.getString(2);
	user_email = rs.getString(3);
	user_firstname = rs.getString(4);
	user_lastname = rs.getString(5);
}
disconnect();
%>
