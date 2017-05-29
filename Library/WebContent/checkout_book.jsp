<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, test.DBUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS</title>
    </head>
    <body bgcolor="cyan">
        <%!
	String[] books=null;
	%>
        <%
	String bks="";
	DBUtil util=new DBUtil();
	Connection con=util.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("select isbn from book");
		ResultSet rs=ps.executeQuery();
		int count=0;
		while(rs.next())
		{
			count++;
			if(count==1)
			{
				bks=rs.getString(1);
			}
			else
			{
				bks=bks+","+rs.getString(1);
			}
		}
		
		
		
		
		books=bks.split(",");
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
        <form action="checkout_bookHandler.jsp">
    <br> <br> <center><h1>Check Out a Book</h1></center> <br><br><br> <center>         Enter Card number:
        <input type="text" name="cno"><br><br/>
        Select Book by ISBN: 
		<select name="bk">
			<%
			for(String book:books)
			{
			%>
			<option><%= book%></option>
			<%	
			}
			%>
		</select><br><br/>
                <input type="submit" value="checkout"></center>
        </form>
        
    </body>
</html>
