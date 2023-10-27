package Model;

/**
 *
 * @author acer
 */
public class Users {
    private int userid;
    private String usernameString;
    private String passString;
    private String role;

    public Users() {
    }

    public Users(int userid, String usernameString, String passString, String role) {
        this.userid = userid;
        this.usernameString = usernameString;
        this.passString = passString;
        this.role = role;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsernameString() {
        return usernameString;
    }

    public void setUsernameString(String usernameString) {
        this.usernameString = usernameString;
    }

    public String getPassString() {
        return passString;
    }

    public void setPassString(String passString) {
        this.passString = passString;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
