package Dal;

import Model.Teacher;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */
public class TeacherDBContext extends DBContext {

    public Teacher getTeacher(int userid) {
        try {
            String sql = "SELECT [teacher_id]\n"
                    + "      ,[teacher_name]\n"
                    + "      ,[teacher_email]\n"
                    + "      ,[teacher_phone]\n"
                    + "  FROM [Teachers] \n"
                    + "  WHERE user_id = ? ";

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

    public boolean updateTeacher(String nameString, String emailString, String phone, int userid) {
        try {
            String sql = "UPDATE [Teachers]\n"
                    + "   SET [teacher_name] = ?\n"
                    + "      ,[teacher_email] = ?\n"
                    + "      ,[teacher_phone] = ?\n"
                    + " WHERE user_id = ? ";

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

    public Users getInforTeacher(String usernameString, String name, String emailString, String phoneString) {
        try {
            String sql = "select u.user_id, u.role, u.user_id, u.password\n"
                    + "from Users u \n"
                    + "join Teachers t on u.user_id = t.user_id\n"
                    + "where u.username = ? \n"
                    + "and t.teacher_name = ? \n"
                    + "and t.teacher_email = ? \n"
                    + "and t.teacher_phone = ? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, usernameString);
            stm.setString(2, name);
            stm.setString(3, emailString);
            stm.setString(4, phoneString);
            ResultSet rs = stm.executeQuery();
            Users u = new Users();
            while (rs.next()) {
                u.setUserid(rs.getInt("user_id"));
                u.setUsernameString(usernameString);
                u.setPassString(rs.getString("password"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
