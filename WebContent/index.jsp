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
          <tr>
            <td><form action="products.jsp">
            <input type="button" name="category" value="Mouse" /></form></td>
          </tr>
          <tr>
            <td><form action="products.jsp">
            <input type="button" name="category" value="Keyboard" /></form></td>
          </tr>
          <tr>
            <td><form action="products.jsp">
            <input type="button" name="category" value="Headphone" /></form></td>
          </tr>
          <tr>
            <td height="22"><form action="products.jsp">
            <input type="button" name="category" value="PSU" /></form></td>
          </tr>
          <tr>
            <td><form action="products.jsp">
            <input type="button" name="category" value="Case" /></form></td>
          </tr>
          <tr>
            <td><form action="products.jsp">
            <input type="button" name="category" value="RAM" /></form></td>
          </tr>
        </table></td>
      </tr>
  </ul>
</nav>

<article>
  <tr>
        <td height="261"><table width="714" height="258" border="0">
          <tr>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="productDetail.jsp">
<input type="hidden" name="product" value="Mouse01">
<input name="buy" type="image" value="mouse1" src="pictures\Mouse01.png" width="114" height="165">
</form></td>
              </tr>
            </table>
              <p class="center1">AA+ Mouse</p>
              <p class="center1">$200</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="productDetail.jsp">
<input type="hidden" name="product" value="Mouse02">
<input name="buy" type="image" value="mouse2" src="pictures\Mouse02.png" width="100" height="165">
</form></td>
              </tr>
            </table></p>
              <p>A+ Mouse</p>
              <p>$100</p></td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="productDetail.jsp">
<input type="hidden" name="product" value="Case01">
<input name="buy" type="image" value="case1" src="pictures\Case01.png" width="104" height="165">
              </tr>
            </table>
              <p class="center1">A++ case</p>
              <p class="center1">$200</p>
            </td>
          </tr>
        </table></td>
      </tr>
</article>

<footer>Copyright &copy; CP.com</footer>

</div>

</body>
</html>
