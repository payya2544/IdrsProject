<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/IdrsProject/index.css">
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="/IdrsProject/index.css">
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="../navbar/navbar.jsp" />
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
                if (con != null) {
                    System.out.println("Connected to the database student");
                }
                Statement statement = null;
                ResultSet resultSet = null;
                statement = con.createStatement();
                String sql = "SELECT * FROM `home_img`";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <div class="container">
            <div class="card">
                <%
                    }
                %>
                <div class="card-body">
                    <%                        String sql1 = "SELECT * FROM `schedule_blog`";
                        resultSet = statement.executeQuery(sql1);
                        while (resultSet.next()) {
                    %>
                    <h1 class="card-title"><%=resultSet.getString("Article_title")%></h1>
                    <p class="card-text"><%=resultSet.getString("Article_content")%></p>

                </div>  
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
        <jsp:include page="../footer/footer.jsp"/>

    </body>
    <!--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>-->
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>-->
</html>

