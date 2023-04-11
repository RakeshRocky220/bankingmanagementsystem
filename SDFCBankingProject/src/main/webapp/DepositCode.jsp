<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ include file="home.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
	double damount=Double.parseDouble(request.getParameter("damt"));
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","o1db","o1db");
	PreparedStatement ps=con.prepareStatement("select amount from bank where accno=? and acc_holder_name=? and password=?");
	ps.setString(1,accno);
	ps.setString(2,acc_holder_name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	double amt=0.0;
	if(rs.next()){
		 amt=rs.getDouble(1);
		 double temp=amt;
			amt=amt+damount;
			PreparedStatement pss=con.prepareStatement("update bank set amount=? where accno=?");
			pss.setDouble(1,amt);
			pss.setString(2, accno);
			int i=pss.executeUpdate();
			if(i!=0){
				%><table border="1"><tr><th><%
				out.print("Account info");%></th><tr>
				<tr><td><% out.print("Previous Balance :"+temp);%></td></tr>
				<tr><td><% out.print("Deposited Balance :"+damount);%></td></tr>
				<tr><td><% out.print("Current Balance :"+amt);%></td></tr></table>
				<%
			}else{
				out.print("balance update failed");
			}
			
	}else{
		out.print("<h1>Please Enter Valid Details</h1>");
	}
	con.close();
}catch(Exception e){
	out.print(e);
}
%>
</body>
</html>