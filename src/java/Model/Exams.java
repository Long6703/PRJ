package Model;

/**
 *
 * @author acer
 */
public class Exams {
    private int examID;
    private String exam_date;
    private String exam_form;
    private String exam_type;
    private String exam_time;
    private String exam_location;
    private String dateOfPublic;
    private Courses courses;
    private Teacher teacher;

    public Exams() {
    }

    public Exams(int examID, String exam_date, String exam_form, String exam_type, String exam_time, String exam_location, String dateOfPublic, Courses courses, Teacher teacher) {
        this.examID = examID;
        this.exam_date = exam_date;
        this.exam_form = exam_form;
        this.exam_type = exam_type;
        this.exam_time = exam_time;
        this.exam_location = exam_location;
        this.dateOfPublic = dateOfPublic;
        this.courses = courses;
        this.teacher = teacher;
    }

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public String getExam_date() {
        return exam_date;
    }

    public void setExam_date(String exam_date) {
        this.exam_date = exam_date;
    }

    public String getExam_form() {
        return exam_form;
    }

    public void setExam_form(String exam_form) {
        this.exam_form = exam_form;
    }

    public String getExam_type() {
        return exam_type;
    }

    public void setExam_type(String exam_type) {
        this.exam_type = exam_type;
    }

    public String getExam_time() {
        return exam_time;
    }

    public void setExam_time(String exam_time) {
        this.exam_time = exam_time;
    }

    public String getExam_location() {
        return exam_location;
    }

    public void setExam_location(String exam_location) {
        this.exam_location = exam_location;
    }

    public String getDateOfPublic() {
        return dateOfPublic;
    }

    public void setDateOfPublic(String dateOfPublic) {
        this.dateOfPublic = dateOfPublic;
    }

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
    
    
    

    
    
    
   
    
}
