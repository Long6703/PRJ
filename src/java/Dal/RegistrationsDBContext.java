package Dal;

import Model.Classes;
import Model.Courses;
import Model.Exams;
import Model.Registrations;
import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class RegistrationsDBContext extends DBContext {

//    public boolean insertRegistrations(Registrations r) {
//        try {
//            connection.setAutoCommit(false);
//            String sql = "INSERT INTO [dbo].[Registrations]\n"
//                    + "           ([exam_id]\n"
//                    + "           ,[student_id]\n"
//                    + "           ,[registration_date])\n"
//                    + "     VALUES\n"
//                    + "           (?\n"
//                    + "           ,?\n"
//                    + "           ,?)";
//
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, r.getExam().getExamID());
//            stm.setInt(2, r.getStudent().getStudent_id());
//            stm.setString(3, r.getDateRegistrations());
//            stm.executeUpdate();
//
//            String sql_getID = "SELECT @@IDENTITY as [registration_id]";
//            PreparedStatement stm_getID = connection.prepareStatement(sql_getID);
//            ResultSet rs = stm_getID.executeQuery();
//            if (rs.next()) {
//                try {
//                    String sql1 = "INSERT INTO [ExamRegistrationStatus]\n"
//                            + "           ([IsRegistered]\n"
//                            + "           ,[RegistrationID])\n"
//                            + "     VALUES\n"
//                            + "           (0\n"
//                            + "           ,?);";
//
//                    PreparedStatement stm1 = connection.prepareStatement(sql1);
//                    stm1.setInt(1, rs.getInt("registration_id"));
//                    stm1.executeUpdate();
//                } catch (SQLException ex) {
//                    Logger.getLogger(ExamRegistrationStatusDBContext.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//            connection.commit();
//            return true;
//        } catch (SQLException ex) {
//            try {
//                Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
//                connection.rollback();
//            } catch (SQLException ex1) {
//                Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex1);
//            }
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//            } catch (SQLException ex) {
//                Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return false;
//    }
    public boolean insertRegistrations(Registrations r) {
        try {
            String sql = "INSERT INTO [dbo].[Registrations]\n"
                    + "           ([exam_id]\n"
                    + "           ,[student_id]\n"
                    + "           ,[registration_date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getExam().getExamID());
            stm.setInt(2, r.getStudent().getStudent_id());
            stm.setString(3, r.getDateRegistrations());
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Registrations> getAllExamsInRegistration(int userID) {
        ArrayList<Registrations> litExamses = new ArrayList<>();
        try {
            String sql = "SELECT r.registration_id, e.exam_id, e.course_id, co.course_name, e.exam_date, e.exam_time, e.exam_location, e.exam_form, e.exam_type, e.dateOfPublic\n"
                    + "  FROM [Registrations] r\n"
                    + "  join Exams e on e.exam_id = r.exam_id\n"
                    + "  join Courses co on co.course_id = e.course_id\n"
                    + "  Join Students s on r.student_id = s.student_id\n"
                    + "  where s.user_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registrations r = new Registrations();
                r.setRegistrationsID(rs.getInt("registration_id"));
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                r.setExam(e);
                litExamses.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return litExamses;
    }

    public boolean deleteRegistration(int registrationsID) {
        try {
            String sql = "DELETE FROM [dbo].[Registrations]\n"
                    + "      WHERE registration_id = ?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, registrationsID);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Registrations> listRegistration(int teacherID, int courseID) {
        ArrayList<Registrations> registrationses = new ArrayList<>();
        try {
            String sql = "select r.student_id,s.student_name,c.class_name, r.exam_id, e.course_id, co.course_name, r.registration_date from Registrations r\n"
                    + "join Exams e on r.exam_id = e.exam_id\n"
                    + "join Students s on r.student_id = s.student_id\n"
                    + "join Courses co on co.course_id = e.course_id\n"
                    + "join Classes c on s.class_id = c.class_id\n"
                    + "where co.teacher_id = ? and co.course_id = ? ;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, teacherID);
            stm.setInt(2, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registrations r = new Registrations();
                Student s = new Student();
                s.setStudent_id(rs.getInt("student_id"));
                s.setStudent_name(rs.getString("student_name"));
                Classes c = new Classes();
                c.setClass_nameString(rs.getString("class_name"));
                s.setStudentClasses(c);
                r.setStudent(s);
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses co = new Courses();
                co.setCourseID(rs.getInt("course_id"));
                co.setCourseName(rs.getString("course_name"));
                e.setCourses(co);
                r.setExam(e);
                r.setDateRegistrations(rs.getString("registration_date"));
                registrationses.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registrationses;
    }

    public boolean deleteExams(int examsID) {
        try {
            String sql = "DELETE FROM [dbo].[Registrations]\n"
                    + "      WHERE exam_id = ? ;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examsID);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
