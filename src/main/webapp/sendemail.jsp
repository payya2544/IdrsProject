<%@page import="com.sun.xml.messaging.saaj.packaging.mime.internet.MimeMultipart"%>
<%@page import="com.sun.xml.messaging.saaj.packaging.mime.internet.MimeBodyPart"%>
<%@page import="com.google.protobuf.Message"%>
<%@page import="jdk.internal.net.http.websocket.Transport"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.MimeMultipart"%>

<%
    String payment_email = (String) session.getAttribute("email");
    String full_name = (String) session.getAttribute("fullname");
    if (payment_email == null) {
        payment_email = (String) request.getParameter("email");
    }
    if (full_name == null) {
        full_name = (String) request.getParameter("fullname");
    }
//String payment_email = "kcice50@gmail.com";
    String payment_status;
    String qr_status;
    String pdf_status;
    String email_status;
%>

<%
    try {
        //----------------- https://myaccount.google.com/security --------------------------------
        //------------------------------------------------------------------ send mail
        String A_mail = "idrs.023@gmail.com";
        String P_mail = "ydqowdfocwknvbfs";
        String T_mail = payment_email;
        String subject = "Confirmation Register";
        String st = "Dear " + full_name + ",Pleasure for your registration";
        //--------------------------------------------------------------------------
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        Session session2 = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(A_mail, P_mail);
            }
        });
        Message msg = new MimeMessage(session2);                                    //Creates a new e-mail message              
        msg.setFrom(new InternetAddress(A_mail));                                   //E-mail Sender
        InternetAddress[] toAddresses = {new InternetAddress(T_mail)};
        //--------------------------------------------------------------------------
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);                                                    //subject
        //--------------------------------------------------------------------------
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        Multipart multipart = new MimeMultipart();
        messageBodyPart.setText(st, "utf-8", "html");                                 //message

        //Attachment body part.
        MimeBodyPart pdfAttachment = new MimeBodyPart();
        pdfAttachment.attachFile("/opt/tomcat/webapps/idrs/gen_result/" + payment_email + ".pdf");

        MimeBodyPart pngAttachment = new MimeBodyPart();
        pngAttachment.attachFile("/opt/tomcat/webapps/idrs/gen_result/" + payment_email + ".jpg");

        multipart.addBodyPart(messageBodyPart);
        multipart.addBodyPart(pdfAttachment);
        multipart.addBodyPart(pngAttachment);
        msg.setContent(multipart);
        //--------------------------------------------------------------------------
        Transport.send(msg);
        session.setAttribute("email", null);
        session.setAttribute("full_name", null);
        response.sendRedirect("dashboardidrsmahidol2023.jsp");

    } catch (Exception e) {
        System.out.println(e);
    }
%>

<%
//        if(payment_status.equals("Suscess")){ 
//                    if(email_status.equals("Suscess")&& pdf_status.equals("Suscess") && qr_status.equals("Suscess")){ 
//                        session.setAttribute("email", "null"); 
//                        response.sendRedirect("main.jsp");
////                        RequestDispatcher dispatcher = request.getRequestDispatcher("qr_gen.jsp");
////                        dispatcher.forward( request, response );
//                    } 
//                }
//        }                     
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Hello World!</h1>-->
        <%--<%= // payment_email%>--%>

    </body>
</html>