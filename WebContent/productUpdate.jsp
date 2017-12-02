<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.io.*"%>
<%@ include file="session.jsp" %>
<%
int rows_updated;
Integer tempint = (request.getParameter("product_id") == null) ? 0 : request.getParameter("product_id");
Integer product_id = Integer.parseInt(tempint);
String category = request.getParameter ("category");
String name = request.getParameter ("name");
Double tempdouble = (request.getParameter ("price") == null) ? 0.0 : request.getParameter ("price");
Double price = Double.parseDouble(tempdouble);
Part image = request.getPart ("image");
InputStream instream;

if(product_id != null && category != null && name != null && price != null) {
    connect();
    String sql = "REPLACE INTO Product (id,category,name,price,image) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1,product_id);
    pstmt.setString(2,category);
    pstmt.setString(3,name);
    pstmt.setDouble(4,price);
    if(image != null) {
        instream = image.getInputStream();
        pstmt.setBlob(5,instream);
    }
    else {
        pstmt.setNull(5,Types.BLOB);
    }
    rows_updated = pstmt.executeUpdate();
}
else {
    out.println("Missing values for product update!");
    rows_updated = 0;
}

if (rows_updated == 1) {
%>
    <jsp:forward page="products.jsp" />
<%
} else if(rows_updated != 0) {
    out.println("More than one user session found!");
}
%>
</body>
</html>
