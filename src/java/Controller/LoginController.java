package Controller;

import Dal.UsersDBContext;
import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
public class LoginController extends BaseAuthen {

    @Override
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if ("rememberMe".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
//                    HttpSession session = request.getSession(false);
//                    response.sendRedirect("/examschedule/home.jsp");
//                    return;
//                }
//            }
//        }
        request.getRequestDispatcher("view/login.jsp").forward(request, response);

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
    protected void doPost2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean rememberMe = "1".equals(request.getParameter("rememberme"));
        UsersDBContext usersDBContext = new UsersDBContext();
        Users users = usersDBContext.checkLogin(username, password);
        if (users != null) {
            request.getSession().setAttribute("user", users);
//            if (rememberMe) {
//                Cookie rememberMeCookie = new Cookie("rememberMe", "true");
//                rememberMeCookie.setMaxAge(30 * 24 * 60 * 60);
//                response.addCookie(rememberMeCookie);
//            } else {
//                Cookie rememberMeCookie = new Cookie("rememberMe", "");
//                rememberMeCookie.setMaxAge(0);
//                response.addCookie(rememberMeCookie);
//            }
            response.sendRedirect("/examschedule/home.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password.!!!");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
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
