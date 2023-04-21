<%-- 
    Document   : backendpay
    Created on : Apr 3, 2023, 3:19:06 PM
    Author     : paanpun
--%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>

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
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        if (connection != null) {
//            out.println("Database Connected.");

        } else {
            out.println("Database Connect Failed.");
        }

    } catch (Exception e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
        e.printStackTrace();
    }

    try {
        if ((String) request.getParameter("pass") == null) {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Backend Page</title>\
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <nav>
                <div class="logo-name">
                    <div class="logo-image">
                        <!--<img src="images/logo.png" alt="">-->
                    </div>

                    <span class="logo_name">IDRS2023</span>
                </div>

                <div class="menu-items">
                    <ul class="nav-links">
                        <li>
                            <a href="/dashboardidrsmahidol2023.jsp">
                                <i class="uil uil-estate"></i>
                                <span class="link-name">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="/backendpay.jsp">
                                <i class="uil uil-estate"></i>
                                <span class="link-name">Edit Payment</span>
                            </a>
                        </li>
                        <li>
                            <a href="/dashboradidrsmahidol2023.jsp">
                                <i class="uil uil-files-landscapes"></i>
                                <span class="link-name">User Register</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="logout-mode">
                        <li><a href="/login_dash.jsp">
                                <i class="uil uil-signout"></i>
                                <span class="link-name">Logout</span>
                            </a></li>

                        <li class="mode">
                            <a href="#">
                                <i class="uil uil-moon"></i>
                                <span class="link-name">Dark Mode</span>
                            </a>

                            <div class="mode-toggle">
                                <span class="switch"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>

            <section class="dashboard">
                <div class="top">
                    <i class="uil uil-bars sidebar-toggle"></i>

                </div>
                <div class="dash-content">

                    <div class="activity">
                        <div class="title">
                            <i class="uil uil-clock-three"></i>
                            <span class="text">User Payment</span>
                        </div>
                        <div class="activity-data">
                            <div class="tbl-header">

                                <form class="mt-3" action="approval.jsp" method="post">
                                    <table class="table table-hover" id="customers">
                                        <tr>
                                            <th>Project Name</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Package Name</th>
                                            <th>Payment ID</th>
                                            <th>Email</th>
                                            <th>Price (Baht)</th>
                                            <th>Created at</th>
                                            <th>Payment status</th>
                                            <th>Change to not paid</th>
                                            <th>Change to paid</th>
                                        </tr>
                                        <% try {
                                                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                                statement = connection.createStatement();
                                                String sql = "select *,DATE_FORMAT(payment.created_at, '%d/%m/%Y') as Date from payment join user on payment.payment_email = user.Email JOIN promos on payment.payment_promoid = promos.promo_id";
                                                resultSet = statement.executeQuery(sql);
                                                DecimalFormat formatter = new DecimalFormat("#,##0");
                                                while (resultSet.next()) {%>
                                        <tr>
                                            <td>IDRS International Conference 2023
                                            </td>
                                            <td>
                                                <%=resultSet.getString("FirstName")%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("LastName")%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("promo_name")%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("payment_id")%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("payment_email")%>
                                            </td>
                                            <td>
                                                <%=formatter.format(Integer.parseInt(resultSet.getString("promo_price")))%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("Date")%>
                                            </td>
                                            <td>
                                                <%=resultSet.getString("payment_status")%>
                                            </td>
                                            <td>
                                                <a href="changestatus.jsp?id=<%=resultSet.getString("payment_id")%>&method=0" name="approv" type="submit">Change to Not Paid</a>
                                            </td>
                                            <td>
                                                <a href="changestatus.jsp?id=<%=resultSet.getString("payment_id")%>&method=1" name="approv" type="submit">Change to Paid</a>
                                            </td>
                                            <%
                                                    }
                                                    connection.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--</div>-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
            </section>
        </div>
    </body>
</html>
