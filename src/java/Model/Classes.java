package Model;

/**
 *
 * @author acer
 */
public class Classes {
    private int class_id;
    private String class_nameString;
    private Users users;

    public Classes() {
    }

    public Classes(int class_id, String class_nameString, Users users) {
        this.class_id = class_id;
        this.class_nameString = class_nameString;
        this.users = users;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_nameString() {
        return class_nameString;
    }

    public void setClass_nameString(String class_nameString) {
        this.class_nameString = class_nameString;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    
    
}
