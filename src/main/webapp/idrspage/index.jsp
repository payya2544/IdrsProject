<%-- 
    Document   : index
    Created on : Jan 9, 2023, 12:37:39 PM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.idrsproject.DBConnection" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--        <link rel="stylesheet" href="/IdrsProject/index.css">-->
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="navbar/navbar.jsp" />
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
            try {
                Connection con = DriverManager.getConnection(connectionUrl + database, userid, password);
                Statement statement = null;
                ResultSet resultSet = null;
                statement = con.createStatement();
                String sql = "SELECT * FROM `home_img`";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <div class="container">
            <div class="home-item1">
                <%
                    }
                %>
                <div class="box-text-1">
                    <%                        String sql1 = "SELECT * FROM `wc_blog`";
                        resultSet = statement.executeQuery(sql1);
                        while (resultSet.next()) {
                    %>
                    <h1><%=resultSet.getString("Article_title")%></h1>
                    <%=resultSet.getString("Article_content")%>
                </div>  
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <jsp:include page="footer/footer.jsp"/>

    </body>
</html>
