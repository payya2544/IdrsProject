<%-- 
    Document   : saveedit
    Created on : Feb 7, 2023, 11:55:01 AM
    Author     : paanpun
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Edit Page</title>
    </head>
    <body>
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
        <%            if (request.getParameter("submit_data") != null) {
                try {
                    // Get the database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(connectionUrl + database, userid, password);
                    if (con != null) {
                        System.out.println("Connected to the database student");
                    }

                    // Get the form data
                    String title = request.getParameter("Article_title");
                    String content = request.getParameter("Article_content");
                    String id = request.getParameter("id");
                    String page_name = request.getParameter("page");
              
                    String sql = "UPDATE `" + page_name + "` SET `Article_title` = ?, `Article_content` = ? WHERE id = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, title);
                    ps.setString(2, content);
                    ps.setString(3, id);
                    int executeUpdate = ps.executeUpdate();
                    if (executeUpdate != 0) {
                        out.println("Article updated successfully");
                        response.sendRedirect("index.jsp");
                    } else {
                        out.println("Failed to update the data");
                    }
                } catch (ClassNotFoundException e) {
                    out.println("JDBC driver not found");
                } catch (SQLException e) {
                    out.println("Failed to connect to the database");
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
                    out.println(e.getMessage());
                }
            } else {
                response.sendRedirect("index.jsp?invalidRequest");
            }
        %>
        <h1>Hello World!</h1>

    </body>
</html>
