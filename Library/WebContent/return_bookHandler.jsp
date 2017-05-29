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
            DBUtil util=new DBUtil();
		Connection con=util.getConnection();
		String cno=request.getParameter("cno");
		String isbn=request.getParameter("isbn");
		
		try {
			PreparedStatement ps=con.prepareStatement("select cardno,isbn from book_borrow where cardno=? and isbn=?");
			ps.setString(1, cno);
			ps.setString(2, isbn);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps2=con.prepareStatement("delete from book_borrow where cardno=? and isbn=?");
				ps2.setString(1, cno);
				ps2.setString(2, isbn);
				ps2.executeUpdate();
				
				PreparedStatement ps3=con.prepareStatement("insert into txn_history(cardno, isbn, status) values(?, ?, ?)");
				ps3.setString(1, cno);
				ps3.setString(2, isbn);
				ps3.setString(3, "book returned");
				ps3.executeUpdate();
				
				PreparedStatement ps4=con.prepareStatement("update book set  AVAILABLECOPIES= AVAILABLECOPIES+1");
				ps4.executeUpdate();
				out.println("U have successfully return the book...!!!");
			}
			else
			{
				out.println("U did not taken that book");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
