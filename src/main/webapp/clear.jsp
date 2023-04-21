<%-- 
    Document   : clear
    Created on : Mar 13, 2023, 7:31:26 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://127.0.0.1:3306/";
    String database = "student?characterEncoding=UTF-8";

    String userid = "student";
    String password = "uploadfile286";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

%>

<%    Connection connection = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        if (connection != null) {
            out.println("Database Connected.");

        } else {
            out.println("Database Connect Failed.");
        }

    } catch (Exception e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
        e.printStackTrace();
    }

    String url = null;

    try ( Statement stmt = connection.createStatement();) {
        
        String query1 = "DELETE FROM payment WHERE payment_status = 'not paid'";

        stmt.executeUpdate(query1);
        out.println("clear_pass");

        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }


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
