package Model;

/**
 *
 * @author acer
 */
public class Teacher {
    private int teacher_id;
    private String teacher_nameString;
    private String teacher_emailString;
    private String teacher_phoneString;
    private Users users;

    public Teacher() {
    }

    public Teacher(int teacher_id, String teacher_nameString, String teacher_emailString, String teacher_phoneString, Users users) {
        this.teacher_id = teacher_id;
        this.teacher_nameString = teacher_nameString;
        this.teacher_emailString = teacher_emailString;
        this.teacher_phoneString = teacher_phoneString;
        this.users = users;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_nameString() {
        return teacher_nameString;
    }

    public void setTeacher_nameString(String teacher_nameString) {
        this.teacher_nameString = teacher_nameString;
    }

    public String getTeacher_emailString() {
        return teacher_emailString;
    }

    public void setTeacher_emailString(String teacher_emailString) {
        this.teacher_emailString = teacher_emailString;
    }

    public String getTeacher_phoneString() {
        return teacher_phoneString;
    }

    public void setTeacher_phoneString(String teacher_phoneString) {
        this.teacher_phoneString = teacher_phoneString;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    
    
    
}
