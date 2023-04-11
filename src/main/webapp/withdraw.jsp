<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="home.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
h1{
background-color:rgb(111, 228, 121);
border-radius:10px;
padding:4px;
display:inline;
}
input.cat{
background-color:rgb(111, 228, 121);
border-radius:10px;
transition:1s;
font-weight:bolder;
}
.cat:hover{
transform:scale(1.1);
background-color:green;
color:white;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<center>
<h1>Withdraw form</h1>
<br>
<br>
<br>
<form action="WithdrawCode.jsp" method="post">
<table>
<tr><th align="left"><label for="1">Account number</label></th><td><input type="text" id="1" name="acno"></td></tr>
<tr><th align="left"><label for="2">Account holder Name</label></th><td><input type="text" id="2" name="name"></td></tr>
<tr><th align="left"><label for="3">Password</label></th><td><input type="text" id="3" name="psw"></td></tr>
<tr><th align="left"><label for="5">Withdraw Amount</label></th><td><input type="text" id="5" name="amt"></td></tr>
<tr>
<td align="right"><input type="submit" class="cat"  value="submit"></td><td align="left"><input type="reset"  class="cat" value="clear"></td></tr>
</table>
</form>
</fieldset>
</body>
</html>