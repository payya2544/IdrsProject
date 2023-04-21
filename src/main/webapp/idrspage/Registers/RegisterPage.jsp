<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mycompany.idrsproject.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
            Connection con = null;
            try {
                Class.forName(driver);
                con = DriverManager.getConnection(connectionUrl + database, userid, password);
                if (con != null) {
                    System.out.println("Connected to the database student");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }

            if (con != null) {
                Statement statement = null;
                ResultSet resultSet = null;
                try {
                    statement = con.createStatement();
                    String sql = "SELECT * FROM `home_img`";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
        %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <%
                        String sql1 = "SELECT * FROM `register_blog`";
                        resultSet = statement.executeQuery(sql1);
                        while (resultSet.next()) {
                    %>
                    <h1 class="card-title"><%=resultSet.getString("Article_title")%></h1>
                    <p class="card-text"><%=resultSet.getString("Article_content")%></p>
                    <%
                        }
                    %>
                </div>  
            </div>
        </div>
        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) {
                            resultSet.close();
                        }
                        if (statement != null) {
                            statement.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</div>
<br>
<div class="submitregister" style="text-align: center">

    <button onclick="document.location = 'https://idrs2023.mahidol.ac.th'">Super Early Bird Rates</button>

</div>
<br>
<jsp:include page="../footer/footer.jsp"/>

</body>
</html>
