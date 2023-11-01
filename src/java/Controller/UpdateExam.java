
package Controller;

import Dal.ExamDBContext;
import Model.Exams;
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
public class UpdateExam extends BaseAuthen {
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String courseID = request.getParameter("courseId");
        ExamDBContext edbc = new ExamDBContext();
        Exams examses = edbc.getExamsByID(Integer.parseInt(courseID));
        request.setAttribute("examses", examses);
        request.getRequestDispatcher("view/updateExam.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost2(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String edate = request.getParameter("examDate");
        String examTime = request.getParameter("examTime");
        String examLocation = request.getParameter("examLocation");
        String examType = request.getParameter("examType");
        String dateOfPublic = request.getParameter("dateOfPublic");
        String examid = request.getParameter("examID");
        ExamDBContext ebdc = new ExamDBContext();
        Users u = (Users)request.getSession().getAttribute("user");
        if(ebdc.updateExam(edate, examTime, examLocation, examType, dateOfPublic, Integer.parseInt(examid))){
            response.sendRedirect( "editexam?userid="+u.getUserid()+"&role="+u.getRole() );
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
