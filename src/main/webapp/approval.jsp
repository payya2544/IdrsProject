<%-- 
    Document   : pdf_gen
    Created on : Apr 4, 2022, 4:45:34 AM
    Author     : Yel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String approv = request.getParameter("email");
    String receipt = request.getParameter("receipt");
    request.setAttribute("approv", null);
    request.setAttribute("receipt", null);
%>

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

    String payment_email = approv;
    String payment_status;

    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from payment where payment_email ='" + payment_email + "'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            payment_status = resultSet.getString("payment_status");

            if (payment_status.equals("paid")) {
                String sqlreceipt = "UPDATE payment SET receipt_number = ? WHERE payment_email = ? ";
                PreparedStatement ps = connection.prepareStatement(sqlreceipt);
                ps.setString(1, receipt);
                ps.setString(2, payment_email);
                int executeUpdate = ps.executeUpdate();
                if (executeUpdate != 0) {
                    out.println("Update receipt_number Successfully");
                } else {
                    out.println("Failed to update the receipt_number");
                }
                session.setAttribute("email", payment_email);
                response.sendRedirect("qrcode_gen.jsp?email=" + payment_email);
            }
        }
    } catch (Exception e) {
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
        <%=receipt%>
    </body>
</html>
