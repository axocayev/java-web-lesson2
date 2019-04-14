<%-- 
    Document   : navbar
    Created on : Apr 13, 2019, 3:26:33 PM
    Author     : anarx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Markalar <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <c:forEach var="marka" items="${carmarks}">
                <li><a href='<c:out value="${pageContext.request.contextPath}"/>/rentcar/<c:out value="${marka.getId()}"></c:out>'><c:out value="${marka.getName()}"></c:out></a></li>
            </c:forEach>
        </ul>
      </li>
  
    </ul>
  </div>
</nav>
  
