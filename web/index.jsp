<%-- 
    Document   : index
    Created on : Mar 28, 2019, 8:15:31 PM
    Author     : anarx
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        String getResult(int num){
            if(num%2==0){
                  return (num+ " <b>Cut </b> <br>");   
              }else{
                  return  (num+ " <b>Tek </b> <br>");   

              }
        }
        %>
        <%
          out.print("<b>Hello Asif</b>  <hr>");   
          out.print("<h1>Hello Asif</h1>");
          out.print(new Date());
          out.print("<hr>");   

          for(int i=10;i<15;i++){
              out.print(getResult(i));
          }

        %>
        
        <hr>
        
        <%= new Date() %>
        <%= "<hr>" %>
    </body>
</html>
