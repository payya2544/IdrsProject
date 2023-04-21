<%-- 
    Document   : update_payment
    Created on : Mar 9, 2023, 11:29:12 PM
    Author     : Acer
--%>

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
    try {
        if (request.getParameter("payment_id") != null) {
            String responseinvoice = request.getParameter("payment_id");
            out.println(responseinvoice);

            try ( Statement stmt = connection.createStatement();) {
                //out.println("pass1");
                String query = "UPDATE payment set payment_status = 'paid'" + " where payment_id = '" + responseinvoice + "'";

                stmt.executeUpdate(query);

                out.println("pass");
                response.sendRedirect("clear.jsp");

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            out.println("token is null");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
