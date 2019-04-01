<%-- 
    Document   : studfull
    Created on : Apr 1, 2019, 7:03:54 PM
    Author     : anarx
--%>

<%@page import="az.itedu.servlet.Student"%>
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
        
        String id=request.getParameter("studid");
       // out.print(id);
        Student student=null;
        for(Student s:list.getAllStudent()){
         //   out.print(s);
            if(String.valueOf(s.getId()).equals(id)){
                student=s;
               // out.print(student);
               break;
                
            }
        }
         pageContext.setAttribute("st", student);
        %>
        <p> Id :<c:out value="${st.getId()}"></c:out></p>

        <p> Name :<c:out value="${st.getName()}"></c:out></p>
        <p> SurName :<c:out value="${st.getSurname()}"></c:out></p>
        <p> Email :<c:out value="${st.getEmail()}"></c:out></p>
        <p> Phone :<c:out value="${st.getPhone()}"></c:out></p>
    </body>
</html>
