<%-- 
    Document   : editcontent
    Created on : Jan 15, 2023, 10:44:59 PM
    Author     : paanpun
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <jsp:include page="../../navbar/navbaradmin.jsp" />
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
        <%            Connection connection = null;
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                if (connection != null) {
                    // out.println("Database Connected.");
                } else {
                    // out.println("Database Connect Failed.");
                }
            } catch (Exception e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
            Statement statement = null;
            ResultSet resultSet = null;
            statement = connection.createStatement();
            String sql = "SELECT * FROM `" + request.getParameter("source") + "` where id like " + request.getParameter("id");
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
        %>
        <div class="container">          
            <h1>article id is = ${param.id}</h1>
            <form action="saveedit.jsp" method="POST">
                <div class="input-field">
                    <label for="title">Enter title</label>
                    <input type="text" name="Article_title" id="title" value="<%=resultSet.getString("Article_title")%>">
                    <input type="hidden" name="id" value="${param.id}">
                    <input type="hidden" name="page" value="${param.source}">
                </div>
                <textarea name="Article_content" id="editor" ><%=resultSet.getString("Article_content")%></textarea>
                <%
                    }
                %>
                <button type="submit" class="btn-green" name="submit_data" >save</button>
            </form>
        </div>
        <script src="../../ckeditor/ckeditor.js"></script>
        <script> CKEDITOR.replace('editor');</script>
    </body>
</html>
