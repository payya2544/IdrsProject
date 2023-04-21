<%-- 
    Document   : createcontent
    Created on : Feb 26, 2023, 10:38:22 PM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
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

        <%
            if (request.getParameter("submit_data") != null) {
                try {
                    Connection con = DriverManager.getConnection(connectionUrl + database, userid, password);
                    if (con != null) {
                        System.out.println("Connected to the database student");
                    }
                    String title = request.getParameter("Article_title");
                    String content = request.getParameter("Article_content");
                    String page_name = request.getParameter("page");
                    if (title != null && content != null) {
                        String sql = "INSERT INTO `" + page_name + "` (Article_title,Article_content) VALUES (?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, title);
                        ps.setString(2, content);
                        int executeUpdate = ps.executeUpdate();
                        if (executeUpdate != 0) {
                            out.println("Article Published Successfully");
                            response.sendRedirect("index.jsp");
                        } else {
                            out.println("Failed to submit the data");
                        }
                    } else {
                        response.sendRedirect("index.jsp?emptyFields");
                    }
                } catch (SQLException e) {
                    out.println("Failed to connect to the server");
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect("index.jsp?invalidRequest");
            }
        %>
    </body>
</html>
