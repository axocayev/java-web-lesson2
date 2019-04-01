<%-- 
    Document   : autolist
    Created on : Apr 1, 2019, 8:23:38 PM
    Author     : anarx
--%>

<%@page import="az.automobile.model.Automobile"%>
<%@page import="az.automobile.fileops.AutoFileOps"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  pageContext.setAttribute("autoList", afo.getAllAuto());
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
                    <c:forEach var="a" items="${autoList}" >
                    <tr>
                        <td><c:out value="${a.getMarka()}"></c:out></td>
                        <td><c:out value="${a.getModel()}"></c:out></td>
                        <td><c:out value="${a.getType()}"></c:out></td>
                        <td><c:out value="${a.getYear()}"></c:out></td>
                        <td><c:out value="${a.getMotor() }"></c:out></td>
                        <td><c:out value="${a.getColor()}"></c:out></td>
                        <td><c:out value="${a.getTransmission()}"></c:out></td>
                        <td><c:out value="${a.getPrice()}"></c:out></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
