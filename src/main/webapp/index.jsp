<%-- 
    Document   : check
    Created on : Jun 30, 2022, 11:46:46 PM
    Author     : Acer
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>
<%--<%@page import="com.mycompany.idrsproject.DBConnection" %>--%>

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IDRS_Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/newcss.css" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="imglogo">
                <img class="mahidollogo" src="pic/idrsmu.png" alt="idrsmu" >
            </div>
            <div class="title">Registration</div>
            <div class="content">
                <form action="check.jsp"  method="post">
                    <div class="user-details">

                        <div class="input-box">

                            <span class="details">* First Name</span>
                            <input type="text" placeholder="Enter your first name" name="fname" required>
                        </div>

                        <div class="input-box">
                            <span class="details">* Last Name</span>
                            <input type="text" placeholder="Enter your  last name" name="lname" required>
                        </div>

                        <div class="input-box">
                            <span class="details">* Email</span>
                            <input type="email" placeholder="Enter your email" name="email" required>
                            <p class="notify" style="font-size: 15px;">Please use IDRS registration Email if selecting member or student rate</p>
                        </div>

                        <div class="input-box">
                            <span class="details">Affiliation</span>
                            <input type="text" placeholder="Enter your affiliation" name="affiliation" >
                            <p class="notify" style="font-size: 15px;">Current place of study/work or other - no more than 2 affiliations, this will go on your name tag</p>
                        </div>
                        <div class="input-box">
                            <span class="details">Preferred pronouns</span>
                            <input type="text" placeholder="Enter your pronouns" name="pronouns">
                            <p class="notify"style="font-size: 15px;">If any, this will go on your name tag</p>
                        </div>

                        <div class="input-box">              
                            <span class="details">* Phone Number</span>
                            <input type="tel" id="phone" name="phone[main]" placeholder="Enter phone number" required>


                        </div>
                        <div class="input-box">
                            <span class="details">* Nationality</span>
                            <%                                String[] addressCodes = Locale.getISOCountries();

                                Map<String, String> mapCountries = new TreeMap<>();

                                for (String addressCode : addressCodes) {
                                    Locale locale = new Locale("", addressCode);
                                    String code = locale.getCountry();
                                    String name = locale.getDisplayCountry();
                                    mapCountries.put(code, name);
                                }

                            %>
                            <select placeholder="Enter your nationality" name="address" id="address" class="planid"  required>
                                <%
                                    for (Map.Entry<String, String> entry : mapCountries.entrySet()) {
                                        String addressName = entry.getValue();
                                %>
                                <option value="<%= addressName%>" class="textplan"><%= addressName%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>



                        <div class="input-box">
                            <span class="details">* Registration package</span>
                            <select name="planid" class="planid" required >
                                <option value="" selected disabled hidden class="textplan">Choose your package</option>
                                <%
                                    try {
                                        Statement statement = null;
                                        ResultSet resultSet = null;
                                        Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                                        statement = connection.createStatement();
                                        String sql = "select * from promos";
                                        resultSet = statement.executeQuery(sql);
                                        DecimalFormat formatter = new DecimalFormat("#,##0");
                                        while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getString("promo_id")%>"><%=resultSet.getString("promo_name") + " - " + formatter.format(Integer.parseInt(resultSet.getString("promo_price"))) + " Baht"%></option>
                                <%
                                        }
                                        connection.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>

                    </div>

                    <div>
                        <input type="checkbox" id="cerify" name="cerify" value="" required="">
                        <label for="cerify">I certify that if I select the member or student rate, I will be an IDRS member during the conference (July 18-22, 2023)</label>
                    </div>

                    <div class="button">
                        <input type="submit" name="action" value="register" >
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
<script type="text/javascript">
    var input = document.querySelector("#phone"),
            errorMsg = document.querySelector("#error-msg"),
            validMsg = document.querySelector("#valid-msg");
    // here, the index maps to the error code returned from getValidationError - see readme
    var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

    var phone_number = window.intlTelInput(input, {
        separateDialCode: true,
        preferredCountries: ["th"],
        hiddenInput: "full",
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js"
    });
    $("form").submit(function () {
        var full_number = phone_number.getNumber(intlTelInputUtils.numberFormat.E164);
        $("input[name='phone[full]'").val(full_number);
        console.log(full_number);
    });
    var reset = function () {
        input.classList.remove("error");
        errorMsg.innerHTML = "";
        errorMsg.classList.add("hide");
        validMsg.classList.add("hide");
    };
    // on blur: validate
    input.addEventListener('blur', function () {
        reset();
        if (input.value.trim()) {
            if (phone_number.isValidNumber()) {
                validMsg.classList.remove("hide");
            } else {
                input.classList.add("error");
                var errorCode = phone_number.getValidationError();
                errorMsg.innerHTML = errorMap[errorCode];
                errorMsg.classList.remove("hide");
            }
        }
    });
    // on keyup / change flag: reset
    input.addEventListener('change', reset);
    input.addEventListener('keyup', reset);
</script>