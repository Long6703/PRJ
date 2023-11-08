
package Controller;

import Dal.RegistrationsDBContext;
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
public class updateprocess extends BaseAuthen {
   


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
        String studentid = request.getParameter("studentid");
        String examid = request.getParameter("examid");
        RegistrationsDBContext bContext = new RegistrationsDBContext();
        if(request.getParameter("yes")!= null){
            if(bContext.updateprocess(Integer.parseInt(examid), Integer.parseInt(studentid))){
                response.sendRedirect("examregistrationlist");
            }
        }
        if(request.getParameter("no")!= null){
            if(bContext.updateprocess2(Integer.parseInt(examid), Integer.parseInt(studentid))){
                response.sendRedirect("examregistrationlist");
            }
        }
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
