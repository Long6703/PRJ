package Controller;

import Dal.RegistrationsDBContext;
import Model.Registrations;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class View_Exam_Schedule extends BaseAuthen {

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
            int pagesize = 3;
            String page = request.getParameter("pageindex");
            if(page == null || page.trim().length() == 0){
                page = "1";
            }
            int totalrecord = rgdb.getCount(Integer.parseInt(userid));
            int totalpage = (totalrecord % pagesize == 0) ? (totalrecord / pagesize) : (totalrecord / pagesize) + 1;
            int pageindex = Integer.parseInt(page);
            ArrayList<Registrations> litExamses = rgdb.getAllExamsInRegistration2(Integer.parseInt(userid), pageindex, pagesize);
            request.setAttribute("pageindex", pageindex);
            request.setAttribute("totalpage", totalpage);
            request.setAttribute("litExamses", litExamses);
            request.getRequestDispatcher("view/viewexmas.jsp").forward(request, response);
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
