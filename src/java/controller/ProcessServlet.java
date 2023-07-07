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

@WebServlet(name="ProcessServlet", urlPatterns={"/process"})
public class ProcessServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        productDAO d = new productDAO();
        List<model.product> list = d.selectAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart1 cart = new Cart1(txt, list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num=0;
        try {
            id = Integer.parseInt(id_raw);
            model.product p = d.getProductById(id);
            int numStore = p.getQty();
            num = Integer.parseInt(num_raw);
            if(num==-1 && (cart.getQuantityById(id)<=1)) {
                cart.removeItem(id);
            }else {
                if(num==1 && cart.getQuantityById(id)>=numStore){
                    num = 0;
                }
                double price = p.getPrice()*2;
                Item t = new Item(p, num, price);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size()>0){
            txt = items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity();
            for(int i=1; i<items.size(); i++){
                txt += "/" + items.get(i).getProduct().getId() + ":" + items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*60*24*2);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mycart.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       productDAO d = new productDAO();
        List<model.product> list = d.selectAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String id = request.getParameter("id");
        String[] ids = txt.split("/");
        String out = "";
        for (int i=0; i<ids.length; i++) {
            String[] s = ids[i].split(":");
            if (!s[0].equals(id)) {
                if(out.isEmpty()){
                    out = ids[i];
                }else {
                    txt += "/" + ids[i];
                }
            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(2*24*60*60);
            response.addCookie(c);
        }
        Cart1 cart = new Cart1(out, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mycart.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
