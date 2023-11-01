package Controller;

import Dal.ExamDBContext;
import Dal.RegistrationsDBContext;
import Model.Exams;
import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class Edit_exam extends BaseAuthen {

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
        Users u = (Users) request.getSession().getAttribute("user");
        if ("teacher".equals(u.getRole())) {
            ExamDBContext edbc = new ExamDBContext();
            ArrayList<Exams> allExamByTeacher = edbc.getAllExamByTeacher(u.getUserid());
            request.setAttribute("allExamByTeacher", allExamByTeacher);
            request.getRequestDispatcher("view/editexam.jsp").forward(request, response); 
        }else {
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
        ExamDBContext e = new ExamDBContext();
        String examID = request.getParameter("examId");
        RegistrationsDBContext rdbc = new RegistrationsDBContext();
        Users u = (Users)request.getSession().getAttribute("user");
        if (rdbc.deleteExams(Integer.parseInt(examID))) {
            e.deleteExam(Integer.parseInt(examID));
            response.sendRedirect( "editexam?userid="+u.getUserid()+"&role="+u.getRole() );
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
