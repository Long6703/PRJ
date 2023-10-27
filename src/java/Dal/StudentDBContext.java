package Dal;

import Model.Classes;
import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class StudentDBContext extends DBContext{
    public Student getStudent(int userId){
        try {
            String sqlString = "select s.student_id, s.student_name, s.student_email, s.student_phone, c.class_id, c.class_name \n" +
                            "from Students s\n" +
                            "join Classes c on s.class_id = c.class_id\n" +
                            "where s.user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sqlString);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Student student = new Student();
                student.setStudent_id(rs.getInt(1));
                student.setStudent_name(rs.getString(2));
                student.setStudent_email(rs.getString(3));
                student.setStudent_phone(rs.getString(4));
                Classes classes = new Classes();
                classes.setClass_id(rs.getInt(5));
                classes.setClass_nameString(rs.getString(6));
                student.setStudentClasses(classes);
                return student;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean updateStudent(String nameString, String emailString, String phone, int userid){
        try {
            String sql = "UPDATE [Students]\n" +
                    "   SET [student_name] = ?\n" +
                    "      ,[student_email] = ?\n" +
                    "      ,[student_phone] = ?\n" +
                    " WHERE user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, nameString);
            stm.setString(2, emailString);
            stm.setString(3, phone);
            stm.setInt(4, userid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int getStudentID(int userid){
        int studentID = 0;
        try {
            String sql = "SELECT [student_id]\n" +
                        "  FROM [Students]\n" +
                        "  where user_id = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                studentID = rs.getInt("student_id");
                return studentID;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentID;
    }
    
    
}
