<%-- 
    Document   : navbaradmin
    Created on : Jan 15, 2023, 5:21:32 PM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/navbar/navbaradmin.css">
        <script src="https://kit.fontawesome.com/8af7176a08.js" crossorigin="anonymous"></script>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <nav class="main-menu">
                <ul>
                    <li>
                        <a href="../admin/index.jsp/">
                            <i class="fa fa-home"></i>
                            <span class="nav-text">
                                Dashboard
                            </span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="../admin/settings/index.jsp/">
                            <i class="fa fa-cogs"></i>
                            <span class="nav-text">
                                Settings
                            </span>
                        </a>
                    </li>
                    
                </ul>

                <ul class="logout">
                    <li>
                        <a href="/">
                            <i class="fa fa-power-off"></i>
                            <span class="nav-text">
                                Logout
                            </span>
                        </a>
                    </li>  
                </ul>
            </nav>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
