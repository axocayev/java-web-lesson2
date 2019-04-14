/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.servlet;

import az.rentcar.dao.MarkaDAO;
import az.rentcar.dao.OrderDao;
import az.rentcar.dao.RentCarDao;
import az.rentcar.model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.parser.Token;

/**
 *
 * @author anarx
 */
public class OrderServlet extends HttpServlet {
        MarkaDAO mdao = new MarkaDAO();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                response.setContentType("text/html;charset=UTF-8");

        System.out.println(request.getPathInfo());
        
        String rentId=request.getPathInfo().replace("/", "");
        System.out.println("id "+rentId);
        RentCarDao  carDao=new RentCarDao();
        az.rentcar.model.RentCar car=
                carDao.getRentCarById(Integer.parseInt(rentId));
        
        request.setAttribute("rentcar", car);
        request.setAttribute("carmarks", mdao.getAllMarka());
        
        RequestDispatcher rq=request.getRequestDispatcher("/carrentviews/order.jsp");
        rq.include(request, response);
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/html;charset=UTF-8");
      String id=request.getParameter("id");
      String name=request.getParameter("name");
      String sname=request.getParameter("sname");
      String email=request.getParameter("email");
      String phone=request.getParameter("phone");
      
        Order order=new Order();
        order.setEmail(email);
        order.setName(name);
        order.setPhone(phone);
        order.setSname(sname);
        RentCarDao carDao=new RentCarDao();
        order.setCar(carDao.getRentCarById(Integer.parseInt(id)));
        
        OrderDao dao=new OrderDao();
       if( dao.createOrder(order)>0){
               try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<a href='/java-web-lesson2/rentcar/all'>Order successfully complteted!!</a>");
            out.println("</body>");
            out.println("</html>");
        }
       }
        
        System.out.println(id+" "+name+" "+sname+" "+email+" "+phone);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
