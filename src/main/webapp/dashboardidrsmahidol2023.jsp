<%-- 
    Document   : pdf_gen
    Created on : Apr 4, 2022, 4:45:34 AM
    Author     : paanpun
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat" %>
<%
    String id = request.getParameter("userid");
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


%>

<%    String name = (String) session.getAttribute("user");
    if(name == null){response.sendRedirect("login_dash.jsp");}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
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
                                <table id="customers">
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
                                        <th>Receipt number</th>
                                        <th></th>
                                    </tr>
                                    <% try {
                                            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                            statement = connection.createStatement();

                                            String sql = "SELECT * FROM payment ORDER BY payment_id DESC";
                                            resultSet = statement.executeQuery(sql);

                                            String sql2 = "select *,DATE_FORMAT(payment.created_at, '%d/%m/%Y') as Date from payment INNER join user on payment.payment_email = user.Email JOIN promos on payment.payment_promoid = promos.promo_id ORDER BY payment.id DESC";
                                            resultSet = statement.executeQuery(sql2);
                                            DecimalFormat formatter = new DecimalFormat("#,##0");
                                            Integer i = 0;
                                            while (resultSet.next()) {
                                                i++;%>

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
                                            <% if (resultSet.getString("receipt_number") != null) {%>
                                            <%=resultSet.getString("receipt_number")%>
                                            <% } else {%>
                                            <input type="text" value="2023IR" id="receipt<%=i%>" name="receipt" minlength="10" maxlength="10" required>
                                            <input type="hidden" value="<%=resultSet.getString("payment_email")%>" id="email<%=i%>" name="email" required>
                                            <% } %>
                                        </td>
                                        <td>
                                            <% if ((resultSet.getString("payment_status").equals("paid")) && (resultSet.getString("receipt_number") == null)) {%>
                                            <button onclick="submitForm(<%=i%>)">Send</button>
                                            <% } %>
                                        </td>
                                    </tr>  
                                    <%
                                            }
                                            connection.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </table>
                                <script>
                                    function submitForm(row) {
                                        var receipt = document.getElementById("receipt" + row).value;
                                        var email = document.getElementById("email" + row).value;
                                        var xhttp = new XMLHttpRequest();
                                        xhttp.open("POST", "approval.jsp", true);
                                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xhttp.send("receipt=" + receipt + "&email=" + email);
                                    }
                                </script>
                            </div>
                        </div>

                    </div>
                </div>
                <a type="submit" href="export.jsp?type='excel'">export</a>   
            </section>
        </div>
    </body>
</html>