<%-- 
    Document   : json
    Created on : Apr 12, 2023, 3:01:04 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.*"%>
<%@page import="java.sql.*"%>


<% 
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://127.0.0.1:3306/";
    final String database = "student?characterEncoding=UTF-8";
    final String user="student";
    final String pass="uploadfile286";

    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
        
    try{
        Class.forName(jdbcdriver);
        con = DriverManager.getConnection(url+database, user, pass);
    }catch(ClassNotFoundException e){
    }catch(SQLException e){}
    
    try{
        
        String query;
        
        stmt = con.createStatement();
        //String payment_email = "pnphanp@gmail.com";
        String payment_email = request.getParameter("email");
        query = "select * from user where Email ='"+payment_email+"'";
        result = stmt.executeQuery(query);
        
        if(!result.next()){
            out.print("0");
        }else{
            JSONArray array=new JSONArray();
            do{
                JSONObject obj = new JSONObject();
                obj.put("FirstName",result.getString("FirstName"));
                obj.put("LastName",result.getString("LastName"));
                obj.put("Location",result.getString("Address"));
                out.print(obj);
                //array.put(obj.toString());
            }while(result.next());
            //out.print("fff");
        }
        
    }catch(SQLException e){
        out.print("Exception: "+e);
    }
    finally{
        if(stmt != null){
            try{
                stmt.close();
            }catch(SQLException e){}
        }
        if(con != null){
            try{
                con.close();
            }catch(SQLException e){}
        }
    }
%>


