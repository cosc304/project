

<!DOCTYPE html>
<html>
<head>
<style>
html{

background-color: lightblue;
}
body{
color:red;

}
.mainRight{
align: right;
}

 </style>
        <title>Welcome</title>
</head>
<body>

<header>
	<div class= "mainRight">
 <% if(session.getAttribute("uname")==null) { 
			%>
      <a href="login.jsp" align="right">Login</a><a href="registration_index.jsp" align="right">Register</a>
       <%} else {
				%>
       <a href="logout.jsp" align="right"><%out.print(session.getAttribute("uname"));  %></a> <% //showing user name if user logged in%>
        <%}%>  
<!--<a href="profile.jsp">profile</a>   -->
	</div>
</header>
<h1 align="center">Welcome to "New" and "Legal" Computer Parts!</h1>

<form align = "center"method="post" action="listprod.jsp"> <!-- The search bar at top of page will redirect to list product when item searched for -->
<input type="text" value="Search" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<div>  </div>
<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>
 
 
 
<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

</body>
</head>


