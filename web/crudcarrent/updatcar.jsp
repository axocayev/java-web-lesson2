<%-- 
    Document   : addcar
    Created on : Apr 6, 2019, 3:12:33 PM
    Author     : anarx
--%>

<%@page import="az.automobile.fileops.AutoFileOps"%>
<%@page import="az.automobile.model.Automobile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String marka = request.getParameter("marka");
            String model = request.getParameter("model");
            String type = request.getParameter("type");
            String year = request.getParameter("year");
            String motor = request.getParameter("motor");
            String color = request.getParameter("color");
            String transmission = request.getParameter("transmission");
            String price = request.getParameter("price");
            AutoFileOps afo = new AutoFileOps();
            
            Automobile auto = new Automobile();
            auto.setId(id);
            auto.setMarka(marka);
            auto.setModel(model);
            auto.setMotor(motor);
            auto.setColor(color);
            auto.setType(type);
            auto.setYear(year);
            auto.setPrice(price);
            auto.setTransmission(transmission);

            
            
            
            RequestDispatcher rq = null;
            if (afo.updateAuto(auto)) {
                rq = request.getRequestDispatcher("autolist.jsp");
                rq.forward(request, response);
            } else {
                 rq = request.getRequestDispatcher("update.jsp?id="+id);
                rq.forward(request, response);
            };


        %>
    </body>
</html>
