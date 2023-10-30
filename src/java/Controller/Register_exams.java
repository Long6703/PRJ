package Controller;

import Dal.CourseDBContext;
import Dal.ExamDBContext;
import Dal.RegistrationsDBContext;
import Dal.StudentDBContext;
import Model.Exams;
import Model.Registrations;
import Model.Student;
import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author acer
 */
public class Register_exams extends BaseAuthen {

    @Override
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Users u = (Users) request.getSession().getAttribute("user");
        if ("student".equals(u.getRole())) {
            ExamDBContext edbc = new ExamDBContext();
            ArrayList<Exams> listCourseses = edbc.getCoursesesByStudent(u.getUserid());
            request.setAttribute("listCourseses", listCourseses);
            request.getRequestDispatcher("view/registerexam.jsp").forward(request, response);
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
        Users u = (Users) request.getSession().getAttribute("user");
        String examid = request.getParameter("examid");
        StudentDBContext stdb = new StudentDBContext();
        int studentId = stdb.getStudentID(u.getUserid());
        if (studentId != 0) {
            Student s = new Student();
            s.setStudent_id(studentId);
            Exams e = new Exams();
            e.setExamID(Integer.parseInt(examid));
            Registrations r = new Registrations();
            r.setExam(e);
            r.setStudent(s);
            LocalDate currentDate = LocalDate.now();
            String date = String.valueOf(currentDate);
            r.setDateRegistrations(date);
            RegistrationsDBContext rgdb = new RegistrationsDBContext();
            if (rgdb.insertRegistrations(r)) {
                
            }
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
