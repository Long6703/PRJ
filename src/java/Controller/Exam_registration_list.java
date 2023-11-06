package Controller;

import Dal.ClassesDBContext;
import Dal.CourseDBContext;
import Dal.RegistrationsDBContext;
import Model.Classes;
import Model.Courses;
import Model.Registrations;
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
public class Exam_registration_list extends BaseAuthen {

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
            CourseDBContext cdbc = new CourseDBContext();
            ArrayList<Courses> listCourseses = cdbc.getAllCourseByUserID(u.getUserid());
            request.setAttribute("listCourseses", listCourseses);
            request.getRequestDispatcher("view/examregistrationlist.jsp").forward(request, response);
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
        String teacherid = request.getParameter("teacherid");
        String courseID = request.getParameter("courseID");
        System.out.println(teacherid + " " + courseID);
        String cname = request.getParameter("cname");
        if (cname == null || cname.equals("all")) {
            cname = "";
        }
        System.out.println("classname : " + cname);
        RegistrationsDBContext bContext = new RegistrationsDBContext();
        ArrayList<Registrations> registrations = bContext.listRegistration(Integer.parseInt(teacherid), Integer.parseInt(courseID), cname);
        ClassesDBContext bContext1 = new ClassesDBContext();
        ArrayList<Classes> listclass = bContext1.getAllClassesesByCourse(Integer.parseInt(courseID), Integer.parseInt(teacherid));
        request.setAttribute("registrations", registrations);
        request.setAttribute("listclass", listclass);
        request.getRequestDispatcher("view/liststudentregis.jsp").forward(request, response);
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
