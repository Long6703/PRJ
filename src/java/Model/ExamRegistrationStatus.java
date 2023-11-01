package Model;

/**
 *
 * @author acer
 */
public class ExamRegistrationStatus {
    private int id;
    private String isRegistered;
    private Registrations registrations;

    public ExamRegistrationStatus() {
    }

    public ExamRegistrationStatus(int id, String isRegistered, Registrations registrations) {
        this.id = id;
        this.isRegistered = isRegistered;
        this.registrations = registrations;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsRegistered() {
        return isRegistered;
    }

    public void setIsRegistered(String isRegistered) {
        this.isRegistered = isRegistered;
    }

    public Registrations getRegistrations() {
        return registrations;
    }

    public void setRegistrations(Registrations registrations) {
        this.registrations = registrations;
    }
     
}
