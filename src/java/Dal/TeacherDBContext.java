package Dal;

import Model.Teacher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class TeacherDBContext extends DBContext{
    
    public Teacher getTeacher(int userid){
        try {
            String sql = "SELECT [teacher_id]\n" +
                        "      ,[teacher_name]\n" +
                        "      ,[teacher_email]\n" +
                        "      ,[teacher_phone]\n" +
                        "  FROM [Teachers] \n" +
                        "  WHERE user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Teacher teacher = new Teacher();
                teacher.setTeacher_id(rs.getInt(1));
                teacher.setTeacher_nameString(rs.getString(2));
                teacher.setTeacher_emailString(rs.getString(3));
                teacher.setTeacher_phoneString(rs.getString(4));
                return teacher;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean updateTeacher(String nameString, String emailString, String phone, int userid){
        try {
            String sql = "UPDATE [Teachers]\n" +
                    "   SET [teacher_name] = ?\n" +
                    "      ,[teacher_email] = ?\n" +
                    "      ,[teacher_phone] = ?\n" +
                    " WHERE user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, nameString);
            stm.setString(2, emailString);
            stm.setString(3, phone);
            stm.setInt(4, userid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(TeacherDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
