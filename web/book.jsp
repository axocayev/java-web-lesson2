<%-- 
    Document   : book
    Created on : Mar 31, 2019, 1:11:23 PM
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
        
        <c:set var="name" value="Anar"></c:set>
        <c:out value="${name}"></c:out>
        
        <c:set var="s" value="${5*5*5}"></c:set>
        <c:out value="${s}"></c:out>
        <c:if test="${s>100}">
             <c:out value="${s*10}"></c:out>
        </c:if>
        
        <c:set var="day" value="70"></c:set>
        <c:choose>
            <c:when test="${day==1}">
                 <c:out value="Monday"></c:out>
            </c:when>
            <c:when test="${day==7}">
                 <c:out value="Sunday"></c:out>
            </c:when>
            <c:otherwise>
                 <c:out value="Not correct day number"></c:out>
           
            </c:otherwise>
        </c:choose> 
        
        
        
        <c:forEach var="i" begin="0" end="10">
               <br>  <c:out value="${i}"></c:out>
        </c:forEach>
          
    <table width='600px' border='1'>    
        <c:forEach      var="list" items="${StudentList}" >
            <tr>
                <td> <c:out value="${list.getId()}"></c:out></td>
                <td> <c:out value="${list.getName()}"></c:out></td>
                <td> <c:out value="${list.getSurname()}"></c:out></td>
                <td> <c:out value="${list.getEmail()}"></c:out></td>
                <td> <c:out value="${list.getPhone()}"></c:out></td>
            </tr>
        </c:forEach>  
               
    </table>          
    </body>
</html>
