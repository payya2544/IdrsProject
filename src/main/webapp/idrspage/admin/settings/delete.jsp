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
                throw new RuntimeException("Failed to load JDBC driver", e);
            }
        %>

        <%
            if (request.getParameter("source") != null) {
                String id = request.getParameter("id");
                String page_name = request.getParameter("source");
                if (id != null && page_name != null) {
                    try ( Connection con = DriverManager.getConnection(connectionUrl + database, userid, password);  PreparedStatement ps = con.prepareStatement("DELETE FROM `" + page_name + "` WHERE id = ?")) {
                        ps.setString(1, id);
                        int executeUpdate = ps.executeUpdate();
                        if (executeUpdate != 0) {
                            out.println("Article Delete Successfully");
                            response.sendRedirect("index.jsp");
                        } else {
                            response.sendRedirect("index.jsp?deleteFailed");
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException("Failed to delete article from database", e);
                    }
                } else {
                    response.sendRedirect("index.jsp?emptyFields");
                }
            } else {
                response.sendRedirect("index.jsp?invalidRequest");
            }
        %>
    </body>
</html>
