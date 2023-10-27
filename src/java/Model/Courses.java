package Model;

/**
 *
 * @author acer
 */
public class Courses {
    private int courseID;
    private String courseName;
    private Teacher teacher;

    public Courses() {
    }

    public Courses(int courseID, String courseName, Teacher teacher) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.teacher = teacher;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
    
    
}
