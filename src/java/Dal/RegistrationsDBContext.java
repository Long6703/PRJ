package Dal;

import Model.Classes;
import Model.Courses;
import Model.Exams;
import Model.Registrations;
import Model.Student;
import Model.Teacher;
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
                    + "           ,[registration_date]\n"
                    + "           ,[statusprocess])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,'processing')\n";
                    
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
            String sql = "SELECT r.registration_id, e.exam_id, e.course_id, co.course_name, e.exam_date, e.exam_time, e.exam_location, e.exam_form, e.exam_type, e.dateOfPublic, r.statusprocess \n"
                    + "  FROM [Registrations] r\n"
                    + "  join Exams e on e.exam_id = r.exam_id\n"
                    + "  join Courses co on co.course_id = e.course_id\n"
                    + "  Join Students s on r.student_id = s.student_id\n"
                    + "  where s.user_id = ? ";

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
                r.setStatusprocess(rs.getString("statusprocess"));
                litExamses.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return litExamses;
    }
    
        public ArrayList<Registrations> getAllExamsInRegistration2(int userID, int pageindex, int pagesize) {
        ArrayList<Registrations> litExamses = new ArrayList<>();
        try {
            String sql = "SELECT *\n" +
                        "FROM (\n" +
                        "  SELECT\n" +
                        "    r.registration_id,\n" +
                        "    e.exam_id,\n" +
                        "    e.course_id,\n" +
                        "    co.course_name,\n" +
                        "    e.exam_date,\n" +
                        "    e.exam_time,\n" +
                        "    e.exam_location,\n" +
                        "    e.exam_form,\n" +
                        "    e.exam_type,\n" +
                        "    e.dateOfPublic,\n" +
                        "    r.statusprocess,\n" +
                        "    ROW_NUMBER() OVER (ORDER BY r.registration_id ASC) AS rownum\n" +
                        "  FROM Registrations r\n" +
                        "  JOIN Exams e ON e.exam_id = r.exam_id\n" +
                        "  JOIN Courses co ON co.course_id = e.course_id\n" +
                        "  JOIN Students s ON r.student_id = s.student_id\n" +
                        "  WHERE s.user_id = ? \n" +
                        ") AS RankedRegistrations\n" +
                        "WHERE rownum >= ( ? - 1 )* ? + 1 AND rownum <= ( ? * ? );";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
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
                r.setStatusprocess(rs.getString("statusprocess"));
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

    public ArrayList<Registrations> listRegistration(int teacherID, int courseID, String classname) {
        ArrayList<Registrations> registrationses = new ArrayList<>();
        try {
            String sql = "select r.student_id,s.student_name,c.class_name, r.exam_id, e.course_id, co.course_name, co.teacher_id, r.registration_date from Registrations r\n"
                    + "join Exams e on r.exam_id = e.exam_id\n"
                    + "join Students s on r.student_id = s.student_id\n"
                    + "join Courses co on co.course_id = e.course_id\n"
                    + "join Classes c on s.class_id = c.class_id\n"
                    + "where co.teacher_id = ? and co.course_id = ? and c.class_name like ? ;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, teacherID);
            stm.setInt(2, courseID);
            stm.setString(3, "%" + classname + "%");
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
                Teacher t = new Teacher();
                t.setTeacher_id(rs.getInt("teacher_id"));
                co.setTeacher(t);
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
    
    public boolean updateprocess(int examid, int studentid){
        try {
            String sql = "UPDATE [dbo].[Registrations]\n" +
                    "   SET [statusprocess] = 'approve'\n" +
                    " WHERE exam_id = ? and student_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examid);
            stm.setInt(2, studentid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateprocess2(int examid, int studentid){
        try {
            String sql = "UPDATE [dbo].[Registrations]\n" +
                    "   SET [statusprocess] = 'reject'\n" +
                    " WHERE exam_id = ? and student_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examid);
            stm.setInt(2, studentid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int getCount(int userid){
        try {
            String sql = "select count(*) as total from Registrations r\n" +
                        "join Students s on r.student_id = s.student_id\n" +
                        "where s.user_id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

}
