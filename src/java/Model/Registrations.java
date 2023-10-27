package Model;

/**
 *
 * @author acer
 */
public class Registrations {
    private int registrationsID;
    private Exams exam;
    private Student student;
    private String dateRegistrations;

    public Registrations() {
    }

    public Registrations(int registrationsID, Exams exam, Student student, String dateRegistrations) {
        this.registrationsID = registrationsID;
        this.exam = exam;
        this.student = student;
        this.dateRegistrations = dateRegistrations;
    }

    public int getRegistrationsID() {
        return registrationsID;
    }

    public void setRegistrationsID(int registrationsID) {
        this.registrationsID = registrationsID;
    }

    public Exams getExam() {
        return exam;
    }

    public void setExam(Exams exam) {
        this.exam = exam;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getDateRegistrations() {
        return dateRegistrations;
    }

    public void setDateRegistrations(String dateRegistrations) {
        this.dateRegistrations = dateRegistrations;
    }
    
    
}
