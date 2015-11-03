package ms.profile;

/**
 * Participants entity. @author MyEclipse Persistence Tools
 */

public class Participants implements java.io.Serializable {

	// Fields

	private Integer participantsId;
	private Meeting meeting;
	private Emp emp;

	// Constructors

	/** default constructor */
	public Participants() {
	}

	/** full constructor */
	public Participants(Meeting meeting, Emp emp) {
		this.meeting = meeting;
		this.emp = emp;
	}

	// Property accessors

	public Integer getParticipantsId() {
		return this.participantsId;
	}

	public void setParticipantsId(Integer participantsId) {
		this.participantsId = participantsId;
	}

	public Meeting getMeeting() {
		return this.meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

}