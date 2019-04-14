<%-- 
    Document   : order
    Created on : Apr 14, 2019, 4:39:10 PM
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
                <hr>
                <div class="row">
                    <div class="col-lg-6">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <td> 
                                    <div class="text text-primary">Marka</div> 
                                </td>
                                <td>
                                    <div class="bg-success">
                                        <b> <c:out value="${rentcar.getMarka().getName()}"/></b>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td> 
                                <div class="text text-primary">Model</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getModel().getName()}"/></b>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td> 
                                <div class="text text-primary">Type</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getType()}"/></b>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td> 
                                <div class="text text-primary">Motor</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getMotor()}"/></b>
                                </div>
                            </td>
                        </tr>



                        <tr>
                            <td> 
                                <div class="text text-primary">Year</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getYear()}"/></b>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td> 
                                <div class="text text-primary">Color</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getColor()}"/></b>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td> 
                                <div class="text text-primary">Transmission</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getTransmission()}"/></b>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td> 
                                <div class="text text-primary">Price</div> 
                            </td>
                            <td>
                                <div class="bg-success">
                                    <b> <c:out value="${rentcar.getPrice()}"/></b>
                                </div>
                            </td>
                        </tr>
                    </table>


                </div>
                <div class="col-lg-6">

                    <form action="<c:out value="${pageContext.request.contextPath}"/>/order" method="POST">
                        <div class="input-group">
                            <input type="hidden" 
                                   class="form-control" 
                                   name="id"  value="<c:out value="${rentcar.getId()}"/>">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Your name" >
                        </div>
                        <hr>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" id="sname" name="sname" placeholder="Your Surname">
                        </div>
                        <hr>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email"  placeholder="Email">
                        </div>
                        <hr>
                        <div class="input-group">

                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
                        </div>

                        <hr>
                        <div class="input-group">

                            <input type="submit" class="btn btn-success" 
                                   value="Order" >
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </body>
</html>
