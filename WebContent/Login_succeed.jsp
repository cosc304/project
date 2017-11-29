<%@ page charset=UTF-8" contentType="text/html; import="java.sql.*"; language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style>
.right {text-align: right;
}
</style>
</head>

<body>
<header>

  
   <a href="projshop.jsp">Home</a> |

 <% if(session.getAttribute("uname")==null) { 
	 
			%>
      <a href="login.jsp" class = "mainRight">Login</a>
       <%} else {
				%>
       <a href="logout.jsp" class = "mainRight"><%out.print(session.getAttribute("uname"));  %></a> <% //showing user name if user logged in%>
        <%}%>  
 </header>
 <center> 
<table width="900" height="120" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
  </tr>
</table>
<hr />
<br />
 Welcome <%=session.getAttribute("uname")%>,
	
	 <script type="text/javascript">
function Redirect()
{
    window.location="projshop.jsp";
}
document.write("Redirecting you to the main page in just a few seconds.");
setTimeout('Redirect()', 5000);
</script>


<!--  <p>Click <a href="main.jsp
">here</a> to return to the main page. 
   </p>  -->
</body>
</html>