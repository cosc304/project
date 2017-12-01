<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

section {
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
<section>
<hr />
<p><strong>No Match Found</strong> for your Search.</p>
</section>
</body>
</html>
