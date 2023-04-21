<%-- 
    Document   : editcontent
    Created on : Jan 15, 2023, 10:44:59 PM
    Author     : paanpun
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="com.mycompany.idrsproject.DBConnection" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <jsp:include page="../../navbar/navbaradmin.jsp" />
        <br>
        <div class="container">          
            <form action="createcontent.jsp" method="POST">
                <div class="input-field">
                    <label for="title">Enter title</label>
                    <input type="text" name="Article_title" id="title">
                    <input type="hidden" name="page" value="${param.source}">
                </div>
                <textarea name="Article_content" id="editor" ></textarea>
                <button type="submit" class="btn-green" name="submit_data" >save</button>
            </form>
        </div>
        <script src="../../ckeditor/ckeditor.js"></script>
        <script> CKEDITOR.replace('editor');</script>
    </body>
</html>
