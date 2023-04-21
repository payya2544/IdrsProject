<%-- 
    Document   : 2c2p.jsp
    Created on : Mar 3, 2023, 1:17:26 AM
    Author     : Acer
--%>

<%@page import="com.sun.org.apache.xml.internal.security.algorithms.Algorithm"%>
<%@page import="com.sun.org.apache.xml.internal.security.algorithms.Algorithm"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.auth0.jwt.*"%>
<%@page import="com.auth0.jwt.algorithms.*"%>
<%@page import="com.auth0.jwt.interfaces.*"%>
<%@page import="com.auth0.jwt.JWTVerifier.*"%>
<%@page import="com.auth0.jwt.exceptions.JWTCreationException.*"%>
<%@page import="com.auth0.jwt.exceptions.*"%>
<%@page import="com.auth0.jwt.exceptions.JWTVerificationException.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.InputStreamReader.*"%>
<%@page import="java.net.URL.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Random"%>
<%--<%@page import="com.mycompany.idrsproject.DBConnection" %>--%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>

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

%>

<%    String token = "";
    String secretKey = "C4D47B3E4E5F0AC0D9E8DF78085E5C11041BD58C8D8CB21F9503771EC6BEDED5";
    String payment_id = request.getParameter("payment_id");
    String total_price = request.getParameter("total_price");
//    out.println(invoice_no);
    Connection connection = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        if (connection != null) {
            out.println("Database Connected.");

        } else {
            out.println("Database Connect Failed.");
        }
        Statement statement = null;
        ResultSet resultSet = null;
        statement = connection.createStatement();
        String sql = "SELECT * FROM `payment` join promos on payment_promoid = promos.promo_id WHERE payment_id ='" + payment_id + "' LIMIT 1";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            String[] channel = {"CC"};
            HashMap<String, Object> payload = new HashMap<>();
            payload.put("merchantID", "014012022011571");
            payload.put("invoiceNo", resultSet.getString("payment_id"));
            payload.put("description", resultSet.getString("promo_desc"));
            payload.put("amount", resultSet.getString("promo_price"));
            payload.put("currencyCode", "THB");
            payload.put("paymentChannel", channel);
            payload.put("frontendReturnUrl", "https://idrs2023.mahidol.ac.th/main.jsp");
            payload.put("backendReturnUrl", "https://idrs2023.mahidol.ac.th/update_payment.jsp?payment_id=" + resultSet.getString("payment_id"));

            Algorithm algorithm = Algorithm.HMAC256(secretKey);

            token = JWT.create().withPayload(payload).sign(algorithm);
        }

    } catch (JWTCreationException | IllegalArgumentException e) {
        //Invalid Signing configuration / Couldn't convert Claims.
        e.printStackTrace();
    }

    JSONObject requestData = new JSONObject();
    requestData.put("payload", token);

//    out.println(requestData);
    try {
        String endpoint = "https://pgw.2c2p.com/payment/4.1/paymentToken";
        URL obj = new URL(endpoint);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/*+json");
        con.setRequestProperty("Accept", "text/plain");

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(requestData.toString());
        wr.flush();
        wr.close();

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response1 = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response1.append(inputLine);
        }
        in.close();
        JSONParser parser = new JSONParser();
        JSONObject responsedata = (JSONObject) parser.parse(response1.toString());
        out.println(responsedata.get("payload"));
//        HttpSession mysession = request.getSession();
//        mysession.setAttribute("response_token", response1);

        response.sendRedirect("checktoken.jsp?token=" + responsedata.get("payload"));
    } catch (Exception e) {
        e.printStackTrace();
    }
%>






<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>2c2p test</title>
    </head>
    <body>
        <h1>2c2p test</h1>
    </body>
</html>
