<%-- 
    Document   : index
    Created on : Jan 15, 2023, 8:57:56 PM
    Author     : paanpun
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Settings</title>

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
        <script type="text/javascript">
            function setValue() {
                document.getElementById("dropdown").value = document.getElementById("page").value;
                document.changePage.submit();
                return true;
            }
        </script>
        <div class="container">
            <h1>Settings</h1>

            <form method="post" action="index.jsp" name="changePage">
                <select id="page" name="page" onchange="return setValue();">
                    <option value="/">Select Page Edit</option>
                    <option value="wc_blog">Home</option>
                    <option value="schedule_blog">Schedule</option>
                    <option value="conference_blog">Conference Info</option>
                    <option value="about_blog">About Mahidol</option>
                    <option value="register_blog">Register</option>
                </select>
                <input type="hidden" name="dropdown" id="dropdown">
            </form>
            <br>
            <%                String currentpage = request.getParameter("page");
            %>
            <a class="btn-blue" href="content.jsp?source=<%=currentpage%>" >create</a>
            </br>
            <div class="row">
                <div class="col-md-11">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title" style="text-transform: capitalize;"><%=currentpage%> page Edit</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table  table-hover" style="min-width: 845px">
                                    <thead>
                                        <tr align='center'>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Content</th>
                                            <th>Published</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            try {
                                                Connection connection = null;
                                                Statement statement = null;
                                                ResultSet resultSet = null;
                                                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                                statement = connection.createStatement();
                                                String sql = "SELECT * FROM `" + currentpage + "`";
                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                        %>
                                        <tr align='center'>
                                            <td><%=resultSet.getString("id")%></td>
                                            <td><%=resultSet.getString("Article_title")%></td>
                                            <td><textarea id="id" name="name" rows="5" cols="50"><%=resultSet.getString("Article_content")%></textarea></td>
                                            <td><%=resultSet.getString("updated_at")%></td>
                                            <td><a href="./editcontent.jsp?id=<%=resultSet.getString("id")%>&source=<%=currentpage%>"><i class="fa fa-edit"></i></a></td>
                                            <td><a href="./delete.jsp?id=<%=resultSet.getString("id")%>&source=<%=currentpage%>
                                                   " onclick="return confirm('Are you sure to delete !!!')" style="color: red;">
                                                    <i class="fa-solid fa-trash"></i></a></td>
                                        </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
