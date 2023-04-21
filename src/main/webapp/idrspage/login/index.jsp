<%-- 
    Document   : login
    Created on : Mar 2, 2023, 4:52:38 PM
    Author     : paanpun
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--        <link rel="stylesheet" href="/IdrsProject/login/newcss.css">-->
        <link rel="stylesheet" href="../login/login.css">
    </head>

    <body>
        <%
            Connection connect = null;
            ResultSet rec = null;
            Statement s = null;
            try {
                Class.forName("com.mysql.jbdc.Driver");
                connect = DriverManager.getConnection("jbdc:mysql://localhost/student"
                        + "?user=root&password=");
                s = connect.createStatement();
                String sql = "SELECT * FFROM student";
                rec = s.executeQuery(sql);
            } catch (Exception e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-form">
                        <div class="signin-image">

                            <img src="../img/idrsmu.png" alt="sing up image">

                        </div>
                        <h2 class="form-title">Log in</h2>
                        <form method="" action="" class="login-form" id="login-form">

                            <div class="form-group">
                                <label for="username"><i class="input-username"></i></label> 
                                <input type="text" name="username" id="username" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="input-password"></i></label> 
                                <input type="password" name="password" id="password" placeholder="Password" />
                            </div>
                            <div class="iform-group">
                                <select class="form-select" name="position" id="form-select"aria-label="Default select example">
                                    <option selected>Select Position</option>
                                    <option value="Admin1">Admin1</option>
                                    <option value="Admin1">Admin2</option>
                                    <option value="Employee">Employee</option>
                                </select>
                            </div>

                            <div class="form-group form-button">

                                <a href="../admin/LinkIn.jsp" class="form-submit">
                                    Submit
                                </a>
                            </div>
                        </form>

                    </div>
                </div>
        </div>
    </section>

</div>


</body>
</html>
