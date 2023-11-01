package Controller;

import Dal.UsersDBContext;
import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
public class ChangePass extends BaseAuthen {

    
    @Override
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/changepass.jsp").forward(request, response);
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
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        String err;
        Users u = (Users) request.getSession().getAttribute("user");
        if (u.getPassString().equals(oldpass) && newpass.equals(renewpass)) {
            UsersDBContext udbc = new UsersDBContext();
            udbc.changepass(newpass, u.getUserid());
            response.sendRedirect("logout");
        } else {
            err = "Something went wrong!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("view/changepass.jsp").forward(request, response);
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
