<%-- 
    Document   : login_dash
    Created on : Mar 11, 2023, 11:56:38 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>

<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Login | Dashboard</title>
      <link href="css/Loginstyle.css" rel="stylesheet" type="text/css">
   </head>
   <body>
      <div class="center">
         <input type="checkbox" id="show">
         <label for="show" class="show-btn">Click for login</label>
         <div class="container">
            <label for="show" class="close-btn fas fa-times" title="close"></label>
            <div class="text">
               Login Form
            </div>
            <form action="into.jsp" method="post">
               <div class="data">
                  <label>Email or Phone</label>
                  <input type="text" name="user" required>
               </div>
               <div class="data">
                  <label>Password</label>
                  <input type="password"  name="pass" required>
               </div>
               <div class="forgot-pass">
                  <a href="#">Forgot Password?</a>
               </div>
               <div class="btn">
                  <div class="inner"></div>
                  <button type="submit" name="login">login</button>
               </div>
               <div class="signup-link">
                  Not a member? <a href="#">Signup now</a>
               </div>
            </form>
         </div>
      </div>
   </body>
</html>