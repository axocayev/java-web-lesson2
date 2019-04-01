<%-- 
    Document   : studlist
    Created on : Apr 1, 2019, 7:00:11 PM
    Author     : anarx
--%>

<%@page import="az.itedu.servlet.StduentList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%
        StduentList list=new StduentList();
        pageContext.setAttribute("StudentList", list.getAllStudent());
        %>
        
    
          
    <table width='600px' border='1'>  
        <tr><th>ID</th><th>Name</th><th>Full Info</th></tr>
        <c:forEach      var="list" items="${StudentList}" >
            <tr>
                <td> <c:out value="${list.getId()}"></c:out></td>
                <td> <c:out value="${list.getName()}"></c:out></td>
                <td> <a href="studfull.jsp?studid=<c:out value="${list.getId()}"></c:out>" >Info</</a></td>
            </tr>
        </c:forEach>  
               
    </table>          
    </body>
</html>
