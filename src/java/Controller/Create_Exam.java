
package Controller;

import Dal.CourseDBContext;
import Dal.ExamDBContext;
import Model.Courses;
import Model.Exams;
import Model.Teacher;
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
public class Create_Exam extends BaseAuthen {
   

    @Override
    protected void doGet2(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Users u = (Users)request.getSession().getAttribute("user");
        CourseDBContext c = new CourseDBContext();
        ArrayList<Courses> coursesList = c.getAllCourseByUserID(u.getUserid());
        request.setAttribute("coursesList", coursesList);
        request.getRequestDispatcher("view/createexam.jsp").forward(request, response);
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
        String id = request.getParameter("teacherID");
        String courseID = request.getParameter("courseID");
        String examdate = request.getParameter("examdate");
        String examtime = request.getParameter("examtime");
        String examtype = request.getParameter("examtype");
        String examlocation = request.getParameter("examlocation");
        String dateofpublic = request.getParameter("dateofpublic");
        Exams e = new Exams();
        Courses c = new Courses();
        c.setCourseID(Integer.parseInt(courseID));
        e.setCourses(c);
        e.setExam_date(examdate);
        e.setExam_time(examtime);
        e.setExam_location(examlocation);
        e.setDateOfPublic(dateofpublic);
        e.setExam_type(examtype);
        Teacher t = new Teacher();
        t.setTeacher_id(Integer.parseInt(id));
        e.setTeacher(t);
        if("FE".equals(e.getExam_type())){
            e.setExam_form("Multiple choices on EOS");
        }else {
            e.setExam_form("Practical exam (PEA client)");
        }
        ExamDBContext edbc = new ExamDBContext();
        if(edbc.createExam(e, Integer.parseInt(id))){
            response.getWriter().println("done");
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
