<%-- 
    Document   : into
    Created on : Mar 12, 2023, 10:23:05 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String login = request.getParameter("login");
    out.println(login);
    if (login!=null) {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        out.println(user);
        out.println(pass);
        if(user.equals("idrs_2023")&&pass.equals("mahidol")){
            session.setAttribute("user",user);
            response.sendRedirect("dashboard.jsp");
            
    }
    
        else{response.sendRedirect("login_dash.jsp");}
    
    }
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
