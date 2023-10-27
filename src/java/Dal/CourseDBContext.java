package Dal;

import Model.Courses;
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
public class CourseDBContext extends DBContext {

    public ArrayList<Courses> getAllCourse() {
        ArrayList<Courses> listCourseses = new ArrayList<>();
        try {
            String sql = "SELECT co.[course_id]\n"
                    + "      ,co.[course_name]\n"
                    + "      ,t.[teacher_id]\n"
                    + "	  ,t.teacher_name\n"
                    + "  FROM [Courses] co\n"
                    + "  join Teachers t on t.teacher_id = co.teacher_id";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                Teacher t = new Teacher();
                t.setTeacher_id(rs.getInt("teacher_id"));
                t.setTeacher_nameString(rs.getString("teacher_name"));
                c.setTeacher(t);
                listCourseses.add(c);
            }
            return listCourseses;

        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Courses> getAllCourseByUserID(int userid) {
        ArrayList<Courses> listCourseses = new ArrayList<>();
        try {
            String sql = "SELECT c.[course_id]\n"
                    + "      ,c.[course_name]\n"
                    + "      ,c.[teacher_id]\n"
                    + "	  ,t.teacher_name\n"
                    + "  FROM [Courses] c\n"
                    + "  join Teachers t on t.teacher_id = c.teacher_id\n"
                    + "  where t.user_id = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName(rs.getString("course_name"));
                Teacher t = new Teacher();
                t.setTeacher_id(rs.getInt("teacher_id"));
                t.setTeacher_nameString(rs.getString("teacher_name"));
                c.setTeacher(t);
                listCourseses.add(c);
            }
            return listCourseses;

        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Courses> getAllCoursrByClass(int userId){
        ArrayList<Courses> list = new ArrayList<>();
        try {
            String sql = "select c.course_id, co.course_name from Classes c \n" +
                    "join ClassCourses cc on c.class_id = cc.class_id\n" +
                    "join Courses co on cc.course_id = co.course_id\n" +
                    "join Students s on c.class_id = s.class_id\n" +
                    "where s.user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Courses c = new Courses();
                c.setCourseID(rs.getInt("course_id"));
                c.setCourseName("course_name");
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    

}
