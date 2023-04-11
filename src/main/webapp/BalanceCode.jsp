<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<%@include file="home.jsp"%>
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
<link rel="stylesheet" href="balancecode.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<br>
<%
try{
	String accno=request.getParameter("acno");
	String acc_holder_name=request.getParameter("name");
	String password=request.getParameter("psw");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","o1db","o1db");
	PreparedStatement ps=con.prepareStatement("select * from bank where accno=? and acc_holder_name=? and password=?");
	ps.setString(1,accno);
	ps.setString(2,acc_holder_name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	ResultSetMetaData rsd=rs.getMetaData();
	int n=rsd.getColumnCount();
	%>
	
	<br>

	<center>
	<h1><%= "welcome "+acc_holder_name%></h1>
	<br>
	<br>
	<br>
	<table border='1'><tr>
	<%for(int i=1;i<=n;i++){%>
	<th>
	<% out.print(rsd.getColumnName(i));%>
	</th>
	<%}%>
	</tr>

	<%while(rs.next()){%>
		<tr>
		<% for(int i=1;i<=n;i++){
	%>
	<td>
	<%out.print(rs.getString(i)); %>
	</td>
	<% }%>
	</tr>
		<% }%>

	</table>
	<% con.close();
	}catch(Exception e){
		out.print(e);
	}
	%>
	<center>
	</body>
	</html>
	