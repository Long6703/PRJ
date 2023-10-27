
package Controller;

import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
public abstract class BaseAuthen extends HttpServlet {
   
    private boolean isAuthenticated(HttpServletRequest request){
        Users users = (Users)request.getSession().getAttribute("user");
        return users!=null;
    }
    
    protected abstract void doGet2(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException;
    
    
    protected abstract void doPost2(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if(isAuthenticated(request) || request.getRequestURI().endsWith("/login")|| request.getRequestURI().endsWith("/register")){
            doGet2(request, response);
        }else {
            request.getRequestDispatcher("view/AuthenError.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if(isAuthenticated(request) || request.getRequestURI().endsWith("/login") || request.getRequestURI().endsWith("/register")){
            doPost2(request, response);
        }else {
            request.getRequestDispatcher("view/AuthenError.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
