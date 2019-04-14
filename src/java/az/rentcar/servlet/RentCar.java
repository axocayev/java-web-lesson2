/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.servlet;

import az.rentcar.dao.MarkaDAO;
import az.rentcar.dao.ModelDAO;
import az.rentcar.dao.RentCarDao;
import az.rentcar.model.Marka;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anarx
 */
public class RentCar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RentCar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RentCar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
        System.out.println("getScheme()" + request.getScheme());
        System.out.println("getServerName()" + request.getServerName());
        System.out.println("getServerPort()" + request.getServerPort());
        System.out.println("getContextPath()" + request.getContextPath());
        System.out.println("getServletPath()" + request.getServletPath());
        System.out.println("getQueryString()" + request.getQueryString());
        System.out.println("getPathInfo()" + request.getPathInfo());
        System.out.println("getRequestURI()" + request.getRequestURI());
           MarkaDAO mdao = new MarkaDAO();
        
        if (getCarsByMarkId(request.getPathInfo()) != null ) {
            System.out.println("1");
            RequestDispatcher rd = request.getRequestDispatcher("/carrentviews/carlist.jsp");
            request.setAttribute("carmarks", mdao.getAllMarka());
            request.setAttribute("autoList",
                    new RentCarDao().getCarsByMarka(Integer.parseInt(
                            request.getPathInfo().replace("/", ""))));

            rd.forward(request, response);
        } else if (request.getPathInfo().equals("/all") || request.getPathInfo()==null) {
            System.out.println("2");
            RequestDispatcher rd = request.getRequestDispatcher("/carrentviews/carlist.jsp");
            request.setAttribute("carmarks", mdao.getAllMarka());
            request.setAttribute("autoList", new RentCarDao().getAllCars());

            rd.forward(request, response);
        } else {
            System.out.println("3");
            RequestDispatcher rd = request.getRequestDispatcher("/carrentviews/carlist.jsp");
            request.setAttribute("carmarks", mdao.getAllMarka());
            request.setAttribute("autoList", new RentCarDao().getAllCars());

            rd.forward(request, response);
        }

        /* try (PrintWriter out = response.getWriter()) {
            out.println("<br>getScheme()" + request.getScheme());
            out.println("<br>getServerName()" + request.getServerName());
            out.println("<br>getServerPort()" + request.getServerPort());
            out.println("<br>getContextPath()" + request.getContextPath());
            out.println("<br>getServletPath()" + request.getServletPath());
            out.println("<br>getQueryString()" + request.getQueryString());
            out.println("<br>getPathInfo()" + request.getPathInfo());
            out.println("<br>getRequestURI()" + request.getRequestURI());
        }*/
       

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private List<az.rentcar.model.RentCar> getCarsByMarkId(String marka_id) {
        List<az.rentcar.model.RentCar> list = null;
        try{
        list = new RentCarDao().getCarsByMarka(
                Integer.parseInt(marka_id.replace("/", "")));
        if (list.size() == 0) {
            return null;
        } else {
            return list;
        }
        }catch(NumberFormatException e){
            return null;
        }
    }

}
