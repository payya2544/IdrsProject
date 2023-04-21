<%-- 
    Document   : pdf_gen
    Created on : Apr 4, 2022, 4:45:34 AM
    Author     : paanpun
--%>

<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfImportedPage"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>  
<%@page import="com.itextpdf.text.pdf.PdfWriter"%> 
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.*"%>
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

    String payment_email = (String) session.getAttribute("email");
    if (payment_email == null) {
        payment_email = (String) request.getParameter("email");
    }
//String payment_email = "kcice50@gmail.com";
    String payment_status;
    String qr_status;
    String pdf_status;
    String email_status;
    String order_name;
    String order_price;
    String order_pro;
    String order_user;
    String order_last;
    String order_id;
    String order_add;
    String order_date;
    String order_phone;
    String order_ref;
    String order_text;
    String text;
%>

<%
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "select *,DATE_FORMAT(payment.created_at, '%d/%m/%Y') as Date from payment INNER join user on payment.payment_email = user.Email JOIN promos on payment.payment_promoid = promos.promo_id where payment_email ='" + payment_email + "'";
    resultSet = statement.executeQuery(sql);
    DecimalFormat formatter = new DecimalFormat("#,##0");
    while (resultSet.next()) {
        payment_status = resultSet.getString("payment_status");
//                qr_status = resultSet.getString("qr_status");
//                pdf_status = resultSet.getString("pdf_status");
        order_ref = resultSet.getString("receipt_number");
        order_date = resultSet.getString("Date");
        order_phone = resultSet.getString("PhoneNumber");
        order_add = resultSet.getString("Address");
        order_id = resultSet.getString("payment_id");
        order_pro = resultSet.getString("Pronouns");
        order_user = resultSet.getString("FirstName");
        order_last = resultSet.getString("LastName");
        order_name = resultSet.getString("promo_name");
        order_text = resultSet.getString("promo_text");
        order_price = formatter.format(Integer.parseInt(resultSet.getString("promo_price")));
%>

<%
        try {
            String file_name = "/opt/tomcat/webapps/idrs/gen_result/" + payment_email + ".pdf";
            Document document = new Document();

            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file_name, true));

            document.open();

            Paragraph para = new Paragraph("This " + payment_email);
            Paragraph para1 = new Paragraph("                                        ");
            Paragraph para2 = new Paragraph("                                                   " + order_text + " Baht");
            Paragraph para3 = new Paragraph("        Package   :  " + order_name + "                                                                      " + order_price);
            Paragraph p = new Paragraph("test");
            Paragraph para5 = new Paragraph("                                                          " + "                                              " + "                         " + order_ref);
            Paragraph para4 = new Paragraph("                                                            " + order_pro + "  " + order_user + "  " + order_last);
            Paragraph para6 = new Paragraph("                                                                                                                                          " + order_price);
            Paragraph para7 = new Paragraph("                                                                                                                                       " + order_date);
            Paragraph para8 = new Paragraph("        IDRS International Conference 2023");


            document.add(new Paragraph("\n" + "\n" + "\n" + "\n" + "\n" + "\n"));
            document.add(para5);
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n"));
            document.add(para7);
            document.add(new Paragraph("\n"));
            document.add(para4);
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n"));
            document.add(para8);
            document.add(para3);
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n"));
            document.add(para6);
            document.add(new Paragraph("\n"));
            document.add(para2);
            //FixText("Add Your Text",400,700,writer,14);

            PdfContentByte canvas = writer.getDirectContent();

            PdfReader reader = new PdfReader("/opt/tomcat/webapps/idrs/pic/receipt.pdf");
            PdfImportedPage header = writer.getImportedPage(reader, 1);
            PdfImportedPage header1 = writer.getImportedPage(reader, 2);

            float ws = PageSize.LETTER.getWidth() / header.getWidth();
            float hs = PageSize.LETTER.getHeight() / header.getHeight();
            canvas.addTemplate(header,
                    ws, 0, 0,
                    hs, 0, 0);
            document.newPage();
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n"));
            document.add(new Paragraph("            " + order_pro + "  " + order_user + "  " + order_last));
//            document.add(new Paragraph("                                                         "+"                                                            "+order_add));
//            document.add(new Paragraph("                                                         "+"                                                            "+order_phone));
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n" + "\n"));
            document.add(new Paragraph("                                                       " + order_user + "  " + order_last));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("                                                       " + order_date));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("                                                       " + order_name));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("                                                       " + order_id));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("                                                       " + order_price + "  Baht"));
            document.add(new Paragraph("\n" + "\n" + "\n" + "\n" + "\n"));
            canvas.addTemplate(header1,
                    ws, 0, 0,
                    hs, 0, 0);
            document.newPage();

            document.close();
            String text12 = order_pro + "  " + order_user + "  " + order_last;
            session.setAttribute("fullname", text12);

//             
            response.sendRedirect("sendemail.jsp?email=" + payment_email + "&fullname=" + text12);
        } catch (Exception e) {
            out.println(e);
//                        response.sendRedirect("error.jsp");
        }
    }
%>

<%
//        if(payment_status.equals("Suscess")){ 
//                    if(email_status.equals("wait")){ 
//                        session.setAttribute("email", payment_email); 
//                        response.sendRedirect("sendemail.jsp");
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
        <h1>Hello World!</h1>
        <%= payment_email%>
    </body>
</html>
