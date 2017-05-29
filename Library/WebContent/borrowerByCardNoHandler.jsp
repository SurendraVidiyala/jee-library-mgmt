<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.PreparedStatement,java.sql.SQLException, java.sql.ResultSet"%>
    <%@ page import="test.DBUtil, java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<% 
String cno=request.getParameter("cno");
DBUtil util=new DBUtil();
Connection con=util.getConnection();
ResultSet rs1=null;
ResultSet rs2=null;
try {
	PreparedStatement ps1=con.prepareStatement("select * from borrower where cardno=?");
	ps1.setString(1, cno);
	rs1=ps1.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}

//getting borrower details
String cnum="";
String name="";
String add="";
long phone=0;
try {
	if(rs1.next())
	{
		cnum=rs1.getString(1);
		name=rs1.getString(2);
		add=rs1.getString(3);
		phone=rs1.getLong(4);
	}
} catch (SQLException e) {
	e.printStackTrace();
}



//getting books checkout by that borrower
String books="";

try {
	PreparedStatement ps2=con.prepareStatement("select distinct isbn from book_borrow where cardno=?");
	ps2.setString(1, cno);
	rs2=ps2.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}


try {
	int count=0;
	while(rs2.next())
	{
		count++;
		if(count==1)
		{
			books=rs2.getString(1);
		}
		else
		{
			books=books+","+rs2.getString(1);
		}
	}
} catch (SQLException e) {
	e.printStackTrace();
}


//displaying borrower details and books checkout by that borrrower
 out.println(" <br> <br> <center><h1>Borrower details</h1></center> <br><br><br> <center>"  );
		out.println("Card no: "+cnum+"<br/>");
		out.println("Borrower name: "+name+"<br/>");
		out.println("Address: "+add+"<br/>");
		out.println("Phone: "+phone+"<br/>"+"<br/>");
		
		
	//	out.println("books checkout by a borrower:"+"<br/>"+"<br/>");
		String[] bks=books.split(",");
		for(String bk:bks)
		{
			out.println(bk+"<br/>");
		}
	out.println("</center>  ");
%>
</body>
</html>