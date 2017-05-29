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
		String isbn=request.getParameter("bk");
		
		try {
			PreparedStatement ps=con.prepareStatement("select cardno,isbn from book_borrow where cardno=? and isbn=?");
			ps.setString(1, cno);
			ps.setString(2, isbn);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				out.println("u are already having that book");
			}
			else
			{
				PreparedStatement ps2=con.prepareStatement("select  AVAILABLECOPIES from book where isbn=?");
                                ps2.setString(1, isbn);
				ResultSet rs2=ps2.executeQuery();
				if(rs2.next())
				{
					int copies=rs2.getInt(1);
					if(copies==0)
					{
						out.println("currently this book is busy, used by some other persons..");
					}
					else
					{
						PreparedStatement ps3=con.prepareStatement("insert into book_borrow(cardno, isbn) values(?,?)");
						ps3.setString(1, cno);
						ps3.setString(2, isbn);
						ps3.executeUpdate();
						
						
						PreparedStatement ps5=con.prepareStatement("insert into txn_history(cardno, isbn, status) values(?,?, ?)");
						ps5.setString(1, cno);
						ps5.setString(2, isbn);
                                                ps5.setString(3, "checkout");
						ps5.executeUpdate();
						
						
						
						PreparedStatement ps4=con.prepareStatement("update book set  AVAILABLECOPIES= AVAILABLECOPIES-1");
						ps4.executeUpdate();

                                                  out.println(" <br> <br> <center><h1>U have checkedout successfully checkedout this book...!!!</h1></center> <br><br><br> <center>"  );
                                               
					}
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        %>
    </body>
</html>
