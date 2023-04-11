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
<link rel="stylesheet" href="newacccode.css">
<title>Insert title here</title>
</head>
<body>
<% 
try{
	String accno=request.getParameter("acno");
	String acc_holder_name=request.getParameter("name");
	String password=request.getParameter("psw");
	String cpassword=request.getParameter("cpsw");
	double amount=Double.parseDouble(request.getParameter("amt"));
	String address=request.getParameter("add");
	String mobno=request.getParameter("mobno");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","o1db","o1db");
	PreparedStatement ps=con.prepareStatement("insert into bank values(?,?,?,?,?,?)");
	ps.setString(1,accno);
	ps.setString(2,acc_holder_name);
	ps.setString(3,password);
	ps.setDouble(4,amount);
	ps.setString(5,address);
	ps.setString(6,mobno);
	if(password.equals(cpassword)){
		int i=ps.executeUpdate(); %>
		<h1><center>
		<% 
		if(i!=0){
			out.print("<h1>Registration Successful</h1>");
		}else{
			out.print("<h1>Registration Failed</h1>");
		}
	}else{
		out.print("<h1>please ensure that password and confirm password must be equal</h1>");
	}%>
	</h1></center><% 
	con.close();
}catch(Exception e){
	out.print(e);
}

%>
</body>
</html>