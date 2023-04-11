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
	String tacno=request.getParameter("tacno");
	double tamount=Double.parseDouble(request.getParameter("amt"));
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","o1db","o1db");
	PreparedStatement ps=con.prepareStatement("select amount from bank where accno=? and acc_holder_name=? and password=?");
	ps.setString(1,accno);
	ps.setString(2,acc_holder_name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		double c_bal=rs.getDouble(1);
		if(c_bal>tamount){
			c_bal=c_bal-tamount;
			PreparedStatement pss=con.prepareStatement("update bank set amount=? where accno=?");
			pss.setDouble(1,c_bal);
			pss.setString(2,accno);
			int i=pss.executeUpdate();
			PreparedStatement pw=con.prepareStatement("select amount from bank where accno=?");
			pw.setString(1,tacno);
			ResultSet rss=pw.executeQuery();
			if(rss.next()){
			 double t_c_bal=rss.getDouble(1);
			 t_c_bal=t_c_bal+tamount;
			 PreparedStatement pww=con.prepareStatement("update bank set amount=? where accno=?");
			 pww.setDouble(1,t_c_bal);
			pww.setString(2,tacno);
			int j=pww.executeUpdate();
			if(j!=0){
				%><table><tr><th align="center" colspan="2">Account Info</th><tr>
				<tr><th align=left>Status</th><td><%out.print("Transaction successful");%></td></tr>
				<tr><th align=left>Current Balance</th><td><%out.print(c_bal);%></td></tr>
				
				<%
				
			}}	
		}else{
			out.print("<h1>Low Balance</h1>");
		}
	}else{
		out.print("<h1>Please Enter Valid Details</h1>");
	}
}catch(Exception e){
out.print(e);
}

%>
</body>
</html>