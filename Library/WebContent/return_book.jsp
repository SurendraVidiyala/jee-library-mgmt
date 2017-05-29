<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS</title>
    </head>
    <body bgcolor="cyan">
        <form action="return_bookHandler.jsp">
    <br> <br> <center><h1>Return a Book</h1></center> <br><br><br> <center>         Enter card number:
            <input type="text" name="cno"/>(case sensitive)<br><br/>
            Enter isbn of book:
            <input type="text" name="isbn"/>(case sensitive)<br><br/>
            <input type="submit" value="return book"></center>
        </form>
    </body>
</html>
