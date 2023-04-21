<%-- 
    Document   : main
    Created on : Jul 2, 2022, 1:22:28 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

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

<%    Connection connection = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        if (connection != null) {
            //out.println("Database Connected.");

        } else {
            //out.println("Database Connect Failed.");
        }

    } catch (Exception e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
        e.printStackTrace();
    }

    String url = null;

    try ( Statement stmt = connection.createStatement();) {
       
        String query1 = "DELETE payment,user FROM payment INNER JOIN user ON payment.payment_email = user.Email WHERE payment_status = 'not paid'";
   

        stmt.executeUpdate(query1);
  
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }


%>

<link href="css/newcss.css" rel="stylesheet" type="text/css"
      <!DOCTYPE html>


<%//        if(session.getAttribute("username")== null)
//        {
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('You need to Login first');"); 
//            out.println("location='index.jsp';"); 
//            out.println("</script>");
////            response.sendRedirect("index.jsp");
//            
//        }
//        
%>

<%    String approv = request.getParameter("approv");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <!--            <img src="logo.png"width="55" height="48">-->
            <div class="title">Thank You!</div>
            <div class="content"></div>
            <h1>Back To Registration Page</h1>
            <%--<%= approv%>--%>
    </body><br>
    <a href="./index.jsp"
       style="text-decoration: none;
       border-radius: 5px;
       border: none;
       color: #fff;
       font-size: 18px;
       font-weight: 500;
       letter-spacing: 1px;
       cursor: pointer;
       transition: all 0.3s ease;
       background:linear-gradient(135deg, #71b7e6, #9b59b6);
       padding: 10px;
       ">Submit</a>

</html>



