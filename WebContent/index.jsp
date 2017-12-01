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

<header>
  <tr>
   <td width="205" height="89"><img src="pictures/logo.png" width="251" height="88" alt="Logo" />
    <hr /></td>
        <td width="713" class="right">Welcome to CP shopping! | <a href="index.jsp">Home</a> | <a href="listProduct.jsp">All Product</a>
        <% if(session.getAttribute("uname")==null) {
			%>
           | <a href="login.jsp">Login</a> | <a href="register.jsp">Signup</a> | <a href="showCart.jsp">ShoppingCart</a>
            <%} else {
				%>
                <a href="logout.jsp">Logout</a>
                <%}%>
                </td>
      </tr>
      <tr>
        <td><form id="form1" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
</header>
  
<nav>
  <ul>
    <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">PC Parts</td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="button" name="category" value="Mouse" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="button" name="category" value="Keyboard" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="button" name="category" value="Headphone" /></form></td>
          </tr>
          <tr>
            <td height="22"><form action="category.jsp">
            <input type="button" name="category" value="PSU" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="button" name="category" value="Case" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
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
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value="Mouse01"> 
<input name="buy" type="image" value="grand" src="pictures\Mouse01.png" width="114" height="165"> 
</form></td>
              </tr>
            </table>
              <p class="center1">Good Mouse</p>
              <p class="center1">$150</p>
            </td>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
              <tr>
                <td width="111"><form action="product.jsp"> 
<input type="hidden" name="product" value="Mouse02">
<input name="buy" type="image" value="s4" src="pictures\Mouse02.png" width="100" height="165"> 
</form></td>
              </tr>
            </table></p>
              <p>Normal Mouse</p>
              <p>$75</p></td>
            <td width="224"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value="Case01"> 
<input name="buy" type="image" value="g pro" src="pictures\Case01.png" width="104" height="165"> 
</form></td>
              </tr>
            </table>
              <p class="center1">Good case</p>
              <p class="center1">$112</p>
            </td>
          </tr>
        </table></td>
      </tr>
</article>

<footer>Copyright &copy; CP.com</footer>

</div>

</body>
</html>
