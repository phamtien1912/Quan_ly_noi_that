package controller;

import dal.commentDAO;
import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import model.comment;
import model.product;
import model.user;

@WebServlet(name="CommentServerlet", urlPatterns={"/comment"})
public class CommentServerlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentServerlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServerlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        commentDAO c = new commentDAO();
        productDAO pd = new productDAO();
        
        String productId = request.getParameter("productId");
        int productId_int = Integer.parseInt(productId);       
        product p = pd.getProductById(productId_int);        
        List<user> listUser = c.getUserByProductId(p.getId());
        List<comment> listComment = c.selectAllByProductId(p.getId());
       
        request.setAttribute("product", p);
        request.setAttribute("listUser", listUser);
        request.setAttribute("listComment", listComment);
        request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
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
