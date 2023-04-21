<%-- 
    Document   : LinkIn
    Created on : Mar 3, 2023, 3:00:00 AM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    .grid-container {
      display: grid;
      grid-template-columns: auto auto auto;
      background-color: #2196F3;
      padding: 10px;
    }

    .grid-item {
      background-color: rgba(255, 255, 255, 0.8);
      border: 1px solid rgba(0, 0, 0, 0.8);
      padding: 20px;
      font-size: 30px;
      text-align: center;
    }
</style>
    </head>
    <body>
        <div class="grid-container">
            <a href="../admin/index.jsp" class="grid-item">go admin</a>
            <h2 class="grid-item">go dashboard</h2>
        </div>
       
    </body>
</html>
