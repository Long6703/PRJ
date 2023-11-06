package Controller;

import Dal.StudentDBContext;
import Dal.TeacherDBContext;
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
public class ForgotpasswordController extends BaseAuthen {

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
        String username = request.getParameter("username");
        request.setAttribute("username", username);
        request.getRequestDispatcher("view/forgotpassword.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        if (username.isEmpty() || name.isEmpty() || email.isEmpty() || phone.isEmpty() || newpass.isEmpty() || renewpass.isEmpty()) {
            String err = "Missing information for user authentication!!!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("view/forgotpassword.jsp").forward(request, response);
            return;
        }

        if (!newpass.equals(renewpass)) {
            String err = "New Password and Re_new password do not match!!!!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("view/forgotpassword.jsp").forward(request, response);
            return;
        }
        boolean check = false;
        Users u = null;
        if ("student".equals(role)) {
            StudentDBContext sdbc = new StudentDBContext();
            u = sdbc.getInforStudents(username, name, email, phone);
            if (u != null) {
                check = true;
            }
        } else {
            TeacherDBContext tdbc = new TeacherDBContext();
            u = tdbc.getInforTeacher(username, name, email, phone);
            if (u != null) {
                check = true;
            }
        }

        if (check) {
            UsersDBContext udbc = new UsersDBContext();
            if (udbc.changepass(newpass, u.getUserid())) {
                response.sendRedirect("login");
            }
        } else {

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
