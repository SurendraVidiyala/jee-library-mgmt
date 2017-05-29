<%@page import="java.sql.PreparedStatement,java.sql.SQLException, java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.DBUtil, java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<%!
	ResultSet rs=null;
%>
<%
	String name=request.getParameter("name");
	DBUtil util=new DBUtil();
	Connection con=util.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from author where name=?");
		ps.setString(1, name);
		rs=ps.executeQuery();
%>


<%
    String aid="";
	String nme="";
	String email="";
	try {
	if(rs.next())
	{
		aid=rs.getString(1);
		nme=rs.getString(2);
		email=rs.getString(3);
	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
        out.println(" <br> <br> <center><h1>Author Details</h1></center> <br><br><br> <center>"  );
        out.println("<cenetr><br><br><br>");
	out.println("Author ID: "+aid+"<br>");
	out.println("Name: "+nme+"<br>");
	out.println("Email: "+email);
         out.println("</cenetr>");
%>


<%		
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>