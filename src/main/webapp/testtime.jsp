<%-- 
    Document   : testtime
    Created on : Mar 11, 2023, 5:34:25 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.time.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss");
        LocalDateTime date_step1 = LocalDateTime.parse("2023-03-03 00:00:00", dtf);
        LocalDateTime date_step2 = LocalDateTime.parse("2023-04-01 00:00:00", dtf);
        LocalDateTime now = LocalDateTime.now();
        dtf.format(now);
        
        out.println(date_step1);
        out.println(now);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
