<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.io.*" %>
<%@ include file="db.jsp" %>
<%
PreparedStatement pstmt;
int rows_updated = 0;

String usrnm = request.getParameter ("usrnm");
String pswrd = request.getParameter ("pswrd");

String sql = "UPDATE User SET session_id=? WHERE username=? And password=?";

try {
    connect();
    pstmt = con.prepareStatement (sql);
    pstmt.setString(1,session.getId());
    pstmt.setString(2,usrnm);
    pstmt.setString(3,pswrd);
    rows_updated = pstmt.executeUpdate();
} catch (Exception e) {
    out.println (e);
}
disconnect();

if (rows_updated == 1) {
%>
    <jsp:forward page="login_succeed.jsp" />
<%
} else if(rows_updated == 0) {
%>
    <jsp:forward page="login_fail.jsp"/>
<%
} else {
    out.println("More than one user session found!");
}
%>
</body>
</html>
