package Controller;

import Dal.RegistrationsDBContext;
import Model.Exams;
import Model.Registrations;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class Delete_Exam extends BaseAuthen {

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
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userid = request.getParameter("userid");
        String role = request.getParameter("role");
        if ("student".equals(role)) {
            RegistrationsDBContext rgdb = new RegistrationsDBContext();
            ArrayList<Registrations> litExamses = rgdb.getAllExamsInRegistration(Integer.parseInt(userid));
            request.setAttribute("litExamses", litExamses);
            request.getRequestDispatcher("view/deleteexam.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("view/permissions.jsp").forward(request, response);
        }
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
        String registrationsID = request.getParameter("registrationsID");
        RegistrationsDBContext rgdb = new RegistrationsDBContext();
        Users u = (Users)request.getSession().getAttribute("user");
        if(rgdb.deleteRegistration(Integer.parseInt(registrationsID))){
            response.sendRedirect( "deleteexam?userid="+u.getUserid()+"&role="+u.getRole() );
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
