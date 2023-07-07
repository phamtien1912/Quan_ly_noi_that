package controller;

import dal.categoryDAO;
import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
@WebServlet(name="home", urlPatterns={"/home"})
public class home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        productDAO pDAO = new productDAO();
        List<product> listP = pDAO.selectAll();
        
        
        categoryDAO cDAO = new categoryDAO();
        List<category> listC = cDAO.selectAll();
        
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("favorite")) {
                    txt += o.getValue();
                }
            }
        }
        String[] favo = txt.split("/");
        int size = favo.length;

        request.setAttribute("size", size);
        request.setAttribute("dataP", listP);
        request.setAttribute("dataC", listC);
        request.getRequestDispatcher("index.jsp").forward(request, response);  
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
