package Controller;

import Dal.StudentDBContext;
import Dal.TeacherDBContext;
import Model.Student;
import Model.Teacher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
public class UserDetail extends BaseAuthen {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String mode = request.getParameter("mode");
        if ("student".equals(role)) {
            StudentDBContext studentDBContext = new StudentDBContext();
            Student student = studentDBContext.getStudent(Integer.parseInt(userid));
            request.setAttribute("student_infor", student);
            if ("1".equals(mode)) {
                request.getRequestDispatcher("view/studentdetail.jsp").forward(request, response);
            } else{
                request.getRequestDispatcher("view/updateStudent.jsp").forward(request, response);
            }
            return;
        }

        if ("teacher".equals(role)) {
            TeacherDBContext teacherDBContext = new TeacherDBContext();
            Teacher t = teacherDBContext.getTeacher(Integer.parseInt(userid));
            request.setAttribute("teacher_infor", t);
            if ("1".equals(mode)) {
                request.getRequestDispatcher("view/teacherdetail.jsp").forward(request, response);
            } else{
                request.getRequestDispatcher("view/updateteacher.jsp").forward(request, response);
            }
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
        String userid = request.getParameter("userid");
        String role = request.getParameter("role");
        if ("student".equals(role)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            StudentDBContext stu = new StudentDBContext();
            stu.updateStudent(name, email, phone, Integer.parseInt(userid));
            String redirectURL = "userdetail?userid=" + userid + "&role=" + role + "&mode=1";
            redirectURL = response.encodeRedirectURL(redirectURL);
            response.sendRedirect(redirectURL);
        }

        if ("teacher".equals(role)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            TeacherDBContext t = new TeacherDBContext();
            t.updateTeacher(name, email, phone, Integer.parseInt(userid));
            String redirectURL = "userdetail?userid=" + userid + "&role=" + role + "&mode=1";
            redirectURL = response.encodeRedirectURL(redirectURL);
            response.sendRedirect(redirectURL);
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
