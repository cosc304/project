<header>
  <tr>
   <td width="205" height="89"><img src="pictures/logo.png" width="251" height="88" alt="Logo" />
    <hr /></td>
        <td width="713" class="right">Welcome to Legitimate Computer Goods shopping! | <a href="index.jsp">Home</a> | <a href="products.jsp">All Product</a>
            <%
            if(user_id == 0) {
            %>
            | <a href="login.jsp">Login</a> | <a href="register.jsp">Signup</a> | <a href="showCart.jsp">ShoppingCart</a>
            <%} else {
            %>
            | <a href="logout.jsp">Logout</a>
            <%}%>
        </td>
      </tr>
      <tr>
        <td><form action="products.jsp" method="post">
          <input name="name" type="text" id="search" size="60" />
          <input type="submit" />
        </form></td>
      </tr>
</header>
