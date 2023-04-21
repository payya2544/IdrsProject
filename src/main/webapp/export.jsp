<%-- 
    Document   : export
    Created on : Mar 20, 2023, 1:25:15 AM
    Author     : Acer
--%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=IDRS_2023_EXPORT.xls");
%>
<table>
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
        <th>Receipt Number</th>
        <!--<th>Gen</th>-->
    </tr>
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            statement = connection.createStatement();
            String sql = "select *,DATE_FORMAT(payment.created_at, '%d/%m/%Y') as Date from payment INNER join user on payment.payment_email = user.Email JOIN promos on payment.payment_promoid = promos.promo_id;";
            resultSet = statement.executeQuery(sql);
            DecimalFormat formatter = new DecimalFormat("#,##0");
            while (resultSet.next()) {
    %>
    <tr>
        <td>IDRS International Conference 2023</td>
        <td><%=resultSet.getString("FirstName")%></td>
        <td><%=resultSet.getString("LastName")%></td>
        <td><%=resultSet.getString("promo_name")%></td>
        <td><%=resultSet.getString("payment_id")%></td>
        <td><%=resultSet.getString("payment_email")%></td>
        <td><%=formatter.format(Integer.parseInt(resultSet.getString("promo_price")))%></td>
        <td><%=resultSet.getString("Date")%></td>
        <td><%=resultSet.getString("payment_status")%></td>
        <td><%=resultSet.getString("receipt_number")%></td>
        <!--<td><%=resultSet.getString("invoice_no")%></td>-->
    </tr>  
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
