<%-- 
    Document   : process
    Created on : Jan 13, 2023, 4:53:28 PM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String driver = "com.mysql.cj.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String userid = "student";
            String password = "uploadfile286";
            Connection connection = null;

            try {
                Class.forName(driver);
                connection = DriverManager.getConnection(connectionUrl, userid, password);
                if (connection != null) {
                    System.out.println("Connected to the database student.");
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>

        <%
            if (request.getParameter("submit_data") != null) {
                try {
                    String title = request.getParameter("Article_title");
                    String content = request.getParameter("Article_content");
                    if (title != null && content != null) {
                        String sql = "INSERT INTO WC_blog(Article_title, Article_content) VALUES (?, ?)";
                        PreparedStatement ps = connection.prepareStatement(sql);
                        ps.setString(1, title);
                        ps.setString(2, content);
                        int executeUpdate = ps.executeUpdate();
                        if (executeUpdate != 0) {
                            out.println("Article Published Successfully.");
                        } else {
                            out.println("Failed to submit the data.");
                        }
                    } else {
                        response.sendRedirect("index.jsp?emptyFields");
                    }
                } catch (SQLException e) {
                    out.println("Failed to connect to the server.");
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect("index.jsp?invalidRequest");
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
