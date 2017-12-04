<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
div.container {
    width: 100%;
    height: 100%;
    border: 1px solid gray;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: red;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
a img {
    margin: 32px;
    max-height: 128px;
    width: auto;
}
.info {
    color: grey;
    font-size: 0.5em;
}
</style>
</head>
<body>

<div class="container">

<%@ include file="header.jsp" %>

<nav>
  <ul>
    <tr>
        <td height="184"><table width="242" height="171" border="0">
            <tr>
            <td class="normal">PC Parts</td>
            </tr>
            <%
            connect();
            String sql = "SELECT DISTINCT category FROM Product";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            %>
            <tr>
            <td><form action="products.jsp">
            <input type="submit" name="category" value="<%=rs.getString(1)%>" /></form></td>
            </tr>
            <%
            }
            sql = null;
            ps = null;
            rs = null;
            disconnect();
            %>
        </table></td>
      </tr>
  </ul>
</nav>

<article>
<table>
    <tr>
        <%
        connect();
        if(user_id>0) {
            sql = "SELECT P.id, P.name, P.price, SUM(P.price*OP.quantity) total FROM Product P, `Order` O, OrderProduct OP "+
                         "WHERE O.user_id=? AND OP.order_id = O.id AND OP.product_id = P.id "+
                         "GROUP BY P.id ORDER BY total DESC LIMIT 2";
            ps = con.prepareStatement(sql);
            ps.setInt(1,user_id);
            rs = ps.executeQuery();
            while(rs.next()) {
                %>
                    <td>
                    <a href="/productDetail?pid=<%=rs.getInt(1)%>">
                        <img height="128px" src="/image?pid=<%=rs.getInt(1)%>" />
                        <p class="center1"><%=rs.getString(2)%></p>
                    </a>
                        <p class="center1"><%=rs.getString(3)%></p>
                        <p class="info">(User Recommendation)</p>
                    </td>
                </a>
                <%
            }
            sql = "SELECT P.id, P.name, P.price, SUM(P.price*OP.quantity) total FROM Product P, `Order` O, OrderProduct OP "+
                         "WHERE OP.order_id = O.id AND OP.product_id = P.id "+
                         "GROUP BY P.id ORDER BY total DESC LIMIT 2";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                %>
                    <td>
                    <a href="/productDetail?pid=<%=rs.getInt(1)%>">
                        <img height="128px" src="/image?pid=<%=rs.getInt(1)%>" />
                        <p class="center1"><%=rs.getString(2)%></p>
                    </a>
                        <p class="center1"><%=rs.getString(3)%></p>
                        <p class="info">(General Recommendation)</p>
                    </td>
                </a>
                <%
            }
            sql = "SELECT id, name, price FROM Product ORDER BY price DESC LIMIT 1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                %>
                    <td>
                    <a href="/productDetail?pid=<%=rs.getInt(1)%>">
                        <img height="128px" src="/image?pid=<%=rs.getInt(1)%>" />
                        <p class="center1"><%=rs.getString(2)%></p>
                    </a>
                        <p class="center1"><%=rs.getString(3)%></p>
                        <p class="info">(High-quality product)</p>
                    </td>
                </a>
                <%
            }
        }
        disconnect();
        %>
    </tr>
</table>
</article>

<footer>Copyright &copy; LegitimateComputerGoods.com</footer>

</div>

</body>
</html>
