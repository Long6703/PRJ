package Model;

/**
 *
 * @author acer
 */
public class Student {
    private int student_id;
    private String student_name;
    private String student_email;
    private String student_phone;
    private Classes studentClasses;
    private Users users;

    public Student() {
    }

    public Student(int student_id, String student_name, String student_email, String student_phone, Classes studentClasses, Users users) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_email = student_email;
        this.student_phone = student_phone;
        this.studentClasses = studentClasses;
        this.users = users;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_email() {
        return student_email;
    }

    public void setStudent_email(String student_email) {
        this.student_email = student_email;
    }

    public String getStudent_phone() {
        return student_phone;
    }

    public void setStudent_phone(String student_phone) {
        this.student_phone = student_phone;
    }

    public Classes getStudentClasses() {
        return studentClasses;
    }

    public void setStudentClasses(Classes studentClasses) {
        this.studentClasses = studentClasses;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    
    
}
