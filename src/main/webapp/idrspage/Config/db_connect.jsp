<%-- 
    Document   : db_connect
    Created on : Jan 13, 2023, 5:52:15 PM
    Author     : paanpun
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

  
    <body>
        <%
            Connection conect = null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jbdc:mysql://localhost/student" + 
                "?user=root&password=");
                if(con != null){
                out.println("Database Connected.");
            }else{
                out.println("Database Connect Failed.");
            }
            } catch(Exception e){
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
