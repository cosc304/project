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
	<h1>Enter your information to complete the transaction:</h1>

<form method="get" action="order.jsp">
<table>
<tr><td>Customer Information:</td> </tr>
<tr><td>Customer ID:</td><td><input type="text" name="customerId" size="20"></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" size="20"></td></tr>
<tr><td>Shipping Information:</td> </tr>
<tr><td>Address</td><td><input type="text" name="address" size="35"></td></tr>
<tr><td>PostalCode</td><td><input type="text" name="postalcode" size="20"></td></tr>
<tr><td>City</td><td><input type="text" name="city" size="20"></td></tr>
<tr><td>Province</td><td><input type="text" name="province" size="20"></td></tr>
<tr><td>Country</td><td><input type="text" name="country" size="20"></td></tr>

<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</table>
</form>
</section>
<footer>Copyright &copy; Legitimate Computer Goods.com</footer>

</div>
</body>
</html>

