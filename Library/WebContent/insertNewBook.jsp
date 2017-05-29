<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, test.DBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
	<%!
	String[] pubids=null;
	String[] autids=null;
	%>
	<%
	String pids="";
	String aids="";
	DBUtil util=new DBUtil();
	Connection con=util.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select publisherid from publisher");
		PreparedStatement ps2=con.prepareStatement("select authorid from author");
		ResultSet rs=ps.executeQuery();
		ResultSet rs2=ps2.executeQuery();
		int count=0;
		while(rs.next())
		{
			count++;
			if(count==1)
			{
				pids=rs.getString(1);
			}
			else
			{
				pids=pids+","+rs.getString(1);
			}
		}
		
		
		int count2=0;
		while(rs2.next())
		{
			count2++;
			if(count2==1)
			{
				aids=rs2.getString(1);
			}
			else
			{
				aids=aids+","+rs2.getString(1);
			}
		}
		
		pubids=pids.split(",");
		autids=aids.split(",");
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
	
	<form action="insertNewBookHandler.jsp">
            <br> <br> <center><h1>Insert a New book</h1></center> <br><br><br> <center>Enter ISBN:  &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="isbn" required><br><br/>
		Enter title:    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="text" name="title" required> <br><br/>
		Number of copies:  &nbsp;&nbsp  <input type="text" name="acopies" required><br><br/>
                PublishDate:  &nbsp;&nbsp  <input type="text" name="pdate" required><br><br/>
		Select PublisherId: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <select name="pid">
			<%
			for(String pubid:pubids)
			{
			%>
			<option><%= pubid%></option>
			<%	
			}
			%>
		</select><br><br/>
		
		Select AuthorId: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <select name="aid">
			<%
			for(String autid:autids)
			{
			%>
			<option><%= autid%></option>
			<%	
			}
			%>
		</select><br><br/>
		<input type="submit" value="submit">
		</center>
	</form>
</body>
</html>