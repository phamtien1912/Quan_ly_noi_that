/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import dal.orderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.order;
import model.product;
import model.user;

/**
 *
 * @author Admin
 */
@WebServlet(name = "purchaseServerlet", urlPatterns = {"/pur"})
public class purchaseServerlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet purchaseServerlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet purchaseServerlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String page = request.getParameter("page");
        if (page == null) {
            page = "0";
        }
        user u = (user) session.getAttribute("acc");
        orderDAO o = new orderDAO();
        List<product> listProduct = new ArrayList<>();
        List<order> listOrder = new ArrayList<>(); 
        
        
        if(page.equals("0")){
            listProduct = o.getAllProductByOrder(u.getId());
            listOrder = o.selectAll(u.getId());
        }else{
            listProduct = o.getProductByOrder(u.getId(), page);
            listOrder = o.selectByStatus(u.getId(), page);
        }
        
        int pageInt = Integer.parseInt(page);       
        request.setAttribute("user", u);        
        request.setAttribute("dataProduct", listProduct);
        request.setAttribute("dataOrder", listOrder);
        request.setAttribute("index", pageInt);
        request.getRequestDispatcher("process.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
