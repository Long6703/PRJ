package Dal;

import Model.Classes;
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
public class ClassesDBContext extends DBContext{
    public ArrayList<Classes> getAllClasseses(){
        ArrayList<Classes> listclass = new ArrayList<>();
        try {
            String sql = "SELECT [class_id]\n" +
                    "      ,[class_name]\n" +
                    "  FROM [Classes]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Classes classes = new Classes();
                classes.setClass_id(rs.getInt("class_id"));
                classes.setClass_nameString(rs.getString("class_name"));
                listclass.add(classes);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listclass;
    }
    
    public Classes getClassById(int userid){
        try {
            String sql = "select c.class_id, c.class_name from Students s\n" +
                    "join Classes c on s.class_id = c.class_id\n" +
                    "where s.user_id = ? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Classes c = new Classes();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_nameString(rs.getString("class_name"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassesDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
