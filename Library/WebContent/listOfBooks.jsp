<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, test.DBUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS</title>
    </head>
    <body bgcolor="cyan">
        <%
            DBUtil util=new DBUtil();
		Connection con=util.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from book");
			ResultSet rs=ps.executeQuery();
                        out.println(" <br> <br> <center><h1>List All Books</h1></center> <br><br><br> <center>"  );
			out.println("<table border='1px'>");
                        out.println("<tr><th>ISBN</th><th>title</th><th>publisher id</th><th>author id</th><th>available copies</th></tr>");
			while(rs.next())
			{
                            out.println("<tr>");
				String isbn=rs.getString(1);
                                out.println("<td>"+isbn+"</td>");
				String title=rs.getString(2);
                                out.println("<td>"+title+"</td>");
				String pid=rs.getString(3);
                                out.println("<td>"+pid+"</td>");
				String aid=rs.getString(4);
                                out.println("<td>"+aid+"</td>");
				String availcopies=rs.getString(6);
                                out.println("<td>"+availcopies+"</td>");
                            out.println("</tr>");
			}
                        out.println("</table></center> ");
		} catch (SQLException e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
