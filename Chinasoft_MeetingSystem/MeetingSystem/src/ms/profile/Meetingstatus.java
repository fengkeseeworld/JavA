package ms.profile;

import java.util.HashSet;
import java.util.Set;

/**
 * Meetingstatus entity. @author MyEclipse Persistence Tools
 */

public class Meetingstatus implements java.io.Serializable {

	// Fields

	private Integer meetingstatusId;
	private String meetingstatusName;
	private Set meetings = new HashSet(0);

	// Constructors

	/** default constructor */
	public Meetingstatus() {
	}

	/** minimal constructor */
	public Meetingstatus(String meetingstatusName) {
		this.meetingstatusName = meetingstatusName;
	}

	/** full constructor */
	public Meetingstatus(String meetingstatusName, Set meetings) {
		this.meetingstatusName = meetingstatusName;
		this.meetings = meetings;
	}

	// Property accessors

	public Integer getMeetingstatusId() {
		return this.meetingstatusId;
	}

	public void setMeetingstatusId(Integer meetingstatusId) {
		this.meetingstatusId = meetingstatusId;
	}

	public String getMeetingstatusName() {
		return this.meetingstatusName;
	}

	public void setMeetingstatusName(String meetingstatusName) {
		this.meetingstatusName = meetingstatusName;
	}

	public Set getMeetings() {
		return this.meetings;
	}

	public void setMeetings(Set meetings) {
		this.meetings = meetings;
	}

}