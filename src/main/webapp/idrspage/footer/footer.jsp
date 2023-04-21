<%-- 
    Document   : footer
    Created on : Dec 25, 2022, 1:59:20 PM
    Author     : pnpha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <style>
        .footer *{
            position: relative;
            background-color: #102F7B;
            color: white;
            padding: 0 0;
            font-family: kanit;
            color: white;
        }
        
        div.footer-box{
            display: grid;
            background-color: #102F7B !important;
            grid-template-columns: repeat(3,1fr);
            grid-gap: 15px;

        }
    </style>
    <body>
     <div class="footer">
             <div class="footer-box">
                <div class="footer-item">
                    <img src="/img/mahidollogo1.png" alt="mahidollogo">
                    <p>College of Music, Mahidol University</p>
                    <div class="footer-item">
                        <a href="#"><i>Facebook</i></a>
                        <a href="#"><i>Youtube</i></a>
                        <a href="#"><i>Twitter</i></a>
                        <a href="#"><i>Instagram</i></a>
                    </div>
                </div>
                <div class="footer-item">
                    <h2>Link</h2>
                    <ul class="footer-item">
                        <li><a href="../">Home</a></li>
                        <li><a href="#">Schedule</a></li>
                        <li><a href="#">Conference Info</a></li>
                        <li><a href="#">About Mahidol</a></li>
                        <li><a href="#">Register</a></li>
                    </ul>
                </div>
                <div class="footer-item">
                    <h2>Information About</h2>
                    <ul class="footer-item">
                        <li><a href="#">999 Phuttamonthon 4 Road, Salaya,
                                            Nakhon Pathom 73170 Thailand</a></li>
                        <li><a>+66 (0) 2849-6000</a></li>
                        <li><a>Our Location</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
