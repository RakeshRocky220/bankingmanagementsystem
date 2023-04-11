<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>
<% 
try{
	String accno=request.getParameter("acno");
	String acc_holder_name=request.getParameter("name");
	String password=request.getParameter("psw");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","o1db","o1db");
	PreparedStatement ps=con.prepareStatement("delete from bank where accno=? and acc_holder_name=? and password=?");
	ps.setString(1,accno);
	ps.setString(2,acc_holder_name);
	ps.setString(3,password);
	int i=ps.executeUpdate();
	if(i!=0){
		out.print("<h1>Successfully deleted your Account<h1>");
	}
	con.close();
}catch(Exception e){
	out.print(e);
}







%>
</body>
</html>