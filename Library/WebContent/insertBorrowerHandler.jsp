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
String cno=request.getParameter("cno");
String name=request.getParameter("name");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
long phne=Long.parseLong(phone);


DBUtil util=new DBUtil();
Connection con=util.getConnection();
try {
	PreparedStatement ps=con.prepareStatement("insert into borrower values(?,?,?,?)");
	ps.setString(1, cno);
	ps.setString(2, name);
	ps.setString(3, address);
	ps.setLong(4, phne);
	ps.executeUpdate();
             out.println(" <br> <br> <center><h1>borrower inserted successfully</h1></center> <br><br><br> <center>"  );
       
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>