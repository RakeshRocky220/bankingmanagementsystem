<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="home.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
transform:scale(1.3);
background-color:green;
}
span{
text-align:center;
margin-down:2px;
}
</style>
</head>
<body>
<center>
<br>
<br>
<h1>Open Account Form</h1>
<br>
<br>
<br>
<table>
<form action="NewAccCode.jsp" method="post">
<tr><th align="left"><label for="1">Account number</label></th><td><input onkeyup="validateAc()" type="text"  id="1" name="acno"><br><span id="acnoerr"class="acerr"></span></td></tr>
<tr><th align="left"><label for="2">Account holder Name</label></th><td><input type="text" id="2" name="name"></td></tr>
<tr><th align="left"><label for="3">Password</label></th><td><input type="text" id="3" name="psw"></td></tr>
<tr><th align="left"><label for="4">confirm password</label></th><td><input type="text" id="4" name="cpsw"></td></tr>
<tr><th align="left"><label for="5">Amount</label></th><td><input type="text" id="5" name="amt"></td></tr>
<tr><th align="left"><label for="6">Address</label></th><td><input type="text" id="6" name="add"></td></tr>
<tr><th align="left"><label for="7">Mobile number</label></th><td><input type="text" id="7" name="mobno"></td></tr>
<tr>
<td align="right"><input type="submit" class="cat"  value="register"></td><td  align="left"><input class="cat" type="reset" value="clear"></td></tr>
</table>
<form>

<center>
<script>

var acerr=document.getElementById("acnoerr");
function validateAc()
{
    var num=document.getElementById("1").value;
    if(num.lenght==0){
        acerr.innerHTMl="Please enter the Account number";
        return false;
    }
    if(!num.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)){
    	acerr.innerHTML='write full name';
    	return false;
    }
    acerr.innerHTML='valid';
    return true;
}



</script>
</body>
</html>