<%-- 
    Document   : changestatus
    Created on : Apr 3, 2023, 3:46:56 PM
    Author     : Yel
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    if ((request.getParameter("id") != null) && (request.getParameter("method") != null)) {
        try {
            Connection con = DriverManager.getConnection(connectionUrl + database, userid, password);
            if (con != null) {
                System.out.println("Connected to the database idrs_pages");
            } else {
                out.println("Database Connect Failed.");
            }
            String method = null;
            String id = request.getParameter("id");
            if (Integer.parseInt(request.getParameter("method")) == 0) {
                method = "not paid";
            } else {
                method = "paid";
            }
            out.println(id + method);
            String sql = "UPDATE `payment` SET `payment_status`= ? WHERE payment_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, method);
            ps.setString(2, id);
            int executeUpdate = ps.executeUpdate();
            if (executeUpdate != 0) {
                out.println("Article update Successfully");
                response.sendRedirect("backendpay.jsp?pass");
            } else {
                out.println("Failed to update the data");
            }
        } catch (SQLException e) {
            out.println("Failed to connect to the server");
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("index.jsp?invalidRequest");
    }
%>
<!DOCTYPE html>

