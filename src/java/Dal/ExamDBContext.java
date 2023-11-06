package Dal;

import Model.Courses;
import Model.Exams;
import Model.Teacher;
import java.sql.Date;
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
public class ExamDBContext extends DBContext {

    public ArrayList<Exams> getExamByClass(int classID) {
        ArrayList<Exams> exmasArrayList = new ArrayList<>();
        try {
            String sql = "SELECT co.course_id, e.exam_id, e.exam_date, e.exam_time, e.exam_location, e.exam_form, e.exam_type, e.dateOfPublic, co.course_name\n"
                    + "FROM Exams e\n"
                    + "INNER JOIN ClassCourses cc ON e.exam_id = cc.examid\n"
                    + "INNER JOIN Courses co ON cc.course_id = co.course_id\n"
                    + "INNER JOIN Classes c ON cc.class_id = c.class_id\n"
                    + "WHERE c.class_id = ? ;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, classID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
                exmasArrayList.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exmasArrayList;
    }

    public boolean createExam(Exams exams, int teacherID) {
        try {
            String sql = "INSERT INTO [Exams]\n"
                    + "           ([course_id]\n"
                    + "           ,[exam_date]\n"
                    + "           ,[exam_time]\n"
                    + "           ,[exam_location]\n"
                    + "           ,[exam_form]\n"
                    + "           ,[exam_type]\n"
                    + "           ,[teacherID]\n"
                    + "           ,[dateOfPublic])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, exams.getCourses().getCourseID());
            stm.setDate(2, Date.valueOf(exams.getExam_date()));
            stm.setString(3, exams.getExam_time());
            stm.setString(4, exams.getExam_location());
            stm.setString(5, exams.getExam_form());
            stm.setString(6, exams.getExam_type());
            stm.setInt(7, teacherID);
            stm.setDate(8, Date.valueOf(exams.getDateOfPublic()));
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Exams> getAllExamByTeacher(int userID) {
        ArrayList<Exams> exmasArrayList = new ArrayList<>();
        try {
            String sql = "SELECT e.[exam_id]\n"
                    + "      ,e.[course_id]\n"
                    + "	  ,c.course_name\n"
                    + "      ,e.[exam_date]\n"
                    + "      ,e.[exam_time]\n"
                    + "      ,e.[exam_location]\n"
                    + "      ,e.[exam_form]\n"
                    + "      ,e.[exam_type]\n"
                    + "      ,e.[dateOfPublic]\n"
                    + "      ,e.[teacherID]\n"
                    + "  FROM [Exams] e\n"
                    + "  join Courses c on c.course_id = e.course_id\n"
                    + "  join Teachers t on t.teacher_id = e.teacherID\n"
                    + "  Where t.user_id = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
                exmasArrayList.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exmasArrayList;
    }

    public ArrayList<Exams> getAllExamByCourse(int courseID) {
        ArrayList<Exams> exmasArrayList = new ArrayList<>();
        try {
            String sql = "SELECT e.[exam_id]\n"
                    + "      ,e.[course_id]\n"
                    + "       ,c.course_name\n"
                    + "      ,e.[exam_date]\n"
                    + "      ,e.[exam_time]\n"
                    + "      ,e.[exam_location]\n"
                    + "      ,e.[exam_form]\n"
                    + "      ,e.[exam_type]\n"
                    + "      ,e.[dateOfPublic]\n"
                    + "      ,e.[teacherID]\n"
                    + "  FROM [Exams] e\n"
                    + "  join Courses c on c.course_id = e.course_id\n"
                    + "  Where e.course_id = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
                exmasArrayList.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exmasArrayList;
    }

    public boolean deleteExam(int examID) {
        try {
            String sql = "DELETE FROM [dbo].[Exams]\n"
                    + "      WHERE exam_id = ?; ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examID);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateExam(String edate, String etime, String elocation, String etype, String epublic, int examid) {
        try {
            String sql = "UPDATE [Exams]\n"
                    + "   SET [exam_date] = ?\n"
                    + "      ,[exam_time] = ?\n"
                    + "      ,[exam_location] = ?\n"
                    + "      ,[exam_type] = ?\n"
                    + "      ,[exam_form] = ?\n"
                    + "      ,[dateOfPublic] = ?\n"
                    + " WHERE exam_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, Date.valueOf(edate));
            stm.setString(2, etime);
            stm.setString(3, elocation);
            stm.setString(4, etype);
            if ("FE".equals(etype)) {
                stm.setString(5, "Multiple choices on EOS");
            } else {
                stm.setString(5, "Practical exam (PEA client)");
            }
            stm.setDate(6, Date.valueOf(epublic));
            stm.setInt(7, examid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Exams getExamsByID(int examid) {
        try {
            String sql = "SELECT e.[exam_id]\n"
                    + "      ,e.[course_id]\n"
                    + "	  ,co.course_name\n"
                    + "      ,e.[exam_date]\n"
                    + "      ,e.[exam_time]\n"
                    + "      ,e.[exam_location]\n"
                    + "      ,e.[exam_form]\n"
                    + "      ,e.[exam_type]\n"
                    + "      ,e.[dateOfPublic]\n"
                    + "  FROM [Exams] e\n"
                    + "  join Courses co on e.course_id = co.course_id\n"
                    + "  where e.exam_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examid);
            ResultSet rs = stm.executeQuery();
            Exams e = new Exams();
            while (rs.next()) {
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
            }
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Exams> getCoursesesByStudent(int userid) {
        ArrayList<Exams> allCoursesesofStudent = new ArrayList<>();
        try {
            String sql = "select e.exam_id,e.course_id, co.course_name, e.exam_date,e.exam_time, e.exam_location,e.exam_type, e.exam_form,e.dateOfPublic, e.exam_date,t.teacher_id, t.teacher_name, t.teacher_email\n" +
                        "from Exams e\n" +
                        "join Courses co on e.course_id = co.course_id\n" +
                        "join Teachers t on co.teacher_id = t.teacher_id\n" +
                        "join ClassCourses cc on co.course_id = cc.course_id\n" +
                        "join Classes c on c.class_id = cc.class_id\n" +
                        "join Students s on s.class_id = c.class_id\n" +
                        "where s.user_id = ? \n" +
                        "and e.exam_id NOT IN (SELECT [exam_id] FROM Registrations r\n" +
                        "join Students s on r.student_id = s.student_id\n" +
                        "where s.user_id = ? )";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            stm.setInt(2, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exams e = new Exams();
                e.setExamID(rs.getInt("exam_id"));
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                e.setCourses(c);
                e.setExam_date(rs.getString("exam_date"));
                e.setExam_form(rs.getString("exam_form"));
                e.setExam_type(rs.getString("exam_type"));
                e.setExam_time(rs.getString("exam_time"));
                e.setExam_location(rs.getString("exam_location"));
                e.setDateOfPublic(rs.getString("dateOfPublic"));
                Teacher t = new Teacher();
                t.setTeacher_id(rs.getInt("teacher_id"));
                t.setTeacher_nameString(rs.getString("teacher_name"));
                t.setTeacher_emailString(rs.getString("teacher_email"));
                e.setTeacher(t);
                allCoursesesofStudent.add(e);
            }
            return allCoursesesofStudent;
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
