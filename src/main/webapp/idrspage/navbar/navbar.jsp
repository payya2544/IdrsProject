<%-- 
    Document   : navbar
    Created on : Dec 24, 2022, 1:48:50 PM
    Author     : pnpha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/navbar/navbar.css">
    </head>
    <body>
        <header>
            <a href="./idrspage/index.jsp/"><img class="idrsmu" src="/img/idrsmu.png" alt="idrsmu"></a>
            <nav>
                <ul class="navbar">
                    <li><a href="./idrspage/index.jsp/">Home</a></li>
                    <li><a href="./idrspage/Schedules/SchedulePage.jsp">Schedule</a></li>
                    <li><a href="./idrspage/ConferenceInfo/ConferenceInfoPage.jsp">Conference Info</a></li>                  
                    <li><a href="./idrspage/AboutMahidol/AboutMahidolPage.jsp">About Mahidol</a></li>
                </ul>
            </nav>
            <a class="register" href="./idrspage/Registers/RegisterPage.jsp"><button>Register</button></a>
        </header>
    </body>
</html>
