<%-- 
    Document   : carlist
    Created on : Apr 13, 2019, 3:27:44 PM
    Author     : anarx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <jsp:include page="navbar.jsp"></jsp:include>
    
  <h2>Condensed Table</h2>
  <p>The .table-condensed class makes a table more compact by cutting cell padding in half:</p>            
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
                        <th>Order</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${autoList}" >
                    <tr>
                        <td><c:out value="${a.getMarka().getName()}"></c:out></td>
                        <td><c:out value="${a.getModel().getName()}"></c:out></td>
                        <td><c:out value="${a.getType()}"></c:out></td>
                        <td><c:out value="${a.getYear()}"></c:out></td>
                        <td><c:out value="${a.getMotor() }"></c:out></td>
                        <td><c:out value="${a.getColor()}"></c:out></td>
                        <td><c:out value="${a.getTransmission()}"></c:out></td>
                        <td><c:out value="${a.getPrice()}"></c:out></td>
                        <td><a href='<c:out value="${pageContext.request.contextPath}"/>/order/<c:out value="${a.getId()}"></c:out>'
                               class ="btn btn-primary">
                        
                        Order</a> </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
</div>

</body>
</html>
