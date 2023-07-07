package controller;

import dal.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rem = request.getParameter("rem");
        String n = request.getParameter("password");

        userDAO uDAO = new userDAO();
        user a = uDAO.login(userName, password);

        Cookie cUser = new Cookie("cUser", userName);
        Cookie cPass = new Cookie("cPass", n);
        Cookie cRem = new Cookie("cRem", rem);

        if (rem != null) {
            cUser.setMaxAge(60 * 60 * 24 * 30);
            cPass.setMaxAge(60 * 60 * 24 * 30);
            cRem.setMaxAge(60 * 60 * 24 * 30);
        } else {
            cUser.setMaxAge(0);
            cPass.setMaxAge(0);
            cRem.setMaxAge(0);
        }

        response.addCookie(cUser);
        response.addCookie(cPass);
        response.addCookie(cRem);

        if (a == null) {
            request.setAttribute("messError", "Wrong username or password !!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
