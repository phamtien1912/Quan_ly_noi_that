package controller;

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
import model.Cart1;
import model.Item;

/**
 *
 * @author Admin
 */
@WebServlet(name="ShopServlet", urlPatterns={"/shop"})
public class ShopServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        productDAO d = new productDAO();
        List<model.product> list = d.selectAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr!=null) {
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                }
            }
        }
        Cart1 cart = new Cart1(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if(listItem!=null){
            n = listItem.size();
        }else {
            n = 0;
        }
        request.setAttribute("size", n);
        request.setAttribute("data", list);
        request.getRequestDispatcher("home").forward(request, response);
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
