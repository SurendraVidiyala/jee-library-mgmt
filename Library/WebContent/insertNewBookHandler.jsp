<%@ page import="java.io.IOException, java.io.PrintWriter, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, test.DBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String isbn=request.getParameter("isbn");
	String title=request.getParameter("title");
	String pid=request.getParameter("pid");
	String aid=request.getParameter("aid");
        String pdate=request.getParameter("pdate");
	String noofcopies=request.getParameter("acopies");
        int nocopies=Integer.parseInt(noofcopies);
	
	
	DBUtil util=new DBUtil();
	Connection con=util.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("insert into book(isbn, title, publisherid, authorid,publishdate, availablecopies) values(?,?,?,?,?,?)");
		ps.setString(1, isbn);
		ps.setString(2, title);
		ps.setString(3, pid);
		ps.setString(4, aid);
		ps.setString(5, pdate);
		ps.setInt(6,nocopies);
		ps.executeUpdate();
                  out.println(" <br> <br> <center><h1>Book Inserted Successfully</h1></center> <br><br><br> <center>"  );
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
</body>
</html>