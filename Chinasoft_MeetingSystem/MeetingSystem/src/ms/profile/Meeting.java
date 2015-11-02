package ms.profile;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Meeting entity. @author MyEclipse Persistence Tools
 */

public class Meeting implements java.io.Serializable {

	// Fields

	private Integer meetId;
	private Meetingroom meetingroom;
	private Meetingstatus meetingstatus;
	private Emp emp;
	private String meetName;
	private Integer meetParticipants;
	private Timestamp meetStarttime;
	private Timestamp meetEndtime;
	private Set participantses = new HashSet(0);

	// Constructors

	/** default constructor 
	 * @param meetEndtime2 
	 * @param meetStarttime2 
	 * @param meetParticipants2 
	 * @param meetName2 
	 * @param emp2 
	 * @param meetingstatus2 
	 * @param meetingroom2 
	 * @param meeting_id */
	public Meeting(Integer meetId, Meetingroom meetingroom,
			Meetingstatus meetingstatus, Emp emp, String meetName,
			Integer meetParticipants, Timestamp meetStarttime,
			Timestamp meetEndtime, Set participantses) {
		super();
		this.meetId = meetId;
		this.meetingroom = meetingroom;
		this.meetingstatus = meetingstatus;
		this.emp = emp;
		this.meetName = meetName;
		this.meetParticipants = meetParticipants;
		this.meetStarttime = meetStarttime;
		this.meetEndtime = meetEndtime;
		this.participantses = participantses;
	}
	
	

	/** minimal constructor */
	public Meeting(Meetingroom meetingroom, Meetingstatus meetingstatus,
			Emp emp, String meetName, Integer meetParticipants,
			Timestamp meetStarttime, Timestamp meetEndtime) {
		this.meetingroom = meetingroom;
		this.meetingstatus = meetingstatus;
		this.emp = emp;
		this.meetName = meetName;
		this.meetParticipants = meetParticipants;
		this.meetStarttime = meetStarttime;
		this.meetEndtime = meetEndtime;
	}
    




	public Meeting() {
		super();
		// TODO Auto-generated constructor stub
	}



	/** full constructor */
	public Meeting(Meetingroom meetingroom, Meetingstatus meetingstatus,
			Emp emp, String meetName, Integer meetParticipants,
			Timestamp meetStarttime, Timestamp meetEndtime, Set participantses) {
		this.meetingroom = meetingroom;
		this.meetingstatus = meetingstatus;
		this.emp = emp;
		this.meetName = meetName;
		this.meetParticipants = meetParticipants;
		this.meetStarttime = meetStarttime;
		this.meetEndtime = meetEndtime;
		this.participantses = participantses;
	}

	// Property accessors

	public Meeting(Integer meeting_id, Meetingroom meetingroom2,
			Meetingstatus meetingstatus2, Emp emp2, String meetName2,
			Integer meetParticipants2, Timestamp meetStarttime2,
			Timestamp meetEndtime2) {
		this.meetId=meeting_id;
		this.meetingroom = meetingroom2;
		this.meetingstatus = meetingstatus2;
		this.emp = emp2;
		this.meetName = meetName2;
		this.meetParticipants = meetParticipants2;
		this.meetStarttime = meetStarttime2;
		this.meetEndtime = meetEndtime2;
	}



	public Integer getMeetId() {
		return this.meetId;
	}

	public void setMeetId(Integer meetId) {
		this.meetId = meetId;
	}

	public Meetingroom getMeetingroom() {
		return this.meetingroom;
	}

	public void setMeetingroom(Meetingroom meetingroom) {
		this.meetingroom = meetingroom;
	}

	public Meetingstatus getMeetingstatus() {
		return this.meetingstatus;
	}

	public void setMeetingstatus(Meetingstatus meetingstatus) {
		this.meetingstatus = meetingstatus;
	}

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getMeetName() {
		return this.meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public Integer getMeetParticipants() {
		return this.meetParticipants;
	}

	public void setMeetParticipants(Integer meetParticipants) {
		this.meetParticipants = meetParticipants;
	}

	public Timestamp getMeetStarttime() {
		return this.meetStarttime;
	}

	public void setMeetStarttime(Timestamp meetStarttime) {
		this.meetStarttime = meetStarttime;
	}

	public Timestamp getMeetEndtime() {
		return this.meetEndtime;
	}

	public void setMeetEndtime(Timestamp meetEndtime) {
		this.meetEndtime = meetEndtime;
	}

	public Set getParticipantses() {
		return this.participantses;
	}

	public void setParticipantses(Set participantses) {
		this.participantses = participantses;
	}

}