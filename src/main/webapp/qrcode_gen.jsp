<%-- 
   Document   : qr_gen
   Created on : Oct 9, 2022, 1:56:39 AM
   Author     : Acer
--%>

<%@page import="java.awt.AlphaComposite"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageConfig"%>
<%@page import="java.io.IOException"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.MultiFormatWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    String payment_status;
    String qr_status;
    String pdf_status;
    String email_status;


    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from payment where payment_email ='" + payment_email + "'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            payment_status = resultSet.getString("payment_status");


            String data = payment_email;

            String filePath = "/IdrsFinal/gen_result/" + data + ".jpg";
//
            BitMatrix bitMatrix = new MultiFormatWriter().encode(data, BarcodeFormat.QR_CODE, 500, 500);
            MatrixToImageConfig imageConfig = new MatrixToImageConfig(MatrixToImageConfig.BLACK, MatrixToImageConfig.WHITE);
//
            BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, imageConfig);


            BufferedImage logoImage = ImageIO.read(new File("/IdrsFinal/pic/idrsthailand.png"));

            int finalImageHeight = qrImage.getHeight() - logoImage.getHeight();
            int finalImageWidth = qrImage.getWidth() - logoImage.getWidth();
            //Merging both images 
            BufferedImage finalImage = new BufferedImage(qrImage.getHeight(), qrImage.getWidth(), BufferedImage.TYPE_INT_ARGB);
            Graphics2D graphics = (Graphics2D) finalImage.getGraphics();
            graphics.drawImage(qrImage, 0, 0, null);
            graphics.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f));
            graphics.drawImage(logoImage, (int) Math.round(finalImageWidth / 2), (int) Math.round(finalImageHeight / 2), null);

            ImageIO.write(finalImage, "png", new File(filePath));
//
            response.sendRedirect("pdf_gen.jsp?email=" + payment_email);
        }

//           response.sendRedirect("sendemail.jsp");
    } catch (Exception e) {

        out.println(e);
    }
%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>qr gen!</h1>
        <%= payment_email%>
    </body>
</html>
