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

<%
        ResultSet rs=null;
	String isbn=request.getParameter("isbn");
	DBUtil util=new DBUtil();
	Connection con=util.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select * from book where isbn=?");
		ps.setString(1, isbn);
		rs=ps.executeQuery();

    String isn="";
	String title="";
	String pid="";
	String aid="";
	int availablecopies=0;
	try {
	if(rs.next())
	{
		isn=rs.getString(1);
		title=rs.getString(2);
		pid=rs.getString(3);
		aid=rs.getString(4);
		availablecopies=rs.getInt(6);
	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
         out.println(" <br> <br> <center><h1>Book by ISBN Search</h1></center> <br><br><br> <center>"  );
	out.println("ISBN: "+isn+"<br/>");
	out.println("Title: "+title+"<br/>");
	out.println("PublisherID: "+pid+"<br/>");
	out.println("AuthorID: "+aid+"<br/>");
	out.println("Available copies: "+availablecopies);
         out.println("</center>");
        } catch (SQLException e) {
		e.printStackTrace();
	}
%>


</body>
</html>