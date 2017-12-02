<!DOCTYPE html>
<html>
<head>
<title>CP CheckOut Line</title>
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
<%@ include file="header.jsp" %>

<section>
	<h1>Enter your customer id to complete the transaction:</h1>

	<form method="get" action="order.jsp">
	<input type="text" name="customerId" size="50"> 
	<input type="submit" value="Submit"><input type="reset" value="Reset">
	</form>
</section>
<footer>Copyright &copy; CP.com</footer>

</div>
</body>
</html>
