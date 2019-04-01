<%-- 
    Document   : autolist
    Created on : Apr 1, 2019, 8:23:38 PM
    Author     : anarx
--%>

<%@page import="az.automobile.model.Automobile"%>
<%@page import="az.automobile.fileops.AutoFileOps"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
<%
  AutoFileOps afo=new AutoFileOps();
%>
        <div class="container">
            <h2>List of Automobile</h2>
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Marka</th>
                        <th>Model</th>
                        <th>Type</th>
                        <th>Year</th>
                        <th>Motor</th>
                        <th>Color</th>
                        <th>Transmission</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                    for(Automobile a:afo.getAllAuto()){
                    %>
                    <tr>
                        <td><%=a.getMarka()%></td>
                        <td><%=a.getModel()%></td>
                        <td><%=a.getType()%></td>
                        <td><%=a.getYear()%></td>
                        <td><%=a.getMotor() %></td>
                        <td><%=a.getColor()%></td>
                        <td><%=a.getTransmission()%></td>
                        <td><%=a.getPrice()%></td>
                    </tr>
                     <%}%>  
                </tbody>
            </table>
        </div>
    </body>
</html>
