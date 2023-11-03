package Dal;

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
public class UsersDBContext extends DBContext {

    public Users checkLogin(String nameString, String passString) {
        try {
            String sql = "select * from Users where username=? and password=? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, nameString);
            stm.setString(2, passString);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Users users = new Users();
                users.setUserid(rs.getInt("user_id"));
                users.setUsernameString(rs.getString("username"));
                users.setPassString(rs.getString("password"));
                users.setRole(rs.getString("role"));
                return users;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertUser(Users users) {
        try {
            String sql = "INSERT INTO [Users]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, users.getUsernameString());
            stm.setString(2, users.getPassString());
            stm.setString(3, users.getRole());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean changepass(String newpassString, int userID){
        try {
            String sql = "UPDATE [Users]\n" +
                    "   SET [password] = ?\n" +
                    " WHERE user_id = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newpassString);
            stm.setInt(2, userID);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    
    

}
