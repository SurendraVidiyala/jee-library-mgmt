<%@page import="java.sql.Date"%>
<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, test.DBUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS</title>
    </head>
    <body>
        <%
            String isbn=request.getParameter("isbn");
		DBUtil util=new DBUtil();
		Connection con=util.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from txn_history where isbn=?");
			ps.setString(1, isbn);
			ResultSet rs=ps.executeQuery();
			out.println("<table border='1px'>");
			out.println("<tr><th>Card number</th><th>ISBN</th><th>Date</th><th>Status</th></tr>");
			
			while(rs.next())
			{
				out.println("<tr>");
				String cno=rs.getString(1);
				out.println("<td>"+cno+"</td>");
				String isn=rs.getString(2);
				out.println("<td>"+isn+"</td>");
				Date d=rs.getDate(3);
				out.println("<td>"+d+"</td>");
				String status=rs.getString(4);
				out.println("<td>"+status+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        %>
    </body>
</html>
