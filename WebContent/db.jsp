<%@ page import="java.sql.*" %>

<%!
private String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_kvankes";
private String uid = "kvankes";
private String pw = "37845138";
public Connection con = null;

public void connect() throws SQLException {
    try {
    	Class.forName("com.mysql.jdbc.Driver");
    }
    catch (java.lang.ClassNotFoundException e) {
    	System.err.println("ClassNotFoundException: " +e);
    }
    con = DriverManager.getConnection(url, uid, pw);
}

public void disconnect() throws SQLException
{
    if (con != null) {
        con.close();
    }
    con = null;
}
%>
